import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'pages/user/dashboard_page.dart';
import 'pages/workout/workouts_page.dart';
import 'pages/nutrition/nutrition_page.dart'; // NutritionPageState
import 'pages/program/programs_page.dart';
import 'pages/mental health/mental_health_page.dart';
import 'pages/supplements/supplements_page.dart';
import 'pages/nutrition/meal_service.dart';
import 'pages/nutrition/healthy_meals_page.dart';
import 'pages/nutrition/nutrition_stats_page.dart';
import 'pages/nutrition/water_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialisation de la base SQLite
  await MealService.initDatabase();
  await WaterService.initDatabase();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const FitLifeApp(),
    ),
  );
}

class FitLifeApp extends StatelessWidget {
  const FitLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitLife Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeTabs(),
    );
  }
}

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int _currentIndex = 0;

  final GlobalKey<NutritionPageState> _nutritionKey = GlobalKey<NutritionPageState>();

  late List<Widget> _pages;

  final List<IconData> _icons = [
    Icons.dashboard_rounded,
    Icons.fitness_center_rounded,
    Icons.restaurant_rounded,
    Icons.list_alt_rounded,
    Icons.self_improvement_rounded,
    Icons.local_hospital_rounded,
  ];

  final List<String> _titles = [
    'Dashboard',
    'Entraînements',
    'Nutrition',
    'Programmes',
    'Santé Mentale',
    'Suppléments',
  ];

  @override
  void initState() {
    super.initState();
    _pages = [
      const DashboardPage(),
      const WorkoutsPage(),
      NutritionPage(key: _nutritionKey),
      const ProgramsPage(),
      const MentalHealthPage(),
      const SupplementsPage(),
    ];
  }

  void _refreshNutrition() {
    _nutritionKey.currentState?.loadMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF32383E),
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: _currentIndex == 2
            ? [
                IconButton(
                  icon: const Icon(Icons.restaurant_menu, color: Color(0xFFC7F000)),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HealthyMealsPage()),
                  ).then((_) => _refreshNutrition()),
                ),
                IconButton(
                  icon: const Icon(Icons.bar_chart, color: Color(0xFFC7F000)),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NutritionStatsPage()),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Color(0xFFC7F000)),
                  onPressed: () => _nutritionKey.currentState?.showAddOptions(),
                ),
                const SizedBox(width: 8),
              ]
            : null,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF32383E), Color(0xFF17191C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2124),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, -5))
          ],
          borderRadius: BorderRadius.circular(24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => _currentIndex = i),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: const Color(0xFFC7F000),
            unselectedItemColor: Colors.grey[600],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: _icons.map((icon) {
              int i = _icons.indexOf(icon);
              bool selected = _currentIndex == i;
              return BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFFC7F000).withOpacity(0.15) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: selected ? 28 : 24),
                ),
                label: '',
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

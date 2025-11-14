import 'dart:io';
import 'package:flutter/material.dart';
import '../pages/nutrition/meal_model.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  final VoidCallback? onDelete;

  const MealCard({super.key, required this.meal, this.onDelete});

  // Vérifier si l'image est une URL ou un chemin local
  bool _isImageUrl(String? path) {
    if (path == null || path.isEmpty) return false;
    return path.startsWith('http://') || path.startsWith('https://');
  }

  // Widget pour afficher l'image selon son type
  Widget _buildImage() {
    if (meal.imagePath == null || meal.imagePath!.isEmpty) {
      // Aucune image - afficher une icône par défaut
      return Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF17191C),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.fastfood,
          color: Color(0xFFC7F000),
          size: 30,
        ),
      );
    }

    if (_isImageUrl(meal.imagePath)) {
      // Image depuis une URL (recettes healthy ou scanner)
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          meal.imagePath!,
          fit: BoxFit.cover,
          width: 60,
          height: 60,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF17191C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.fastfood,
                color: Color(0xFFC7F000),
                size: 30,
              ),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF17191C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    strokeWidth: 2,
                    color: const Color(0xFFC7F000),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      // Image depuis un fichier local
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          File(meal.imagePath!),
          fit: BoxFit.cover,
          width: 60,
          height: 60,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF17191C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.fastfood,
                color: Color(0xFFC7F000),
                size: 30,
              ),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2A2E32),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: _buildImage(),
        title: Text(
          meal.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              const Icon(
                Icons.local_fire_department,
                size: 14,
                color: Color(0xFFC7F000),
              ),
              const SizedBox(width: 4),
              Text(
                '${meal.calories} kcal',
                style: const TextStyle(
                  color: Color(0xFFC7F000),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFC7F000).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  meal.categoryIcon + ' ' + meal.categoryName,
                  style: const TextStyle(
                    color: Color(0xFFC7F000),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        trailing: onDelete != null
            ? IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: onDelete,
              )
            : null,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/recipe_model.dart';
import '../utils.dart';

class RecipeCardWidget extends StatelessWidget {
  final RecipeModel recipe;
  final VoidCallback onTap;
  final VoidCallback? onFavorite;
  final double? width;
  final double? height;
  final bool showCookTime;
  final bool showDifficulty;
  final bool showRating;
  final EdgeInsetsGeometry? margin;
  
  const RecipeCardWidget({
    super.key,
    required this.recipe,
    required this.onTap,
    this.onFavorite,
    this.width,
    this.height,
    this.showCookTime = true,
    this.showDifficulty = true,
    this.showRating = true,
    this.margin,
  });
  
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 4),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        child: SizedBox(
          width: width,
          height: height ?? 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppConstants.borderRadius),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(recipe.imageUrl ?? ''),
                      fit: BoxFit.cover,
                      onError: (error, stackTrace) {
                        debugPrint('Error loading image: $error');
                      },
                    ),
                  ),
                  child: Stack(
                    children: [
                      if (onFavorite != null)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: onFavorite,
                              icon: Icon(
                                recipe.isFavorite ?? false
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      if (showCookTime && recipe.cookTime != null)
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${recipe.cookTime} min',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      if (recipe.isPremium == true)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'PRO',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name ?? 'Unknown Recipe',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      if (recipe.description != null)
                        Text(
                          recipe.description!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const Spacer(),
                      Row(
                        children: [
                          if (showRating && recipe.rating != null) ...[
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              AppUtils.formatCounter(recipe.rating!.toInt()),
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 8),
                          ],
                          if (showDifficulty && recipe.difficulty != null) ...[
                            Icon(
                              Icons.signal_cellular_alt,
                              size: 16,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              recipe.difficulty!,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

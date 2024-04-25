import 'package:flutter/material.dart';
import '../constants.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool selected;
  final Color? selectedColor;
  final EdgeInsetsGeometry? contentPadding;
  
  const CustomListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.selectedColor,
    this.contentPadding,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? (selectedColor ?? Colors.grey[200]) : null,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        onTap: onTap,
        onLongPress: onLongPress,
        selected: selected,
        contentPadding: contentPadding ?? 
            const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
              vertical: 4,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
      ),
    );
  }
}

class RecipeListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String imageUrl;
  final String? cookTime;
  final String? difficulty;
  final double? rating;
  final VoidCallback onTap;
  final VoidCallback? onFavorite;
  final bool isFavorite;
  
  const RecipeListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.imageUrl,
    this.cookTime,
    this.difficulty,
    this.rating,
    required this.onTap,
    this.onFavorite,
    this.isFavorite = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: CustomListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60,
                height: 60,
                color: Colors.grey[200],
                child: const Icon(Icons.restaurant),
              );
            },
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (subtitle != null) ...[
              Text(
                subtitle!,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
            ],
            Row(
              children: [
                if (cookTime != null) ...[
                  Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    cookTime!,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                if (difficulty != null) ...[
                  Icon(Icons.signal_cellular_alt, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    difficulty!,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                if (rating != null) ...[
                  Icon(Icons.star, size: 16, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
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
        trailing: onFavorite != null
            ? IconButton(
                onPressed: onFavorite,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}

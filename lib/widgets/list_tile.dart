import 'package:flutter/material.dart';
import '../constants.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool isThreeLine;
  final bool? dense;
  final EdgeInsetsGeometry? contentPadding;
  final Color? tileColor;
  final Color? selectedTileColor;
  final Color? textColor;
  final Color? iconColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? leadingTextStyle;
  final TextStyle? trailingTextStyle;
  final ShapeBorder? shape;
  final bool selected;
  final bool autofocus;
  final bool enableFeedback;
  final FocusNode? focusNode;
  final bool mouseCursor;
  final bool horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;
  final bool enableSelection;
  final Color? selectedColor;
  final Color? splashColor;
  final double? borderRadius;
  final double? elevation;
  final bool showDivider;
  final Color? dividerColor;
  final double? dividerHeight;
  final bool showLeadingBorder;
  final Color? leadingBorderColor;
  final double? leadingBorderWidth;

  const CustomListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.tileColor,
    this.selectedTileColor,
    this.textColor,
    this.iconColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.leadingTextStyle,
    this.trailingTextStyle,
    this.shape,
    this.selected = false,
    this.autofocus = false,
    this.enableFeedback = true,
    this.focusNode,
    this.mouseCursor = true,
    this.horizontalTitleGap = true,
    this.minVerticalPadding,
    this.minLeadingWidth,
    this.enableSelection = false,
    this.selectedColor,
    this.splashColor,
    this.borderRadius,
    this.elevation,
    this.showDivider = false,
    this.dividerColor,
    this.dividerHeight,
    this.showLeadingBorder = false,
    this.leadingBorderColor,
    this.leadingBorderWidth,
  });

  @override
  Widget build(BuildContext context) {
    Widget tile = Container(
      decoration: BoxDecoration(
        color: selected ? (selectedTileColor ?? Colors.grey[200]) : tileColor,
        borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
        border: showLeadingBorder && leading != null
            ? Border(
                left: BorderSide(
                  color: leadingBorderColor ?? AppConstants.primaryColor,
                  width: leadingBorderWidth ?? 3.0,
                ),
              )
            : null,
        boxShadow: elevation != null
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: elevation!,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        onTap: onTap,
        onLongPress: onLongPress,
        isThreeLine: isThreeLine,
        dense: dense,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: 8,
        ),
        textColor: textColor,
        iconColor: iconColor,
        titleTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        leadingTextStyle: leadingTextStyle,
        trailingTextStyle: trailingTextStyle,
        shape: shape,
        selected: selected,
        autofocus: autofocus,
        enableFeedback: enableFeedback,
        focusNode: focusNode,
        mouseCursor: mouseCursor ? SystemMouseCursors.click : null,
        horizontalTitleGap: horizontalTitleGap,
        minVerticalPadding: minVerticalPadding,
        minLeadingWidth: minLeadingWidth,
        selectedColor: selectedColor,
        splashColor: splashColor,
      ),
    );

    if (showDivider) {
      tile = Column(
        children: [
          tile,
          Container(
            height: dividerHeight ?? 1.0,
            color: dividerColor ?? Colors.grey[300],
          ),
        ],
      );
    }

    return tile;
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

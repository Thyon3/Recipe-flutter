import 'package:flutter/material.dart';
import '../constants.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Color? shadowColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final EdgeInsetsGeometry? margin;
  final Clip clipBehavior;
  final bool semanticContainer;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final bool showGradient;
  final Gradient? gradient;
  final bool showBorder;
  final Color? borderColor;
  final double? borderWidth;
  final bool showImage;
  final String? backgroundImage;
  final BoxFit imageFit;
  final Color? imageColor;
  final bool showRipple;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showAnimated;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool showGlow;
  final Color? glowColor;
  final double? glowBlurRadius;
  final bool showShimmer;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final bool showLoading;
  final Widget? loadingWidget;
  final bool showError;
  final Widget? errorWidget;
  final String? errorMessage;
  final VoidCallback? onRetry;
  final bool showOverlay;
  final Widget? overlayWidget;
  final Color? overlayColor;
  final double? overlayOpacity;
  final bool showBadge;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final bool showCornerIcon;
  final IconData? cornerIcon;
  final Color? cornerIconColor;
  final double? cornerIconSize;
  final bool showHeader;
  final Widget? headerWidget;
  final String? headerText;
  final TextStyle? headerTextStyle;
  final bool showFooter;
  final Widget? footerWidget;
  final String? footerText;
  final TextStyle? footerTextStyle;
  final bool showAction;
  final Widget? actionWidget;
  final String? actionText;
  final VoidCallback? onAction;
  final Color? actionColor;
  final bool showDivider;
  final Color? dividerColor;
  final double? dividerHeight;
  final bool showShadow;
  final Color? shadowColorCustom;
  final double? shadowBlurRadius;
  final Offset? shadowOffset;
  final bool showTransform;
  final double? transformScale;
  final double? transformRotation;
  final Offset? transformTranslation;
  
  const CustomCard({
    super.key,
    this.child,
    this.color,
    this.shadowColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior = Clip.none,
    this.semanticContainer = true,
    this.padding,
    this.borderRadius,
    this.showGradient = false,
    this.gradient,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth,
    this.showImage = false,
    this.backgroundImage,
    this.imageFit = BoxFit.cover,
    this.imageColor,
    this.showRipple = false,
    this.onTap,
    this.onLongPress,
    this.showAnimated = false,
    this.animationDuration = AppConstants.animationDuration,
    this.animationCurve = Curves.easeInOut,
    this.showGlow = false,
    this.glowColor,
    this.glowBlurRadius,
    this.showShimmer = false,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.showLoading = false,
    this.loadingWidget,
    this.showError = false,
    this.errorWidget,
    this.errorMessage,
    this.onRetry,
    this.showOverlay = false,
    this.overlayWidget,
    this.overlayColor,
    this.overlayOpacity,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
    this.showCornerIcon = false,
    this.cornerIcon,
    this.cornerIconColor,
    this.cornerIconSize,
    this.showHeader = false,
    this.headerWidget,
    this.headerText,
    this.headerTextStyle,
    this.showFooter = false,
    this.footerWidget,
    this.footerText,
    this.footerTextStyle,
    this.showAction = false,
    this.actionWidget,
    this.actionText,
    this.onAction,
    this.actionColor,
    this.showDivider = false,
    this.dividerColor,
    this.dividerHeight,
    this.showShadow = false,
    this.shadowColorCustom,
    this.shadowBlurRadius,
    this.shadowOffset,
    this.showTransform = false,
    this.transformScale,
    this.transformRotation,
    this.transformTranslation,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget card = _buildCard();
    
    if (showAnimated) {
      card = TweenAnimationBuilder<double>(
        duration: animationDuration,
        tween: Tween<double>(begin: 0.0, end: 1.0),
        curve: animationCurve,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: card,
      );
    }
    
    if (showTransform) {
      card = Transform(
        transform: Matrix4.identity()
          ..scale(transformScale ?? 1.0)
          ..rotateZ((transformRotation ?? 0.0) * 3.14159 / 180)
          ..translate(
            transformTranslation?.dx ?? 0.0,
            transformTranslation?.dy ?? 0.0,
          ),
        child: card,
      );
    }
    
    return Container(
      margin: margin,
      child: card,
    );
  }
  
  Widget _buildCard() {
    Widget cardChild = _buildCardContent();
    
    if (showRipple && onTap != null) {
      cardChild = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          child: cardChild,
        ),
      );
    }
    
    return Container(
      decoration: BoxDecoration(
        color: showGradient ? null : (color ?? Colors.white),
        gradient: showGradient ? (gradient ?? LinearGradient(
          colors: [
            Colors.white,
            Colors.grey[100]!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )) : null,
        borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
        border: showBorder ? Border.all(
          color: borderColor ?? Colors.grey[300]!,
          width: borderWidth ?? 1.0,
        ) : null,
        boxShadow: showShadow ? [
          BoxShadow(
            color: shadowColorCustom ?? Colors.black.withOpacity(0.1),
            blurRadius: shadowBlurRadius ?? 8.0,
            offset: shadowOffset ?? const Offset(0, 4),
          ),
        ] : (elevation != null ? [
          BoxShadow(
            color: shadowColor ?? Colors.black.withOpacity(0.1),
            blurRadius: elevation!,
            offset: const Offset(0, 2),
          ),
        ] : null),
        image: showImage && backgroundImage != null ? DecorationImage(
          image: NetworkImage(backgroundImage!),
          fit: imageFit,
          colorFilter: imageColor != null ? ColorFilter.mode(
            imageColor!,
            BlendMode.color,
          ) : null,
        ) : null,
      ),
      child: Stack(
        children: [
          cardChild,
          if (showCornerIcon && cornerIcon != null)
            Positioned(
              top: 8,
              right: 8,
              child: Icon(
                cornerIcon,
                color: cornerIconColor ?? Colors.grey[600],
                size: cornerIconSize ?? 16,
              ),
            ),
          if (showBadge && badgeText != null)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor ?? Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeText!,
                  style: TextStyle(
                    color: badgeTextColor ?? Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (showOverlay)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: (overlayColor ?? Colors.black).withOpacity(overlayOpacity ?? 0.5),
                  borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
                ),
                child: overlayWidget,
              ),
            ),
        ],
      ),
    );
  }
  
  Widget _buildCardContent() {
    if (showLoading) {
      return loadingWidget ?? const Center(
        child: CircularProgressIndicator(),
      );
    }
    
    if (showError) {
      return errorWidget ?? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage ?? 'Something went wrong',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showHeader) ...[
          headerWidget ?? (headerText != null ? Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Text(
              headerText!,
              style: headerTextStyle ?? const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ) : const SizedBox.shrink()),
          if (showDivider) _buildDivider(),
        ],
        Padding(
          padding: padding ?? const EdgeInsets.all(AppConstants.defaultPadding),
          child: child,
        ),
        if (showFooter) ...[
          if (showDivider) _buildDivider(),
          footerWidget ?? (footerText != null ? Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Text(
              footerText!,
              style: footerTextStyle ?? TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ) : const SizedBox.shrink()),
        ],
        if (showAction) ...[
          if (showDivider) _buildDivider(),
          Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: actionWidget ?? (actionText != null ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onAction,
                  style: TextButton.styleFrom(
                    foregroundColor: actionColor ?? AppConstants.primaryColor,
                  ),
                  child: Text(actionText!),
                ),
              ],
            ) : const SizedBox.shrink()),
          ),
        ],
      ],
    );
  }
  
  Widget _buildDivider() {
    return Container(
      height: dividerHeight ?? 1.0,
      color: dividerColor ?? Colors.grey[200],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Color? borderColor;
  final double? borderWidth;
  final bool showShadow;
  final Color? shadowColor;
  final double? shadowBlurRadius;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showRipple;
  final bool showGradient;
  final Gradient? gradient;
  final bool showIconBackground;
  final Color? iconBackgroundColor;
  final double? iconBackgroundSize;
  final bool showAvatar;
  final String? avatarImage;
  final Widget? avatarWidget;
  final bool showBadge;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onAction;
  final Color? actionColor;
  final bool showTrailing;
  final Widget? trailingWidget;
  final IconData? trailingIcon;
  final Color? trailingIconColor;
  final bool showDivider;
  final Color? dividerColor;
  final double? dividerHeight;
  final bool showAnimated;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool showHover;
  final Color? hoverColor;
  final double? hoverScale;
  final bool showSelected;
  final bool isSelected;
  final Color? selectedColor;
  final Color? selectedBorderColor;
  final bool showDisabled;
  final bool isDisabled;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final bool showLoading;
  final Widget? loadingWidget;
  final bool showError;
  final String? errorMessage;
  final Widget? errorWidget;
  final VoidCallback? onRetry;
  
  const InfoCard({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.titleColor,
    this.subtitleColor,
    this.borderRadius,
    this.elevation,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth,
    this.showShadow = true,
    this.shadowColor,
    this.shadowBlurRadius,
    this.onTap,
    this.onLongPress,
    this.showRipple = false,
    this.showGradient = false,
    this.gradient,
    this.showIconBackground = false,
    this.iconBackgroundColor,
    this.iconBackgroundSize,
    this.showAvatar = false,
    this.avatarImage,
    this.avatarWidget,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
    this.showAction = false,
    this.actionText,
    this.onAction,
    this.actionColor,
    this.showTrailing = false,
    this.trailingWidget,
    this.trailingIcon,
    this.trailingIconColor,
    this.showDivider = false,
    this.dividerColor,
    this.dividerHeight,
    this.showAnimated = false,
    this.animationDuration = AppConstants.animationDuration,
    this.animationCurve = Curves.easeInOut,
    this.showHover = false,
    this.hoverColor,
    this.hoverScale,
    this.showSelected = false,
    this.isSelected = false,
    this.selectedColor,
    this.selectedBorderColor,
    this.showDisabled = false,
    this.isDisabled = false,
    this.disabledColor,
    this.disabledTextColor,
    this.showLoading = false,
    this.loadingWidget,
    this.showError = false,
    this.errorMessage,
    this.errorWidget,
    this.onRetry,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget card = _buildCard();
    
    if (showAnimated) {
      card = TweenAnimationBuilder<double>(
        duration: animationDuration,
        tween: Tween<double>(begin: 0.0, end: 1.0),
        curve: animationCurve,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: card,
      );
    }
    
    if (showHover && onTap != null) {
      card = MouseRegion(
        child: card,
      );
    }
    
    return Container(
      margin: margin,
      child: card,
    );
  }
  
  Widget _buildCard() {
    Widget cardChild = _buildCardContent();
    
    if (showRipple && onTap != null) {
      cardChild = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled || showLoading ? null : onTap,
          onLongPress: isDisabled || showLoading ? null : onLongPress,
          borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          child: cardChild,
        ),
      );
    }
    
    return CustomCard(
      backgroundColor: isDisabled 
          ? (disabledColor ?? Colors.grey[300])
          : (isSelected && showSelected 
              ? (selectedColor ?? AppConstants.primaryColor.withOpacity(0.1))
              : backgroundColor),
      borderRadius: borderRadius,
      elevation: elevation,
      showBorder: showBorder,
      borderColor: isSelected && showSelected 
          ? (selectedBorderColor ?? AppConstants.primaryColor)
          : borderColor,
      borderWidth: borderWidth,
      showShadow: showShadow,
      shadowColor: shadowColor,
      shadowBlurRadius: shadowBlurRadius,
      showGradient: showGradient,
      gradient: gradient,
      onTap: showRipple ? null : (isDisabled || showLoading ? null : onTap),
      onLongPress: showRipple ? null : (isDisabled || showLoading ? null : onLongPress),
      child: cardChild,
    );
  }
  
  Widget _buildCardContent() {
    if (showLoading) {
      return loadingWidget ?? const Center(
        child: CircularProgressIndicator(),
      );
    }
    
    if (showError) {
      return errorWidget ?? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage ?? 'Something went wrong',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      );
    }
    
    return Stack(
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (showAvatar)
                    avatarWidget ?? (avatarImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              avatarImage!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          )
                        : (showIconBackground
                            ? Container(
                                width: iconBackgroundSize ?? 40,
                                height: iconBackgroundSize ?? 40,
                                decoration: BoxDecoration(
                                  color: iconBackgroundColor ?? AppConstants.primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  icon ?? Icons.info,
                                  color: iconColor ?? AppConstants.primaryColor,
                                  size: 20,
                                ),
                              )
                            : Icon(
                                icon ?? Icons.info,
                                color: iconColor ?? AppConstants.primaryColor,
                                size: 24,
                              ))),
                  if (showAvatar || icon != null) const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isDisabled 
                                ? (disabledTextColor ?? Colors.grey[500])
                                : (titleColor ?? Colors.black87),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            subtitle!,
                            style: TextStyle(
                              fontSize: 14,
                              color: isDisabled 
                                  ? (disabledTextColor ?? Colors.grey[400])
                                  : (subtitleColor ?? Colors.grey[600]),
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (showBadge && badgeText != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: badgeColor ?? Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        badgeText!,
                        style: TextStyle(
                          color: badgeTextColor ?? Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (showTrailing)
                    trailingWidget ?? (trailingIcon != null
                        ? Icon(
                            trailingIcon,
                            color: trailingIconColor ?? Colors.grey[600],
                          )
                        : const SizedBox.shrink()),
                ],
              ),
              if (showAction && actionText != null) ...[
                if (showDivider) ...[
                  const SizedBox(height: 12),
                  Container(
                    height: dividerHeight ?? 1.0,
                    color: dividerColor ?? Colors.grey[200],
                  ),
                  const SizedBox(height: 12),
                ] else
                  const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: isDisabled || showLoading ? null : onAction,
                      style: TextButton.styleFrom(
                        foregroundColor: actionColor ?? AppConstants.primaryColor,
                      ),
                      child: Text(actionText!),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
  class RecipeCard extends StatelessWidget {
  final String title;
  final String? description;
  final String imageUrl;
  final String? cookTime;
  final String? difficulty;
  final double? rating;
  final int? servings;
  final String? calories;
  final List<String>? ingredients;
  final List<String>? tags;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;
  final VoidCallback? onCook;
  final bool isFavorite;
  final bool showFavorite;
  final bool showShare;
  final bool showCook;
  final bool showRating;
  final bool showCookTime;
  final bool showDifficulty;
  final bool showServings;
  final bool showCalories;
  final bool showIngredients;
  final bool showTags;
  final double? borderRadius;
  final double? elevation;
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? subtitleColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Color? borderColor;
  final double? borderWidth;
  final bool showShadow;
  final Color? shadowColor;
  final double? shadowBlurRadius;
  final bool showRipple;
  final bool showGradient;
  final Gradient? gradient;
  final bool showAnimated;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool showHover;
  final Color? hoverColor;
  final double? hoverScale;
  final bool showSelected;
  final bool isSelected;
  final Color? selectedColor;
  final Color? selectedBorderColor;
  final bool showDisabled;
  final bool isDisabled;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final bool showLoading;
  final Widget? loadingWidget;
  final bool showError;
  final String? errorMessage;
  final Widget? errorWidget;
  final VoidCallback? onRetry;
  final double? imageHeight;
  final double? imageWidth;
  final BoxFit imageFit;
  final String? placeholderImage;
  final bool showImageOverlay;
  final Color? imageOverlayColor;
  final double? imageOverlayOpacity;
  final bool showBadge;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final bool showPremium;
  final bool isPremium;
  final Color? premiumColor;
  final bool showNew;
  final bool isNew;
  final Color? newColor;
  final bool showPopular;
  final bool isPopular;
  final Color? popularColor;
  final bool showQuick;
  final bool isQuick;
  final Color? quickColor;
  final bool showVegetarian;
  final bool isVegetarian;
  final Color? vegetarianColor;
  final bool showVegan;
  final bool isVegan;
  final Color? veganColor;
  final bool showGlutenFree;
  final bool isGlutenFree;
  final Color? glutenFreeColor;
  final bool showDairyFree;
  final bool isDairyFree;
  final Color? dairyFreeColor;
  final bool showKeto;
  final bool isKeto;
  final Color? ketoColor;
  final bool showLowCarb;
  final bool isLowCarb;
  final Color? lowCarbColor;
  final bool showHighProtein;
  final bool isHighProtein;
  final Color? highProteinColor;
  final bool showLowFat;
  final bool isLowFat;
  final Color? lowFatColor;
  final bool showLowSodium;
  final bool isLowSodium;
  final Color? lowSodiumColor;
  final bool showSugarFree;
  final bool isSugarFree;
  final Color? sugarFreeColor;
  final bool showHeartHealthy;
  final bool isHeartHealthy;
  final Color? heartHealthyColor;
  
  const RecipeCard({
    super.key,
    required this.title,
    this.description,
    required this.imageUrl,
    this.cookTime,
    this.difficulty,
    this.rating,
    this.servings,
    this.calories,
    this.ingredients,
    this.tags,
    this.onTap,
    this.onFavorite,
    this.onShare,
    this.onCook,
    this.isFavorite = false,
    this.showFavorite = true,
    this.showShare = true,
    this.showCook = true,
    this.showRating = true,
    this.showCookTime = true,
    this.showDifficulty = true,
    this.showServings = false,
    this.showCalories = false,
    this.showIngredients = false,
    this.showTags = false,
    this.borderRadius,
    this.elevation,
    this.backgroundColor,
    this.titleColor,
    this.subtitleColor,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth,
    this.showShadow = true,
    this.shadowColor,
    this.shadowBlurRadius,
    this.showRipple = true,
    this.showGradient = false,
    this.gradient,
    this.showAnimated = false,
    this.animationDuration = AppConstants.animationDuration,
    this.animationCurve = Curves.easeInOut,
    this.showHover = false,
    this.hoverColor,
    this.hoverScale,
    this.showSelected = false,
    this.isSelected = false,
    this.selectedColor,
    this.selectedBorderColor,
    this.showDisabled = false,
    this.isDisabled = false,
    this.disabledColor,
    this.disabledTextColor,
    this.showLoading = false,
    this.loadingWidget,
    this.showError = false,
    this.errorMessage,
    this.errorWidget,
    this.onRetry,
    this.imageHeight,
    this.imageWidth,
    this.imageFit = BoxFit.cover,
    this.placeholderImage,
    this.showImageOverlay = false,
    this.imageOverlayColor,
    this.imageOverlayOpacity,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
    this.showPremium = false,
    this.isPremium = false,
    this.premiumColor,
    this.showNew = false,
    this.isNew = false,
    this.newColor,
    this.showPopular = false,
    this.isPopular = false,
    this.popularColor,
    this.showQuick = false,
    this.isQuick = false,
    this.quickColor,
    this.showVegetarian = false,
    this.isVegetarian = false,
    this.vegetarianColor,
    this.showVegan = false,
    this.isVegan = false,
    this.veganColor,
    this.showGlutenFree = false,
    this.isGlutenFree = false,
    this.glutenFreeColor,
    this.showDairyFree = false,
    this.isDairyFree = false,
    this.dairyFreeColor,
    this.showKeto = false,
    this.isKeto = false,
    this.ketoColor,
    this.showLowCarb = false,
    this.isLowCarb = false,
    this.lowCarbColor,
    this.showHighProtein = false,
    this.isHighProtein = false,
    this.highProteinColor,
    this.showLowFat = false,
    this.isLowFat = false,
    this.lowFatColor,
    this.showLowSodium = false,
    this.isLowSodium = false,
    this.lowSodiumColor,
    this.showSugarFree = false,
    this.isSugarFree = false,
    this.sugarFreeColor,
    this.showHeartHealthy = false,
    this.isHeartHealthy = false,
    this.heartHealthyColor,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget card = _buildCard();
    
    if (showAnimated) {
      card = TweenAnimationBuilder<double>(
        duration: animationDuration,
        tween: Tween<double>(begin: 0.0, end: 1.0),
        curve: animationCurve,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: card,
      );
    }
    
    return Container(
      margin: margin,
      child: card,
    );
  }
  
  Widget _buildCard() {
    Widget cardChild = _buildCardContent();
    
    if (showRipple && onTap != null) {
      cardChild = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled || showLoading ? null : onTap,
          borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          child: cardChild,
        ),
      );
    }
    
    return CustomCard(
      backgroundColor: isDisabled 
          ? (disabledColor ?? Colors.grey[300])
          : (isSelected && showSelected 
              ? (selectedColor ?? AppConstants.primaryColor.withOpacity(0.1))
              : backgroundColor),
      borderRadius: borderRadius,
      elevation: elevation,
      showBorder: showBorder,
      borderColor: isSelected && showSelected 
          ? (selectedBorderColor ?? AppConstants.primaryColor)
          : borderColor,
      borderWidth: borderWidth,
      showShadow: showShadow,
      shadowColor: shadowColor,
      shadowBlurRadius: shadowBlurRadius,
      showGradient: showGradient,
      gradient: gradient,
      onTap: showRipple ? null : (isDisabled || showLoading ? null : onTap),
      child: cardChild,
    );
  }
  
  Widget _buildCardContent() {
    if (showLoading) {
      return loadingWidget ?? const Center(
        child: CircularProgressIndicator(),
      );
    }
    
    if (showError) {
      return errorWidget ?? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage ?? 'Something went wrong',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageSection(),
        const SizedBox(height: 8),
        _buildContentSection(),
        if (showTags && tags != null && tags!.isNotEmpty) ...[
          const SizedBox(height: 8),
          _buildTagsSection(),
        ],
        if (showIngredients && ingredients != null && ingredients!.isNotEmpty) ...[
          const SizedBox(height: 8),
          _buildIngredientsSection(),
        ],
        const SizedBox(height: 8),
        _buildActionSection(),
      ],
    );
  }
  
  Widget _buildImageSection() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(borderRadius ?? AppConstants.borderRadius),
          ),
          child: Image.network(
            imageUrl,
            width: imageWidth ?? double.infinity,
            height: imageHeight ?? 200,
            fit: imageFit,
            errorBuilder: (context, error, stackTrace) {
              if (placeholderImage != null) {
                return Image.network(
                  placeholderImage!,
                  width: imageWidth ?? double.infinity,
                  height: imageHeight ?? 200,
                  fit: imageFit,
                );
              }
              return Container(
                width: imageWidth ?? double.infinity,
                height: imageHeight ?? 200,
                color: Colors.grey[200],
                child: const Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                  size: 48,
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: imageWidth ?? double.infinity,
                height: imageHeight ?? 200,
                color: Colors.grey[200],
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
        if (showImageOverlay)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: (imageOverlayColor ?? Colors.black).withOpacity(
                  imageOverlayOpacity ?? 0.3,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(borderRadius ?? AppConstants.borderRadius),
                ),
              ),
            ),
          ),
        Positioned(
          top: 8,
          left: 8,
          right: 8,
          child: Row(
            children: [
              if (showBadge && badgeText != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeColor ?? Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badgeText!,
                    style: TextStyle(
                      color: badgeTextColor ?? Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const Spacer(),
              if (showPremium && isPremium)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: premiumColor ?? Colors.amber,
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
              if (showNew && isNew)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: newColor ?? Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (showPopular && isPopular)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: popularColor ?? Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'POPULAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (showQuick && isQuick)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: quickColor ?? Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'QUICK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: _buildDietaryBadges(),
        ),
      ],
    );
  }
  
  Widget _buildDietaryBadges() {
    return Column(
      children: [
        if (showVegetarian && isVegetarian)
          _buildDietaryBadge('V', vegetarianColor ?? Colors.green),
        if (showVegan && isVegan)
          _buildDietaryBadge('VG', veganColor ?? Colors.green),
        if (showGlutenFree && isGlutenFree)
          _buildDietaryBadge('GF', glutenFreeColor ?? Colors.blue),
        if (showDairyFree && isDairyFree)
          _buildDietaryBadge('DF', dairyFreeColor ?? Colors.orange),
        if (showKeto && isKeto)
          _buildDietaryBadge('K', ketoColor ?? Colors.purple),
        if (showLowCarb && isLowCarb)
          _buildDietaryBadge('LC', lowCarbColor ?? Colors.red),
        if (showHighProtein && isHighProtein)
          _buildDietaryBadge('HP', highProteinColor ?? Colors.teal),
        if (showLowFat && isLowFat)
          _buildDietaryBadge('LF', lowFatColor ?? Colors.yellow),
        if (showLowSodium && isLowSodium)
          _buildDietaryBadge('LS', lowSodiumColor ?? Colors.indigo),
        if (showSugarFree && isSugarFree)
          _buildDietaryBadge('SF', sugarFreeColor ?? Colors.pink),
        if (showHeartHealthy && isHeartHealthy)
          _buildDietaryBadge('❤', heartHealthyColor ?? Colors.red),
      ],
    );
  }
  
  Widget _buildDietaryBadge(String text, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  
  Widget _buildContentSection() {
    return Padding(
      padding: padding ?? const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDisabled 
                  ? (disabledTextColor ?? Colors.grey[500])
                  : (titleColor ?? Colors.black87),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (description != null) ...[
            const SizedBox(height: 4),
            Text(
              description!,
              style: TextStyle(
                fontSize: 14,
                color: isDisabled 
                    ? (disabledTextColor ?? Colors.grey[400])
                    : (subtitleColor ?? Colors.grey[600]),
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 8),
          _buildMetadataSection(),
        ],
      ),
    );
  }
  
  Widget _buildMetadataSection() {
    return Row(
      children: [
        if (showRating && rating != null) ...[
          Icon(
            Icons.star,
            size: 16,
            color: Colors.amber,
          ),
          const SizedBox(width: 4),
          Text(
            rating!.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 14,
              color: isDisabled 
                  ? (disabledTextColor ?? Colors.grey[400])
                  : (subtitleColor ?? Colors.grey[600]),
            ),
          ),
        ],
        if (showCookTime && cookTime != null) ...[
          const SizedBox(width: 12),
          Icon(
            Icons.access_time,
            size: 16,
            color: isDisabled 
                ? (disabledTextColor ?? Colors.grey[400])
                : (subtitleColor ?? Colors.grey[600]),
          ),
          const SizedBox(width: 4),
          Text(
            '$cookTime min',
            style: TextStyle(
              fontSize: 14,
              color: isDisabled 
                  ? (disabledTextColor ?? Colors.grey[400])
                  : (subtitleColor ?? Colors.grey[600]),
            ),
          ),
        ],
        if (showDifficulty && difficulty != null) ...[
          const SizedBox(width: 12),
          Icon(
            Icons.signal_cellular_alt,
            size: 16,
            color: isDisabled 
                ? (disabledTextColor ?? Colors.grey[400])
                : (subtitleColor ?? Colors.grey[600]),
          ),
          const SizedBox(width: 4),
          Text(
            difficulty!,
            style: TextStyle(
              fontSize: 14,
              color: isDisabled 
                  ? (disabledTextColor ?? Colors.grey[400])
                  : (subtitleColor ?? Colors.grey[600]),
            ),
          ),
        ],
        if (showServings && servings != null) ...[
          const SizedBox(width: 12),
          Icon(
            Icons.people,
            size: 16,
            color: isDisabled 
                ? (disabledTextColor ?? Colors.grey[400])
                : (subtitleColor ?? Colors.grey[600]),
          ),
          const SizedBox(width: 4),
          Text(
            '$servings servings',
            style: TextStyle(
              fontSize: 14,
              color: isDisabled 
                  ? (disabledTextColor ?? Colors.grey[400])
                  : (subtitleColor ?? Colors.grey[600]),
            ),
          ),
        ],
        if (showCalories && calories != null) ...[
          const SizedBox(width: 12),
          Icon(
            Icons.local_fire_department,
            size: 16,
            color: isDisabled 
                ? (disabledTextColor ?? Colors.grey[400])
                : (subtitleColor ?? Colors.grey[600]),
          ),
          const SizedBox(width: 4),
          Text(
            '$calories cal',
            style: TextStyle(
              fontSize: 14,
              color: isDisabled 
                  ? (disabledTextColor ?? Colors.grey[400])
                  : (subtitleColor ?? Colors.grey[600]),
            ),
          ),
        ],
      ],
    );
  }
  
  Widget _buildTagsSection() {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: tags!.map((tag) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: AppConstants.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          tag,
          style: TextStyle(
            fontSize: 12,
            color: AppConstants.primaryColor,
          ),
        ),
      )).toList(),
    );
  }
  
  Widget _buildIngredientsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients:',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isDisabled 
                ? (disabledTextColor ?? Colors.grey[400])
                : (subtitleColor ?? Colors.grey[600]),
          ),
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: ingredients!.take(3).map((ingredient) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              ingredient,
              style: TextStyle(
                fontSize: 10,
                color: isDisabled 
                    ? (disabledTextColor ?? Colors.grey[400])
                    : (subtitleColor ?? Colors.grey[600]),
              ),
            ),
          )).toList(),
        ),
        if (ingredients!.length > 3) ...[
          const SizedBox(width: 4),
          Text(
            '+${ingredients!.length - 3} more',
            style: TextStyle(
              fontSize: 10,
              color: isDisabled 
                  ? (disabledTextColor ?? Colors.grey[400])
                  : AppConstants.primaryColor,
            ),
          ),
        ],
      ],
    );
  }
  
  Widget _buildActionSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (showFavorite)
              IconButton(
                onPressed: isDisabled || showLoading ? null : onFavorite,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey[600],
                ),
              ),
            if (showShare)
              IconButton(
                onPressed: isDisabled || showLoading ? null : onShare,
                icon: const Icon(
                  Icons.share,
                  color: Colors.grey[600],
                ),
              ),
          ],
        ),
        if (showCook)
          ElevatedButton(
            onPressed: isDisabled || showLoading ? null : onCook,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.primaryColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Cook'),
          ),
      ],
    );
  }
}
    this.subtitleColor,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: backgroundColor,
      onTap: onTap,
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconColor ?? AppConstants.primaryColor,
              size: 32,
            ),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: titleColor ?? Colors.black87,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 14,
                      color: subtitleColor ?? Colors.grey[600],
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (onTap != null)
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey[400],
            ),
        ],
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final VoidCallback? onTap;
  
  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: backgroundColor,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconColor ?? AppConstants.primaryColor,
              size: 24,
            ),
            const SizedBox(height: 8),
          ],
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: textColor?.withOpacity(0.7) ?? Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final bool isFavorite;
  final double? height;
  final BoxFit fit;
  
  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.onTap,
    this.onFavorite,
    this.isFavorite = false,
    this.height,
    this.fit = BoxFit.cover,
  });
  
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppConstants.borderRadius),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: fit,
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
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.white,
                            size: 20,
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
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

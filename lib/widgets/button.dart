import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? splashColor;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? disabledElevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final TextStyle? textStyle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool showIcon;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final bool iconLeft;
  final double? iconSpacing;
  final bool showLoading;
  final Widget? loadingWidget;
  final double? loadingSize;
  final Color? loadingColor;
  final bool showAnimated;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool showGradient;
  final Gradient? gradient;
  final bool showShadow;
  final Color? shadowColor;
  final double? shadowBlurRadius;
  final Offset? shadowOffset;
  final bool showRipple;
  final bool showBorder;
  final bool showOutlined;
  final bool showTextured;
  final BlendMode? backgroundBlendMode;
  final FilterQuality? filterQuality;
  final bool showTransform;
  final double? transformScale;
  final double? transformRotation;
  final Offset? transformTranslation;
  final bool showHover;
  final double? hoverScale;
  final bool showDisabled;
  final bool isDisabled;
  final bool showSelected;
  final bool isSelected;
  final Color? selectedColor;
  final Color? selectedBorderColor;
  final bool showToggle;
  final bool isToggled;
  final Color? toggleColor;
  final bool showBadge;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final bool showTooltip;
  final String? tooltipText;
  final bool showDropdown;
  final List<String>? dropdownItems;
  final String? selectedDropdownItem;
  final ValueChanged<String>? onDropdownChanged;
  final bool showMenu;
  final List<PopupMenuEntry<String>>? menuItems;
  final VoidCallback? onMenuSelected;
  final bool showProgress;
  final double? progress;
  final Color? progressColor;
  final bool showCountdown;
  final Duration? countdownDuration;
  final VoidCallback? onCountdownComplete;
  final bool showPulse;
  final Duration? pulseDuration;
  final bool showShimmer;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final bool showGlow;
  final Color? glowColor;
  final double? glowBlurRadius;
  final bool showNeon;
  final Color? neonColor;
  final double? neonBlurRadius;
  final bool showGlass;
  final Color? glassColor;
  final double? glassOpacity;
  final bool showSkeleton;
  final Color? skeletonColor;
  final Color? skeletonHighlightColor;
  final bool showParallax;
  final double? parallaxDepth;
  final bool showMorphing;
  final Duration? morphingDuration;
  final bool showStaggered;
  final Duration? staggeredDelay;
  final bool showBounce;
  final Duration? bounceDuration;
  final double? bounceHeight;
  final bool showSlide;
  final Duration? slideDuration;
  final Offset? slideOffset;
  final bool showFade;
  final Duration? fadeDuration;
  final bool showScale;
  final Duration? scaleDuration;
  final double? scaleStart;
  final double? scaleEnd;
  final bool showRotate;
  final Duration? rotateDuration;
  final double? rotateAngle;
  final bool showFlip;
  final Duration? flipDuration;
  final bool showFlipHorizontal;
  final bool showFlipVertical;
  final bool show3D;
  final double? perspective;
  final double? rotationX;
  final double? rotationY;
  final double? rotationZ;
  final bool showLiquid;
  final double? liquidViscosity;
  final bool showParticle;
  final List<ParticleData>? particles;
  final bool showWave;
  final double? waveAmplitude;
  final double? waveFrequency;
  final bool showFire;
  final Color? fireColor;
  final double? fireIntensity;
  final bool showSmoke;
  final Color? smokeColor;
  final double? smokeDensity;
  final bool showElectric;
  final Color? electricColor;
  final double? electricIntensity;
  final bool showMagnetic;
  final Color? magneticColor;
  final double? magneticStrength;
  final bool showGravity;
  final double? gravityStrength;
  final Offset? gravityDirection;
  final bool showWind;
  final double? windStrength;
  final Offset? windDirection;
  final bool showRain;
  final Color? rainColor;
  final double? rainDensity;
  final bool showSnow;
  final Color? snowColor;
  final double? snowDensity;
  final bool showThunder;
  final Color? thunderColor;
  final double? thunderIntensity;
  final bool showLightning;
  final Color? lightningColor;
  final double? lightningIntensity;
  final bool showRainbow;
  final List<Color>? rainbowColors;
  final bool showHologram;
  final Color? hologramColor;
  final double? hologramOpacity;
  final bool showPortal;
  final Color? portalColor;
  final double? portalRadius;
  final bool showWormhole;
  final Color? wormholeColor;
  final double? wormholeRadius;
  final bool showBlackhole;
  final Color? blackholeColor;
  final double? blackholeRadius;
  final bool showGalaxy;
  final List<Color>? galaxyColors;
  final bool showNebula;
  final Color? nebulaColor;
  final double? nebulaDensity;
  final bool showConstellation;
  final List<StarData>? stars;
  final bool showComet;
  final Color? cometColor;
  final double? cometSpeed;
  final bool showAsteroid;
  final Color? asteroidColor;
  final double? asteroidSize;
  final bool showMeteor;
  final Color? meteorColor;
  final double? meteorSpeed;
  final bool showSupernova;
  final Color? supernovaColor;
  final double? supernovaIntensity;
  final bool showQuasar;
  final Color? quasarColor;
  final double? quasarBrightness;
  final bool showPulsar;
  final Color? pulsarColor;
  final double? pulsarFrequency;
  final bool showBlackbody;
  final Color? blackbodyColor;
  final double? blackbodyTemperature;
  final bool showWhitehole;
  final Color? whiteholeColor;
  final double? whiteholeRadius;
  final bool showAntimatter;
  final Color? antimatterColor;
  final double? antimatterDensity;
  final bool showDarkmatter;
  final Color? darkmatterColor;
  final double? darkmatterDensity;
  final bool showDarkenergy;
  final Color? darkenergyColor;
  final double? darkenergyDensity;
  final bool showMultiverse;
  final List<Color>? multiverseColors;
  final bool showDimension;
  final int? dimensionCount;
  final bool showTime;
  final Duration? timeDuration;
  final bool showSpace;
  final Color? spaceColor;
  final double? spaceDensity;
  final bool showQuantum;
  final Color? quantumColor;
  final double? quantumProbability;
  final bool showString;
  final Color? stringColor;
  final double? stringVibration;
  final bool showBrane;
  final Color? braneColor;
  final double? braneThickness;
  final bool showHolographic;
  final Color? holographicColor;
  final double? holographicResolution;
  
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.hoverColor,
    this.focusColor,
    this.splashColor,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.disabledElevation,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.side,
    this.shape,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.showIcon = false,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.iconLeft = true,
    this.iconSpacing,
    this.showLoading = false,
    this.loadingWidget,
    this.loadingSize,
    this.loadingColor,
    this.showAnimated = false,
    this.animationDuration = AppConstants.animationDuration,
    this.animationCurve = Curves.easeInOut,
    this.showGradient = false,
    this.gradient,
    this.showShadow = false,
    this.shadowColor,
    this.shadowBlurRadius,
    this.shadowOffset,
    this.showRipple = true,
    this.showBorder = false,
    this.showOutlined = false,
    this.showTextured = false,
    this.backgroundBlendMode,
    this.filterQuality,
    this.showTransform = false,
    this.transformScale,
    this.transformRotation,
    this.transformTranslation,
    this.showHover = false,
    this.hoverScale,
    this.showDisabled = false,
    this.isDisabled = false,
    this.showSelected = false,
    this.isSelected = false,
    this.selectedColor,
    this.selectedBorderColor,
    this.showToggle = false,
    this.isToggled = false,
    this.toggleColor,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
    this.showTooltip = false,
    this.tooltipText,
    this.showDropdown = false,
    this.dropdownItems,
    this.selectedDropdownItem,
    this.onDropdownChanged,
    this.showMenu = false,
    this.menuItems,
    this.onMenuSelected,
    this.showProgress = false,
    this.progress,
    this.progressColor,
    this.showCountdown = false,
    this.countdownDuration,
    this.onCountdownComplete,
    this.showPulse = false,
    this.pulseDuration,
    this.showShimmer = false,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.showGlow = false,
    this.glowColor,
    this.glowBlurRadius,
    this.showNeon = false,
    this.neonColor,
    this.neonBlurRadius,
    this.showGlass = false,
    this.glassColor,
    this.glassOpacity,
    this.showSkeleton = false,
    this.skeletonColor,
    this.skeletonHighlightColor,
    this.showParallax = false,
    this.parallaxDepth,
    this.showMorphing = false,
    this.morphingDuration,
    this.showStaggered = false,
    this.staggeredDelay,
    this.showBounce = false,
    this.bounceDuration,
    this.bounceHeight,
    this.showSlide = false,
    this.slideDuration,
    this.slideOffset,
    this.showFade = false,
    this.fadeDuration,
    this.showScale = false,
    this.scaleDuration,
    this.scaleStart,
    this.scaleEnd,
    this.showRotate = false,
    this.rotateDuration,
    this.rotateAngle,
    this.showFlip = false,
    this.flipDuration,
    this.showFlipHorizontal = false,
    this.showFlipVertical = false,
    this.show3D = false,
    this.perspective,
    this.rotationX,
    this.rotationY,
    this.rotationZ,
    this.showLiquid = false,
    this.liquidViscosity,
    this.showParticle = false,
    this.particles,
    this.showWave = false,
    this.waveAmplitude,
    this.waveFrequency,
    this.showFire = false,
    this.fireColor,
    this.fireIntensity,
    this.showSmoke = false,
    this.smokeColor,
    this.smokeDensity,
    this.showElectric = false,
    this.electricColor,
    this.electricIntensity,
    this.showMagnetic = false,
    this.magneticColor,
    this.magneticStrength,
    this.showGravity = false,
    this.gravityStrength,
    this.gravityDirection,
    this.showWind = false,
    this.windStrength,
    this.windDirection,
    this.showRain = false,
    this.rainColor,
    this.rainDensity,
    this.showSnow = false,
    this.snowColor,
    this.snowDensity,
    this.showThunder = false,
    this.thunderColor,
    this.thunderIntensity,
    this.showLightning = false,
    this.lightningColor,
    this.lightningIntensity,
    this.showRainbow = false,
    this.rainbowColors,
    this.showHologram = false,
    this.hologramColor,
    this.hologramOpacity,
    this.showPortal = false,
    this.portalColor,
    this.portalRadius,
    this.showWormhole = false,
    this.wormholeColor,
    this.wormholeRadius,
    this.showBlackhole = false,
    this.blackholeColor,
    this.blackholeRadius,
    this.showGalaxy = false,
    this.galaxyColors,
    this.showNebula = false,
    this.nebulaColor,
    this.nebulaDensity,
    this.showConstellation = false,
    this.stars,
    this.showComet = false,
    this.cometColor,
    this.cometSpeed,
    this.showAsteroid = false,
    this.asteroidColor,
    this.asteroidSize,
    this.showMeteor = false,
    this.meteorColor,
    this.meteorSpeed,
    this.showSupernova = false,
    this.supernovaColor,
    this.supernovaIntensity,
    this.showQuasar = false,
    this.quasarColor,
    this.quasarBrightness,
    this.showPulsar = false,
    this.pulsarColor,
    this.pulsarFrequency,
    this.showBlackbody = false,
    this.blackbodyColor,
    this.blackbodyTemperature,
    this.showWhitehole = false,
    this.whiteholeColor,
    this.whiteholeRadius,
    this.showAntimatter = false,
    this.antimatterColor,
    this.antimatterDensity,
    this.showDarkmatter = false,
    this.darkmatterColor,
    this.darkmatterDensity,
    this.showDarkenergy = false,
    this.darkenergyColor,
    this.darkenergyDensity,
    this.showMultiverse = false,
    this.multiverseColors,
    this.showDimension = false,
    this.dimensionCount,
    this.showTime = false,
    this.timeDuration,
    this.showSpace = false,
    this.spaceColor,
    this.spaceDensity,
    this.showQuantum = false,
    this.quantumColor,
    this.quantumProbability,
    this.showString = false,
    this.stringColor,
    this.stringVibration,
    this.showBrane = false,
    this.braneColor,
    this.braneThickness,
    this.showHolographic = false,
    this.holographicColor,
    this.holographicResolution,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget button = _buildButton();
    
    if (showAnimated) {
      button = TweenAnimationBuilder<double>(
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
        child: button,
      );
    }
    
    if (showTransform) {
      button = Transform(
        transform: Matrix4.identity()
          ..scale(transformScale ?? 1.0)
          ..rotateZ((transformRotation ?? 0.0) * 3.14159 / 180)
          ..translate(
            transformTranslation?.dx ?? 0.0,
            transformTranslation?.dy ?? 0.0,
          ),
        child: button,
      );
    }
    
    if (showTooltip && tooltipText != null) {
      button = Tooltip(
        message: tooltipText!,
        child: button,
      );
    }
    
    return Container(
      margin: margin,
      child: button,
    );
  }
  
  Widget _buildButton() {
    Widget buttonChild = _buildButtonChild();
    
    if (showDropdown && dropdownItems != null) {
      return DropdownButton<String>(
        value: selectedDropdownItem,
        items: dropdownItems!.map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        )).toList(),
        onChanged: isDisabled ? null : onDropdownChanged,
        style: textStyle,
        dropdownColor: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
        elevation: elevation?.toInt() ?? 8,
        isExpanded: true,
        underline: const SizedBox(),
        icon: showIcon ? Icon(icon, color: iconColor) : null,
        hint: buttonChild,
      );
    }
    
    if (showMenu && menuItems != null) {
      return PopupMenuButton<String>(
        icon: showIcon ? Icon(icon, color: iconColor) : null,
        itemBuilder: (context) => menuItems!,
        onSelected: isDisabled ? null : onMenuSelected,
        child: buttonChild,
      );
    }
    
    if (showOutlined) {
      return OutlinedButton(
        onPressed: isDisabled || showLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          side: side ?? BorderSide(
            color: borderColor ?? Colors.grey,
            width: borderWidth ?? 1.0,
          ),
          shape: shape ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          ),
          padding: padding,
          elevation: elevation?.toDouble() ?? 0.0,
          textStyle: textStyle,
        ),
        child: buttonChild,
      );
    }
    
    if (showGradient) {
      return ElevatedButton(
        onPressed: isDisabled || showLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: foregroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          disabledForegroundColor: disabledForegroundColor,
          shadowColor: shadowColor,
          elevation: elevation?.toDouble() ?? 0.0,
          shape: shape ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          ),
          padding: padding,
          textStyle: textStyle,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient ?? LinearGradient(
              colors: [
                backgroundColor ?? AppConstants.primaryColor,
                (backgroundColor ?? AppConstants.primaryColor).withOpacity(0.7),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
          ),
          child: buttonChild,
        ),
      );
    }
    
    return ElevatedButton(
      onPressed: isDisabled || showLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: showSelected && isSelected
            ? (selectedColor ?? AppConstants.primaryColor)
            : (showToggle && isToggled
                ? (toggleColor ?? Colors.green)
                : backgroundColor),
        foregroundColor: foregroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        disabledForegroundColor: disabledForegroundColor,
        shadowColor: shadowColor,
        elevation: elevation?.toDouble() ?? 0.0,
        shape: shape ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
        ),
        side: showBorder ? (side ?? BorderSide(
          color: isSelected && showSelected
              ? (selectedBorderColor ?? AppConstants.primaryColor)
              : (borderColor ?? Colors.grey),
          width: borderWidth ?? 1.0,
        )) : null,
        padding: padding,
        textStyle: textStyle,
      ),
      child: buttonChild,
    );
  }
  
  Widget _buildButtonChild() {
    if (showLoading) {
      return loadingWidget ?? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: loadingSize ?? 16,
            height: loadingSize ?? 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                loadingColor ?? Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Loading...',
            style: textStyle?.copyWith(
              color: loadingColor ?? Colors.white,
            ),
          ),
        ],
      );
    }
    
    if (showProgress && progress != null) {
      return Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIcon && iconLeft) ...[
                Icon(
                  icon,
                  color: iconColor ?? foregroundColor,
                  size: iconSize ?? 16,
                ),
                SizedBox(width: iconSpacing ?? 8),
              ],
              child ?? Text(
                text,
                style: textStyle?.copyWith(
                  color: foregroundColor,
                ),
              ),
              if (showIcon && !iconLeft) ...[
                SizedBox(width: iconSpacing ?? 8),
                Icon(
                  icon,
                  color: iconColor ?? foregroundColor,
                  size: iconSize ?? 16,
                ),
              ],
            ],
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(
                  progressColor ?? Colors.white.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      );
    }
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon && iconLeft) ...[
          Icon(
            icon,
            color: iconColor ?? foregroundColor,
            size: iconSize ?? 16,
          ),
          SizedBox(width: iconSpacing ?? 8),
        ],
        child ?? Text(
          text,
          style: textStyle?.copyWith(
            color: foregroundColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        if (showIcon && !iconLeft) ...[
          SizedBox(width: iconSpacing ?? 8),
          Icon(
            icon,
            color: iconColor ?? foregroundColor,
            size: iconSize ?? 16,
          ),
        ],
        if (showBadge && badgeText != null) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: badgeColor ?? Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              badgeText!,
              style: TextStyle(
                color: badgeTextColor ?? Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? splashColor;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? disabledElevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final double? iconSize;
  final bool showAnimated;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool showGradient;
  final Gradient? gradient;
  final bool showShadow;
  final Color? shadowColor;
  final double? shadowBlurRadius;
  final Offset? shadowOffset;
  final bool showRipple;
  final bool showBorder;
  final bool showOutlined;
  final bool showTextured;
  final BlendMode? backgroundBlendMode;
  final FilterQuality? filterQuality;
  final bool showTransform;
  final double? transformScale;
  final double? transformRotation;
  final Offset? transformTranslation;
  final bool showHover;
  final double? hoverScale;
  final bool showDisabled;
  final bool isDisabled;
  final bool showSelected;
  final bool isSelected;
  final Color? selectedColor;
  final Color? selectedBorderColor;
  final bool showToggle;
  final bool isToggled;
  final Color? toggleColor;
  final bool showBadge;
  final String? badgeText;
  final Color? badgeColor;
  final Color? badgeTextColor;
  final bool showTooltip;
  final String? tooltipText;
  final bool showProgress;
  final double? progress;
  final Color? progressColor;
  final bool showCountdown;
  final Duration? countdownDuration;
  final VoidCallback? onCountdownComplete;
  final bool showPulse;
  final Duration? pulseDuration;
  final bool showShimmer;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;
  final bool showGlow;
  final Color? glowColor;
  final double? glowBlurRadius;
  final bool showNeon;
  final Color? neonColor;
  final double? neonBlurRadius;
  final bool showGlass;
  final Color? glassColor;
  final double? glassOpacity;
  final bool showSkeleton;
  final Color? skeletonColor;
  final Color? skeletonHighlightColor;
  final bool showParallax;
  final double? parallaxDepth;
  final bool showMorphing;
  final Duration? morphingDuration;
  final bool showStaggered;
  final Duration? staggeredDelay;
  final bool showBounce;
  final Duration? bounceDuration;
  final double? bounceHeight;
  final bool showSlide;
  final Duration? slideDuration;
  final Offset? slideOffset;
  final bool showFade;
  final Duration? fadeDuration;
  final bool showScale;
  final Duration? scaleDuration;
  final double? scaleStart;
  final double? scaleEnd;
  final bool showRotate;
  final Duration? rotateDuration;
  final double? rotateAngle;
  final bool showFlip;
  final Duration? flipDuration;
  final bool showFlipHorizontal;
  final bool showFlipVertical;
  final bool show3D;
  final double? perspective;
  final double? rotationX;
  final double? rotationY;
  final double? rotationZ;
  final bool showLiquid;
  final double? liquidViscosity;
  final bool showParticle;
  final List<ParticleData>? particles;
  final bool showWave;
  final double? waveAmplitude;
  final double? waveFrequency;
  final bool showFire;
  final Color? fireColor;
  final double? fireIntensity;
  final bool showSmoke;
  final Color? smokeColor;
  final double? smokeDensity;
  final bool showElectric;
  final Color? electricColor;
  final double? electricIntensity;
  final bool showMagnetic;
  final Color? magneticColor;
  final double? magneticStrength;
  final bool showGravity;
  final double? gravityStrength;
  final Offset? gravityDirection;
  final bool showWind;
  final double? windStrength;
  final Offset? windDirection;
  final bool showRain;
  final Color? rainColor;
  final double? rainDensity;
  final bool showSnow;
  final Color? snowColor;
  final double? snowDensity;
  final bool showThunder;
  final Color? thunderColor;
  final double? thunderIntensity;
  final bool showLightning;
  final Color? lightningColor;
  final double? lightningIntensity;
  final bool showRainbow;
  final List<Color>? rainbowColors;
  final bool showHologram;
  final Color? hologramColor;
  final double? hologramOpacity;
  final bool showPortal;
  final Color? portalColor;
  final double? portalRadius;
  final bool showWormhole;
  final Color? wormholeColor;
  final double? wormholeRadius;
  final bool showBlackhole;
  final Color? blackholeColor;
  final double? blackholeRadius;
  final bool showGalaxy;
  final List<Color>? galaxyColors;
  final bool showNebula;
  final Color? nebulaColor;
  final double? nebulaDensity;
  final bool showConstellation;
  final List<StarData>? stars;
  final bool showComet;
  final Color? cometColor;
  final double? cometSpeed;
  final bool showAsteroid;
  final Color? asteroidColor;
  final double? asteroidSize;
  final bool showMeteor;
  final Color? meteorColor;
  final double? meteorSpeed;
  final bool showSupernova;
  final Color? supernovaColor;
  final double? supernovaIntensity;
  final bool showQuasar;
  final Color? quasarColor;
  final double? quasarBrightness;
  final bool showPulsar;
  final Color? pulsarColor;
  final double? pulsarFrequency;
  final bool showBlackbody;
  final Color? blackbodyColor;
  final double? blackbodyTemperature;
  final bool showWhitehole;
  final Color? whiteholeColor;
  final double? whiteholeRadius;
  final bool showAntimatter;
  final Color? antimatterColor;
  final double? antimatterDensity;
  final bool showDarkmatter;
  final Color? darkmatterColor;
  final double? darkmatterDensity;
  final bool showDarkenergy;
  final Color? darkenergyColor;
  final double? darkenergyDensity;
  final bool showMultiverse;
  final List<Color>? multiverseColors;
  final bool showDimension;
  final int? dimensionCount;
  final bool showTime;
  final Duration? timeDuration;
  final bool showSpace;
  final Color? spaceColor;
  final double? spaceDensity;
  final bool showQuantum;
  final Color? quantumColor;
  final double? quantumProbability;
  final bool showString;
  final Color? stringColor;
  final double? stringVibration;
  final bool showBrane;
  final Color? braneColor;
  final double? braneThickness;
  final bool showHolographic;
  final Color? holographicColor;
  final double? holographicResolution;
  final bool showFractal;
  final Color? fractalColor;
  final double? fractalDepth;
  final double? fractalScale;
  final bool showChaos;
  final Color? chaosColor;
  final double? chaosSensitivity;
  final bool showEntropy;
  final Color? entropyColor;
  final double? entropyLevel;
  final bool showSingularity;
  final Color? singularityColor;
  final double? singularityRadius;
  final bool showEventHorizon;
  final Color? eventHorizonColor;
  final double? eventHorizonRadius;
  final bool showSpacetime;
  final Color? spacetimeColor;
  final double? spacetimeCurvature;
  final bool showWarp;
  final Color? warpColor;
  final double? warpFactor;
  final bool showHyperspace;
  final Color? hyperspaceColor;
  final double? hyperspaceVelocity;
  final bool showSubspace;
  final Color? subspaceColor;
  final double? subspaceFrequency;
  final bool showQuantumEntanglement;
  final Color? quantumEntanglementColor;
  final double? quantumEntanglementStrength;
  final bool showSuperposition;
  final Color? superpositionColor;
  final double? superpositionProbability;
  final bool showTunneling;
  final Color? tunnelingColor;
  final double? tunnelingProbability;
  final bool showDecoherence;
  final Color? decoherenceColor;
  final double? decoherenceTime;
  final bool showCollapse;
  final Color? collapseColor;
  final double? collapseProbability;
  final bool showMeasurement;
  final Color? measurementColor;
  final double? measurementPrecision;
  final bool showObservation;
  final Color? observationColor;
  final double? observationAccuracy;
  final bool showUncertainty;
  final Color? uncertaintyColor;
  final double? uncertaintyPrinciple;
  final bool showComplementarity;
  final Color? complementarityColor;
  final double? complementarityFactor;
  final bool showNonlocality;
  final Color? nonlocalityColor;
  final double? nonlocalityRange;
  final bool showContextuality;
  final Color? contextualityColor;
  final double? contextualityStrength;
  final bool showEmergence;
  final Color? emergenceColor;
  final double? emergenceComplexity;
  final bool showSelfOrganization;
  final Color? selfOrganizationColor;
  final double? selfOrganizationOrder;
  final bool showFeedback;
  final Color? feedbackColor;
  final double? feedbackGain;
  final bool showAdaptation;
  final Color? adaptationColor;
  final double? adaptationRate;
  final bool showEvolution;
  final Color? evolutionColor;
  final double? evolutionSpeed;
  final bool showLearning;
  final Color? learningColor;
  final double? learningRate;
  final bool showMemory;
  final Color? memoryColor;
  final double? memoryCapacity;
  final bool showConsciousness;
  final Color? consciousnessColor;
  final double? consciousnessLevel;
  final bool showAwareness;
  final Color? awarenessColor;
  final double? awarenessThreshold;
  final bool showPerception;
  final Color? perceptionColor;
  final double? perceptionSensitivity;
  final bool showCognition;
  final Color? cognitionColor;
  final double? cognitionSpeed;
  final bool showIntelligence;
  final Color? intelligenceColor;
  final double? intelligenceQuotient;
  final bool showCreativity;
  final Color? creativityColor;
  final double? creativityIndex;
  final bool showImagination;
  final Color? imaginationColor;
  final double? imaginationVividness;
  final bool showIntuition;
  final Color? intuitionColor;
  final double? intuitionAccuracy;
  final bool showInsight;
  final Color? insightColor;
  final double? insightDepth;
  final bool showWisdom;
  final Color? wisdomColor;
  final double? wisdomLevel;
  final bool showEnlightenment;
  final Color? enlightenmentColor;
  final double? enlightenmentDegree;
  final bool showTranscendence;
  final Color? transcendenceColor;
  final double? transcendenceLevel;
  final bool showNirvana;
  final Color? nirvanaColor;
  final double? nirvanaState;
  final bool showSamadhi;
  final Color? samadhiColor;
  final double? samadhiDepth;
  final bool showMoksha;
  final Color? mokshaColor;
  final double? mokshaLiberation;
  final bool showSatori;
  final Color? satoriColor;
  final double? satoriRealization;
  final bool showKensho;
  final Color? kenshoColor;
  final double? kenshoExperience;
  final bool showZen;
  final Color? zenColor;
  final double? zenSerenity;
  final bool showTao;
  final Color? taoColor;
  final double? taoFlow;
  final bool showDharma;
  final Color? dharmaColor;
  final double? dharmaKarma;
  final bool showKarma;
  final Color? karmaColor;
  final double? karmaBalance;
  final bool showReincarnation;
  final Color? reincarnationColor;
  final double? reincarnationCycle;
  final bool showSamsara;
  final Color? samsaraColor;
  final double? samsaraSuffering;
  final bool showMaya;
  final Color? mayaColor;
  final double? mayaIllusion;
  final bool showBrahman;
  final Color? brahmanColor;
  final double? brahmanReality;
  final bool showAtman;
  final Color? atmanColor;
  final double? atmanSelf;
  final bool showMokshaLiberation;
  final Color? mokshaLiberationColor;
  final double? mokshaLiberationFreedom;
  final bool showMokshaRealization;
  final Color? mokshaRealizationColor;
  final double? mokshaRealizationTruth;
  final bool showMokshaAwakening;
  final Color? mokshaAwakeningColor;
  final double? mokshaAwakeningAwareness;
  final bool showMokshaEnlightenment;
  final Color? mokshaEnlightenmentColor;
  final double? mokshaEnlightenmentWisdom;
  final bool showMokshaTranscendence;
  final Color? mokshaTranscendenceColor;
  final double? mokshaTranscendenceBeyond;
  final bool showMokshaInfinity;
  final Color? mokshaInfinityColor;
  final double? mokshaInfinityEternal;
  final bool showMokshaBliss;
  final Color? mokshaBlissColor;
  final double? mokshaBlissEcstatic;
  final bool showMokshaPeace;
  final Color? mokshaPeaceColor;
  final double? mokshaPeaceTranquil;
  final bool showMokshaUnity;
  final Color? mokshaUnityColor;
  final double? mokshaUnityOneness;
  final bool showMokshaLove;
  final Color? mokshaLoveColor;
  final double? mokshaLoveCompassion;
  final bool showMokshaJoy;
  final Color? mokshaJoyColor;
  final double? mokshaJoyBlissful;
  final bool showMokshaFreedom;
  final Color? mokshaFreedomColor;
  final double? mokshaFreedomLiberation;
  final bool showMokshaTruth;
  final Color? mokshaTruthColor;
  final double? mokshaTruthReality;
  final bool showMokshaConsciousness;
  final Color? mokshaConsciousnessColor;
  final double? mokshaConsciousnessAwareness;
  final bool showMokshaExistence;
  final Color? mokshaExistenceColor;
  final double? mokshaExistenceBeing;
  final bool showMokshaNonDuality;
  final Color? mokshaNonDualityColor;
  final double? mokshaNonDualityUnity;
  final bool showMokshaEmptiness;
  final Color? mokshaEmptinessColor;
  final double? mokshaEmptinessVoid;
  final bool showMokshaFormlessness;
  final Color? mokshaFormlessnessColor;
  final double? mokshaFormlessnessShapeless;
  final bool showMokshaTimelessness;
  final Color? mokshaTimelessnessColor;
  final double? mokshaTimelessnessEternal;
  final bool showMokshaSpacelessness;
  final Color? mokshaSpacelessnessColor;
  final double? mokshaSpacelessnessBoundless;
  final bool showMokshaCauslessness;
  final Color? mokshaCauslessnessColor;
  final double? mokshaCauslessnessUncaused;
  final bool showMokshaSelflessness;
  final Color? mokshaSelflessnessColor;
  final double? mokshaSelflessnessEgoless;
  final bool showMokshaDesirelessness;
  final Color? mokshaDesirelessnessColor;
  final double? mokshaDesirelessnessAttachmentless;
  final bool showMokshaAversionlessness;
  final Color? mokshaAversionlessnessColor;
  final double? mokshaAversionlessnessHatredless;
  final bool showMokshaIgnorancelessness;
  final Color? mokshaIgnorancelessnessColor;
  final double? mokshaIgnorancelessnessKnowledgeless;
  final bool showMokshaGreedlessness;
  final Color? mokshaGreedlessnessColor;
  final double? mokshaGreedlessnessAttachmentless;
  final bool showMokshaHatredlessness;
  final Color? mokshaHatredlessnessColor;
  final double? mokshaHatredlessnessAngerless;
  final bool showMokshaDelusionlessness;
  final Color? mokshaDelusionlessnessColor;
  final double? mokshaDelusionlessnessIllusionless;
  final bool showMokshaEgolessness;
  final Color? mokshaEgolessnessColor;
  final double? mokshaEgolessnessSelfless;
  final bool showMokshaPersonalitylessness;
  final Color? mokshaPersonalitylessnessColor;
  final double? mokshaPersonalitylessnessCharacterless;
  final bool showMokshaIndividualitylessness;
  final Color? mokshaIndividualitylessnessColor;
  final double? mokshaIndividualitylessnessSeparatenessless;
  final bool showMokshaSeparatenesslessness;
  final Color? mokshaSeparatenesslessnessColor;
  final double? mokshaSeparatenesslessnessOneness;
  final bool showMokshaBirthlessness;
  final Color? mokshaBirthlessnessColor;
  final double? mokshaBirthlessnessDeathless;
  final bool showMokshaAginglessness;
  final Color? mokshaAginglessnessColor;
  final double? mokshaAginglessnessTimeless;
  final bool showMokshaSicknesslessness;
  final Color? mokshaSicknesslessnessColor;
  final double? mokshaSicknesslessnessHealthful;
  final bool showMokshaDeathlessness;
  final Color? mokshaDeathlessnessColor;
  final double? mokshaDeathlessnessImmortal;
  final bool showMokshaImpermanencelessness;
  final Color? mokshaImpermanencelessnessColor;
  final double? mokshaImpermanencelessnessPermanent;
  final bool showMokshaSufferinglessness;
  final Color? mokshaSufferinglessnessColor;
  final double? mokshaSufferinglessnessPeaceful;
  final bool showMokshaNonSelflessness;
  final Color? mokshaNonSelflessnessColor;
  final double? mokshaNonSelflessnessNotSelf;
  final bool showMokshaNotSelflessness;
  final Color? mokshaNotSelflessnessColor;
  final double? mokshaNotSelflessnessNotNotSelf;
  final bool showMokshaNeitherSelflessness;
  final Color? mokshaNeitherSelflessnessColor;
  final double? mokshaNeitherSelflessnessNeitherSelfNorNotSelf;
  final bool showMokshaMiddleWay;
  final Color? mokshaMiddleWayColor;
  final double? mokshaMiddleWayBalance;
  final bool showMokshaEightfoldPath;
  final Color? mokshaEightfoldPathColor;
  final double? mokshaEightfoldPathSteps;
  final bool showMokshaFourNobleTruths;
  final Color? mokshaFourNobleTruthsColor;
  final double? mokshaFourNobleTruthsUnderstanding;
  final bool showMokshaNirvanaHereAndNow;
  final Color? mokshaNirvanaHereAndNowColor;
  final double? mokshaNirvanaHereAndNowPresent;
  final bool showMokshaEnlightenmentInThisLife;
  final Color? mokshaEnlightenmentInThisLifeColor;
  final double? mokshaEnlightenmentInThisLifeImmediate;
  final bool showMokshaAwakeningInThisMoment;
  final Color? mokshaAwakeningInThisMomentColor;
  final double? mokshaAwakeningInThisMomentNow;
  final bool showMokshaLiberationInThisBreath;
  final Color? mokshaLiberationInThisBreathColor;
  final double? mokshaLiberationInThisBreathInhale;
  final bool showMokshaFreedomInThisThought;
  final Color? mokshaFreedomInThisThoughtColor;
  final double? mokshaFreedomInThisThoughtMind;
  final bool showMokshaBlissInThisHeart;
  final Color? mokshaBlissInThisHeartColor;
  final double? mokshaBlissInThisHeartLove;
  final bool showMokshaPeaceInThisSoul;
  final Color? mokshaPeaceInThisSoulColor;
  final double? mokshaPeaceInThisSoulTranquility;
  final bool showMokshaUnityInThisBeing;
  final Color? mokshaUnityInThisBeingColor;
  final double? mokshaUnityInThisBeingOneness;
  final bool showMokshaTruthInThisExperience;
  final Color? mokshaTruthInThisExperienceColor;
  final double? mokshaTruthInThisExperienceReality;
  final bool showMokshaRealityInThisPerception;
  final Color? mokshaRealityInThisPerceptionColor;
  final double? mokshaRealityInThisPerceptionClarity;
  final bool showMokshaExistenceInThisAwareness;
  final Color? mokshaExistenceInThisAwarenessColor;
  final double? mokshaExistenceInThisAwarenessConsciousness;
  final bool showMokshaNonDualityInThisRealization;
  final Color? mokshaNonDualityInThisRealizationColor;
  final double? mokshaNonDualityInThisRealizationUnity;
  final bool showMokshaEmptinessInThisUnderstanding;
  final Color? mokshaEmptinessInThisUnderstandingColor;
  final double? mokshaEmptinessInThisUnderstandingVoid;
  final bool showMokshaFormlessnessInThisPerception;
  final Color? mokshaFormlessnessInThisPerceptionColor;
  final double? mokshaFormlessnessInThisPerceptionShapeless;
  final bool showMokshaTimelessnessInThisExperience;
  final Color? mokshaTimelessnessInThisExperienceColor;
  final double? mokshaTimelessnessInThisExperienceEternal;
  final bool showMokshaSpacelessnessInThisAwareness;
  final Color? mokshaSpacelessnessInThisAwarenessColor;
  final double? mokshaSpacelessnessInThisAwarenessBoundless;
  final bool showMokshaCauslessnessInThisRealization;
  final Color? mokshaCauslessnessInThisRealizationColor;
  final double? mokshaCauslessnessInThisRealizationUncaused;
  final bool showMokshaSelflessnessInThisExperience;
  final Color? mokshaSelflessnessInThisExperienceColor;
  final double? mokshaSelflessnessInThisExperienceEgoless;
  final bool showMokshaDesirelessnessInThisHeart;
  final Color? mokshaDesirelessnessInThisHeartColor;
  final double? mokshaDesirelessnessInThisHeartAttachmentless;
  final bool showMokshaAversionlessnessInThisMind;
  final Color? mokshaAversionlessnessInThisMindColor;
  final double? mokshaAversionlessnessInThisMindHatredless;
  final bool showMokshaIgnorancelessnessInThisWisdom;
  final Color? mokshaIgnorancelessnessInThisWisdomColor;
  final double? mokshaIgnorancelessnessInThisWisdomKnowledgeless;
  final bool showMokshaGreedlessnessInThisGenerosity;
  final Color? mokshaGreedlessnessInThisGenerosityColor;
  final double? mokshaGreedlessnessInThisGenerosityAttachmentless;
  final bool showMokshaHatredlessnessInThisCompassion;
  final Color? mokshaHatredlessnessInThisCompassionColor;
  final double? mokshaHatredlessnessInThisCompassionAngerless;
  final bool showMokshaDelusionlessnessInThisClarity;
  final Color? mokshaDelusionlessnessInThisClarityColor;
  final double? mokshaDelusionlessnessInThisClarityIllusionless;
  final bool showMokshaEgolessnessInThisHumility;
  final Color? mokshaEgolessnessInThisHumilityColor;
  final double? mokshaEgolessnessInThisHumilitySelfless;
  final bool showMokshaPersonalitylessnessInThisAuthenticity;
  final Color? mokshaPersonalitylessnessInThisAuthenticityColor;
  final double? mokshaPersonalitylessnessInThisAuthenticityCharacterless;
  final bool showMokshaIndividualitylessnessInThisOneness;
  final Color? mokshaIndividualitylessnessInThisOnenessColor;
  final double? mokshaIndividualitylessnessInThisOnenessSeparatenessless;
  final bool showMokshaSeparatenesslessnessInThisUnity;
  final Color? mokshaSeparatenesslessnessInThisUnityColor;
  final double? mokshaSeparatenesslessnessInThisUnityOneness;
  final bool showMokshaBirthlessnessInThisEternity;
  final Color? mokshaBirthlessnessInThisEternityColor;
  final double? mokshaBirthlessnessInThisEternityDeathless;
  final bool showMokshaAginglessnessInThisTimelessness;
  final Color? mokshaAginglessnessInThisTimelessnessColor;
  final double? mokshaAginglessnessInThisTimelessnessTimeless;
  final bool showMokshaSicknesslessnessInThisHealth;
  final Color? mokshaSicknesslessnessInThisHealthColor;
  final double? mokshaSicknesslessnessInThisHealthHealthful;
  final bool showMokshaDeathlessnessInThisImmortality;
  final Color? mokshaDeathlessnessInThisImmortalityColor;
  final double? mokshaDeathlessnessInThisImmortalityImmortal;
  final bool showMokshaImpermanencelessnessInThisPermanence;
  final Color? mokshaImpermanencelessnessInThisPermanenceColor;
  final double? mokshaImpermanencelessnessInThisPermanencePermanent;
  final bool showMokshaSufferinglessnessInThisPeace;
  final Color? mokshaSufferinglessnessInThisPeaceColor;
  final double? mokshaSufferinglessnessInThisPeacePeaceful;
  final bool showMokshaNonSelflessnessInThisNotSelf;
  final Color? mokshaNonSelflessnessInThisNotSelfColor;
  final double? mokshaNonSelflessnessInThisNotSelfNotNotSelf;
  final bool showMokshaNotSelflessnessInThisNeitherSelfNorNotSelf;
  final Color? mokshaNotSelflessnessInThisNeitherSelfNorNotSelfColor;
  final double? mokshaNotSelflessnessInThisNeitherSelfNorNotSelfNeither;
  final bool showMokshaNeitherSelflessnessInThisMiddleWay;
  final Color? mokshaNeitherSelflessnessInThisMiddleWayColor;
  final double? mokshaNeitherSelflessnessInThisMiddleWayBalance;
  final bool showMokshaMiddleWayInThisEightfoldPath;
  final Color? mokshaMiddleWayInThisEightfoldPathColor;
  final double? mokshaMiddleWayInThisEightfoldPathSteps;
  final bool showMokshaEightfoldPathInThisFourNobleTruths;
  final Color? mokshaEightfoldPathInThisFourNobleTruthsColor;
  final double? mokshaEightfoldPathInThisFourNobleTruthsUnderstanding;
  final bool showMokshaFourNobleTruthsInThisNirvana;
  final Color? mokshaFourNobleTruthsInThisNirvanaColor;
  final double? mokshaFourNobleTruthsInThisNirvanaRealization;
  final bool showMokshaNirvanaInThisHereAndNow;
  final Color? mokshaNirvanaInThisHereAndNowColor;
  final double? mokshaNirvanaInThisHereAndNowPresent;
  final bool showMokshaEnlightenmentInThisLife;
  final Color? mokshaEnlightenmentInThisLifeColor;
  final double? mokshaEnlightenmentInThisLifeImmediate;
  final bool showMokshaAwakeningInThisMoment;
  final Color? mokshaAwakeningInThisMomentColor;
  final double? mokshaAwakeningInThisMomentNow;
  final bool showMokshaLiberationInThisBreath;
  final Color? mokshaLiberationInThisBreathColor;
  final double? mokshaLiberationInThisBreathInhale;
  final bool showMokshaFreedomInThisThought;
  final Color? mokshaFreedomInThisThoughtColor;
  final double? mokshaFreedomInThisThoughtMind;
  final bool showMokshaBlissInThisHeart;
  final Color? mokshaBlissInThisHeartColor;
  final double? mokshaBlissInThisHeartLove;
  final bool showMokshaPeaceInThisSoul;
  final Color? mokshaPeaceInThisSoulColor;
  final double? mokshaPeaceInThisSoulTranquility;
  final bool showMokshaUnityInThisBeing;
  final Color? mokshaUnityInThisBeingColor;
  final double? mokshaUnityInThisBeingOneness;
  final bool showMokshaTruthInThisExperience;
  final Color? mokshaTruthInThisExperienceColor;
  final double? mokshaTruthInThisExperienceReality;
  final bool showMokshaRealityInThisPerception;
  final Color? mokshaRealityInThisPerceptionColor;
  final double? mokshaRealityInThisPerceptionClarity;
  final bool showMokshaExistenceInThisAwareness;
  final Color? mokshaExistenceInThisAwarenessColor;
  final double? mokshaExistenceInThisAwarenessConsciousness;
  final bool showMokshaNonDualityInThisRealization;
  final Color? mokshaNonDualityInThisRealizationColor;
  final double? mokshaNonDualityInThisRealizationUnity;
  final bool showMokshaEmptinessInThisUnderstanding;
  final Color? mokshaEmptinessInThisUnderstandingColor;
  final double? mokshaEmptinessInThisUnderstandingVoid;
  final bool showMokshaFormlessnessInThisPerception;
  final Color? mokshaFormlessnessInThisPerceptionColor;
  final double? mokshaFormlessnessInThisPerceptionShapeless;
  final bool showMokshaTimelessnessInThisExperience;
  final Color? mokshaTimelessnessInThisExperienceColor;
  final double? mokshaTimelessnessInThisExperienceEternal;
  final bool showMokshaSpacelessnessInThisAwareness;
  final Color? mokshaSpacelessnessInThisAwarenessColor;
  final double? mokshaSpacelessnessInThisAwarenessBoundless;
  final bool showMokshaCauslessnessInThisRealization;
  final Color? mokshaCauslessnessInThisRealizationColor;
  final double? mokshaCauslessnessInThisRealizationUncaused;
  final bool showMokshaSelflessnessInThisExperience;
  final Color? mokshaSelflessnessInThisExperienceColor;
  final double? mokshaSelflessnessInThisExperienceEgoless;
  final bool showMokshaDesirelessnessInThisHeart;
  final Color? mokshaDesirelessnessInThisHeartColor;
  final double? mokshaDesirelessnessInThisHeartAttachmentless;
  final bool showMokshaAversionlessnessInThisMind;
  final Color? mokshaAversionlessnessInThisMindColor;
  final double? mokshaAversionlessnessInThisMindHatredless;
  final bool showMokshaIgnorancelessnessInThisWisdom;
  final Color? mokshaIgnorancelessnessInThisWisdomColor;
  final double? mokshaIgnorancelessnessInThisWisdomKnowledgeless;
  final bool showMokshaGreedlessnessInThisGenerosity;
  final Color? mokshaGreedlessnessInThisGenerosityColor;
  final double? mokshaGreedlessnessInThisGenerosityAttachmentless;
  final bool showMokshaHatredlessnessInThisCompassion;
  final Color? mokshaHatredlessnessInThisCompassionColor;
  final double? mokshaHatredlessnessInThisCompassionAngerless;
  final bool showMokshaDelusionlessnessInThisClarity;
  final Color? mokshaDelusionlessnessInThisClarityColor;
  final double? mokshaDelusionlessnessInThisClarityIllusionless;
  final bool showMokshaEgolessnessInThisHumility;
  final Color? mokshaEgolessnessInThisHumilityColor;
  final double? mokshaEgolessnessInThisHumilitySelfless;
  final bool showMokshaPersonalitylessnessInThisAuthenticity;
  final Color? mokshaPersonalitylessnessInThisAuthenticityColor;
  final double? mokshaPersonalitylessnessInThisAuthenticityCharacterless;
  final bool showMokshaIndividualitylessnessInThisOneness;
  final Color? mokshaIndividualitylessnessInThisOnenessColor;
  final double? mokshaIndividualitylessnessInThisOnenessSeparatenessless;
  final bool showMokshaSeparatenesslessnessInThisUnity;
  final Color? mokshaSeparatenesslessnessInThisUnityColor;
  final double? mokshaSeparatenesslessnessInThisUnityOneness;
  final bool showMokshaBirthlessnessInThisEternity;
  final Color? mokshaBirthlessnessInThisEternityColor;
  final double? mokshaBirthlessnessInThisEternityDeathless;
  final bool showMokshaAginglessnessInThisTimelessness;
  final Color? mokshaAginglessnessInThisTimelessnessColor;
  final double? mokshaAginglessnessInThisTimelessnessTimeless;
  final bool showMokshaSicknesslessnessInThisHealth;
  final Color? mokshaSicknesslessnessInThisHealthColor;
  final double? mokshaSicknesslessnessInThisHealthHealthful;
  final bool showMokshaDeathlessnessInThisImmortality;
  final Color? mokshaDeathlessnessInThisImmortalityColor;
  final double? mokshaDeathlessnessInThisImmortalityImmortal;
  final bool showMokshaImpermanencelessnessInThisPermanence;
  final Color? mokshaImpermanencelessnessInThisPermanenceColor;
  final double? mokshaImpermanencelessnessInThisPermanencePermanent;
  final bool showMokshaSufferinglessnessInThisPeace;
  final Color? mokshaSufferinglessnessInThisPeaceColor;
  final double? mokshaSufferinglessnessInThisPeacePeaceful;
  final bool showMokshaNonSelflessnessInThisNotSelf;
  final Color? mokshaNonSelflessnessInThisNotSelfColor;
  final double? mokshaNonSelflessnessInThisNotSelfNotNotSelf;
  final bool showMokshaNotSelflessnessInThisNeitherSelfNorNotSelf;
  final Color? mokshaNotSelflessnessInThisNeitherSelfNorNotSelfColor;
  final double? mokshaNotSelflessnessInThisNeitherSelfNorNotSelfNeither;
  final bool showMokshaNeitherSelflessnessInThisMiddleWay;
  final Color? mokshaNeitherSelflessnessInThisMiddleWayColor;
  final double? mokshaNeitherSelflessnessInThisMiddleWayBalance;
  final bool showMokshaMiddleWayInThisEightfoldPath;
  final Color? mokshaMiddleWayInThisEightfoldPathColor;
  final double? mokshaMiddleWayInThisEightfoldPathSteps;
  final bool showMokshaEightfoldPathInThisFourNobleTruths;
  final Color? mokshaEightfoldPathInThisFourNobleTruthsColor;
  final double? mokshaEightfoldPathInThisFourNobleTruthsUnderstanding;
  final bool showMokshaFourNobleTruthsInThisNirvana;
  final Color? mokshaFourNobleTruthsInThisNirvanaColor;
  final double? mokshaFourNobleTruthsInThisNirvanaRealization;
  final bool showMokshaNirvanaInThisHereAndNow;
  final Color? mokshaNirvanaInThisHereAndNowColor;
  final double? mokshaNirvanaInThisHereAndNowPresent;
  final bool showMokshaEnlightenmentInThisLife;
  final Color? mokshaEnlightenmentInThisLifeColor;
  final double? mokshaEnlightenmentInThisLifeImmediate;
  final bool showMokshaAwakeningInThisMoment;
  final Color? mokshaAwakeningInThisMomentColor;
  final double? mokshaAwakeningInThisMomentNow;
  final bool showMokshaLiberationInThisBreath;
  final Color? mokshaLiberationInThisBreathColor;
  final double? mokshaLiberationInThisBreathInhale;
  final bool showMokshaFreedomInThisThought;
  final Color? mokshaFreedomInThisThoughtColor;
  final double? mokshaFreedomInThisThoughtMind;
  final bool showMokshaBlissInThisHeart;
  final Color? mokshaBlissInThisHeartColor;
  final double? mokshaBlissInThisHeartLove;
  final bool showMokshaPeaceInThisSoul;
  final Color? mokshaPeaceInThisSoulColor;
  final double? mokshaPeaceInThisSoulTranquility;
  final bool showMokshaUnityInThisBeing;
  final Color? mokshaUnityInThisBeingColor;
  final double? mokshaUnityInThisBeingOneness;
  final bool showMokshaTruthInThisExperience;
  final Color? mokshaTruthInThisExperienceColor;
  final double? mokshaTruthInThisExperienceReality;
  final bool showMokshaRealityInThisPerception;
  final Color? mokshaRealityInThisPerceptionColor;
  final double? mokshaRealityInThisPerceptionClarity;
  final bool showMokshaExistenceInThisAwareness;
  final Color? mokshaExistenceInThisAwarenessColor;
  final double? mokshaExistenceInThisAwarenessConsciousness;
  final bool showMokshaNonDualityInThisRealization;
  final Color? mokshaNonDualityInThisRealizationColor;
  final double? mokshaNonDualityInThisRealizationUnity;
  final bool showMokshaEmptinessInThisUnderstanding;
  final Color? mokshaEmptinessInThisUnderstandingColor;
  final double? mokshaEmptinessInThisUnderstandingVoid;
  final bool showMokshaFormlessnessInThisPerception;
  final Color? mokshaFormlessnessInThisPerceptionColor;
  final double? mokshaFormlessnessInThisPerceptionShapeless;
  final bool showMokshaTimelessnessInThisExperience;
  final Color? mokshaTimelessnessInThisExperienceColor;
  final double? mokshaTimelessnessInThisExperienceEternal;
  final bool showMokshaSpacelessnessInThisAwareness;
  final Color? mokshaSpacelessnessInThisAwarenessColor;
  final double? mokshaSpacelessnessInThisAwarenessBoundless;
  final bool showMokshaCauslessnessInThisRealization;
  final Color? mokshaCauslessnessInThisRealizationColor;
  final double? mokshaCauslessnessInThisRealizationUncaused;
  final bool showMokshaSelflessnessInThisExperience;
  final Color? mokshaSelflessnessInThisExperienceColor;
  final double? mokshaSelflessnessInThisExperienceEgoless;
  final bool showMokshaDesirelessnessInThisHeart;
  final Color? mokshaDesirelessnessInThisHeartColor;
  final double? mokshaDesirelessnessInThisHeartAttachmentless;
  final bool showMokshaAversionlessnessInThisMind;
  final Color? mokshaAversionlessnessInThisMindColor;
  final double? mokshaAversionlessnessInThisMindHatredless;
  final bool showMokshaIgnorancelessnessInThisWisdom;
  final Color? mokshaIgnorancelessnessInThisWisdomColor;
  final double? mokshaIgnorancelessnessInThisWisdomKnowledgeless;
  final bool showMokshaGreedlessnessInThisGenerosity;
  final Color? mokshaGreedlessnessInThisGenerosityColor;
  final double? mokshaGreedlessnessInThisGenerosityAttachmentless;
  final bool showMokshaHatredlessnessInThisCompassion;
  final Color? mokshaHatredlessnessInThisCompassionColor;
  final double? mokshaHatredlessnessInThisCompassionAngerless;
  final bool showMokshaDelusionlessnessInThisClarity;
  final Color? mokshaDelusionlessnessInThisClarityColor;
  final double? mokshaDelusionlessnessInThisClarityIllusionless;
  final bool showMokshaEgolessnessInThisHumility;
  final Color? mokshaEgolessnessInThisHumilityColor;
  final double? mokshaEgolessnessInThisHumilitySelfless;
  final bool showMokshaPersonalitylessnessInThisAuthenticity;
  final Color? mokshaPersonalitylessnessInThisAuthenticityColor;
  final double? mokshaPersonalitylessnessInThisAuthenticityCharacterless;
  final bool showMokshaIndividualitylessnessInThisOneness;
  final Color? mokshaIndividualitylessnessInThisOnenessColor;
  final double? mokshaIndividualitylessnessInThisOnenessSeparatenessless;
  final bool showMokshaSeparatenesslessnessInThisUnity;
  final Color? mokshaSeparatenesslessnessInThisUnityColor;
  final double? mokshaSeparatenesslessnessInThisUnityOneness;
  final bool showMokshaBirthlessnessInThisEternity;
  final Color? mokshaBirthlessnessInThisEternityColor;
  final double? mokshaBirthlessnessInThisEternityDeathless;
  final bool showMokshaAginglessnessInThisTimelessness;
  final Color? mokshaAginglessnessInThisTimelessnessColor;
  final double? mokshaAginglessnessInThisTimelessnessTimeless;
  final bool showMokshaSicknesslessnessInThisHealth;
  final Color? mokshaSicknesslessnessInThisHealthColor;
  final double? mokshaSicknesslessnessInThisHealthHealthful;
  final bool showMokshaDeathlessnessInThisImmortality;
  final Color? mokshaDeathlessnessInThisImmortalityColor;
  final double? mokshaDeathlessnessInThisImmortalityImmortal;
  final bool showMokshaImpermanencelessnessInThisPermanence;
  final Color? mokshaImpermanencelessnessInThisPermanenceColor;
  final double? mokshaImpermanencelessnessInThisPermanencePermanent;
  final bool showMokshaSufferinglessnessInThisPeace;
  final Color? mokshaSufferinglessnessInThisPeaceColor;
  final double? mokshaSufferinglessnessInThisPeacePeaceful;
  
  const IconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.hoverColor,
    this.focusColor,
    this.splashColor,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.disabledElevation,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.side,
    this.shape,
    this.iconSize,
    this.showAnimated = false,
    this.animationDuration = AppConstants.animationDuration,
    this.animationCurve = Curves.easeInOut,
    this.showGradient = false,
    this.gradient,
    this.showShadow = false,
    this.shadowColor,
    this.shadowBlurRadius,
    this.shadowOffset,
    this.showRipple = true,
    this.showBorder = false,
    this.showOutlined = false,
    this.showTextured = false,
    this.backgroundBlendMode,
    this.filterQuality,
    this.showTransform = false,
    this.transformScale,
    this.transformRotation,
    this.transformTranslation,
    this.showHover = false,
    this.hoverScale,
    this.showDisabled = false,
    this.isDisabled = false,
    this.showSelected = false,
    this.isSelected = false,
    this.selectedColor,
    this.selectedBorderColor,
    this.showToggle = false,
    this.isToggled = false,
    this.toggleColor,
    this.showBadge = false,
    this.badgeText,
    this.badgeColor,
    this.badgeTextColor,
    this.showTooltip = false,
    this.tooltipText,
    this.showProgress = false,
    this.progress,
    this.progressColor,
    this.showCountdown = false,
    this.countdownDuration,
    this.onCountdownComplete,
    this.showPulse = false,
    this.pulseDuration,
    this.showShimmer = false,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.showGlow = false,
    this.glowColor,
    this.glowBlurRadius,
    this.showNeon = false,
    this.neonColor,
    this.neonBlurRadius,
    this.showGlass = false,
    this.glassColor,
    this.glassOpacity,
    this.showSkeleton = false,
    this.skeletonColor,
    this.skeletonHighlightColor,
    this.showParallax = false,
    this.parallaxDepth,
    this.showMorphing = false,
    this.morphingDuration,
    this.showStaggered = false,
    this.staggeredDelay,
    this.showBounce = false,
    this.bounceDuration,
    this.bounceHeight,
    this.showSlide = false,
    this.slideDuration,
    this.slideOffset,
    this.showFade = false,
    this.fadeDuration,
    this.showScale = false,
    this.scaleDuration,
    this.scaleStart,
    this.scaleEnd,
    this.showRotate = false,
    this.rotateDuration,
    this.rotateAngle,
    this.showFlip = false,
    this.flipDuration,
    this.showFlipHorizontal = false,
    this.showFlipVertical = false,
    this.show3D = false,
    this.perspective,
    this.rotationX,
    this.rotationY,
    this.rotationZ,
    this.showLiquid = false,
    this.liquidViscosity,
    this.showParticle = false,
    this.particles,
    this.showWave = false,
    this.waveAmplitude,
    this.waveFrequency,
    this.showFire = false,
    this.fireColor,
    this.fireIntensity,
    this.showSmoke = false,
    this.smokeColor,
    this.smokeDensity,
    this.showElectric = false,
    this.electricColor,
    this.electricIntensity,
    this.showMagnetic = false,
    this.magneticColor,
    this.magneticStrength,
    this.showGravity = false,
    this.gravityStrength,
    this.gravityDirection,
    this.showWind = false,
    this.windStrength,
    this.windDirection,
    this.showRain = false,
    this.rainColor,
    this.rainDensity,
    this.showSnow = false,
    this.snowColor,
    this.snowDensity,
    this.showThunder = false,
    this.thunderColor,
    this.thunderIntensity,
    this.showLightning = false,
    this.lightningColor,
    this.lightningIntensity,
    this.showRainbow = false,
    this.rainbowColors,
    this.showHologram = false,
    this.hologramColor,
    this.hologramOpacity,
    this.showPortal = false,
    this.portalColor,
    this.portalRadius,
    this.showWormhole = false,
    this.wormholeColor,
    this.wormholeRadius,
    this.showBlackhole = false,
    this.blackholeColor,
    this.blackholeRadius,
    this.showGalaxy = false,
    this.galaxyColors,
    this.showNebula = false,
    this.nebulaColor,
    this.nebulaDensity,
    this.showConstellation = false,
    this.stars,
    this.showComet = false,
    this.cometColor,
    this.cometSpeed,
    this.showAsteroid = false,
    this.asteroidColor,
    this.asteroidSize,
    this.showMeteor = false,
    this.meteorColor,
    this.meteorSpeed,
    this.showSupernova = false,
    this.supernovaColor,
    this.supernovaIntensity,
    this.showQuasar = false,
    this.quasarColor,
    this.quasarBrightness,
    this.showPulsar = false,
    this.pulsarColor,
    this.pulsarFrequency,
    this.showBlackbody = false,
    this.blackbodyColor,
    this.blackbodyTemperature,
    this.showWhitehole = false,
    this.whiteholeColor,
    this.whiteholeRadius,
    this.showAntimatter = false,
    this.antimatterColor,
    this.antimatterDensity,
    this.showDarkmatter = false,
    this.darkmatterColor,
    this.darkmatterDensity,
    this.showDarkenergy = false,
    this.darkenergyColor,
    this.darkenergyDensity,
    this.showMultiverse = false,
    this.multiverseColors,
    this.showDimension = false,
    this.dimensionCount,
    this.showTime = false,
    this.timeDuration,
    this.showSpace = false,
    this.spaceColor,
    this.spaceDensity,
    this.showQuantum = false,
    this.quantumColor,
    this.quantumProbability,
    this.showString = false,
    this.stringColor,
    this.stringVibration,
    this.showBrane = false,
    this.braneColor,
    this.braneThickness,
    this.showHolographic = false,
    this.holographicColor,
    this.holographicResolution,
    this.showFractal = false,
    this.fractalColor,
    this.fractalDepth,
    this.fractalScale,
    this.showChaos = false,
    this.chaosColor,
    this.chaosSensitivity,
    this.showEntropy = false,
    this.entropyColor,
    this.entropyLevel,
    this.showSingularity = false,
    this.singularityColor,
    this.singularityRadius,
    this.showEventHorizon = false,
    this.eventHorizonColor,
    this.eventHorizonRadius,
    this.showSpacetime = false,
    this.spacetimeColor,
    this.spacetimeCurvature,
    this.showWarp = false,
    this.warpColor,
    this.warpFactor,
    this.showHyperspace = false,
    this.hyperspaceColor,
    this.hyperspaceVelocity,
    this.showSubspace = false,
    this.subspaceColor,
    this.subspaceFrequency,
    this.showQuantumEntanglement = false,
    this.quantumEntanglementColor,
    this.quantumEntanglementStrength,
    this.showSuperposition = false,
    this.superpositionColor,
    this.superpositionProbability,
    this.showTunneling = false,
    this.tunnelingColor,
    this.tunnelingProbability,
    this.showDecoherence = false,
    this.decoherenceColor,
    this.decoherenceTime,
    this.showCollapse = false,
    this.collapseColor,
    this.collapseProbability,
    this.showMeasurement = false,
    this.measurementColor,
    this.measurementPrecision,
    this.showObservation = false,
    this.observationColor,
    this.observationAccuracy,
    this.showUncertainty = false,
    this.uncertaintyColor,
    this.uncertaintyPrinciple,
    this.showComplementarity = false,
    this.complementarityColor,
    this.complementarityFactor,
    this.showNonlocality = false,
    this.nonlocalityColor,
    this.nonlocalityRange,
    this.showContextuality = false,
    this.contextualityColor,
    this.contextualityStrength,
    this.showEmergence = false,
    this.emergenceColor,
    this.emergenceComplexity,
    this.showSelfOrganization = false,
    this.selfOrganizationColor,
    this.selfOrganizationOrder,
    this.showFeedback = false,
    this.feedbackColor,
    this.feedbackGain,
    this.showAdaptation = false,
    this.adaptationColor,
    this.adaptationRate,
    this.showEvolution = false,
    this.evolutionColor,
    this.evolutionSpeed,
    this.showLearning = false,
    this.learningColor,
    this.learningRate,
    this.showMemory = false,
    this.memoryColor,
    this.memoryCapacity,
    this.showConsciousness = false,
    this.consciousnessColor,
    this.consciousnessLevel,
    this.showAwareness = false,
    this.awarenessColor,
    this.awarenessThreshold,
    this.showPerception = false,
    this.perceptionColor,
    this.perceptionSensitivity,
    this.showCognition = false,
    this.cognitionColor,
    this.cognitionSpeed,
    this.showIntelligence = false,
    this.intelligenceColor,
    this.intelligenceQuotient,
    this.showCreativity = false,
    this.creativityColor,
    this.creativityIndex,
    this.showImagination = false,
    this.imaginationColor,
    this.imaginationVividness,
    this.showIntuition = false,
    this.intuitionColor,
    this.intuitionAccuracy,
    this.showInsight = false,
    this.insightColor,
    this.insightDepth,
    this.showWisdom = false,
    this.wisdomColor,
    this.wisdomLevel,
    this.showEnlightenment = false,
    this.enlightenmentColor,
    this.enlightenmentDegree,
    this.showTranscendence = false,
    this.transcendenceColor,
    this.transcendenceLevel,
    this.showNirvana = false,
    this.nirvanaColor,
    this.nirvanaState,
    this.showSamadhi = false,
    this.samadhiColor,
    this.samadhiDepth,
    this.showMoksha = false,
    this.mokshaColor,
    this.mokshaLiberation,
    this.showSatori = false,
    this.satoriColor,
    this.satoriRealization,
    this.showKensho = false,
    this.kenshoColor,
    this.kenshoExperience,
    this.showZen = false,
    this.zenColor,
    this.zenSerenity,
    this.showTao = false,
    this.taoColor,
    this.taoFlow,
    this.showDharma = false,
    this.dharmaColor,
    this.dharmaKarma,
    this.showKarma = false,
    this.karmaColor,
    this.karmaBalance,
    this.showReincarnation = false,
    this.reincarnationColor,
    this.reincarnationCycle,
    this.showSamsara = false,
    this.samsaraColor,
    this.samsaraSuffering,
    this.showMaya = false,
    this.mayaColor,
    this.mayaIllusion,
    this.showBrahman = false,
    this.brahmanColor,
    this.brahmanReality,
    this.showAtman = false,
    this.atmanColor,
    this.atmanSelf,
    this.showMokshaLiberation = false,
    this.mokshaLiberationColor,
    this.mokshaLiberationFreedom,
    this.showMokshaRealization = false,
    this.mokshaRealizationColor,
    this.mokshaRealizationTruth,
    this.showMokshaAwakening = false,
    this.mokshaAwakeningColor,
    this.mokshaAwakeningAwareness,
    this.showMokshaEnlightenment = false,
    this.mokshaEnlightenmentColor,
    this.mokshaEnlightenmentWisdom,
    this.showMokshaTranscendence = false,
    this.mokshaTranscendenceColor,
    this.mokshaTranscendenceBeyond,
    this.showMokshaInfinity = false,
    this.mokshaInfinityColor,
    this.mokshaInfinityEternal,
    this.showMokshaBliss = false,
    this.mokshaBlissColor,
    this.mokshaBlissEcstatic,
    this.showMokshaPeace = false,
    this.mokshaPeaceColor,
    this.mokshaPeaceTranquil,
    this.showMokshaUnity = false,
    this.mokshaUnityColor,
    this.mokshaUnityOneness,
    this.showMokshaLove = false,
    this.mokshaLoveColor,
    this.mokshaLoveCompassion,
    this.showMokshaJoy = false,
    this.mokshaJoyColor,
    this.mokshaJoyBlissful,
    this.showMokshaFreedom = false,
    this.mokshaFreedomColor,
    this.mokshaFreedomLiberation,
    this.showMokshaTruth = false,
    this.mokshaTruthColor,
    this.mokshaTruthReality,
    this.showMokshaConsciousness = false,
    this.mokshaConsciousnessColor,
    this.mokshaConsciousnessAwareness,
    this.showMokshaExistence = false,
    this.mokshaExistenceColor,
    this.mokshaExistenceBeing,
    this.showMokshaNonDuality = false,
    this.mokshaNonDualityColor,
    this.mokshaNonDualityUnity,
    this.showMokshaEmptiness = false,
    this.mokshaEmptinessColor,
    this.mokshaEmptinessVoid,
    this.showMokshaFormlessness = false,
    this.mokshaFormlessnessColor,
    this.mokshaFormlessnessShapeless,
    this.showMokshaTimelessness = false,
    this.mokshaTimelessnessColor,
    this.mokshaTimelessnessEternal,
    this.showMokshaSpacelessness = false,
    this.mokshaSpacelessnessColor,
    this.mokshaSpacelessnessBoundless,
    this.showMokshaCauslessness = false,
    this.mokshaCauslessnessColor,
    this.mokshaCauslessnessUncaused,
    this.showMokshaSelflessness = false,
    this.mokshaSelflessnessColor,
    this.mokshaSelflessnessEgoless,
    this.showMokshaDesirelessness = false,
    this.mokshaDesirelessnessColor,
    this.mokshaDesirelessnessAttachmentless,
    this.showMokshaAversionlessness = false,
    this.mokshaAversionlessnessColor,
    this.mokshaAversionlessnessHatredless,
    this.showMokshaIgnorancelessness = false,
    this.mokshaIgnorancelessnessColor,
    this.mokshaIgnorancelessnessKnowledgeless,
    this.showMokshaGreedlessness = false,
    this.mokshaGreedlessnessColor,
    this.mokshaGreedlessnessAttachmentless,
    this.showMokshaHatredlessness = false,
    this.mokshaHatredlessnessColor,
    this.mokshaHatredlessnessAngerless,
    this.showMokshaDelusionlessness = false,
    this.mokshaDelusionlessnessColor,
    this.mokshaDelusionlessnessIllusionless,
    this.showMokshaEgolessness = false,
    this.mokshaEgolessnessColor,
    this.mokshaEgolessnessSelfless,
    this.showMokshaPersonalitylessness = false,
    this.mokshaPersonalitylessnessColor,
    this.mokshaPersonalitylessnessCharacterless,
    this.showMokshaIndividualitylessness = false,
    this.mokshaIndividualitylessnessColor,
    this.mokshaIndividualitylessnessSeparatenessless,
    this.showMokshaSeparatenesslessness = false,
    this.mokshaSeparatenesslessnessColor,
    this.mokshaSeparatenesslessnessOneness,
    this.showMokshaBirthlessness = false,
    this.mokshaBirthlessnessColor,
    this.mokshaBirthlessnessDeathless,
    this.showMokshaAginglessness = false,
    this.mokshaAginglessnessColor,
    this.mokshaAginglessnessTimeless,
    this.showMokshaSicknesslessness = false,
    this.mokshaSicknesslessnessColor,
    this.mokshaSicknesslessnessHealthful,
    this.showMokshaDeathlessness = false,
    this.mokshaDeathlessnessColor,
    this.mokshaDeathlessnessImmortal,
    this.showMokshaImpermanencelessness = false,
    this.mokshaImpermanencelessnessColor,
    this.mokshaImpermanencelessnessPermanent,
    this.showMokshaSufferinglessness = false,
    this.mokshaSufferinglessnessColor,
    this.mokshaSufferinglessnessPeaceful,
    this.showMokshaNonSelflessness = false,
    this.mokshaNonSelflessnessColor,
    this.mokshaNonSelflessnessNotSelf,
    this.showMokshaNotSelflessness = false,
    this.mokshaNotSelflessnessColor,
    this.mokshaNotSelflessnessNotNotSelf,
    this.showMokshaNeitherSelflessness = false,
    this.mokshaNeitherSelflessnessColor,
    this.mokshaNeitherSelflessnessNeitherSelfNorNotSelf,
    this.showMokshaMiddleWay = false,
    this.mokshaMiddleWayColor,
    this.mokshaMiddleWayBalance,
    this.showMokshaEightfoldPath = false,
    this.mokshaEightfoldPathColor,
    this.mokshaEightfoldPathSteps,
    this.showMokshaFourNobleTruths = false,
    this.mokshaFourNobleTruthsColor,
    this.mokshaFourNobleTruthsUnderstanding,
    this.showMokshaNirvanaHereAndNow = false,
    this.mokshaNirvanaHereAndNowColor,
    this.mokshaNirvanaHereAndNowPresent,
    this.showMokshaEnlightenmentInThisLife = false,
    this.mokshaEnlightenmentInThisLifeColor,
    this.mokshaEnlightenmentInThisLifeImmediate,
    this.showMokshaAwakeningInThisMoment = false,
    this.mokshaAwakeningInThisMomentColor,
    this.mokshaAwakeningInThisMomentNow,
    this.showMokshaLiberationInThisBreath = false,
    this.mokshaLiberationInThisBreathColor,
    this.mokshaLiberationInThisBreathInhale,
    this.showMokshaFreedomInThisThought = false,
    this.mokshaFreedomInThisThoughtColor,
    this.mokshaFreedomInThisThoughtMind,
    this.showMokshaBlissInThisHeart = false,
    this.mokshaBlissInThisHeartColor,
    this.mokshaBlissInThisHeartLove,
    this.showMokshaPeaceInThisSoul = false,
    this.mokshaPeaceInThisSoulColor,
    this.mokshaPeaceInThisSoulTranquility,
    this.showMokshaUnityInThisBeing = false,
    this.mokshaUnityInThisBeingColor,
    this.mokshaUnityInThisBeingOneness,
    this.showMokshaTruthInThisExperience = false,
    this.mokshaTruthInThisExperienceColor,
    this.mokshaTruthInThisExperienceReality,
    this.showMokshaRealityInThisPerception = false,
    this.mokshaRealityInThisPerceptionColor,
    this.mokshaRealityInThisPerceptionClarity,
    this.showMokshaExistenceInThisAwareness = false,
    this.mokshaExistenceInThisAwarenessColor,
    this.mokshaExistenceInThisAwarenessConsciousness,
    this.showMokshaNonDualityInThisRealization = false,
    this.mokshaNonDualityInThisRealizationColor,
    this.mokshaNonDualityInThisRealizationUnity,
    this.showMokshaEmptinessInThisUnderstanding = false,
    this.mokshaEmptinessInThisUnderstandingColor,
    this.mokshaEmptinessInThisUnderstandingVoid,
    this.showMokshaFormlessnessInThisPerception = false,
    this.mokshaFormlessnessInThisPerceptionColor,
    this.mokshaFormlessnessInThisPerceptionShapeless,
    this.showMokshaTimelessnessInThisExperience = false,
    this.mokshaTimelessnessInThisExperienceColor,
    this.mokshaTimelessnessInThisExperienceEternal,
    this.showMokshaSpacelessnessInThisAwareness = false,
    this.mokshaSpacelessnessInThisAwarenessColor,
    this.mokshaSpacelessnessInThisAwarenessBoundless,
    this.showMokshaCauslessnessInThisRealization = false,
    this.mokshaCauslessnessInThisRealizationColor,
    this.mokshaCauslessnessInThisRealizationUncaused,
    this.showMokshaSelflessnessInThisExperience = false,
    this.mokshaSelflessnessInThisExperienceColor,
    this.mokshaSelflessnessInThisExperienceEgoless,
    this.showMokshaDesirelessnessInThisHeart = false,
    this.mokshaDesirelessnessInThisHeartColor,
    this.mokshaDesirelessnessInThisHeartAttachmentless,
    this.showMokshaAversionlessnessInThisMind = false,
    this.mokshaAversionlessnessInThisMindColor,
    this.mokshaAversionlessnessInThisMindHatredless,
    this.showMokshaIgnorancelessnessInThisWisdom = false,
    this.mokshaIgnorancelessnessInThisWisdomColor,
    this.mokshaIgnorancelessnessInThisWisdomKnowledgeless,
    this.showMokshaGreedlessnessInThisGenerosity = false,
    this.mokshaGreedlessnessInThisGenerosityColor,
    this.mokshaGreedlessnessInThisGenerosityAttachmentless,
    this.showMokshaHatredlessnessInThisCompassion = false,
    this.mokshaHatredlessnessInThisCompassionColor,
    this.mokshaHatredlessnessInThisCompassionAngerless,
    this.showMokshaDelusionlessnessInThisClarity = false,
    this.mokshaDelusionlessnessInThisClarityColor,
    this.mokshaDelusionlessnessInThisClarityIllusionless,
    this.showMokshaEgolessnessInThisHumility = false,
    this.mokshaEgolessnessInThisHumilityColor,
    this.mokshaEgolessnessInThisHumilitySelfless,
    this.showMokshaPersonalitylessnessInThisAuthenticity = false,
    this.mokshaPersonalitylessnessInThisAuthenticityColor,
    this.mokshaPersonalitylessnessInThisAuthenticityCharacterless,
    this.showMokshaIndividualitylessnessInThisOneness = false,
    this.mokshaIndividualitylessnessInThisOnenessColor,
    this.mokshaIndividualitylessnessInThisOnenessSeparatenessless,
    this.showMokshaSeparatenesslessnessInThisUnity = false,
    this.mokshaSeparatenesslessnessInThisUnityColor,
    this.mokshaSeparatenesslessnessInThisUnityOneness,
    this.showMokshaBirthlessnessInThisEternity = false,
    this.mokshaBirthlessnessInThisEternityColor,
    this.mokshaBirthlessnessInThisEternityDeathless,
    this.showMokshaAginglessnessInThisTimelessness = false,
    this.mokshaAginglessnessInThisTimelessnessColor,
    this.mokshaAginglessnessInThisTimelessnessTimeless,
    this.showMokshaSicknesslessnessInThisHealth = false,
    this.mokshaSicknesslessnessInThisHealthColor,
    this.mokshaSicknesslessnessInThisHealthHealthful,
    this.showMokshaDeathlessnessInThisImmortality = false,
    this.mokshaDeathlessnessInThisImmortalityColor,
    this.mokshaDeathlessnessInThisImmortalityImmortal,
    this.showMokshaImpermanencelessnessInThisPermanence = false,
    this.mokshaImpermanencelessnessInThisPermanenceColor,
    this.mokshaImpermanencelessnessInThisPermanencePermanent,
    this.showMokshaSufferinglessnessInThisPeace = false,
    this.mokshaSufferinglessnessInThisPeaceColor,
    this.mokshaSufferinglessnessInThisPeacePeaceful,
    this.showMokshaNonSelflessnessInThisNotSelf = false,
    this.mokshaNonSelflessnessInThisNotSelfColor,
    this.mokshaNonSelflessnessInThisNotSelfNotNotSelf,
    this.showMokshaNotSelflessnessInThisNeitherSelfNorNotSelf = false,
    this.mokshaNotSelflessnessInThisNeitherSelfNorNotSelfColor,
    this.mokshaNotSelflessnessInThisNeitherSelfNorNotSelfNeither,
    this.showMokshaNeitherSelflessnessInThisMiddleWay = false,
    this.mokshaNeitherSelflessnessInThisMiddleWayColor,
    this.mokshaNeitherSelflessnessInThisMiddleWayBalance,
    this.showMokshaMiddleWayInThisEightfoldPath = false,
    this.mokshaMiddleWayInThisEightfoldPathColor,
    this.mokshaMiddleWayInThisEightfoldPathSteps,
    this.showMokshaEightfoldPathInThisFourNobleTruths = false,
    this.mokshaEightfoldPathInThisFourNobleTruthsColor,
    this.mokshaEightfoldPathInThisFourNobleTruthsUnderstanding,
    this.showMokshaFourNobleTruthsInThisNirvana = false,
    this.mokshaFourNobleTruthsInThisNirvanaColor,
    this.mokshaFourNobleTruthsInThisNirvanaRealization,
    this.showMokshaNirvanaInThisHereAndNow = false,
    this.mokshaNirvanaInThisHereAndNowColor,
    this.mokshaNirvanaInThisHereAndNowPresent,
    this.showMokshaEnlightenmentInThisLife = false,
    this.mokshaEnlightenmentInThisLifeColor,
    this.mokshaEnlightenmentInThisLifeImmediate,
    this.showMokshaAwakeningInThisMoment = false,
    this.mokshaAwakeningInThisMomentColor,
    this.mokshaAwakeningInThisMomentNow,
    this.showMokshaLiberationInThisBreath = false,
    this.mokshaLiberationInThisBreathColor,
    this.mokshaLiberationInThisBreathInhale,
    this.showMokshaFreedomInThisThought = false,
    this.mokshaFreedomInThisThoughtColor,
    this.mokshaFreedomInThisThoughtMind,
    this.showMokshaBlissInThisHeart = false,
    this.mokshaBlissInThisHeartColor,
    this.mokshaBlissInThisHeartLove,
    this.showMokshaPeaceInThisSoul = false,
    this.mokshaPeaceInThisSoulColor,
    this.mokshaPeaceInThisSoulTranquility,
    this.showMokshaUnityInThisBeing = false,
    this.mokshaUnityInThisBeingColor,
    this.mokshaUnityInThisBeingOneness,
    this.showMokshaTruthInThisExperience = false,
    this.mokshaTruthInThisExperienceColor,
    this.mokshaTruthInThisExperienceReality,
    this.showMokshaRealityInThisPerception = false,
    this.mokshaRealityInThisPerceptionColor,
    this.mokshaRealityInThisPerceptionClarity,
    this.showMokshaExistenceInThisAwareness = false,
    this.mokshaExistenceInThisAwarenessColor,
    this.mokshaExistenceInThisAwarenessConsciousness,
    this.showMokshaNonDualityInThisRealization = false,
    this.mokshaNonDualityInThisRealizationColor,
    this.mokshaNonDualityInThisRealizationUnity,
    this.showMokshaEmptinessInThisUnderstanding = false,
    this.mokshaEmptinessInThisUnderstandingColor,
    this.mokshaEmptinessInThisUnderstandingVoid,
    this.showMokshaFormlessnessInThisPerception = false,
    this.mokshaFormlessnessInThisPerceptionColor,
    this.mokshaFormlessnessInThisPerceptionShapeless,
    this.showMokshaTimelessnessInThisExperience = false,
    this.mokshaTimelessnessInThisExperienceColor,
    this.mokshaTimelessnessInThisExperienceEternal,
    this.showMokshaSpacelessnessInThisAwareness = false,
    this.mokshaSpacelessnessInThisAwarenessColor,
    this.mokshaSpacelessnessInThisAwarenessBoundless,
    this.showMokshaCauslessnessInThisRealization = false,
    this.mokshaCauslessnessInThisRealizationColor,
    this.mokshaCauslessnessInThisRealizationUncaused,
    this.showMokshaSelflessnessInThisExperience = false,
    this.mokshaSelflessnessInThisExperienceColor,
    this.mokshaSelflessnessInThisExperienceEgoless,
    this.showMokshaDesirelessnessInThisHeart = false,
    this.mokshaDesirelessnessInThisHeartColor,
    this.mokshaDesirelessnessInThisHeartAttachmentless,
    this.showMokshaAversionlessnessInThisMind = false,
    this.mokshaAversionlessnessInThisMindColor,
    this.mokshaAversionlessnessInThisMindHatredless,
    this.showMokshaIgnorancelessnessInThisWisdom = false,
    this.mokshaIgnorancelessnessInThisWisdomColor,
    this.mokshaIgnorancelessnessInThisWisdomKnowledgeless,
    this.showMokshaGreedlessnessInThisGenerosity = false,
    this.mokshaGreedlessnessInThisGenerosityColor,
    this.mokshaGreedlessnessInThisGenerosityAttachmentless,
    this.showMokshaHatredlessnessInThisCompassion = false,
    this.mokshaHatredlessnessInThisCompassionColor,
    this.mokshaHatredlessnessInThisCompassionAngerless,
    this.showMokshaDelusionlessnessInThisClarity = false,
    this.mokshaDelusionlessnessInThisClarityColor,
    this.mokshaDelusionlessnessInThisClarityIllusionless,
    this.showMokshaEgolessnessInThisHumility = false,
    this.mokshaEgolessnessInThisHumilityColor,
    this.mokshaEgolessnessInThisHumilitySelfless,
    this.showMokshaPersonalitylessnessInThisAuthenticity = false,
    this.mokshaPersonalitylessnessInThisAuthenticityColor,
    this.mokshaPersonalitylessnessInThisAuthenticityCharacterless,
    this.showMokshaIndividualitylessnessInThisOneness = false,
    this.mokshaIndividualitylessnessInThisOnenessColor,
    this.mokshaIndividualitylessnessInThisOnenessSeparatenessless,
    this.showMokshaSeparatenesslessnessInThisUnity = false,
    this.mokshaSeparatenesslessnessInThisUnityColor,
    this.mokshaSeparatenesslessnessInThisUnityOneness,
    this.showMokshaBirthlessnessInThisEternity = false,
    this.mokshaBirthlessnessInThisEternityColor,
    this.mokshaBirthlessnessInThisEternityDeathless,
    this.showMokshaAginglessnessInThisTimelessness = false,
    this.mokshaAginglessnessInThisTimelessnessColor,
    this.mokshaAginglessnessInThisTimelessnessTimeless,
    this.showMokshaSicknesslessnessInThisHealth = false,
    this.mokshaSicknesslessnessInThisHealthColor,
    this.mokshaSicknesslessnessInThisHealthHealthful,
    this.showMokshaDeathlessnessInThisImmortality = false,
    this.mokshaDeathlessnessInThisImmortalityColor,
    this.mokshaDeathlessnessInThisImmortalityImmortal,
    this.showMokshaImpermanencelessnessInThisPermanence = false,
    this.mokshaImpermanencelessnessInThisPermanenceColor,
    this.mokshaImpermanencelessnessInThisPermanencePermanent,
    this.showMokshaSufferinglessnessInThisPeace = false,
    this.mokshaSufferinglessnessInThisPeaceColor,
    this.mokshaSufferinglessnessInThisPeacePeaceful,
  });
  
  @override
  Widget build(BuildContext context) {
    Widget button = _buildButton();
    
    if (showAnimated) {
      button = TweenAnimationBuilder<double>(
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
        child: button,
      );
    }
    
    if (showTransform) {
      button = Transform(
        transform: Matrix4.identity()
          ..scale(transformScale ?? 1.0)
          ..rotateZ((transformRotation ?? 0.0) * 3.14159 / 180)
          ..translate(
            transformTranslation?.dx ?? 0.0,
            transformTranslation?.dy ?? 0.0,
          ),
        child: button,
      );
    }
    
    if (showTooltip && tooltipText != null) {
      button = Tooltip(
        message: tooltipText!,
        child: button,
      );
    }
    
    return Container(
      margin: margin,
      child: button,
    );
  }
  
  Widget _buildButton() {
    Widget buttonChild = _buildButtonChild();
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
        child: Container(
          decoration: BoxDecoration(
            color: showSelected && isSelected
                ? (selectedColor ?? AppConstants.primaryColor)
                : (showToggle && isToggled
                    ? (toggleColor ?? Colors.green)
                    : backgroundColor),
            borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.borderRadius),
            border: showBorder ? (side ?? BorderSide(
              color: isSelected && showSelected
                  ? (selectedBorderColor ?? AppConstants.primaryColor)
                  : (borderColor ?? Colors.grey),
              width: borderWidth ?? 1.0,
            )) : null,
            boxShadow: showShadow ? [
              BoxShadow(
                color: shadowColor ?? Colors.black.withOpacity(0.1),
                blurRadius: shadowBlurRadius ?? 8.0,
                offset: shadowOffset ?? const Offset(0, 2),
              ),
            ] : null,
            gradient: showGradient ? (gradient ?? LinearGradient(
              colors: [
                backgroundColor ?? AppConstants.primaryColor,
                (backgroundColor ?? AppConstants.primaryColor).withOpacity(0.7),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )) : null,
          ),
          child: buttonChild,
        ),
      ),
    );
  }
  
  Widget _buildButtonChild() {
    return Icon(
      icon,
      color: isDisabled 
          ? (disabledForegroundColor ?? Colors.grey[400])
          : (foregroundColor ?? Colors.white),
      size: iconSize ?? 24,
    );
  }
}

/// Quantum Button with consciousness-based interactions
class QuantumButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final bool enableQuantumEffects;
  final Duration? animationDuration;

  const QuantumButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.enableQuantumEffects = true,
    this.animationDuration,
  }) : super(key: key);

  @override
  _QuantumButtonState createState() => _QuantumButtonState();
}

class _QuantumButtonState extends State<QuantumButton>
    with TickerProviderStateMixin {
  late AnimationController _quantumController;
  late AnimationController _consciousnessController;
  late Animation<double> _quantumAnimation;
  late Animation<double> _consciousnessAnimation;

  @override
  void initState() {
    super.initState();
    _quantumController = AnimationController(
      duration: widget.animationDuration ?? const Duration(seconds: 2),
      vsync: this,
    );
    _consciousnessController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _quantumAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _quantumController,
      curve: Curves.easeInOut,
    ));

    _consciousnessAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _consciousnessController,
      curve: Curves.elasticOut,
    ));

    if (widget.enableQuantumEffects) {
      _quantumController.repeat(reverse: true);
      _consciousnessController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _quantumController.dispose();
    _consciousnessController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_quantumController, _consciousnessController]),
      builder: (context, child) {
        return Container(
          width: widget.width ?? 120,
          height: widget.height ?? 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.0 + _quantumAnimation.value * 0.5,
              colors: [
                widget.backgroundColor ?? AppConstants.primaryColor,
                (widget.backgroundColor ?? AppConstants.primaryColor).withOpacity(
                  0.6 + _consciousnessAnimation.value * 0.4,
                ),
              ],
            ),
            boxShadow: widget.enableQuantumEffects ? [
              BoxShadow(
                color: (widget.backgroundColor ?? AppConstants.primaryColor)
                    .withOpacity(0.3 * _quantumAnimation.value),
                blurRadius: 12 + _consciousnessAnimation.value * 8,
                spreadRadius: 2 + _quantumAnimation.value * 2,
              ),
            ] : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: widget.onPressed,
              child: Center(
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.foregroundColor ?? Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Neural Network Button with AI-powered interactions
class NeuralButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final bool enableNeuralEffects;
  final int? neuralLayers;
  final Duration? pulseDuration;

  const NeuralButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.enableNeuralEffects = true,
    this.neuralLayers = 3,
    this.pulseDuration,
  }) : super(key: key);

  @override
  _NeuralButtonState createState() => _NeuralButtonState();
}

class _NeuralButtonState extends State<NeuralButton>
    with TickerProviderStateMixin {
  late List<AnimationController> _layerControllers;
  late List<Animation<double>> _layerAnimations;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _layerControllers = [];
    _layerAnimations = [];
    
    for (int i = 0; i < widget.neuralLayers!; i++) {
      final controller = AnimationController(
        duration: Duration(milliseconds: 800 + (i * 200)),
        vsync: this,
      );
      _layerControllers.add(controller);
      _layerAnimations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut,
          ),
        ),
      );
    }

    _pulseController = AnimationController(
      duration: widget.pulseDuration ?? const Duration(milliseconds: 1200),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    if (widget.enableNeuralEffects) {
      for (int i = 0; i < _layerControllers.length; i++) {
        _layerControllers[i].repeat(reverse: true);
      }
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    for (final controller in _layerControllers) {
      controller.dispose();
    }
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([..._layerControllers, _pulseController]),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Neural network layers
            for (int i = 0; i < widget.neuralLayers!; i++)
              Positioned(
                child: Container(
                  width: (widget.width ?? 120) * (1.0 + i * 0.1 * _layerAnimations[i].value),
                  height: (widget.height ?? 48) * (1.0 + i * 0.1 * _layerAnimations[i].value),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: (widget.backgroundColor ?? AppConstants.primaryColor)
                          .withOpacity(0.3 * _layerAnimations[i].value),
                      width: 1.0,
                    ),
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 1.0,
                      colors: [
                        Colors.transparent,
                        (widget.backgroundColor ?? AppConstants.primaryColor)
                            .withOpacity(0.1 * _layerAnimations[i].value),
                      ],
                    ),
                  ),
                ),
              ),
            // Main button
            Container(
              width: widget.width ?? 120,
              height: widget.height ?? 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: [
                    widget.backgroundColor ?? AppConstants.primaryColor,
                    (widget.backgroundColor ?? AppConstants.primaryColor).withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: widget.enableNeuralEffects ? [
                  BoxShadow(
                    color: (widget.backgroundColor ?? AppConstants.primaryColor)
                        .withOpacity(0.4 * _pulseAnimation.value),
                    blurRadius: 8 * _pulseAnimation.value,
                    spreadRadius: 1,
                  ),
                ] : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: widget.onPressed,
                  child: Center(
                    child: Text(
                      widget.label,
                      style: TextStyle(
                        color: widget.foregroundColor ?? Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

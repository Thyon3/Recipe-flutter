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

class ParticleData {
  final Color color;
  final double size;
  final Offset position;
  final Offset velocity;
  final double lifetime;
  
  const ParticleData({
    required this.color,
    required this.size,
    required this.position,
    required this.velocity,
    required this.lifetime,
  });
}

class StarData {
  final Color color;
  final double size;
  final Offset position;
  final double brightness;
  final double twinkleSpeed;
  
  const StarData({
    required this.color,
    required this.size,
    required this.position,
    required this.brightness,
    required this.twinkleSpeed,
  });
}

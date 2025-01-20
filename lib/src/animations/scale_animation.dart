import 'package:flutter/material.dart';

/// A widget that applies a scaling animation.
///
/// This animation smoothly scales the widget from 50% to 100% of its original size while
/// controlling its opacity based on the animation progress.
///
/// Example usage:
/// ```dart
/// ScaleAnimation(
///   child: YourWidget(),
///   curve: Curves.easeInOut,
///   duration: Duration(seconds: 1),
///   speedFactor: 1.0,
/// );
/// ```
class ScaleAnimation extends StatelessWidget {
  /// Creates a scaling animation.
  ///
  /// [child] is the widget to animate.
  /// [curve] defines the easing curve for the animation.
  /// [duration] specifies the total duration of the animation.
  /// [speedFactor] adjusts the animation speed.
  const ScaleAnimation({
    super.key,
    required this.child,
    required this.curve,
    required this.duration,
    required this.speedFactor,
  });

  /// The easing curve to apply to the animation.
  final Curve curve;

  /// The child widget that will be animated.
  final Widget child;

  /// The total duration of the animation.
  final Duration duration;

  /// A factor that allows adjusting the speed of the animation.
  final double speedFactor;

  @override
  Widget build(BuildContext context) {
    // SpeedFactor has to be greater than zero
    final safeSpeedFactor = speedFactor > 0 ? speedFactor : 1.0;

    return TweenAnimationBuilder(
      // Apply the easing curve and adjust the duration with the speed factor
      curve: curve,
      duration: duration * safeSpeedFactor,
      // Animate the scaling effect from 0.5x to 1.0x (50% to 100%)
      tween: Tween<double>(begin: 0.5, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          // Apply the scaling effect to the child widget
          scale: value,
          child: Opacity(
            opacity: value.clamp(0.5, 1.0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

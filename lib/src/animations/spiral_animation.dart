import 'package:flutter/material.dart';
import '../constants/animation_direction.dart';

/// A widget that applies a spiral animation.
///
/// This animation smoothly moves the widget in a spiral pattern while changing its
/// opacity. The widget starts from a larger size and spirals inward, rotating along the way.
///
/// Example usage:
/// ```dart
/// SpiralAnimation(
///   child: YourWidget(),
///   curve: Curves.easeInOut,
///   duration: Duration(seconds: 1),
///   speedFactor: 1.0,
/// );
/// ```
class SpiralAnimation extends StatelessWidget {
  /// Creates a spiral animation.
  ///
  /// [child] is the widget to animate.
  /// [curve] defines the easing curve for the animation.
  /// [duration] specifies the total duration of the animation.
  /// [speedFactor] adjusts the animation speed.
  const SpiralAnimation({
    super.key,
    required this.child,
    required this.curve,
    required this.duration,
    required this.direction,
    required this.speedFactor, // Factor de velocidad para ajustes más finos
  });

  /// The easing curve to apply to the animation.
  final Curve curve;

  /// The child widget that will be animated.
  final Widget child;

  /// The total duration of the animation.
  final Duration duration;

  /// A factor that allows adjusting the speed of the animation.
  final double speedFactor;

  /// The direction of the animation.
  final AnimationDirection direction;

  @override
  Widget build(BuildContext context) {
    // Determine the initial movement direction based on the provided animation direction.
    final offset = direction == AnimationDirection.left ? -300.0 : 300.0;

    // SpeedFactor has to be greater than zero
    final safeSpeedFactor = speedFactor > 0 ? speedFactor : 1.0;

    return TweenAnimationBuilder(
      // Apply the easing curve and adjust the duration with the speed factor.
      curve: curve,
      duration: duration * safeSpeedFactor,
      // Animate the widget from a larger size (1.5) to its final position (0.0).
      tween: Tween<double>(begin: 1.5, end: 0.0),
      builder: (context, value, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            // Apply a spiral movement by translating and rotating the widget.
            // The offset value is multiplied by the animation value to make the movement gradual.
            ..translate(
              value * offset, // Horizontal movement (spiraling in/out)
              value * 50, // Vertical movement (spiraling in/out)
              value * 20, // Depth movement (spiraling in/out)
            )
            // Apply rotation to simulate the spiral effect.
            ..rotateZ(value * 0.4),
          child: Opacity(
            // Gradually decrease the opacity as the widget spirals inward.
            opacity: (1.0 - value.abs()).clamp(0.1, 1.0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

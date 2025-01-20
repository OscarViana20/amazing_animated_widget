import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/animation_direction.dart';

/// A widget that applies a flip animation with optional horizontal translation.
///
/// This animation flips the widget horizontally while controlling its opacity and
/// moving it left or right depending on the specified direction.
///
/// Example usage:
/// ```dart
/// FlipAnimation(
///   child: YourWidget(),
///   curve: Curves.easeInOut,
///   duration: Duration(seconds: 1),
///   direction: AnimationDirection.left,
///   speedFactor: 1.0,
/// );
/// ```
class FlipAnimation extends StatelessWidget {
  /// Creates a flip animation with horizontal translation.
  ///
  /// [child] is the widget to animate.
  /// [curve] defines the easing curve for the animation.
  /// [duration] specifies the total duration of the animation.
  /// [direction] determines the direction of the horizontal translation (left or right).
  /// [speedFactor] adjusts the animation speed.
  const FlipAnimation({
    super.key,
    required this.child,
    required this.curve,
    required this.duration,
    required this.direction,
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

  /// The direction in which the widget will translate during the animation (left or right).
  final AnimationDirection direction;

  @override
  Widget build(BuildContext context) {
    // Determine if the flip should be to the left based on the direction
    final isLeft = direction == AnimationDirection.left;

    // SpeedFactor has to be greater than zero
    final safeSpeedFactor = speedFactor > 0 ? speedFactor : 1.0;

    return TweenAnimationBuilder(
      // Apply the easing curve and adjust the duration with the speed factor
      curve: curve,
      duration: duration * safeSpeedFactor,
      // Animate the flip effect from -1.0 to 0.0 (horizontal flip)
      tween: Tween<double>(begin: -1.0, end: 0.0),
      builder: (context, value, child) {
        // Calculate the flip angle in radians (from -90° to 0°)
        final flipAngle = value * pi / 2;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            // Apply horizontal rotation (flip effect)
            ..rotateY(flipAngle)
            // Apply additional horizontal translation based on the flip value
            ..translate(
              isLeft ? -value * 100 : value * 100,
              0,
              0,
            ),
          child: Opacity(
            opacity: (1.0 - value.abs()).clamp(0.5, 1.0),
            child: value > -0.5
                // Show the widget normally before the flip reaches 50%
                ? child
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..rotateY(pi), // Flip completo
                    child: child,
                  ),
          ),
        );
      },
      child: child,
    );
  }
}

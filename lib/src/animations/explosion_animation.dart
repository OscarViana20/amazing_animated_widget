import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/animation_direction.dart';

/// A widget that applies an explosion animation to its child widget.
///
/// The animation starts by expanding outward in random directions and
/// then returns to its original position. The child widget's opacity
/// and scale also change dynamically during the animation.
///
/// Example usage:
/// ```dart
/// ExplosionAnimation(
///   child: YourWidget(),
///   curve: Curves.easeOut,
///   duration: Duration(seconds: 1),
///   direction: AnimationDirection.left,
///   speedFactor: 1.0,
/// );
/// ```
class ExplosionAnimation extends StatelessWidget {
  /// Creates an explosion animation.
  ///
  /// [child] is the widget to animate.
  /// [curve] defines the easing curve for the animation.
  /// [duration] specifies the total duration of the animation.
  /// [direction] sets the direction from which the explosion starts (left or right).
  /// [speedFactor] adjusts the animation speed.
  const ExplosionAnimation({
    super.key,
    required this.child,
    required this.curve,
    required this.duration,
    required this.direction,
    required this.speedFactor,
  });

  /// The easing curve to apply to the animation
  final Curve curve;

  /// The child widget that will be animated.
  final Widget child;

  /// The total duration of the animation.
  final Duration duration;

  /// A factor that allows adjusting the speed of the animation.
  final double speedFactor;

  /// The direction from which the explosion originates.
  final AnimationDirection direction;

  @override
  Widget build(BuildContext context) {
    // Initialize a random number generator for random movement and angles
    final random = Random();

    // Base angle depending on the direction (left or right)
    final baseAngle = direction == AnimationDirection.left ? pi : 0;

    // SpeedFactor has to be greater than zero
    final safeSpeedFactor = speedFactor > 0 ? speedFactor : 1.0;

    return TweenAnimationBuilder(
      // Applying the chosen curve and adjusting the duration with speedFactor
      curve: curve,
      duration: duration * safeSpeedFactor,
      // Tween animation from 0.0 to 1.0 to animate the progress
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        // Random angle to make the explosion's direction unpredictable
        final angle = baseAngle + random.nextDouble() * pi / 6;

        // Maximum distance the widget will move during the explosion
        const maxDistance = 50.0;

        // Calculate the X and Y offsets based on the random angle and animation progress
        final xOffset = maxDistance * cos(angle) * (1 - value);
        final yOffset = maxDistance * sin(angle) * (1 - value);

        return Transform(
          transform: Matrix4.identity()
            // Apply translation for the outward movement
            ..translate(xOffset, yOffset)
            // Dynamically scale the widget during the animation (shrinking and expanding)
            ..scale(value.clamp(0.8, 1.2)),
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

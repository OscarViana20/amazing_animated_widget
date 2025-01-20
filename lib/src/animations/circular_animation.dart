import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/animation_direction.dart';

/// A widget that applies a circular animation to its child.
///
/// The animation moves the child widget along a circular path while
/// progressively increasing its opacity from 0 to 1. The direction,
/// duration, curve, and speed can be customized.
///
/// Example usage:
/// ```dart
/// CircularAnimation(
///   child: YourWidget(),
///   curve: Curves.easeOut,
///   duration: Duration(seconds: 1),
///   direction: AnimationDirection.left,
///   speedFactor: 1.0,
/// );
/// ```
class CircularAnimation extends StatelessWidget {
  /// Creates a circular animation.
  ///
  /// [child] is the widget to animate.
  /// [curve] defines the easing curve for the animation.
  /// [duration] specifies the total animation duration.
  /// [direction] sets the starting direction (left or right).
  /// [speedFactor] adjusts the animation speed.
  const CircularAnimation({
    super.key,
    required this.child,
    required this.curve,
    required this.duration,
    required this.direction,
    required this.speedFactor,
  });

  /// The easing curve for the animation.
  final Curve curve;

  /// The child widget to animate.
  final Widget child;

  /// The duration of the animation.
  final Duration duration;

  /// A factor to fine-tune the speed of the animation.
  final double speedFactor;

  /// The starting direction of the animation.
  final AnimationDirection direction;

  @override
  Widget build(BuildContext context) {
    // Initialize the angle offset based on the direction.
    // Left starts at 180 degrees (π radians), right starts at 0 degrees.
    double angleOffset = direction == AnimationDirection.left ? pi : 0.0;

    // SpeedFactor has to be greater than zero
    final safeSpeedFactor = speedFactor > 0 ? speedFactor : 1.0;

    return TweenAnimationBuilder(
      // Apply the selected curve and adjust the duration with speedFactor.
      curve: curve,
      duration: duration * safeSpeedFactor,
      // Tween from 0.0 to 1.0 to animate the progress.
      tween: Tween<double>(begin: 0.0, end: 1.0), // De 0 a 1
      builder: (context, value, child) {
        // Calculate the widget's position on the circular path.
        const radius = 100.0; // Radius of the circular path.
        final angle = angleOffset +
            (value * pi); // Circular movement between 0° and 180°.

        // Compute the X and Y offsets for the circular movement.
        final offsetX = radius * cos(angle); // Horizontal displacement.
        final offsetY = radius * sin(angle); // Vertical displacement.

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(
                offsetX / radius, offsetY) // Apply the circular translation.
            ..scale(1.0) // Keep the widget's size unchanged.
            ..rotateZ(value * 2 * pi), // Add continuous rotation around Z-axis.
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

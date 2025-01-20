import 'package:flutter/material.dart';

import '../constants/animation_direction.dart';

/// A widget that applies a fade animation with a horizontal translation.
///
/// This animation fades the widget in or out while translating it
/// horizontally from left or right depending on the direction.
///
/// Example usage:
/// ```dart
/// FadeAnimation(
///   child: YourWidget(),
///   curve: Curves.easeOut,
///   duration: Duration(seconds: 1),
///   direction: AnimationDirection.left,
///   speedFactor: 1.0,
/// );
/// ```
class FadeAnimation extends StatelessWidget {
  /// Creates a fade animation with a horizontal translation.
  ///
  /// [child] is the widget to animate.
  /// [curve] defines the easing curve for the animation.
  /// [duration] specifies the total duration of the animation.
  /// [direction] determines the direction of the horizontal translation (left or right).
  /// [speedFactor] adjusts the animation speed.
  const FadeAnimation({
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
    // Determine the initial offset based on the direction (left or right)
    final isLeft = direction == AnimationDirection.left;
    final initialOffset = isLeft ? -50.0 : 50.0;

    // SpeedFactor has to be greater than zero
    final safeSpeedFactor = speedFactor > 0 ? speedFactor : 1.0;

    return TweenAnimationBuilder(
      // Apply the easing curve and adjust the duration with the speed factor
      curve: curve,
      duration: duration * safeSpeedFactor,
      // Animate from 1.0 to 0.0 to create the fade effect
      tween: Tween<double>(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        // Apply horizontal translation with fading effect
        return Transform.translate(
          // Translate horizontally based on the current animation progress (value)
          offset: Offset(initialOffset * value, 0),
          child: Opacity(
            opacity: (1.0 - value).clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

import 'animations/circular_animation.dart';
import 'animations/explosion_animation.dart';
import 'animations/fade_animation.dart';
import 'animations/flip_animation.dart';
import 'animations/scale_animation.dart';
import 'animations/spiral_animation.dart';
import 'constants/animation_direction.dart';
import 'constants/animation_type.dart';

/// A widget that provides dynamic animations to any child widget.
///
/// `AmazingAnimatedWidget` offers a variety of animation types like spiral,
/// explosion, circular, scale, and more. This widget is versatile and can
/// be used with lists, grids, or standalone widgets.
///
/// Example usage:
/// ```dart
/// AmazingAnimatedWidget(
///   index: index,
///   animationType: AnimationType.spiral,
///   child: YourWidget(),
/// );
/// ```
class AmazingAnimatedWidget extends StatefulWidget {
  /// Creates an instance of `AmazingAnimatedWidget`.
  ///
  /// [index] is required to identify the widget uniquely and track its animation state.
  /// [child] is the widget to which the animation will be applied.
  /// [animationType] determines the type of animation to apply (e.g., spiral, scale).
  const AmazingAnimatedWidget({
    super.key,
    required this.index,
    required this.child,
    required this.animationType,
    this.speedFactor = 1.0,
    this.exitAnimation = false,
    this.curve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 500),
    this.animationDirection = AnimationDirection.left,
  });

  /// The unique index of the widget, used to determine animation states.
  final int index;

  /// The animation curve to define the easing behavior.
  final Curve curve;

  /// The child widget to which the animation is applied.
  final Widget child;

  /// The duration of the animation.
  final Duration duration;

  /// Whether to animate the widget's exit.
  ///
  /// If true, the widget animates when it exits the screen.
  final bool exitAnimation;

  /// A factor to fine-tune the speed of the animation.
  final double speedFactor;

  /// The type of animation to apply.
  final AnimationType animationType;

  /// The direction of the animation (e.g., left, right).
  final AnimationDirection animationDirection;

  @override
  State<AmazingAnimatedWidget> createState() => _AmazingAnimatedWidgetState();
}

class _AmazingAnimatedWidgetState extends State<AmazingAnimatedWidget> {
  // Keeps track of already animated indices to prevent re-animating them.
  static final Map<int, Widget> _animatedWidgets = {};

  // Determines if the widget should animate its exit.
  late bool _shouldAnimateExit;

  @override
  void initState() {
    super.initState();
    _shouldAnimateExit = widget.exitAnimation;
  }

  @override
  Widget build(BuildContext context) {
    // If the widget has already animated and exit animation is not enabled, return the child directly.
    if (!_shouldAnimateExit && _animatedWidgets.containsKey(widget.index)) {
      return _animatedWidgets[widget.index]!;
    }

    // Mark the index as animated for entry animations.
    if (!_shouldAnimateExit) {
      _animatedWidgets[widget.index] = widget.child;
    }

    // Build the animation based on the specified type.
    return _buildAnimation(widget.animationType, widget.child);
  }

  /// Builds the animation based on the provided [AnimationType].
  Widget _buildAnimation(AnimationType type, Widget child) {
    switch (type) {
      case AnimationType.circular:
        return CircularAnimation(
          direction: widget.animationDirection,
          speedFactor: widget.speedFactor,
          duration: widget.duration,
          curve: widget.curve,
          child: child,
        );
      case AnimationType.explosion:
        return ExplosionAnimation(
          direction: widget.animationDirection,
          speedFactor: widget.speedFactor,
          duration: widget.duration,
          curve: widget.curve,
          child: child,
        );
      case AnimationType.fade:
        return FadeAnimation(
          direction: widget.animationDirection,
          speedFactor: widget.speedFactor,
          duration: widget.duration,
          curve: widget.curve,
          child: child,
        );
      case AnimationType.flip:
        return FlipAnimation(
          direction: widget.animationDirection,
          speedFactor: widget.speedFactor,
          duration: widget.duration,
          curve: widget.curve,
          child: child,
        );
      case AnimationType.scale:
        return ScaleAnimation(
          speedFactor: widget.speedFactor,
          duration: widget.duration,
          curve: widget.curve,
          child: child,
        );
      case AnimationType.spiral:
        return SpiralAnimation(
          direction: widget.animationDirection,
          speedFactor: widget.speedFactor,
          duration: widget.duration,
          curve: widget.curve,
          child: child,
        );
    }
  }
}

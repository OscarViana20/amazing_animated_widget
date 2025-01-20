# AmazingAnimatedWidget

This package provides a `AmazingAnimatedWidget` widget for Flutter apps. It allows users to add dynamic animations to any widget in Flutter. Whether you're working with lists, grids, or standalone widgets, `AmazingAnimatedWidget` makes it easy to create engaging and captivating interfaces with animations like spirals, explosions, scaling, flips, and more.

## Features

- Easy integration with any widget.
- Customizable animation types: Spiral, Explosion, Circular, Fade, Flip, Scale.
- Supports both entry and exit animations.
- Smooth animation curves for realistic transitions.

## Installation

Add the `amazing_animated_widget` package as a dependency in your `pubspec.yaml` file:
```yaml
dependencies:
  amazing_animated_widget: ^latest_version # Replace with the latest version available on pub.dev
```

Import the package in your Flutter project:
```dart
import 'package:amazing_animated_widget/amazing_animated_widget.dart';
```

## Usage
#### Basic ListView with Default Spiral Animation:
```dart
ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
        return AnimatedWidgetItem(
            index: index,
            animationType: AnimationType.spiral,
            child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                            Colors.purpleAccent.withOpacity(0.6),
                            Colors.pinkAccent.withOpacity(0.6),
                        ],
                    ),
                    boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            offset: Offset(2, 4),
                            color: Colors.black26,
                        ),
                    ],
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                    subtitle: Text(
                        'Subtitle for ${items[index]}',
                        style: TextStyle(
                            color: Colors.white70,
                            fontStyle: FontStyle.italic,
                        ),
                    ),
                    title: Text(
                        items[index],
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    leading: Icon(Icons.star, size: 30, color: Colors.amber),
                    trailing: Icon(Icons.favorite, size: 30, color: Colors.pink),
                ),
            ),
        );
    },
)
```
![spiral default](https://github.com/user-attachments/assets/be04e034-73e6-4197-8941-de9046253207)

### Custom Spiral Animation (With Speed and Exit Effects):
```dart
ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
        return AnimatedWidgetItem(
            index: index,
            speedFactor: 1.0,
            exitAnimation: true,
            curve: Curves.easeOutBack,
            animationType: AnimationType.spiral,
            duration: const Duration(milliseconds: 600),
            animationDirection: index.isEven
                ? AnimationDirection.left
                : AnimationDirection.right,
            child: YourWidget(),
        );
    }
),
```
![spiral custom](https://github.com/user-attachments/assets/6bafdc80-7c05-4f8a-b27f-82bc5102bf9d)

### Custom Circular Animation:
```dart
ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
        return AnimatedWidgetItem(
            index: index,
            speedFactor: 1.0,
            exitAnimation: true,
            curve: Curves.easeOutCirc,
            animationType: AnimationType.circular,
            duration: const Duration(milliseconds: 600),
            animationDirection: index.isEven
                ? AnimationDirection.left
                : AnimationDirection.right,
            child: YourWidget(),
        );
    }
),
```
![circular custom](https://github.com/user-attachments/assets/64086bc7-0401-49fb-87a8-3644c960a9f6)


### Grid View Example with Spiral Animation:
```dart
GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
        return AmazingAnimatedWidget(
            index: index,
            speedFactor: 1.0,
            exitAnimation: true,
            curve: Curves.easeInCubic,
            animationType: AnimationType.spiral,
            duration: const Duration(milliseconds: 600),
            animationDirection: index.isEven
                ? AnimationDirection.left
                : AnimationDirection.right,
            child: YourWidget(),
        );
    },
),
```
![grid example](https://github.com/user-attachments/assets/8fa48275-7343-4e15-881d-063f7fc33a12)

## Standalone animations
- **_SpiralAnimation:_**
```dart
SpiralAnimation(
    duration: const Duration(milliseconds: 600),
    direction: AnimationDirection.left,
    curve: Curves.easeOutBack,
    speedFactor: 1.0,
    child: YourWidget(),
),
```

- **_CircularAnimation:_**
```dart
CircularAnimation(
    duration: const Duration(milliseconds: 600),
    direction: AnimationDirection.left,
    curve: Curves.easeOutCirc,
    speedFactor: 1.0,
    child: YourWidget(),
),
```

- **_ExplosionAnimation:_**
```dart
ExplosionAnimation(
    duration: const Duration(milliseconds: 600),
    direction: AnimationDirection.left,
    curve: Curves.easeOutCubic,
    speedFactor: 1.0,
    child: YourWidget(),
),
```

- **_FadeAnimation:_**
```dart
FadeAnimation(
    duration: const Duration(milliseconds: 600),
    direction: AnimationDirection.left,
    curve: Curves.easeIn,
    speedFactor: 3.0,
    child: YourWidget(),
),
```

- **_FlipAnimation:_**
```dart
FlipAnimation(
    duration: const Duration(milliseconds: 600),
    direction: AnimationDirection.left,
    curve: Curves.easeOut,
    speedFactor: 1.0,
    child: YourWidget(),
),
```

- **_ScaleAnimation:_**
```dart
ScaleAnimation(
    duration: const Duration(milliseconds: 600),
    curve: Curves.ease,
    speedFactor: 1.0,
    child: YourWidget(),
),
```

## Customization

The AnimatedWidgetItem widget offers various customization options to match your app's design:

- `child`: The widget to animate (e.g., Text, Container, ListTile,...).
- `index`: An identifier used for animation sequencing and exit animations.
- `speedFactor`: Allows finer control over the animation speed.
- `exitAnimation`: When set to true, applies the animation to the widget's exit as well.
- `curve`: Defines the animation curve (e.g., Curves.easeIn, Curves.bounceOut).
- `animationType`: The type of animation (spiral, explosion, flip, fade, circular, scale).
- `duration`:  The duration of the animation.
- `animationDirection`: Specifies the direction for directional animations (not required for scale).

## Support
If you like this project, please leave a ⭐️. It helps and motivates us to continue working on it!<br>

## Contributions
Contributions, issues, and feature requests are welcome! Feel free to open an issue or submit a pull request.

## License
This project is MIT licensed.
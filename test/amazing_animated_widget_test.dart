import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:amazing_animated_widget/amazing_animated_widget.dart';

void main() {
  group('AmazingAnimatedWidget Tests', () {
    testWidgets('Renders with default properties', (WidgetTester tester) async {
      // Arrange
      final testWidget = AmazingAnimatedWidget(
        index: 0,
        animationType: AnimationType.spiral,
        child: Container(color: Colors.red, width: 100, height: 100),
      );

      // Act
      await tester.pumpWidget(MaterialApp(home: testWidget));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(AmazingAnimatedWidget), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('Applies circular animation correctly',
        (WidgetTester tester) async {
      // Arrange
      final testWidget = AmazingAnimatedWidget(
        index: 0,
        animationType: AnimationType.circular,
        animationDirection: AnimationDirection.right,
        child: Container(color: Colors.blue, width: 100, height: 100),
      );

      // Act
      await tester.pumpWidget(MaterialApp(home: testWidget));
      await tester.pump(
        const Duration(milliseconds: 100),
      );

      // Assert
      expect(find.byType(AmazingAnimatedWidget), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('Applies fade animation correctly',
        (WidgetTester tester) async {
      // Arrange
      final testWidget = AmazingAnimatedWidget(
        index: 0,
        animationType: AnimationType.fade,
        animationDirection: AnimationDirection.right,
        child: Container(color: Colors.blue, width: 100, height: 100),
      );

      // Act
      await tester.pumpWidget(MaterialApp(home: testWidget));
      await tester.pump(
        const Duration(milliseconds: 100),
      );

      // Assert
      expect(find.byType(AmazingAnimatedWidget), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('Applies flip animation correctly',
        (WidgetTester tester) async {
      // Arrange
      final testWidget = AmazingAnimatedWidget(
        index: 0,
        animationType: AnimationType.flip,
        animationDirection: AnimationDirection.right,
        child: Container(color: Colors.blue, width: 100, height: 100),
      );

      // Act
      await tester.pumpWidget(MaterialApp(home: testWidget));
      await tester.pump(
        const Duration(milliseconds: 100),
      );

      // Assert
      expect(find.byType(AmazingAnimatedWidget), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('Applies scale animation correctly',
        (WidgetTester tester) async {
      // Arrange
      final testWidget = AmazingAnimatedWidget(
        index: 0,
        animationType: AnimationType.scale,
        animationDirection: AnimationDirection.right,
        child: Container(color: Colors.blue, width: 100, height: 100),
      );

      // Act
      await tester.pumpWidget(MaterialApp(home: testWidget));
      await tester.pump(
        const Duration(milliseconds: 100),
      );

      // Assert
      expect(find.byType(AmazingAnimatedWidget), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('Applies explosion animation correctly',
        (WidgetTester tester) async {
      // Arrange
      final testWidget = AmazingAnimatedWidget(
        index: 0,
        animationType: AnimationType.explosion,
        animationDirection: AnimationDirection.right,
        child: Container(color: Colors.blue, width: 100, height: 100),
      );

      // Act
      await tester.pumpWidget(MaterialApp(home: testWidget));
      await tester.pump(
        const Duration(milliseconds: 100),
      );

      // Assert
      expect(find.byType(AmazingAnimatedWidget), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('Handles multiple animations', (WidgetTester tester) async {
      // Arrange
      final testWidget = Column(
        children: List.generate(
          3,
          (index) => AmazingAnimatedWidget(
            index: index,
            speedFactor: 1.0,
            exitAnimation: true,
            curve: Curves.easeInCubic,
            animationType: AnimationType.spiral,
            duration: const Duration(milliseconds: 600),
            animationDirection: index.isEven
                ? AnimationDirection.left
                : AnimationDirection.right,
            child: Text('Item $index'),
          ),
        ),
      );

      // Act
      await tester.pumpWidget(MaterialApp(home: testWidget));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(AmazingAnimatedWidget), findsNWidgets(3));
      expect(find.text('Item 0'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });
  });
}

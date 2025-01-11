import 'package:amazing_animated_widget/amazing_animated_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<String> items = List.generate(100, (index) => 'Item $index');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Amazing Animated List'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Stack(
          children: [
            ListView.builder(
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
                  child: _buildItem(index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(2, 4),
            color: Colors.black26,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        subtitle: Text(
          'Subtitle for ${items[index]}',
          style: const TextStyle(
            color: Colors.white70,
            fontStyle: FontStyle.italic,
          ),
        ),
        title: Text(
          items[index],
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(Icons.star, size: 30, color: Colors.amber),
        trailing: const Icon(Icons.favorite, size: 30, color: Colors.pink),
      ),
    );
  }
}

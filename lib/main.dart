import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragDropDemo(),
    );
  }
}

class DragDropDemo extends StatefulWidget {
  const DragDropDemo({super.key});

  @override
  State<DragDropDemo> createState() => _DragDropDemoState();
}

class _DragDropDemoState extends State<DragDropDemo> {
  bool dropped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drag & Drop Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 🟦 DRAGGABLE
            Draggable<String>(
              data: "box",
              feedback: Container(
                width: 80,
                height: 80,
                color: Colors.blue.withOpacity(0.7),
              ),
              childWhenDragging: Container(
                width: 80,
                height: 80,
                color: Colors.grey,
              ),
              child: Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 40),

            // 🔴 DRAG TARGET
            DragTarget<String>(
              onAccept: (data) {
                setState(() {
                  dropped = true;
                });
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 140,
                  height: 140,
                  color: dropped ? Colors.green : Colors.red,
                  child: Center(
                    child: Text(
                      dropped ? "Accepted!" : "Drop here",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
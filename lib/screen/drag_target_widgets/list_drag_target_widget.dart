import 'package:flutter/material.dart';
class ListDragTargetWidget extends StatefulWidget {
  const ListDragTargetWidget({super.key});

  @override
  _ListDragTargetWidgetState createState() => _ListDragTargetWidgetState();
}

class _ListDragTargetWidgetState extends State<ListDragTargetWidget> {
  bool _isDragged = false; // Variable to track whether the widget is being dragged

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LongPressDraggable Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LongPressDraggable(
              feedback: Container(
                width: 100,
                height: 100,
                color: Colors.blue.withOpacity(0.5),
                child: Center(
                  child: Text(
                    'Dragging...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onDragStarted: () {
                // Callback when the drag operation starts
                setState(() {
                  _isDragged = true; // Update the drag state
                });
              },
              onDragEnd: (details) {
                // Callback when the drag operation ends
                setState(() {
                  _isDragged = false; // Update the drag state
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Drag me!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _isDragged
                ? const Text('Widget is being dragged!')
                : const Text('Widget is not being dragged.'),
          ],
        ),
      ),
    );
  }
}

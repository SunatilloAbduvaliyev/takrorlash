import 'package:flutter/material.dart';

class DragTargetWidget extends StatefulWidget {
  const DragTargetWidget({super.key});

  @override
  State<DragTargetWidget> createState() => _DragTargetWidgetState();
}

class _DragTargetWidgetState extends State<DragTargetWidget> {
  Color globalColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Draggable(
              feedback: Container(
                width: 150,
                height: 150,
                color: Colors.orangeAccent.withOpacity(0.5),
                child: Text(
                  'Box...',
                  style: TextStyle(
                    color: Colors.white.withOpacity(
                      0.5,
                    ),
                  ),
                ),
              ),
              onDraggableCanceled: (velocity, offset) {},
              data: Colors.orangeAccent,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.orangeAccent,
                child: const Text(
                  'Box one',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            DragTarget(
              builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected,){
                return Container(
                  width: 200,
                  height: 200,
                  color: accepted.isEmpty ? globalColor : Colors.grey.shade200,
                  child: const Center(
                    child: Text("Drag here"),
                  ),
                );
              },
              onAccept: (Color color) {
                globalColor = color;
              },
            )
          ],
        ),
      ),
    );
  }
}

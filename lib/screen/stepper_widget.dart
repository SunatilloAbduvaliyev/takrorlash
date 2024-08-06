import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Stepper(
            steps: const [
              Step(
                title: Text("titile one"),
                content: Text('content one'),
              ),
              Step(
                title: Text("titile two"),
                content: Text('content two'),
              ),
              Step(
                title: Text("titile three"),
                content: Text('content three'),
              ),
            ],
            onStepTapped: (int index){
              setState(() {
                _currentIndex = index;
              });
            },
            currentStep: _currentIndex,
            onStepContinue: (){
              if(_currentIndex != 2){
                setState(() {
                  _currentIndex++;
                });
              }
            },
            onStepCancel: (){
              if(_currentIndex != 0){
                setState(() {
                  _currentIndex--;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}

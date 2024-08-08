import 'package:flutter/material.dart';

class MultiTickerExample extends StatefulWidget {
  const MultiTickerExample({super.key});

  @override
  State<MultiTickerExample> createState() => _MultiTickerExampleState();
}

class _MultiTickerExampleState extends State<MultiTickerExample>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // TickerProviderStateMixin dan foydalanamiz
    );

    _controller2 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this, // TickerProviderStateMixin dan foydalanamiz
    );

    _animation1 = Tween<double>(begin: 50, end: 200).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Curves.easeInOut,
      ),
    );

    _animation2 = Tween<double>(begin: 50, end: 200).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInOut,
      ),
    );

    _controller1.forward(); // Birinchi animatsiyani boshlash
    _controller2.forward(); // Ikkinchi animatsiyani boshlash
  }

  @override
  void dispose() {
    _controller1.dispose(); // Resurslarni tozalash
    _controller2.dispose(); // Resurslarni tozalash
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiTicker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation1,
              builder: (BuildContext context, child) => Container(
                width: _animation1.value,
                height: _animation1.value,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Animated Box 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animation2,
              builder: (BuildContext context, child) {
                return Container(
                  width: _animation2.value,
                  height: _animation2.value,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Animated Box 2',
                      style: TextStyle(color: Colors.white),
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

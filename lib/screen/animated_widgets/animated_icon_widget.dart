import 'package:flutter/material.dart';

// StatefulWidget yaratiladi va State bilan bog'lanadi
class AnimatedIconWidget extends StatefulWidget {
  const AnimatedIconWidget({super.key});

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

// StatefulWidget uchun State yaratiladi
class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with TickerProviderStateMixin { // TickerProviderStateMixin qo'shilib, animatsiyalarni qo'llab-quvvatlash uchun kerak
  late AnimationController _animatedController; // Animatsiya boshqaruvchisi uchun o'zgaruvchi e'lon qilinadi
  bool isAnimated = false; // Animatsiya holatini belgilovchi bayroq

  @override
  void initState() {
    // initState metodida animatsiya boshqaruvchisi ishga tushiriladi
    _animatedController = AnimationController(
      duration: const Duration(seconds: 1), // Animatsiya davomiyligi 1 soniya
      vsync: this, // TickerProviderStateMixin dan foydalaniladi
    );
    super.initState();
  }

  @override
  void dispose() {
    // dispose metodida animatsiya boshqaruvchisi tozalanadi
    _animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Widgetning interfeysi quriladi
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Ustun elementlari vertikal markazlanadi
        crossAxisAlignment: CrossAxisAlignment.center, // Ustun elementlari gorizontal markazlanadi
        children: [
          ElevatedButton(
            onPressed: () {
              // Tugma bosilganda animatsiya holati o'zgaradi
              if (isAnimated) {
                _animatedController.reverse(); // Agar animatsiya davom etayotgan bo'lsa, uni teskari aylantirish
                isAnimated = false; // Animatsiya holatini o'chirilgan deb belgilash
              } else {
                _animatedController.forward(); // Agar animatsiya davom etmayotgan bo'lsa, uni boshlash
                isAnimated = true; // Animatsiya holatini yoqilgan deb belgilash
              }
            },
            child: const Text('Animated'), // Tugma ichidagi matn
          ),
          const SizedBox(
            height: 100, // Tugma va animatsiya o'rtasida bo'sh joy
          ),
          // Animatsiyali ikona yaratiladi
          AnimatedIcon(
            icon: AnimatedIcons.add_event, // Ikona turi
            progress: _animatedController, // Animatsiya boshqaruvchisi
          ),
        ],
      ),
    );
  }
}

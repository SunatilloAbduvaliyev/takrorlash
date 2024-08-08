import 'package:flutter/material.dart';
import 'package:takrorlash/screen/animated_widgets/animated_cross_fade_widget.dart';
import 'package:takrorlash/screen/animated_widgets/animated_list_widget.dart';
import 'package:takrorlash/screen/animated_widgets/animated_modal_barrier_widget.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_align_widget.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_container.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_default_text_style.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_opacity_widget.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_padding_widget.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_positioned_directional_widget.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_positioned_widget.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_pysical_model_widget.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_rotation_widget.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_size_widget.dart';
import 'package:takrorlash/screen/animation/internal_animation/animated_theme_widget.dart';


class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>   {
  final List<Widget> screens = [
    const AnimatedAlignTwoWidget(),
    const AnimatedContainerWidget(),
    const AnimatedDefaultTextStyleDemo(),
    const AnimatedOpacityWidget(),
    const AnimatedPaddingWidget(),
    const AnimatedPhysicalModelDemo(),
    const AnimatedPositionedDemo(),
    const AnimatedPositionedDirectionalExample(),
    const AnimatedSizeExample(),
    const AnimatedThemeExample(),
    const AnimatedCrossFadeWidget(),
    const AnimatedListWidget(),
    const AnimatedModalBarrierWidget(),
    const AnimatedRotationExample(),
  ];
  final List<String> screenNames = [
    "AnimatedAlign",
    "AnimatedContainer",
    "AnimatedDefaultTextStyle",
    "AnimatedOpacity",
    "AnimatedPadding",
    "AnimatedPhysicalModel",
    "AnimatedPositioned",
    "AnimatedPositionedDirectional",
    "AnimatedSize",
    "AnimatedTheme",
    "AnimatedCrossFade",
    "AnimatedList",
    "AnimatedModalBarrierWidget",
    "AnimatedRotationWidget",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: screens.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Ink(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => screens[index]));
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        screenNames[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:takrorlash/screen/home/home_screen.dart';

import '../../screen/summary/summary_screen.dart';
import '../model/button_model.dart';

List<ButtonModel> buttons = [
  ButtonModel(
    icon: "assets/icons/flash.svg",
    widget: const HomeScreen(),
  ),
  ButtonModel(
    icon: "assets/icons/training.svg",
    widget: const SummaryScreen(),
  ),
  ButtonModel(
    icon: "assets/icons/next.svg",
    widget: const Scaffold(),
  ),
  ButtonModel(
    icon: "assets/icons/setting.svg",
    widget: const Scaffold(),
  ),
  ButtonModel(
    icon: "assets/icons/message.svg",
    widget: const Scaffold(),
  )
];

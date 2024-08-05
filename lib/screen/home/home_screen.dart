import 'package:flutter/material.dart';
import 'package:takrorlash/screen/animated_widgets/animated_align.dart';
import 'package:takrorlash/screen/animated_widgets/animated_cross_fade_widget.dart';
import 'package:takrorlash/screen/animated_widgets/animated_icon_widget.dart';
import 'package:takrorlash/screen/animated_widgets/animated_list_widget.dart';
import 'package:takrorlash/screen/animated_widgets/animated_modal_barrier_widget.dart';
import 'package:takrorlash/screen/animated_widgets/animated_switcher.dart';
import 'package:takrorlash/screen/backdropfilter_widget.dart';
import 'package:takrorlash/screen/banner_widget.dart';
import 'package:takrorlash/screen/clip_widges/clip_oval_widget.dart';
import 'package:takrorlash/screen/clip_widges/clip_path_widget.dart';
import 'package:takrorlash/screen/clip_widges/clip_rect_widget.dart';
import 'package:takrorlash/screen/dialog/about_dialog_widget.dart';
import 'package:takrorlash/screen/drag_target_widgets/drag_target_widget.dart';

import '../animated_widgets/animated_builder.dart';
import '../box_decorated_transform.dart';
import '../date_table_widget.dart';
import '../drag_target_widgets/list_drag_target_widget.dart';
import '../search/autocomplete_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>   {
  final List<Widget> screens = [
    //animated container
    const AnimatedAlignWidget(),
    const AnimatedBuilderWidget(),
    const AnimatedCrossFadeWidget(),
    const AnimatedIconWidget(),
    const AnimatedListWidget(),
    const AnimatedModalBarrierWidget(),
    const AnimatedSwitcherWidget(),
    //dialog
    const AboutDialogWidget(),
    //serach
    const AutocompleteWidget(),
    //shoffof background
    const BackDropFilterWidget(),
    //banner widget
    const BannerWidget(),
    //clips widget
    const ClipOvalWidget(),
    const ClipPathWidget(),
    const ClipRectWidget(),
    //date table widget
    const DataTableDemo(),
    //BoxDecoratedTransform
    const BoxDecoratedTransform(),
    //Drag widget
    const DragTargetWidget(),
    const ListDragTargetWidget(),
  ];
  final List<String> screenNames = [
    'AnimatedAlignWidget',
    'AnimatedBuilderWidget',
    "AnimatedCrossFadeWidget",
    'AnimatedIconWidget',
    "AnimatedListWidget",
    "AnimatedModalBarrierWidget",
    "AnimatedSwitcherWidget",
    "AboutDialogWidget",
    "AutocompleteWidget",
    "BackDropFilterWidget",
    "BannerWidget",
    "ClipOvalWidget",
    "ClipPathWidget",
    "ClipRectWidget",
    "DataTableDemo",
    "BoxDecoratedTransform",
    "DragTargetWidget",
    "ListDragTargetWidget",
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

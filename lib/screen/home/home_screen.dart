import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/cubit/navigation_button_cubit.dart';
import 'package:takrorlash/utils/style/app_text_style.dart';
import '../../utils/color/app_colors.dart';
import '../../utils/ui_utils/ui_utils.dart';
import '../global_widget/navigation_button.dart';
import '../services/widget_saver_sevices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        backgroundColor: AppColors.cFDFDFD,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.blue,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                String randomKey = getRandomLetter();
                WidgetSaverService.openWidgetAsImage(
                  context: context,
                  widgetKey: _globalKey,
                  fileId:  randomKey,
                );
              },
              icon: const Icon(
                Icons.share,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        body: BlocBuilder<NavigationButtonCubit, int>(builder: (BuildContext context, int state) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/person.png",
                  height: 245,
                  width: 245,
                ),
                Text(
                  'Verónica  Rivadulla Deschamps',
                  style: AppTextStyle.bold.copyWith(
                    fontSize: 32,
                    color: AppColors.c_000072,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Text(
                      'UX/UI & Visual Designer Front-end developer Graphic Designer Visual communicator',
                      style: AppTextStyle.regular.copyWith(
                        fontSize: 14,
                        color: AppColors.c_000000,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const NavigationButtons(),
              ],
            ),
          );
        },)
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takrorlash/cubit/navigation_button_cubit.dart';
import '../../data/repository/button_repository.dart';
import '../../utils/color/app_colors.dart';
import '../../utils/style/app_text_style.dart';

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationButtonCubit, int>(
      builder: (BuildContext context, int state) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: AppColors.cFFC3DF,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset:
                            const Offset(0, 1), // changes position of shadow
                          ),
                        ]),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>widget,),);
                      },
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Ink(
                    decoration: BoxDecoration(
                      color: AppColors.cFFC3DF,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 2,
                        color: AppColors.c_000072,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          'Contact',
                          style: AppTextStyle.medium.copyWith(
                            color: AppColors.c_000072,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: AppColors.cFFC3DF,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset:
                            const Offset(0, 1), // changes position of shadow
                          ),
                        ]),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: double.infinity,
                color: AppColors.c_000072,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    buttons.length,
                        (index) => GestureDetector(
                      onTap: () {
                        context.read<NavigationButtonCubit>().changeIndex(index);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => buttons[index].widget,
                          ),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration:  BoxDecoration(
                          color: state == index? Colors.white:AppColors.c_000072,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          buttons[index].icon,
                          colorFilter: ColorFilter.mode(
                            state == index? AppColors.c_000072:Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

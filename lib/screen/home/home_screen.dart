import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:takrorlash/screen/http_user_bloc/book_bloc.dart';
import 'package:takrorlash/screen/http_user_bloc/user_event.dart';
import 'package:takrorlash/screen/http_user_bloc/user_state.dart';
import 'package:takrorlash/utils/style/app_text_style.dart';

import '../../data/model/book_model/book_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<BookBloc, BookState>(
          builder: (BuildContext context, state) {
            if (state is BookLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BookSuccessState) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (BuildContext context, int index) {
                  BookModel bookModel = state.data[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5.w),
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100.w,
                          height: 100.h,
                          child: Image.network(
                            state.data[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.data[index].name,
                              style: AppTextStyle.regular,
                            ),
                            Text(
                              state.data[index].author,
                              style: AppTextStyle.regular,
                            ),
                            RichText(
                              text: TextSpan(
                                text:
                                    "Price: ${NumberFormat.currency(locale: 'uz').format(state.data[index].price)}",
                                style: AppTextStyle.regular
                                    .copyWith(fontSize: 12.sp),
                                children: [
                                  TextSpan(
                                    text:
                                        "   Rate: ${state.data[index].rate.toString()}  ",
                                    style: AppTextStyle.regular
                                        .copyWith(fontSize: 12.sp),
                                  ),
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Ink(
                              decoration: BoxDecoration(
                                color: state.data[index].isCheck == 1
                                    ? Colors.greenAccent
                                    : Colors.amber,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  context.read<BookBloc>().add(
                                        UpdateBookEvent(
                                          updateData: BookModel(
                                            uuid: bookModel.uuid,
                                            name: bookModel.name,
                                            author: bookModel.author,
                                            price: bookModel.price,
                                            rate: bookModel.rate,
                                            imageUrl: bookModel.imageUrl,
                                            isCheck: 1,
                                            description: bookModel.description,
                                          ),
                                        ),
                                      );
                                },
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5.w, horizontal: 10),
                                  child: Center(
                                      child: Text(
                                    state.data[index].isCheck == 1
                                        ? 'Purchased'
                                        : 'Purchase',
                                    style: AppTextStyle.medium.copyWith(
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
          listener: (BuildContext context, Object? state) {},
        ),
      ),
    );
  }
}

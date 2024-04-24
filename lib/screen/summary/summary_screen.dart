import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:takrorlash/cubit/navigation_button_cubit.dart';
import 'package:takrorlash/screen/global_widget/navigation_button.dart';
import '../../bloc/file_manager_bloc.dart';
import '../../data/model/file_model/file_model.dart';
import '../../data/repository/file_repository.dart';
import '../../utils/color/app_colors.dart';
import '../../utils/ui_utils/ui_utils.dart';
import '../services/file_managet_services.dart';
import '../services/widget_saver_sevices.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
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
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      ...List.generate(
                        context.read<FileRepository>().files.length,
                            (index) {
                          FileDataModel fileDataModel =
                          context.read<FileRepository>().files[index];

                          FileManagerBloc fileManagerBloc = FileManagerBloc();

                          return BlocProvider.value(
                            value: fileManagerBloc,
                            child: BlocBuilder<FileManagerBloc, FileManagerState>(
                              builder: (context, state) {
                                debugPrint("CURRENT MB: ${state.progress}");
                                String filePath = FileManagerService.isExist(
                                  fileDataModel.fileUrl,
                                  fileDataModel.fileName,
                                );
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(fileDataModel.fileName),
                                      subtitle: Text(fileDataModel.fileUrl),
                                      trailing: IconButton(
                                          onPressed: () async {
                                            if (filePath.isNotEmpty) {
                                              await OpenFilex.open(filePath);
                                            } else {
                                              fileManagerBloc.add(
                                                DownloadFileEvent(
                                                  fileDataModel: fileDataModel,
                                                ),
                                              );
                                            }
                                          },
                                          icon: Icon(
                                            filePath.isNotEmpty
                                                ? Icons.check
                                                : Icons.download,
                                            color: Colors.blue,
                                          )),
                                    ),
                                    Visibility(
                                      visible: state.progress != 0,
                                      child: LinearProgressIndicator(
                                        value: state.progress,
                                        backgroundColor: Colors.grey,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const NavigationButtons(),
              ],
            );
          },)
      ),
    );
  }
}



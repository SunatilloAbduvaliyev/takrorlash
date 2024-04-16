import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takrorlash/data/http_cruds/api_provider/api_provider.dart';
import 'package:takrorlash/screen/countries/countries_screen.dart';
import 'package:takrorlash/screen/graphql_coutnries_bloc/countries_bloc.dart';
import 'package:takrorlash/screen/http_user_bloc/book_bloc.dart';
import 'package:takrorlash/screen/http_user_bloc/user_event.dart';
import 'package:takrorlash/screen/route.dart';

import 'data/graphql_api/api/api_provider.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();

  final ApiClient apiClient =
  ApiClient(graphQLClient: ApiClient.create().graphQLClient);
  HttpApiProvider httpApiProvider = HttpApiProvider();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>BookBloc(httpApiProvider: httpApiProvider)..add(GetAllBookEvent())),
        BlocProvider(
          create: (_) => CountriesBloc(apiClient: apiClient)..add(FetchCountries('EU')),
        )
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(375, 812),
      builder: (context, _ ){
        ScreenUtil.init(context);
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CountriesScreen(),
          onGenerateRoute: AppRoute.generateRoute,
          initialRoute: RouteName.homeScreen,
        );
      },
    );
  }
}

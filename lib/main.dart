import 'package:e_commerce/config/routes_manager/route_generator.dart';
import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/utils/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  runApp( const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({ super.key});

  @override
  Widget build(BuildContext context) {
    String? token = CacheHelper.getData<String>("token");
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: token==null ? Routes.signInRoute : Routes.mainRoute),
    );
  }
}

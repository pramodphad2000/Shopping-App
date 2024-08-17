import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shoping_app/utils/routes/routes.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main({String? env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);     
 
  runApp(
    MyApp(
     
    ),
  );
}



class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
   
  });


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appRoutes = Routes();
    return ScreenUtilInit(
        designSize: const Size(360, 740),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Shopping app',
            debugShowCheckedModeBanner: false,
            routeInformationParser: appRoutes.router.routeInformationParser,
            routeInformationProvider: appRoutes.router.routeInformationProvider,
            routerDelegate: appRoutes.router.routerDelegate,
          );
        });
  }
}

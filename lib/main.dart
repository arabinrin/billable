import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:billable/screens/Home.dart';
import 'package:billable/screens/auth/login.dart';
import 'package:billable/screens/auth/onboarding.dart';
import 'package:billable/screens/auth/splash.dart';
import 'package:billable/utils/get_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserToken()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext ctx) => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        theme: ThemeData(
            primaryColor: Color(0xFF003566),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (state) => const Color(0xFFE5E5E5)))),
            scaffoldBackgroundColor: Colors.white,
            brightness: Brightness.light),
        home: AnimatedSplash(),
      ),
    );
  }
}

class AnimatedSplash extends StatelessWidget {
  static const route = '/AnimatedSplash';
  const AnimatedSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserToken>(context);

    return AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height,
      splash: Splash(),
      nextScreen: auth.box.read('name') != null ? LogIn() : B1(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      duration: 2000,
    );
  }
}

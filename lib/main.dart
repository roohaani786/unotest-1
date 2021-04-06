import 'package:flutter/material.dart';
import 'package:unotest/pages/login.dart';
import 'src/helpers/app_config.dart' as config;
import 'src/repository/settings_repository.dart' as settingRepo;
import 'src/models/setting.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingRepo.setting,
        builder: (context, Setting _setting, _) {
          //print(CustomTrace(StackTrace.current, message: _setting.toMap().toString()));
          return MaterialApp(
            navigatorKey: settingRepo.navigatorKey,
            title: "DoorBell",//_setting.appName,
            initialRoute: '/Splash',
            //onGenerateRoute: RouteGenerator.generateRoute,
            debugShowCheckedModeBanner: false,
            locale: _setting.mobileLanguage.value,
            localizationsDelegates: [
              S.delegate,
             
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: _setting.brightness.value == Brightness.light
                ? ThemeData(
              fontFamily: 'Poppins',
              primaryColor: Color(0xFF2C2C2C),//Colors.white,
              floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0, foregroundColor: Colors.white),
              brightness: Brightness.dark,
              accentColor: config.Colors().mainColor(1),
              dividerColor: config.Colors().accentColor(0.1),
              focusColor: config.Colors().accentColor(1),
              hintColor: config.Colors().secondColor(1),
              textTheme: TextTheme(
                headline5: TextStyle(fontSize: 20.0, color: config.Colors().secondColor(1), height: 1.35),
                headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondColor(1), height: 1.35),
                headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondColor(1), height: 1.35),
                headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainColor(1), height: 1.35),
                headline1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondColor(1), height: 1.5),
                subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondColor(1), height: 1.35),
                headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.Colors().mainColor(1), height: 1.35),
                bodyText2: TextStyle(fontSize: 12.0, color: config.Colors().secondColor(1), height: 1.35),
                bodyText1: TextStyle(fontSize: 14.0, color: config.Colors().secondColor(1), height: 1.35),
                caption: TextStyle(fontSize: 12.0, color: config.Colors().accentColor(1), height: 1.35),
              ),
            )
                : ThemeData(
              fontFamily: 'Poppins',
              primaryColor: Color(0xFF252525),
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Color(0xFF2C2C2C),
              accentColor: config.Colors().mainDarkColor(1),
              dividerColor: config.Colors().accentColor(0.1),
              hintColor: config.Colors().secondDarkColor(1),
              focusColor: config.Colors().accentDarkColor(1),
              textTheme: TextTheme(
                headline5: TextStyle(fontSize: 20.0, color: config.Colors().secondDarkColor(1), height: 1.35),
                headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1), height: 1.35),
                headline3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: config.Colors().secondDarkColor(1), height: 1.35),
                headline2: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700, color: config.Colors().mainDarkColor(1), height: 1.35),
                headline1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w300, color: config.Colors().secondDarkColor(1), height: 1.5),
                subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: config.Colors().secondDarkColor(1), height: 1.35),
                headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: config.Colors().mainDarkColor(1), height: 1.35),
                bodyText2: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(1), height: 1.35),
                bodyText1: TextStyle(fontSize: 14.0, color: config.Colors().secondDarkColor(1), height: 1.35),
                caption: TextStyle(fontSize: 12.0, color: config.Colors().secondDarkColor(0.6), height: 1.35),
              ),
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return LoginWidget();
    //   Scaffold(
    //
    // );
  }
}

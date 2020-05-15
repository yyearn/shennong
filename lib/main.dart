import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterny/page/indexPage.dart';
import 'package:flutterny/routes/application.dart';
import 'routes/routes.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main()  async {

  //-----------------路由主要代码start
  final router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  //-----------------路由主要代码end
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false, //不现实debug 提示
      //-----------------路由主要代码start
      onGenerateRoute: Application.router.generator,
      //-----------------路由主要代码end

      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70
      ),
      home: IndexPage(),
    );
  }
}


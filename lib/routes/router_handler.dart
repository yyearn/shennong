import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutterny/page/addPage.dart';
import 'package:flutterny/page/indexPage.dart';
import 'package:flutterny/page/login.dart';
// 首页
Handler indexPageHanderl = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return IndexPage();
  },
);

// 登陆页面
Handler loginHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return LoginPage();
    }
);

// 添加信息页面
Handler addHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return AddPage();
    }
);
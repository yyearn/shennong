import 'package:flutter/material.dart';

/**
 * form表单的使用
 */
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 表单Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormRouteDemo(),
    );
  }
}

class openInfo{

}

class FormRouteDemo extends StatefulWidget {
  @override
  _FormRouteDemoState createState() => _FormRouteDemoState();
}

class _FormRouteDemoState extends State<FormRouteDemo> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  //FormState为Form的State类，可以通过 Form.of() 或GlobalKey获得。我们可以通过它来对
  //Form的子孙FormField进行统一操作。
  GlobalKey _formKey  = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Padding(
        //symmetric代表着对称，其vertical代表上下对称，horizontal代表左右对称
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
            key: _formKey,//设置GlobalKey，用于后面获取FormState
            autovalidate: true,//开启自动校验
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: '用户名',
                      hintText: '用户名或手机号',
                      icon: Icon(Icons.person)
                  ),
                  //校验用户名
                  validator: (v){
                    return v
                        .trim()
                        .length > 0 ? null : '用户名不能为空';
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: '密码',
                      hintText: '您的登录密码',
                      icon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v){
                    return v
                        .trim()
                        .length > 5 ? null : '密码不能少于6位';
                  },
                ),
                //登录和注册按钮
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text('登录'),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: (){
                              /***
                               * 在这里不能通过Form.of(context)的方式获取FormState，context不对
                               * 通过_formKey.currentState获取FormState后，
                               * 调用validate()方法校验用户名密码是否合法，校验通过后再提交数据
                               */
                              if((_formKey.currentState as FormState).validate()){
                                //验证通过提交数据
                                //。。。。。
                              }
                            }
                        ),
                      ),

                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
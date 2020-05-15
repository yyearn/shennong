import 'package:flutter/material.dart';
import 'indexPage.dart';
import '../routes/routes.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String uname , pwd ;
  @override
  Widget build(BuildContext context) {
    final _loginFormKey = GlobalKey<FormState>();

    final logo = new Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: new Image.asset('assets/logo.png'),
      ),
    );

    final username = new TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
     // initialValue: 'suyie001@gmail.com',
      onSaved: (v){
        uname = v;
      },
      decoration: new InputDecoration(
          icon: Icon(Icons.person),
          hintText: '用户名',
          contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          )
      ),
    );

    final password = new TextFormField(
      autofocus: false,
     // initialValue: 'some password',
      obscureText: true,
      onSaved: (v){
        pwd = v;
      },

      decoration:  new InputDecoration(
          icon: Icon(Icons.lock),
          hintText: '密码',
          contentPadding: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
      ),
    );

    final loginButton = Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                padding: EdgeInsets.all(15.0),
                child: Text("登录"),
                color: Theme
                    .of(context)
                    .primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  //在这里不能通过此方式获取FormState，context不对
                  //print(Form.of(context));

                  // 通过_formKey.currentState 获取FormState后，
                  // 调用validate()方法校验用户名密码是否合法，校验
                  // 通过后再提交数据。
                  //Navigator.of(context).pushNamed(home);
                 
                },
              ),
            ),
          ],
        ),
    );

    final forgetLabel = new FlatButton(
      onPressed: (){},
      child: new Text('Forget Password?',style: new TextStyle(color: Colors.black54),),
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      backgroundColor: Colors.white,
      body: Form(
          child: new Center(
            child: new Center(
              child: new ListView(
                shrinkWrap: true,
                padding: new EdgeInsets.only(left: 24.0,right: 24.0),
                children: <Widget>[
                  //logo,
                  //SizedBox(height: 48.0),
                  username,
                  SizedBox(height: 8.0,),
                  password,
                  SizedBox(height: 24.0,),
                  loginButton,
                  //forgetLabel
                ],
              ),
            ),
          ),
      ),
    );
  }
}
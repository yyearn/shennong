import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:flutterny/routes/navigator_util.dart';
import '../models/param.dart';

class AddFormPage extends StatefulWidget {
  @override
  _AddFormPageState createState() => new _AddFormPageState();
}

class _AddFormPageState extends State<AddFormPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _cbrName;
  String _bcbrName;
  String _acreage;
  String _price;
  String _remarks;


  var url='http://47.94.209.231:9292/ny/save';
  var subjects = [];
  Response response;
  Dio dio = Dio();
  requestDate() async {

    Map map = {
      'cbrName': _cbrName,
      'bcbrName': _bcbrName,
      'acreage': _acreage,
      'priceNumber': _price,
      'remarks': _remarks,
    };

    response = await dio.post(url, data:map);
    Map subjects = response.data;

  }

  void _forSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      requestDate();
      NavigatorUtil.jump(context, '/indexPage?isRefresh=true');

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('信息记录'),
      ),
     /* floatingActionButton: new FloatingActionButton(
        onPressed: _forSubmitted,
        child: new Text('提交1'),
      ),*/
      body: new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '承包人姓名',
                ),
                onSaved: (val) {
                  _cbrName = val;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return '不能为空';
                  }
                  return null;
                },
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '转包人姓名',
                ),
                //10obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return '不能为空';
                  }
                  return null;
                },
                onSaved: (val) {
                  _bcbrName = val;
                },
              ),
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: '亩数',
                ),
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp("[0-9.]")),//只允许输入小数
                ],
                validator: (val) {
                  if (val.isEmpty) {
                    return '不能为空';
                  }
                },
                onSaved: (val) {
                  _acreage = val;
                },
              ),
              new TextFormField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: '价格',
                ),
                //obscureText: true,
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp("[0-9.]")),//只允许输入小数
                ],
                validator: (val) {
                  if (val.isEmpty) {
                    return '不能为空';
                  }
                },
                onSaved: (val) {
                  _price = val;
                },
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '说明',
                ),
                onSaved: (val) {
                  _remarks = val;
                },
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text('完成'),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed:this._forSubmitted,
                            )
                        )
                      ]
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
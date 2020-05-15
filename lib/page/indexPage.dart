import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterny/routes/navigator_util.dart';
import 'package:flutterny/routes/routes.dart';
import 'addPage.dart';
import 'login.dart';
import 'nyList.dart';
import 'addFormPage.dart';
import '../models/param.dart';

class IndexPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //backgroundColor: Colors.grey[100],
        appBar: AppBar(
          //标题居中
          centerTitle: true,
          title: Text("项目"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              tooltip: '添加信息',
              onPressed: (){
                  NavigatorUtil.gotransitionCupertinoDemoPage(context, '/addPage');
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              tooltip: '搜索按钮',
              onPressed: ()=> debugPrint("搜索按钮"),
            ),
          ],
          elevation: 30.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black45,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.widgets)),
              Tab(icon: Icon(Icons.account_balance)),
              Tab(icon: Icon(Icons.account_circle)),

            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          NyListView(),
          Text("data"),
          LoginPage(),
        ],),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("yyearn",style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text("yyearn@163.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://resources.ninghao.org/images/wanghao.jpg"),
                ),
              ),
              ListTile(
                title: Text("Message",textAlign: TextAlign.right,),
                trailing: Icon(Icons.message,color: Colors.black12,size: 22.0,),
                onTap: ()=> Navigator.pop(context),
              ),
              ListTile(
                title: Text("Map",textAlign: TextAlign.right,),
                trailing: Icon(Icons.map,color: Colors.black12,size: 22.0,),
                onTap: ()=> Navigator.pop(context),
              ),
              ListTile(
                title: Text("注销",textAlign: TextAlign.right,),
                trailing: Icon(Icons.settings,color: Colors.black12,size: 22.0,),
                onTap: (){
                  debugPrint('注销操作');
                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
        // bottomNavigationBar: BottomNavigationBarDemo(),
//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.add_circle),
//          onPressed: (){
//            print('添加信息页面');
//            AddForm();
//
//          },
//        ),

      ) ,
    );
  }


}

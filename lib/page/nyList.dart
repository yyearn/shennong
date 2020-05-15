import 'package:flutter/material.dart';
import 'dart:convert' as Convert;
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:dio/dio.dart';

class NyListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NyListViewState();
  }
}

class NyListViewState extends State<NyListView> with AutomaticKeepAliveClientMixin{

  var url='http://47.94.209.231:9292/ny/all';
  var subjects = [];
  var itemHeight = 150.0;

  requestDate() async {
    Response response = await Dio().get(url);
    Map data = response.data;
    setState(() {
      print("数据请求状态:${data['message']}");
      subjects = data['subjects'];
    });
  }

  @override
  void initState() {
    super.initState();
    requestDate();
  }

  onRefresh(){
    requestDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        bottomBouncing: false,
        child: getListViewContainer(),
        onRefresh: () async => onRefresh(),
        onLoad:() async => requestDate(),
      ),
    );
  }

  getListViewContainer() {
    if (subjects.length == 0) {
      //loading
      return CupertinoActivityIndicator();
    }
    return ListView.builder(
      //item 的数量
        itemCount: subjects.length,

        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(

            //Flutter 手势处理
            child: Container(

              //color: Colors.black12,
              child: itemWidget(index)
            ),
            onTap: () {
              //监听点击事件
              print("click item index=$index");
            },
          );
        });
  }

  //状态
  itemWidget(var index) {
    return Container(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          rowData(subjects[index]),
          getItemContainerView(subjects[index]),
          //下面的灰色分割线

        ],
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 50, 201, 129),
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5, //阴影范围
              spreadRadius: 1, //阴影浓度
              color: Colors.grey, //阴影颜色
            )
          ],

      ),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      margin: EdgeInsets.all(10.0),

    );
  }
  rowData(subject){
    return Container(
      child: Row(
        children: <Widget>[
          stateWidget('种植完成'),
          acreageWidget(subject['acreage']),
          priceWidget(subject['priceNumber'])
        ],
      ),
    );
  }
  //肖申克的救赎(1993) View
  getTitleView(subject) {
    var bcbrName = subject['bcbrName'];
    var cbrName = subject['cbrName'];
    var upDate = subject['upDate'];
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '转包人： ${bcbrName}',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              /*Text('($upDate)',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  )
              )*/
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                '承包人： ${cbrName}',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text('($upDate)',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey))
            ],
          ),
        ],
      )
    );
  }

  getItemContainerView(var subject) {
    //var imgUrl = subject['images']['medium'];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          //getImage(imgUrl),
          Expanded(
            child: getMovieInfoView(subject),
            flex: 1,
          )
        ],
      ),
    );
  }

  //圆角图片
  getImage(var imgUrl) {
    return Container(
      decoration: BoxDecoration(
          image:
          DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      margin: EdgeInsets.only(left: 8, top: 3, right: 8, bottom: 3),
      height: itemHeight,
      width: 100.0,
    );
  }

  getStaring(var stars) {
    return Row(
      children: <Widget>[RatingBar(stars), Text('$stars')],
    );
  }

  //电影标题，星标评分，演员简介Container
  getMovieInfoView(var subject) {
    //var start = subject['rating']['average'];
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          getTitleView(subject),
          //RatingBar(start),
          SizedBox(height: 16.0,),
          if(subject['remarks'] != null)
          DescWidget(subject)
        ],
      ),
    );
  }

  priceWidget(var priceNumber) {
    return Container(
      child: Text(
        '价格：$priceNumber',
        style: TextStyle(color: Colors.black),
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 201, 129),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      margin: EdgeInsets.only(left: 12, top: 10),
    );
  }
  //状态
  stateWidget(var state) {
    return Container(
      child: Text(
        '$state',
        style: TextStyle(color: Colors.black),
      ),
      decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      margin: EdgeInsets.only(left: 12, top: 10),
    );
  }

  acreageWidget(var no) {
    return Container(
      child: Text(
        '亩数：$no',
        style: TextStyle(color: Color.fromARGB(255, 133, 66, 0)),
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 201, 129),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      margin: EdgeInsets.only(left: 12, top: 10),
    );
  }
  @override
  bool get wantKeepAlive => true;
}

//类别、演员介绍
class DescWidget extends StatelessWidget {
  var subject;

  DescWidget(this.subject);

  @override
  Widget build(BuildContext context) {
    /*var casts = subject['casts'];
    var sb = StringBuffer();
    var genres = subject['genres'];
    for (var i = 0; i < genres.length; i++) {
      sb.write('${genres[i]}  ');
    }
    sb.write("/ ");
    List<String> list = List.generate(
        casts.length, (int index) => casts[index]['name'].toString());

    for (var i = 0; i < list.length; i++) {
      sb.write('${list[i]} ');
    }*/
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        subject['remarks'],
        softWrap: true,
        textDirection: TextDirection.ltr,
        style:
        TextStyle(fontSize: 16, color: Color.fromARGB(255, 118, 117, 118)),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  double stars;

  RatingBar(this.stars);

  @override
  Widget build(BuildContext context) {
    List<Widget> startList = [];
    //实心星星
    var startNumber = stars ~/ 2;
    //半实心星星
    var startHalf = 0;
    if (stars.toString().contains('.')) {
      int tmp = int.parse((stars.toString().split('.')[1]));
      if (tmp >= 5) {
        startHalf = 1;
      }
    }
    //空心星星
    var startEmpty = 5 - startNumber - startHalf;

    for (var i = 0; i < startNumber; i++) {
      startList.add(Icon(
        Icons.star,
        color: Colors.amberAccent,
        size: 18,
      ));
    }
    if (startHalf > 0) {
      startList.add(Icon(
        Icons.star_half,
        color: Colors.amberAccent,
        size: 18,
      ));
    }
    for (var i = 0; i < startEmpty; i++) {
      startList.add(Icon(
        Icons.star_border,
        color: Colors.grey,
        size: 18,
      ));
    }
    startList.add(Text(
      '$stars',
      style: TextStyle(
        color: Colors.grey,
      ),
    ));
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 0, top: 8, right: 0, bottom: 5),
      child: Row(
        children: startList,
      ),
    );
  }
}
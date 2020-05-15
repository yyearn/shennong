import 'package:flutter/material.dart';
import 'package:sqljocky5/results/results.dart';
import '../models/post.dart';
import '../routes/routes.dart';
import 'post_show.dart';
import '../models/ny_core.dart';

class ListViewDemo extends StatelessWidget{

  Widget _ListItemBuilder(BuildContext context,int index){

    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              //Image.network(posts[index].imageUrl),
              SizedBox(height: 16.0,),//高度间隔16
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subhead,
              ),
              SizedBox(height: 16.0,),//高度间隔16
              Column(

              )
            ],
          ),
          Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: (){
                    //debugPrint("点击list");
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> PostShow(post: posts[index],))
                    );
                  },
                ),
              )
          )
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _ListItemBuilder ,
    );
  }
}

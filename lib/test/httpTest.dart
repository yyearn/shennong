import 'dart:io';
import 'dart:convert' as Convert;
import 'package:http/http.dart' as http;
import '../models/ny_core.dart';
import 'package:dio/dio.dart';


var url='http://127.0.0.1:9292/ny/save';
var subjects = [];
Response response;
Dio dio = Dio();

requestDate() async {


  Map map = {
    'cbrName': "_cbrName",
    'bcbrName': "_bcbrName",
    'acreage': 16,
    'price': 19,
    'remarks': "_remarks",
  };



  response = await dio.post(url, data:map);
  Map subjects = response.data;
  print(subjects['code']);

}

void main(){
  requestDate();
}
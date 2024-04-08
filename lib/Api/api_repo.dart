import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'ModelClass.dart';

class ApiRepo {
  PostModel? pm;
  List<PostModel> postList=[];

  Future loadJsonData(category) async {
    http.Response res = await http
        .get(Uri.parse('https://newsapi.org/v2/top-headlines/sources?apiKey=a1bb1ce7138442de88393005bade82de&category=$category&language=en'));
    print(res.body);

    var d = jsonDecode(res.body)['sources'];
    print(d);
    for(var e in d){
      pm = PostModel.fromJson(e);
      postList.add(pm!);
    }
    return postList;
  }
}


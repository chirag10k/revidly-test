import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:revidlytest/models/post_model.dart';

import 'database_service.dart';

class ApiService extends ChangeNotifier {

  Future<List<Post>> getPostsFromApi(BuildContext context) async {
    fetchedPostList.removeRange(0, fetchedPostList.length);
    String url = 'http://revidly.surge.sh/revidlyapi.json';
    bool trustSelfSigned = true;
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
      client.badCertificateCallback=(X509Certificate cert, String host, int port)=> trustSelfSigned;};
    Response response = await dio.get(url);
    if(response.statusCode == 200) {
      List<dynamic> val = response.data as List;
      List<Post> postList = [];
      for(var u in val){
        postList.add(Post.fromMap(u));
      }
      fetchedPostList = postList;
      DatabaseService().createPostList(postList);
      return fetchedPostList;
    } else {
      print('Request failed with status: ${response.statusCode}');
    }

  }

}
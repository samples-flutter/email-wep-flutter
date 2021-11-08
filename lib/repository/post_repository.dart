import 'package:dio/dio.dart';
import 'package:web_flutter/models/email.dart';

class PostRepository {
  Future<List<Email>> getPost() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');

      final responseList = response.data as List;
      return responseList.map((e) => Email.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Exception occured");
    }
  }
}

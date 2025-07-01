import 'dart:convert';

import 'package:get/get.dart';
import 'package:untitled3/models/Post.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  var isLoading = false.obs;
  var posts = <Post>[].obs;

  Future<void> getPosts() async {
    isLoading.value = true;

    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await http.get(url);

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        posts.value = postFromJson(response.body);
      } else {
        Get.snackbar('Error', 'Failed to load posts');
      }
    } catch (e) {
      Get.snackbar('Exception', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addpost(String mytitle, String mybody) async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': mytitle,
          'body': mybody,
          'userId': 1,
        }),
      );

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Post added successfully');
        print("Response: ${response.body}");
      } else {
        Get.snackbar('Error', 'Failed to add post');
      }
    } catch (e) {
      Get.snackbar('Exception', 'Something went wrong: $e');
    }
  }
}

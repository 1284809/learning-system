import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/postcontroller.dart';
import 'package:untitled3/models/Post.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final PostController c = Get.put(PostController());

  @override
  void initState() {
    super.initState();
    c.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              c.getPosts();
            },
          )
        ],
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (c.posts.isEmpty) {
          return const Center(child: Text('No posts found.'));
        }

        return ListView.builder(
          itemCount: c.posts.length,
          itemBuilder: (context, index) {
            final Post post = c.posts[index];
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
            );
          },
        );
      }),
    );
  }
}

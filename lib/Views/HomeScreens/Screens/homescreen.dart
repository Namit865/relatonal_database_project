import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relatonal_database_project/Views/HomeScreens/Screens/blogdetailed.dart';
import '../Controller/blogcontroller.dart';
import 'addblog.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BlogPostController blogPostController = Get.put(BlogPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                blogPostController.themeChange();
              },
              icon: blogPostController.isDark.value
                  ? const Icon(CupertinoIcons.sun_max)
                  : const Icon(CupertinoIcons.moon_zzz),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
        title: const Text('Blog Platform'),
      ),
      body: _buildBlogList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(AddBlogPostDialog());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBlogList() {
    return Obx(
      () => ListView.builder(
        itemCount: blogPostController.blogPosts.length,
        itemBuilder: (context, index) {
          final post = blogPostController.blogPosts[index];
          return Card(
            color: Colors.black54,
            child: ListTile(
              onTap: () {
                Get.to(() => detailedBlogScreen(post: post));
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        "Are You Sure Want to Delete this Post?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            blogPostController.deleteBlogPost(post.id!);
                            Get.back();
                          },
                          child: const Text("Ok"),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Cancel"),
                        ),
                      ],
                    );
                  },
                );
              },
              title: Text(post.title),
              subtitle: Text("${post.content}"),
            ),
          );
        },
      ),
    );
  }
}

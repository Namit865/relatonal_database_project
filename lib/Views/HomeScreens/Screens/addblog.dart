import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Model/blogmodel.dart';
import '../Controller/blogcontroller.dart';

class AddBlogPostDialog extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final BlogPostController blogPostController = Get.find<BlogPostController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a New Blog Post'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(labelText: 'Content'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            final title = _titleController.text.trim();
            final content = _contentController.text.trim();

            if (title.isNotEmpty && content.isNotEmpty) {
              blogPostController.addBlogPost(BlogPost(
                title: title,
                content: content,
                date: DateTime.now(),
              ));
              Get.back(); // Use Get.back() directly
            }
          },
          child: const Text('Add Post'),
        ),
      ],
    );
  }
}
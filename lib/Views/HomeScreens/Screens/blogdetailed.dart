import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:relatonal_database_project/Model/blogmodel.dart';

class detailedBlogScreen extends StatefulWidget {
  final BlogPost post;

  const detailedBlogScreen({super.key, required this.post});

  @override
  State<detailedBlogScreen> createState() => _detailedBlogScreenState();
}

class _detailedBlogScreenState extends State<detailedBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Text(
            widget.post.content.capitalizeFirst.toString(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

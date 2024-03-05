import 'package:flutter/material.dart';

class DetailScreenBlog extends StatefulWidget {
  final Map<String, dynamic> news;

  const DetailScreenBlog({super.key, required this.news});

  @override
  State<DetailScreenBlog> createState() => _DetailScreenBlogState();
}

class _DetailScreenBlogState extends State<DetailScreenBlog> {
  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.news['imageurl'];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.news['title'] ?? 'No Title'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: imageUrl == null || imageUrl.isEmpty
                  ? const Center(
                      child: Icon(Icons.error_outline, color: Colors.white),
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              widget.news['published_time'.split("T")[0]],
            ),
            Text(
              "Description : \n${widget.news['description'] ?? 'No Description'}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              'Content: \n${widget.news['content'] ?? 'No Content'}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Text(
              textAlign: TextAlign.right,
              'Author: ${widget.news['author'] ?? 'Unknown'}',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

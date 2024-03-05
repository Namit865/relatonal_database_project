import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relatonal_database_project/Views/HomeScreens/Controller/blogcontroller.dart';
import 'package:relatonal_database_project/Views/HomeScreens/Screens/detailedscreen.dart';

import '../../../Helper/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = Get.put(HomeScreenController());
  final DataBaseHelper dataBaseHelper = DataBaseHelper();

  @override
  void dispose() {
    dataBaseHelper.closeDatabase();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
      ),
      body: FutureBuilder(
        future: dataBaseHelper.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final newsList = snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => DetailScreenBlog(news: news),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    color: Colors.white24,
                    child: ListTile(
                      title: Text(news['title'] ?? ''),
                      subtitle: Text(
                        controller
                            .truncateDescription(news['description'] ?? ''),
                      ),
                      leading: Container(
                        height: 60,
                        width: 80,
                        child: Image.network(news['imageurl'] ?? ''),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

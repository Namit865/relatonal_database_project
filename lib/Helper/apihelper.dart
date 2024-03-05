import 'dart:convert';

import 'database_helper.dart';
import 'package:http/http.dart' as http;

void fetchNews(DataBaseHelper dataBaseHelper) async {
  const String apiKey = '032e2eea6932491a974961833685e1d9';
  const String apiUrl =
      'https://newsapi.org/v2/everything?q=apple&from=2024-03-04&to=2024-03-04&sortBy=popularity&apiKey=';

  try {
    final response = await http.get(Uri.parse('$apiUrl$apiKey'));

    if (response.statusCode == 200) {
      final newsData = json.decode(response.body);
      print('API Response: $newsData');

      if (newsData['articles'] != null) {
        final articles = newsData['articles'];
        for (var e in articles) {
          await dataBaseHelper.insertNews({
            'title': e['title'],
            'author': e['author'],
            'description': e['description'],
            'content': e['content'],
            'imageurl': e['urlToImage'],
            'published_time': e['publishedAt'],
            'name' : e['name']
          });
        }
      }
    }
  } catch (e) {
    print('API Request Exception: $e');
  }
}

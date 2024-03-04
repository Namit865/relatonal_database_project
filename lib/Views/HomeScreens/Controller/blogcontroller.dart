import 'package:get/get.dart';
import 'package:relatonal_database_project/Model/lightdark.dart';
import '../../../Helper/database_helper.dart';
import '../../../Model/blogmodel.dart';

class BlogPostController extends GetxController {
  RxList blogPosts = [].obs;
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  themeMode mode = themeMode(isdark: false.obs);

  @override
  void onInit() {
    initializeBlogPosts();
    super.onInit();
  }

  Future<void> initializeBlogPosts() async {
    await _databaseHelper.initializeDatabase();
    List<BlogPost> newBlogPosts = await _databaseHelper.getBlogPosts().then(
          (posts) => posts.map((post) => BlogPost.fromMap(post)).toList(),
    );
    blogPosts.value = RxList.from(newBlogPosts);
    update();
  }

  Future<void> addBlogPost(BlogPost post) async {
    await _databaseHelper.insertBlogPost(post.toMap());
    initializeBlogPosts();
  }

  Future<void> updateBlogPost(BlogPost post) async {
    await _databaseHelper.updateBlogPost(post.toMap());
    initializeBlogPosts();
  }

  Future<void> deleteBlogPost(int id) async {
    await _databaseHelper.deleteBlogPost(id);
    blogPosts.removeWhere((post) => post.id == id);
    update();
  }

  void themeChange(){
    mode.isdark != mode.isdark;
  }

}

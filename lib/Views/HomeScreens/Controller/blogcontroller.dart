import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  String truncateDescription(String description) {
    const int maxLines = 2;
    final lines = description.split('\n');


    if (lines.length <= maxLines) {
      return description;
    } else {
      return '${lines.take(maxLines).join('\n')}...';
    }
  }

}
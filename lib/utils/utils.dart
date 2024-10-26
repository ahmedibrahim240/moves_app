import 'config/app_info.dart';

class Utils {
  static String getImageUrl(String path) {
    return AppInfo.IMAGE_HOST + path;
  }
}

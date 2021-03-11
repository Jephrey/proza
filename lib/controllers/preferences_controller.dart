import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// All preferences in one place.
class Preferences extends GetxController {
  static Preferences get to => Get.find<Preferences>();

  final _prefs = GetStorage();

  var _theme = 'system'.obs; // Theme: light, dark, system.

  // Get and set the theme.
  String get theme => _theme.value.toString();
  set theme(String theme) {
    _theme.val(theme);
    _prefs.write('theme', theme);
  }

  Preferences() {
    _theme.value = _prefs.read('theme') ?? 'system';
  }
}

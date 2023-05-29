import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController lasNameCobtroller = TextEditingController();
  TextEditingController age = TextEditingController();

  Future<void> putToBox() async {
    Box<dynamic> registerBox = Hive.box("register");
    await registerBox.put("name", nameController.text);
    await registerBox.put("lastName", lasNameCobtroller.text);
    await registerBox.put("age", age.text);
    notifyListeners();
  }
}

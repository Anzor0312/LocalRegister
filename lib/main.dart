import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tack/provider/home_provider.dart';
import 'package:tack/view/homepage.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  await Hive.openBox("register");
  runApp(MultiProvider(providers:[ ChangeNotifierProvider(create: (context) => HomeProvider(),)],
  child: MyWidget(),));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

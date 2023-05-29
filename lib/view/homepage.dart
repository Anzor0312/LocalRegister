import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:tack/provider/home_provider.dart';
import 'package:tack/view/info_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) => _scaffold(context),
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      drawer: InfoPage(),
      appBar: AppBar(
        title:const Text("HomePage"),
      ),
      body: Column(
        children: [
          TextField(
            controller: context.watch<HomeProvider>().nameController,
            style:const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Name",
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              controller: context.watch<HomeProvider>().lasNameCobtroller,
              style:const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Last name",
              ),
            ),
          ),
          TextField(
            controller: context.watch<HomeProvider>().age,
            style:const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Age",
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.blue),
            child: Column(
              children: [
                ListTile(
                  title: const Text("ismi:"),
                  subtitle: Text(Hive.box("register").get("name") ?? ""),
                ),
                ListTile(
                  title: const Text("familiyasi:"),
                  subtitle: Text(Hive.box("register").get("lastName") ?? ""),
                ),
                ListTile(
                  title: const Text("yoshi:"),
                  subtitle: Text(Hive.box("register").get("age") ?? ""),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
        await  context.read<HomeProvider>().putToBox();
        },
        child:const Text("Next"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mockxl/constant/text_config.dart';
import 'package:mockxl/helper/shared_pref.dart';
import 'package:mockxl/pages/home/widgets/home_header.dart';
import 'package:mockxl/pages/home/widgets/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: SafeArea(
            child: Column(
          children: [
            HomeHeader(),
            HomeSlider(),
            ElevatedButton(
                onPressed: () async {
                  var res = await SharedPrefs.clearAll();
                  print(res);
                },
                child: Text("Clear"))
          ],
        )));
  }
}

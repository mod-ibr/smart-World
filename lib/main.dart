import 'package:flutter/material.dart';

import 'FirstPage.dart';
import 'LeftSideBar.dart';
import 'RightSideBar.dart';
import 'SecondPage.dart';
import 'TopBar.dart';

int index = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Technology',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: MyHomePage()),
    );
  }
}

double height = 0;
double width = 0;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      setState(() {
        index = controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(color: Colors.white),
        PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: [
            FirstPage(height, width),
            SecondPage(height, width),
          ],
        ),
        TopBar(height, width),
        RightSideBar(height),
        LeftSideBar(height, index),
      ],
    );
  }
}

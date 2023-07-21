import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/sheert/colors.dart';

import 'screens/add_post.dart';
import 'screens/home.dart';
import 'screens/profile.dart';
import 'screens/search.dart';

class moail extends StatefulWidget {
  const moail({super.key});

  @override
  State<moail> createState() => _moailState();
}

class _moailState extends State<moail> {
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("مرحبا بك في عالمي")),
      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: mobileBackgroundColor,
          onTap: (index) {
            // print("77777777777");
            _pageController.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: "البحث"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "اضافة"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "اعجاب"),
          ]),
      body: PageView(
        onPageChanged: (index) {},
        // physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Home(),
          Profile(),
          Search(),
          AddPost(),
        ],
      ),
    );
  }
}

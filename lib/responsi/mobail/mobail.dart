import 'package:firebase_auth/firebase_auth.dart';
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
  int currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
          backgroundColor: mobileBackgroundColor,
          // !فونكشن مهمه
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              currentPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: currentPage == 0 ? primaryColor : secondaryColor,
                ),
                label: "الرئيسية"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_rounded,
                  color: currentPage == 1 ? primaryColor : secondaryColor,
                ),
                label: "البحث"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: currentPage == 2 ? primaryColor : secondaryColor,
                ),
                label: "اضافة"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: currentPage == 3 ? primaryColor : secondaryColor,
                ),
                label: "اعجاب"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: currentPage == 4 ? primaryColor : secondaryColor,
                ),
                label: ""),
          ]),
      body: PageView(
        onPageChanged: (index) {},
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          const Home(),
          const Search(),
          const AddPost(),
          const Center(child: Text("Love u ♥")),
          Profile(
            uiddd: FirebaseAuth.instance.currentUser!.uid,
          ),
        ],
      ),
    );
  }
}

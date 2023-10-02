import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/responsi/mobail/screens/comments.dart';
import 'package:flutter_svg/svg.dart';

import '../../sheert/colors.dart';
import '../mobail/screens/add_post.dart';
import '../mobail/screens/home.dart';
import '../mobail/screens/profile.dart';
import '../mobail/screens/search.dart';

class wep extends StatefulWidget {
  const wep({super.key});

  @override
  State<wep> createState() => _wepState();
}

class _wepState extends State<wep> {
  int page = 0;
  final PageController _pageController = PageController();
  navigate2Screen(int indexx) {
    _pageController.jumpToPage(indexx);
    setState(() {
      page = indexx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: page == 0 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              navigate2Screen(0);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: page == 1 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              navigate2Screen(1);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: page == 2 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              navigate2Screen(2);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: page == 3 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              navigate2Screen(3);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: page == 4 ? primaryColor : secondaryColor,
            ),
            onPressed: () {
              navigate2Screen(4);
            },
          ),
        ],
        title: SvgPicture.asset(
          "assets/instagram.svg",
          color: primaryColor,
          height: 32,
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {},
        physics: NeverScrollableScrollPhysics(),
        // controller: _pageController,
        children: [
          
          Home(),
          Search(),
          AddPost(),
          Center(child: Text("Love u ♥")),
          Profile(uiddd: FirebaseAuth.instance.currentUser!.uid,),
        ],
      ),
    );
  }
}

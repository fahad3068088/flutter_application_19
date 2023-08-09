import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../sheert/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          widthScreen > 600 ? webBackgroundColor : mobileBackgroundColor,
      appBar: widthScreen > 600
          ? null
          : AppBar(
              backgroundColor: mobileBackgroundColor,
              actions: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.messenger_outline)),
                IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
              ],
              title: SvgPicture.asset(
                "assets/instagram.svg",
                color: primaryColor,
                height: 32,
              ),
            ),
      body: Container(
        decoration: BoxDecoration(
            color: mobileBackgroundColor,
            borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(
            vertical: 55, horizontal: widthScreen > 600 ? widthScreen / 6 : 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: CircleAvatar(
                          radius: 33,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/564x/94/df/a7/94dfa775f1bad7d81aa9898323f6f359.jpg"),
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      Text(
                        "اسم المستخدم",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              ),
            ),
            Image.network(
              "https://cdn1-m.alittihad.ae/store/archive/image/2021/10/22/6266a092-72dd-4a2f-82a4-d22ed9d2cc59.jpg?width=1300",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.comment_outlined,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_outline),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, 10, 0, 9),
              width: double.infinity,
              child: Text(
                "data",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              children: [
                Text("اسم الشخص المرسل"),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                Text("الرسالة♥"),
              ],
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                    width: double.infinity, child: Text("000000000000000"))),
          ],
        ),
      ),
    );
  }
}

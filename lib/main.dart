import 'package:flutter/material.dart';
import 'package:flutter_application_19/responsi/Responsive%20.dart';
import 'package:flutter_application_19/responsi/mobail/mobail.dart';
import 'package:flutter_application_19/responsi/web/web.dart';

import 'responsi/mobail/screens/register.dart';
import 'responsi/mobail/screens/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Login(),
      // home: Responsive(mobail: moail(),wep: wep()),
    );
  }
}

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final double widthScreen = MediaQuery.of(context).size.width;
//     return Scaffold(
//         appBar: AppBar(
//             title: widthScreen > 600
//                 ? Text("شاشة الكمبيوتر")
//                 : (Text(
//                     "شاشة الجوال",
//                     style: TextStyle(color: Colors.red),
//                   ))));
 
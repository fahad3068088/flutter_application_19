import 'package:flutter/material.dart';
class wep extends StatefulWidget {
  const wep({super.key});

  @override
  State<wep> createState() => _wepState();
}

class _wepState extends State<wep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
       appBar: AppBar(
            title:Text("الويب")  )
    );
  }
}
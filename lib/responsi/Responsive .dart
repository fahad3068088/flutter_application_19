import 'package:flutter/material.dart';
import 'package:flutter_application_19/responsi/mobail/mobail.dart';
import 'package:flutter_application_19/responsi/web/web.dart';

class Responsive extends StatefulWidget {
  final mobail;
  final wep;
  const Responsive({super.key, required this.mobail, required this.wep});

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext, BoxConstraints) {
      if (BoxConstraints.maxWidth > 600) {
        return widget.wep;
      } else {
        return widget.mobail;
      }
    });
  }
}

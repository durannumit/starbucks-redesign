import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starbucks_redesign/constants/colors.dart';
import 'package:starbucks_redesign/constants/dimens.dart';
import 'package:starbucks_redesign/utils/device/device_utils.dart';
import 'package:starbucks_redesign/utils/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      child: Center(child: Text("Home")),
    ));
  }
}

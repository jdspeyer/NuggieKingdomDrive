// ignore_for_file: implementation_imports

import 'package:drive_nuggiekingdom/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';


class HomeScreen extends Screen {
  const HomeScreen({
    super.key,
    super.path = "/",
    super.name = "home",
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(color: Colors.red),
    );
  }
}

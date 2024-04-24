// ignore_for_file: implementation_imports

import 'package:drive_nuggiekingdom/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';


class AuthenticationScreen extends Screen {
  const AuthenticationScreen({
    super.key,
    super.path = "/signin",
    super.name = "signin",
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(color: Colors.blue),
    );
  }
}

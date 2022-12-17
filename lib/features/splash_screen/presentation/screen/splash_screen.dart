import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tadawal/config/app_routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goToNextPage() => Navigator.pushNamed(context, Routes.homeRoute);
  _startDelayFun() =>
      _timer = Timer(const Duration(seconds: 1), () => _goToNextPage());

  @override
  void initState() {
    super.initState();
    _startDelayFun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'T3DaWAl',
        style: Theme.of(context).textTheme.headline6,
      )),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

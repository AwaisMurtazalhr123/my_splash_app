import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  DateTime date = DateTime.now();
  String title = "";
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const MainPage()));
      setState(() {});

      //  print("This is future");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int newTime = int.parse(DateFormat('kk').format(date));
    if (newTime <= 12) {
      title = 'Good Morning Dear';
    } else if (newTime > 12 && newTime <= 16) {
      title = 'Good AfterNoon Dear';
    } else if (newTime > 16 && newTime <= 20) {
      title = 'Good Evening Dear';
    } else {
      title = 'Good Night Dear have a tight sleep';
    }
    // print('This is present');
    // print(newTime);
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 60,
          color: Colors.white,
          fontFamily: "Snowy Season",
        ),
      )),
    );
  }
}

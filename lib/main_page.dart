import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wishes_app/messages_page.dart';
import 'package:wishes_app/wishes_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List wishes = [
  //   'Birthday wishes',
  //   'Aniversary Wishes',
  //   'Eid Wishes',
  //   'Mothers Day Wishes',
  // ];
  go(BuildContext c, String text) {
    Navigator.push(
        c, MaterialPageRoute(builder: (_) => MesagesPage(title: text)));
  }

  @override
  Widget build(BuildContext context) {
    List unique = [];
    for (var item in wishes) {
      unique.add(item.category);
    }
    unique = unique.toSet().toList();
    return Scaffold(
      body: GridView.builder(
        itemCount: unique.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (c, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                go(c, unique[i]);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    unique[i],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

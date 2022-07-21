import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wishes_app/detail.dart';
import 'package:wishes_app/wishes_model.dart';

class MesagesPage extends StatelessWidget {
  // const MesagesPage({Key? key}) : super(key: key);

  String title;
  MesagesPage({required this.title});

  go(BuildContext c, String text) {
    Navigator.push(
        c, MaterialPageRoute(builder: (_) => DetailPage(detail: text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: wishes
              .where((element) => element.category == title)
              .map((e) => InkWell(
                    onTap: () {
                      go(context, e.messages);
                    },
                    child: Card(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              e.messages,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

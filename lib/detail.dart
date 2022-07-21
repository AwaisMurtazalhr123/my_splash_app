import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DetailPage extends StatelessWidget {
  String? detail;
  DetailPage({this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(minHeight: 300),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      detail!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Share.share(detail!);
                },
                icon: const Icon(Icons.share),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  FlutterClipboard.copy(detail!).whenComplete(() =>
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Copied'))));
                },
                icon: const Icon(Icons.copy),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                iconSize: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

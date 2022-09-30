import 'package:flutter/material.dart';
import 'package:json_data_fetching/dataFetcher.dart';
import 'package:json_data_fetching/shopping.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: 300.0,
              child: Center(
                child: Column(
                  children: [
                    Shopping(),
                    DataFetcher(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      routes: {
        '/shopping': (context) => Shopping(),
        '/dataFetcher': (context) => DataFetcher(),
      },
    );
  }
}

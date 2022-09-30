import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var name;
var age;
var user;

class DataFetcher extends StatefulWidget {
  DataFetcher({Key? key}) : super(key: key);

  @override
  State<DataFetcher> createState() => _DataFetcherState();
}

class _DataFetcherState extends State<DataFetcher> {
  @override
  Widget build(BuildContext context) {
    return Column(
// display all the users frm users.json file
      children: [
        ElevatedButton(
            onPressed: () async {
              final userJsonData =
                  await rootBundle.loadString('assets/jsonFiles/users.json');
              final list = json.decode(userJsonData) as List<dynamic>;
              print("List data is $list");
              setState(() {
                name = list[0]['name'];

                age = list[0]['age'];
                user = list;
              });
            },
            child: Text("Get users data")),
        Container(
          child: Column(
            children: [
              if (name != null) Text("Name is $name"),
              if (age != null) Text("Age is $age"),
              if (user != null)
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return Text("Name is ${user[index]['name']}");
                    })
            ],
          ),
        ),
      ],
    );
  }
}

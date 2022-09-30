import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_data_fetching/shopping_model.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ReadUserData(),
        builder: (context, data) {
          if (data.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else if (data.hasData) {
            var items = data.data as List<ShoppingDataModel>;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      items[index].image!,
                      fit: BoxFit.fill,
                      width: 100.0,
                      height: 100.0,
                    ),
                    title: Text(items[index].name!),
                    subtitle: Text(items[index].price.toString()),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

// Reading will take time so we use FutureBuilder
  Future<List<ShoppingDataModel>> ReadUserData() async {
    // this statement will help us to read the json file
    final userJsonData =
        await rootBundle.loadString('assets/jsonFiles/products.json');

    // this statement will help us to convert the json file into list
    final list = json.decode(userJsonData) as List<dynamic>;

    // this will return the list from where this function is called
    return list.map((e) => ShoppingDataModel.fromJson(e)).toList();
  }
}

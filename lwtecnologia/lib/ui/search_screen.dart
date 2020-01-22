import 'package:flutter/material.dart';
import 'package:lwtecnologia/triggers/cars.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: Cars.toList.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.directions_car),
            title: Text(
              Cars.toList[index]['type'],
              style: Theme.of(context).textTheme.headline,
            ),
            subtitle: Text(
              Cars.toList[index]['uid'],
              style: Theme.of(context).textTheme.subhead,
            ),
          );
        },
      ),
    );
  }
}

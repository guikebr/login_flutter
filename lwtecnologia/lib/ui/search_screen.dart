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
        itemBuilder: buildItem,
      ),
    );
  }

  Widget buildItem(context, index) {
    return ListTile(
      leading: Container(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.network(
              'https://picsum.photos/250?image=${index + 1000}',
            ),
          ),
        ),
      ),
      title: Text(
        Cars.toList[index]['type'],
        style: Theme.of(context).textTheme.headline,
      ),
      subtitle: Text(
        Cars.toList[index]['uid'],
        style: Theme.of(context).textTheme.subhead,
      ),
    );
  }
}

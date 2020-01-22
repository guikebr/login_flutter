import 'package:flutter/material.dart';
import 'package:lwtecnologia/triggers/cars.dart';
import 'package:lwtecnologia/ui/item_car.dart';

class AccountScreen extends StatefulWidget {
  static String id = 'account_screen';

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String token = '';

  Map<String, dynamic> _lastRemoved;
  int _lastRemovedPos = 0;

  @override
  void initState() {
    super.initState();
    Cars.updateCar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: ListView.separated(
          itemCount: Cars.cars.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: buildItem,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: new FloatingActionButton.extended(
        icon: Icon(Icons.place),
        elevation: 0.0,
        label: Text(
          "Adicionar carro",
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Roboto Regular', letterSpacing: 1),
        ),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {
          Navigator.pushNamed(context, ItemCar.id);
        },
      ),
    );
  }

  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Theme.of(context).accentColor,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(Cars.cars[index]);

          print(_lastRemoved);
          _lastRemovedPos = index;
          Cars.cars.removeAt(index);
          Cars.saveData(_lastRemoved);
          final snack = SnackBar(
            content: Text("Carro \"${Cars.cars[index]['type']}\" foi removido"),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                setState(() {
                  Cars.toList.insert(_lastRemovedPos, _lastRemoved);
                  Cars.saveData(Cars.toList);
                });
              },
            ),
            duration: Duration(seconds: 3),
          );
          Scaffold.of(context).showSnackBar(snack);
        });
      },
      child: ListTile(
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
          Cars.cars[index]['type'],
          style: Theme.of(context).textTheme.headline,
        ),
        subtitle: Text(
          Cars.cars[index]['uid'],
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference our box
  final _mybox = Hive.box('myBox');

  // write data
  void writeData() {
    _mybox.put(1, ['Rafael', 25, 'Developer']);
  }

  // read data
  void readData() {
    print(_mybox.get(1));
  }

  // delete data
  void deleteData() {
    _mybox.delete(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                writeData();
              },
              color: Colors.blue,
              child: Text('Write'),
            ),
            MaterialButton(
              onPressed: () {
                readData();
              },
              color: Colors.green,
              child: Text('Read'),
            ),
            MaterialButton(
              onPressed: () {
                deleteData();
              },
              color: Colors.red,
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}

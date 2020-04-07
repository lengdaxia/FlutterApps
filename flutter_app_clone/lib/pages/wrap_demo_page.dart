import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class WrapPage extends StatefulWidget {
  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  CircleAvatar smallCircle = CircleAvatar(
    backgroundColor: Colors.transparent,
    radius: 20.0,
  );

  List<Widget> dataList = [
    CircleAvatar(
      child: FlutterLogo(),
      radius: 40.0,
    )
  ];

  void addNew() {
    CircleAvatar big = CircleAvatar(
      child: FlutterLogo(),
      radius: 40.0,
    );
    CircleAvatar small = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20.0,
    );

    setState(() {
      if (dataList.length % 2 == 1) {
        dataList.add(small);
        dataList.add(small);
        dataList.add(big);
      } else {
        dataList.add(big);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addNew,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width - 20,
            color: Colors.yellow[100],
            // padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                // spacing: 8.0,
                // runSpacing: 5.0,
                runAlignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.end,
                direction: Axis.vertical,
                children: dataList,
              ),
            ),
          ),
          Divider(),
          Container(
            height: 160,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            color: Colors.yellow[200],
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: CircleAvatar(
                      radius: 40.0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

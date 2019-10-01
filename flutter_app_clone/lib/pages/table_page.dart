import 'package:flutter/material.dart';


class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Table(
          border: TableBorder.all(color: Colors.grey[400]),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey[200]),
              children: _addPadding([
                Text('姓名'),
                Text('性别'),
                Text('备注'),
              ]),
            ),
            TableRow(
              children: _addPadding([
                Text('张三'),
                Text('男'),
                Text('我和张三不是兄弟' * 2),
              ])
            ),
            TableRow(
              children: _addPadding([
                Text("李四"),
                Text("男"),
                Text("不予置评"),
              ])),
          ],
        ),
        DataTable(
          sortColumnIndex: 0,
          sortAscending: true,
          rows:<DataRow>[
            DataRow(
              cells: [
                DataCell(Text('1')),
                DataCell(Text('23.4')),
              ]
            ),
            DataRow(
              cells: [
                DataCell(Text('2')),
                DataCell(Text('23.4')),
              ]
            ),
          ],
          columns: <DataColumn>[
            DataColumn(
              label: Text('Id'),
              numeric: true,
              onSort: (a, b) => print("$a $b"),
            ),
            DataColumn(label: Text("价格 ¥"), numeric: true)
          ],
        ),
      ],
    );
  }

  _addPadding(List<Widget> w){
    return w.map((e){
      return Padding(
        padding: EdgeInsets.all(6),
        child: e,
      );
    }).toList();
  }
}
import 'package:flutter/material.dart';
import 'package:smooth_table/data.dart';

class SmoothTableScreen extends StatefulWidget {
  const SmoothTableScreen({Key? key}) : super(key: key);

  @override
  State<SmoothTableScreen> createState() => _SmoothTableScreenState();
}

class _SmoothTableScreenState extends State<SmoothTableScreen> {
  final List<String> tableHeaders = [
    'Name',
    'Age',
    'City',
    'Sex',
    'Ethnicity',
    'Weight',
  ];

  Widget tableHeaderCell(String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          debugPrint('Sort by $title');
          setState(() {
            dummyTableData.sort((a, b) => a[title]!.compareTo(b[title]!));
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
              ),
              const Icon(Icons.filter_list),
            ],
          ),
        ),
      ),
    );
  }

  Widget tableDataCell(String title) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smooth Table'),
      ),
      body: Column(
        children: [
          Row(
            children:
                tableHeaders.map((title) => tableHeaderCell(title)).toList(),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                ...dummyTableData.map((data) {
                  return Row(
                    children: tableHeaders.map((value) {
                      return tableDataCell(data[value] ?? 'null');
                    }).toList(),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

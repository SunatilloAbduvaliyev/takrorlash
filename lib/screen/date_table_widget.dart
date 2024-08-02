import 'package:flutter/material.dart';

class DataTableDemo extends StatelessWidget {
  const DataTableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            const Text("Date Table widget"),
            DataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Age')),
                DataColumn(label: Text('Gender')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('John Doe')),
                  DataCell(Text('25')),
                  DataCell(Text('Male')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Jane Smith')),
                  DataCell(Text('30')),
                  DataCell(Text('Female')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('Sam Brown')),
                  DataCell(Text('22')),
                  DataCell(Text('Male')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4')),
                  DataCell(Text('Lucy White')),
                  DataCell(Text('28')),
                  DataCell(Text('Female')),
                ]),
              ],
            ),
            DataTable(
              columns: const [
                DataColumn(
                  label: Text('ID'),
                  numeric: true, // Agar sonli qiymat bo'lsa true qilinadi
                  tooltip: 'This is the ID column', // Ustun ustiga olib borganingizda ko'rsatiladigan matn
                ),
                DataColumn(
                  label: Text('Name'),
                  tooltip: 'This is the Name column',
                ),
                DataColumn(
                  label: Text('Age'),
                  numeric: true,
                  tooltip: 'This is the Age column',
                ),
                DataColumn(
                  label: Text('Gender'),
                  tooltip: 'This is the Gender column',
                ),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('John Doe')),
                  DataCell(Text('25')),
                  DataCell(Text('Male')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('Jane Smith')),
                  DataCell(Text('30')),
                  DataCell(Text('Female')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('Sam Brown')),
                  DataCell(Text('22')),
                  DataCell(Text('Male')),
                ]),
                DataRow(cells: [
                  DataCell(Text('4')),
                  DataCell(Text('Lucy White')),
                  DataCell(Text('28')),
                  DataCell(Text('Female')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
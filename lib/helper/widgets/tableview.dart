import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tab4/models/search_info.dart';

import '../../services/sharedPref.dart';
import '../getSearchInfo.dart';

class DataTableView extends DataTableSource {
  List data = [];

  DataTableView(this.data) {
    print(data);
  }

  @override
  DataRow? getRow(int index) {

    String reg = data[index]['requisition_no'].toString();

    // TODO: implement getRow
    return DataRow(
      cells: [
        DataCell(Text(data[index]['company_name'].toString())),
        DataCell(Text(data[index]['contract_id'].toString())),
        DataCell(Text(data[index]['requisition_no'].toString())),
        DataCell(Text(data[index]['start_date'].toString())),
        DataCell(Text(data[index]['requested_date'].toString())),
        DataCell(Text(data[index]['engineer'].toString())),
        DataCell(Text(data[index]['sign_engineer'].toString())),
        DataCell(Text(data[index]['sign_customer'].toString())),
        // DataCell(Text(data[index]['option']['edit'].toString())),
        // DataCell(Text(data[index]['option']['delete'].toString())),
        // DataCell(Text(data[index]['option']['view'].toString())),
        // DataCell(Text(data[index]['option']['email_sent'].toString())),
        // DataCell(Text(data[index]['option']['email'].toString())),
        // DataCell(Text(data[index]['option']['signature'].toString())),
        // DataCell(Text(data[index]['option']['print'].toString())),

        // DataCell(Container(
        //   height: 70,
        //   width: 30,
        //   color: Colors.red,
        // )),
        DataCell(
          Row(
            children: [
              Visibility(
                visible: data[index]['option']['edit'],
                // edit
                child: IconButton(
                  icon: const Icon(Icons.file_open_outlined),
                  onPressed: () {
                    
                    print('edit on id - $index ----> reg no : $reg');
                  },
                  iconSize: 20,
                ),
              ),

              // delete
              Visibility(
                visible: data[index]['option']['delete'],
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    print('delete on id - $index $reg');
                  },
                  iconSize: 20,
                  color: Colors.red,
                ),
              ),

              // email
              Visibility(
                visible: data[index]['option']['email'],
                child: IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () {
                    print('email on id - $index $reg');
                  },
                  iconSize: 20,
                  color: Colors.blue[700],
                ),
              ),

              // search
              Visibility(
                visible: data[index]['option']['view'],
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    print('search on id - $index $reg');
                  },
                  iconSize: 20,
                  color: Colors.grey,
                ),
              ),

              // $
              Visibility(
                visible: data[index]['option']['signature'],
                child: IconButton(
                  icon: const Icon(Icons.car_crash_rounded),
                  onPressed: () {
                    print('money on id - $index $reg');
                  },
                  iconSize: 20,
                  color: Colors.green,
                ),
              ),

              // print
              Visibility(
                visible: data[index]['option']['print'],
                child: IconButton(
                  icon: const Icon(Icons.print),
                  onPressed: () {
                    print('print on id - $index $reg');
                  },
                  iconSize: 20,
                  color: Colors.blue[900],
                ),
              ),
            ],
          ),
        ),
      ],

    );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => data.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/dropdowntypesItems.dart';

class MyChip extends StatefulWidget {
  const MyChip({Key? key}) : super(key: key);

  @override
  State<MyChip> createState() => _MyChipState();
}

class _MyChipState extends State<MyChip> {
  List<DropDownTypesItems> ListOfdropdownitemsA = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.blue,
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          // child: Container(
          child: Column(
            children: [
              Container(
                height: 10,
                color: Colors.white,
              ),
              Container(
                  // child: buildDropDown(
                  //   // ite
                  // ),
                  ),
              Container(
                height: 10,
                color: Colors.amber,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 10,
                color: Colors.amber,
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    color: Colors.green,
                    height: 60,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          color: Colors.red,
                          child: Column(
                            children: const [
                              // SizedBox(
                              //   width: double.infinity,
                              //   height: 600,
                              // ),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                              Text('jkcjkcnjckndjknkclc'),
                              Text('nejcbejcejcn ec lecc'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // drop down
  Widget buildDropDown(
      String title,
      var replacedropdownvalue,
      List replaceListOfdropdownitems,
      var replaceObj,
      var replaceModelclzname,
      var listing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 5),
        Container(
          height: 50,
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.white),
                left: BorderSide(width: 1.0, color: Colors.white),
                right: BorderSide(width: 1.0, color: Colors.white),
                bottom: BorderSide(width: 1.0, color: Colors.white),
              ),
              borderRadius: BorderRadius.all(Radius.circular(0))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<dynamic>(
              // Initial Value
              value: replacedropdownvalue,
              iconSize: 36,
              hint: const Text('Choose one'),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              isExpanded: true,
              // Array list of items
              // items: replaceListOfdropdownitems.map(
              //   (replaceObj) {
              //     var dropdownMenuItem = DropdownMenuItem<replaceModelclzname>(
              //       value: replaceObj,
              //       child: Text(
              //         replaceObj.serial_no,
              //         style: const TextStyle(color: Colors.red),
              //       ),
              //     );
              //     return dropdownMenuItem;
              //   },
              // ).toList(),

              items: listing,

              onChanged: (val) async {
                // bdropdownvalue = val;
                // int bindexOfSelectedItem =
                //     blistOfDrofDownValues.indexOf(bdropdownvalue);
                // bIdOfSelectedDropDownItem =
                //     blistOfDrofDownValues[bindexOfSelectedItem].serial_no;
                // clickableSerialNumber = bIdOfSelectedDropDownItem;

                // delete select drop value
                //blistOfDrofDownValues.removeAt(bindexOfSelectedItem);
                //reload(bindexOfSelectedItem);

                // print(
                //     'User Selected serial number ----> serial_no = $bIdOfSelectedDropDownItem');
                // setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }

  List makeItem(List ListOfdropdownitemsA) {
    ListOfdropdownitemsA.map(
      (replaceObj) {
        var dropdownMenuItem = DropdownMenuItem<DropDownTypesItems>(
          value: replaceObj,
          child: Text(
            replaceObj.item_dec,
            style: const TextStyle(color: Colors.red),
          ),
        );
        return dropdownMenuItem;
      },
    ).toList();


    return ListOfdropdownitemsA;
  }
}

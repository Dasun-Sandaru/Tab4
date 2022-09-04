import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:tab4/models/dropdowntypesSerialNumbers.dart';
import 'package:tab4/models/serialInfo.dart';
import '../helper/getDropValues.dart';
import '../models/DropDownTypes.dart';
import '../models/dropdowntypesItems.dart';
import '../services/config.dart';
import '../services/sharedPref.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  bool isLoading = true;
  double totalCost = 0.0;
  int a = 100000;
  String? searchSerialNumber;

  TextEditingController _controllerSearchSerialNo = TextEditingController();
  // int index = 0;
  //List<Map> listOfSelectedSerialNumbersInfo = [{'serial_no': 'NWI5'},{'serial_no': 'CRD100_20180907_03'},{'serial_no': 'drpshp000000383'},{'serial_no': 'drpshp000000392'}];
  List<Map> listOfSelectedSerialNumbersInfo = [];
  StreamController _controller = StreamController();

  addStreamData() async {
    for (var i = 0; i < listOfSelectedSerialNumbersInfo.length; i++) {
      await Future.delayed(const Duration(seconds: 2));
      _controller.sink.add(listOfSelectedSerialNumbersInfo);
      print(i);
      //print(listOfSelectedSerialNumbersInfo[i]);
    }
    //_controller.sink.add(listOfSelectedSerialNumbersInfo);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  //2st
  Stream<int> addStreamData2() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 2));
      yield i;
    }
  }

  // Widget buildTestingStream3() {
  //   return StreamBuilder(
  //     stream: _controller.stream,
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       if (snapshot.hasError) {
  //         return const Text('Error');
  //       } else if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const CircularProgressIndicator.adaptive();
  //       }

  //       return ListView.builder(
  //         itemCount: snapshot.data.length,
  //         //itemCount: snapshot.data.length,
  //         itemBuilder: (BuildContext content, int index) {
  //           return
  //           Card(
  //             elevation: 4,
  //             child: ListTile(
  //               dense: true,
  //               //leading: Text(snapshot.data[index]['serial_no']),
  //               //leading: Text('snapshot ===== $index'),
  //               // leading: Row(
  //               //   children: [
  //               //     Expanded(child: Text(snapshot.data[index]['item'])),
  //               //     Expanded(child: Text(snapshot.data[index]['item_des'])),
  //               //     Expanded(child: Text(snapshot.data[index]['sp'])),
  //               //     Expanded(child: Text(snapshot.data[index]['quantity'])),
  //               //     Expanded(child: Text(snapshot.data[index]['item_des'])),
  //               //     //IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
  //               //   ],
  //               // ),
  //               // leading: Row(
  //               //   children: [
  //               //     Text('data 1'),
  //               //     // Expanded(child: Text('data 2')),
  //               //     // Expanded(child: Text('data 3')),
  //               //     // Expanded(child: Text('data 4')),
  //               //     // Expanded(child: Text('data 4')),
  //               //     // IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
  //               //   ],
  //               // ),
  //               // subtitle: Text(snapshot.data[index]['item_des']),
  //               // trailing: IconButton(
  //               //   onPressed: () {
  //               //     print('delete ---> $index');
  //               //     print(snapshot.data[index]['serial_no']);
  //               //   },
  //               //   icon: const Icon(Icons.delete),
  //               // ),

  //               // subtitle: Row(
  //               //   children: [
  //               //     Text('data 1'),
  //               //     Expanded(child: Text('data 2')),
  //               //     Expanded(child: Text('data 3')),
  //               //     Expanded(child: Text('data 4')),
  //               //     Expanded(child: Text('data 4')),
  //               //     // IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
  //               //   ],
  //               // ),

  //               subtitle: Row(
  //                 children: [
  //                   Expanded(child: Center(child: Text(snapshot.data[index]['item']))),
  //                   Expanded(child: Center(child: Text(snapshot.data[index]['item_des']))),
  //                   Expanded(child: Center(child: Text(snapshot.data[index]['sp']))),
  //                   Expanded(child: Center(child: Text(snapshot.data[index]['serial_no']))),
  //                   Expanded(child: Center(child: Text(snapshot.data[index]['quantity']))),
  //                   //IconButton(onPressed: () {}, icon: Icon(Icons.delete)),

  //                 ],
  //               ),

  //               trailing: IconButton(
  //                 onPressed: () {
  //                   print('delete ---> $index');
  //                   print(snapshot.data[index]['serial_no']);
  //                 },
  //                 icon: const Icon(Icons.delete),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  Widget buildTestingStream3() {
    return StreamBuilder(
      stream: _controller.stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator.adaptive();
        }

        return ListView.separated(
          itemCount: snapshot.data.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          //itemCount: snapshot.data.length,
          itemBuilder: (BuildContext content, int index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [
                  Expanded(
                      child: Center(
                          child:
                              Text(snapshot.data[index]['item'].toString()))),
                  Expanded(
                      child: Center(
                          child: Text(
                              snapshot.data[index]['item_des'].toString()))),
                  Expanded(
                      child: Center(
                          child: Text(snapshot.data[index]['sp'].toString()))),
                  Expanded(
                      child: Center(
                          child: Text(
                              snapshot.data[index]['serial_no'].toString()))),
                  Expanded(
                      child: Center(
                          child: Text(
                              snapshot.data[index]['quantity'].toString()))),
                  Expanded(
                      child: IconButton(
                          onPressed: () {
                            print('deleting ---> $index');

                            // int reIndex = 100;
                            setState(() {
                              try {
                                double sp =
                                    double.parse(snapshot.data[index]['sp']);
                                totalCost = totalCost - sp;
                                print(totalCost);

                                String reSerialNo =
                                    snapshot.data[index]['serial_no'];
                                //print("buebcebuebfebfcebfijefciefniebf------> " + reSerialNo);
                                //try to get lenghth

                                print(blistOfDrofDownValues.length + 1);
                                blistOfDrofDownValues.add(
                                    DropDownTypesSerialNumbers(
                                        index: a, serial_no: reSerialNo));
                                listOfSelectedSerialNumbersInfo.removeAt(index);

                                a++;

                                //blistOfDrofDownValues.add(DropDownTypesSerialNumbers(index: 1000,serial_no: 'dasun'));

                              } catch (e) {
                                print(e.toString());
                              }
                            });
                          },
                          icon: const Icon(Icons.delete))),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildColumnsNameRow() {
    return Row(
      children: const [
        Expanded(child: Center(child: Text('Item'))),
        Expanded(child: Center(child: Text('Description'))),
        Expanded(child: Center(child: Text('Cost'))),
        Expanded(child: Center(child: Text('Purpose'))),
        Expanded(child: Center(child: Text('Serial No'))),
        Expanded(child: Center(child: Text('Quantity'))),
        Expanded(child: Center(child: Text('Option'))),
        //Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.delete))),
      ],
    );
  }

  Widget oneRow() {
    return Row(
      children: [
        Expanded(child: Text('data 1')),
        Expanded(child: Text('data 2')),
        Expanded(child: Text('data 3')),
        Expanded(child: Text('data 4')),
        Expanded(child: Text('data 4')),
        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
      ],
    );
  }

  Widget buildRows() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text('data 1')),
            Expanded(child: Text('data 2')),
            Expanded(child: Text('data 3')),
            Expanded(child: Text('data 4')),
            Expanded(child: Text('data 4')),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text('data 1')),
            Expanded(child: Text('data 2')),
            Expanded(child: Text('data 3')),
            Expanded(child: Text('data 4')),
            Expanded(child: Text('data 4')),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text('data 1')),
            Expanded(child: Text('data 2')),
            Expanded(child: Text('data 3')),
            Expanded(child: Text('data 4')),
            Expanded(child: Text('data 4')),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
      ],
    );
  }

  // late String responseMsg; // for get response of requisition api
  String reqNo = 'SVCYYNNNN_xxxx';

  // for drop down
  List<DropDownTypes> listOfDrofDownValues = [];
  List<DropDownTypesItems> alistOfDrofDownValues = [];
  List<DropDownTypesSerialNumbers> blistOfDrofDownValues = [];

  // assing selected drop down value
  var adropdownvalue, bdropdownvalue;

  late String IdOfSelectedDropDownItem,
      token,
      aIdOfSelectedDropDownItem,
      bIdOfSelectedDropDownItem;

  String clickableSerialNumber = '---';

  SharedPref sharedPref = SharedPref();

  var tokenVariable;

  //getDropvalue getDropvalueobj = getDropvalue();

  // get token
  getToken() async {
    // SharedPref sharedPref = SharedPref();
    token = (await sharedPref.readToken())!;
    tokenVariable = token;

    //await getDropvalueobj.getDropDownValues(token, 'get-items/');

    // getting dropdown values
    // alistOfDrofDownValues =
    //     (await getDropvalueobj.getDropDownValuesForItems(token, 'get-items/'))!;
    //print(alistOfDrofDownValues);
    //S3AlistOfDrofDownValues = (await S3AgetDropvalueObj.getDropDownValues(token, 'get-paid-days'))!;
    setState(() {});
  }

  // get travel time text

  int currentStep = 0; // for stepper

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     // run stream
      //     // addStreamData();
      //   },
      // ),
      body: Container(
        color: Colors.white54,
        child: Column(
          children: <Widget>[
            // const SizedBox(
            //   height: 10,
            // ),

            //<------------------ title box -------------------------
            // ConstrainedBox(
            //   constraints: BoxConstraints(
            //     //minWidth: double.infinity,
            //     minHeight: 100,
            //     maxWidth: double.infinity,
            //   ),
            //   child: Container(
            //       //width: 600,
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(colors: [
            //           Color.fromRGBO(0, 197, 255, .6),
            //           Color.fromRGBO(0, 114, 255, 1),
            //         ]),
            //       ),
            //       padding: EdgeInsets.all(20).copyWith(left: 5),
            //       alignment: Alignment.topLeft,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Row(
            //             children: <Widget>[
            //               Container(
            //                 height: 80,
            //                 width: 90,
            //                 decoration: BoxDecoration(
            //                   image: DecorationImage(
            //                       image: AssetImage(
            //                           'assets/images/logo_system_foce.png'),
            //                       fit: BoxFit.fill),
            //                 ),
            //               ),
            //               Container(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: <Widget>[
            //                     Container(
            //                       alignment: Alignment.topLeft,
            //                       child: Text('System Force I.T.',
            //                           style: GoogleFonts.gelasio(
            //                             textStyle: TextStyle(
            //                               fontSize: 48,
            //                               fontWeight: FontWeight.bold,
            //                             ),
            //                           )),
            //                     ),
            //                     //SizedBox(height: 10,),

            //                     Container(
            //                       alignment: Alignment.bottomLeft,
            //                       child: Text('SERVICE RECORD FORM',
            //                           style: GoogleFonts.ubuntu(
            //                             textStyle: TextStyle(
            //                               fontSize: 28,
            //                               fontWeight: FontWeight.normal,
            //                               color: Colors.black54,
            //                             ),
            //                           )),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //           SizedBox(
            //             width: 15,
            //           ),
            //           Container(
            //             width: 110,
            //             height: 50,
            //             alignment: AlignmentDirectional.centerEnd,
            //             // padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            //             // height: 40,
            //             child: Container(
            //               child: Material(
            //                 borderRadius: BorderRadius.circular(20),
            //                 color: Colors.grey,
            //                 shadowColor: Colors.black,
            //                 elevation: 7,
            //                 child: GestureDetector(
            //                   onTap: () {
            //                     // showPreviewDialog(context);
            //                   },
            //                   child: Row(
            //                     children: [
            //                       Container(
            //                         padding: EdgeInsets.all(5),
            //                         child: Icon(
            //                           Icons.remove_red_eye_outlined,
            //                           color: Colors.black38,
            //                         ),
            //                       ),
            //                       Center(
            //                         child: Padding(
            //                           padding: EdgeInsets.only(right: 5),
            //                           child: Text(
            //                             ' PREVIEW ',
            //                             style: TextStyle(
            //                               color: Colors.black38,
            //                               fontWeight: FontWeight.bold,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       )),
            // ),
            //<------------------ close of title -------------------------

            SizedBox(
              height: 10,
            ),

            //<------------------- stepper widget -------------------------
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Stepper(
                  type: StepperType.horizontal,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;

                    if (isLastStep) {
                      print('Complete');
                    } else {
                      setState(() => currentStep += 1);
                    }
                  },
                  onStepCancel: currentStep == 0
                      ? null
                      : () => setState(() => currentStep -= 1),
                  onStepTapped: (step) => setState(() => currentStep = step),
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    final isLastStep = currentStep == getSteps().length - 1;

                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              if (currentStep != 0)
                                Container(
                                  width: 200,
                                  child: ElevatedButton(
                                    child: Text('PREVIOUS',
                                        style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        )),
                                    onPressed: details.onStepCancel,
                                  ),
                                ),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                width: 200,
                                child: ElevatedButton(
                                  child: Text(isLastStep ? 'CONFIRM' : 'NEXT',
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                      )),
                                  onPressed: details.onStepContinue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            //<------------------- close of stepper widget ----------------

            // Container(
            //   color: Colors.blue,
            //   height: 100,
            //   child: Expanded(
            //     child: Container(
            //       width: double.infinity,
            //       color: Colors.green,
            //       child: Column(
            //         children: [
            //           buildColumnsNameRow(),
            //           const SizedBox(height: 3,),
            //           buildTestingStream3(),
            //         ],
            //       )
            //     ),
            //   ),
            // ),

            // Container(
            //   color: Colors.blue,
            //   height: 100,
            //   child: Expanded(
            //     child: Container(
            //       width: double.infinity,
            //       color: Colors.green,
            //       child: buildTestingStream3(),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      // ),
    );
  }

  // widgets

  Widget buildChipBox() {
    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      children: blistOfDrofDownValues
          .map((chip) => Chip(
                label: Text(chip.index.toString() + '--' + chip.serial_no),
                deleteIcon: const Icon(Icons.add),
                onDeleted: () {
                  //int bindexOfSelectedchipIndex = blistOfDrofDownValues.indexOf('a');
                  deleteChips(chip.index, chip.serial_no);
                  print(chip.serial_no);
                },
              ))
          .toList(),
    );
  }

  // your requistion number title
  Widget buildRequistionNumberTitle() {
    return Text(
      'Your Requisition Number',
      style: GoogleFonts.ubuntu(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  // reqNo
  Widget buildReqNo() {
    return Container(
      // height: 100,
      // width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: Text("reqNo",
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(
                color: Colors.black26, fontWeight: FontWeight.bold),
          )),
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
    );
  }

  //Search for Serial Number
  Widget buildSearchSerialNumber() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // height: 100,
            // width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: Container(
              width: 280,
              height: 50,
              // padding: EdgeInsets.fromLTRB(40, 15, 30, 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 0)),
              child: TextField(
                controller: _controllerSearchSerialNo,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search for Serial Number",
                  hintStyle: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                      color: Colors.grey[400],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.center,
                onEditingComplete: () {
                  searchSerialNumber = _controllerSearchSerialNo.text;
                },
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 30),
              onPressed: () {
                //search serial info
                if (searchSerialNumber == null) {
                  Fluttertoast.showToast(
                    msg: 'Please Enter Serial Number',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                  );

                  print(searchSerialNumber);
                } else {
                  print(searchSerialNumber);
                  searchSerialInfo(searchSerialNumber!);
                }
              },
              icon: const Icon(Icons.search_rounded,
                  color: Colors.black, size: 50),),
        ],
      ),
    );
  }

  // items drop down ---- a
  Widget buildItemDropDown() {
    return Container(
      height: 30,
      // child: DropdownButtonHideUnderline(
      //   child: DropdownButton<String>(
      //     //value: valueOfIdType,
      //     iconSize: 36,
      //     hint: const Text('   - - Select - -'),
      //     icon: const Icon(
      //       Icons.arrow_drop_down,
      //       color: Colors.black,
      //     ),
      //     isExpanded: true,
      //     items: itemsIdTypes.map(buildMenuItem).toList(),
      //     onChanged: (value) {
      //       setState(() {});
      //     },
      //   ),
      // ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          // Initial Value
          value: adropdownvalue,
          iconSize: 36,
          hint: const Text('   - - Select - -'),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          isExpanded: true,
          // Array list of items
          items: alistOfDrofDownValues.map(
            (DropDownModelClzObj) {
              var dropdownMenuItem = DropdownMenuItem<DropDownTypesItems>(
                value: DropDownModelClzObj,
                child: Text(
                  DropDownModelClzObj.item_dec,
                  style: const TextStyle(color: Colors.red),
                ),
              );
              return dropdownMenuItem;
            },
          ).toList(),

          onChanged: (val) async {
            try {
              setState(() {
                blistOfDrofDownValues.clear();
              });
              adropdownvalue = val;
              int aindexOfSelectedItem =
                  alistOfDrofDownValues.indexOf(adropdownvalue);
              aIdOfSelectedDropDownItem =
                  alistOfDrofDownValues[aindexOfSelectedItem].item_code;
              print(
                  'User Selected Item - dec ----> item_code = $aIdOfSelectedDropDownItem');
              // blistOfDrofDownValues =
              //     (await getDropvalueobj.getDropDownValuesForSerialNumbers(token,
              //         'get-serial?item_code=CARD100/1000&customer_id=100081'))!;

              // blistOfDrofDownValues =
              //     (await getDropvalueobj.getDropDownValuesForSerialNumbers(
              //         token,
              //         'get-serial?item_code=$aIdOfSelectedDropDownItem&customer_id=100081'))!;

              // print(blistOfDrofDownValues);

              //print(blistOfDrofDownValues[0].serial_no);

              setState(() {});
            } catch (e) {
              print(e.toString());
            }
          },
        ),
      ),
    );
  }

  // serial drop down -----
  Widget buildSerialDropDown() {
    return Container(
      height: 30,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          // Initial Value
          value: bdropdownvalue,
          iconSize: 36,
          hint: const Text('   - - Select - -'),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          isExpanded: true,
          // Array list of items
          items: blistOfDrofDownValues.map(
            (DropDownModelClzObj) {
              var dropdownMenuItem =
                  DropdownMenuItem<DropDownTypesSerialNumbers>(
                value: DropDownModelClzObj,
                child: Text(
                  DropDownModelClzObj.serial_no,
                  style: const TextStyle(color: Colors.red),
                ),
              );
              return dropdownMenuItem;
            },
          ).toList(),

          onChanged: (val) async {
            bdropdownvalue = val;
            int bindexOfSelectedItem =
                blistOfDrofDownValues.indexOf(bdropdownvalue);
            bIdOfSelectedDropDownItem =
                blistOfDrofDownValues[bindexOfSelectedItem].serial_no;
            clickableSerialNumber = bIdOfSelectedDropDownItem;

            // delete select drop value
            //blistOfDrofDownValues.removeAt(bindexOfSelectedItem);
            //reload(bindexOfSelectedItem);

            print(
                'User Selected serial number ----> serial_no = $bIdOfSelectedDropDownItem');
            setState(() {});
          },
        ),
      ),
    );
  }

  // clickable serial number
  Widget buildCilckableSerialNumber() {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Selected Serial Number',
            style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              // serial number adding
              print('click serial number ---> $clickableSerialNumber');
              // delete this serial number from serial number drop down ***********************************************************************************
              // get serial info for table rows

              // getSerialInfo(clickableSerialNumber);
            },
            child: Container(
              // height: 100,
              // width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              child: Text(
                clickableSerialNumber,
                textAlign: TextAlign.center,
                style: GoogleFonts.ubuntu(
                  textStyle: const TextStyle(
                      color: Colors.black26, fontWeight: FontWeight.bold),
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            ),
          ),
        ],
      ),
    );
  }

  // data table
  Widget buildDataTable() {
    return Container(
      margin: const EdgeInsets.all(10).copyWith(bottom: 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: ExpansionTile(
        maintainState: true,
        childrenPadding: const EdgeInsets.all(15).copyWith(top: 0),
        title: Text(
          'Item Table',
          style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ),
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  // border: TableBorder.all(),
                  columns: const [
                    DataColumn(label: Text('Item')),
                    DataColumn(label: Text('Description')),
                    DataColumn(label: Text('Cost')),
                    DataColumn(label: Text('Purpose')),
                    DataColumn(label: Text('Serial No.')),
                    DataColumn(label: Text('Quantity')),
                    DataColumn(label: Text('Option')),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('item1')),
                        DataCell(Text('dis1')),
                        DataCell(Text('10')),
                        DataCell(Text('purpos1')),
                        DataCell(Text('123')),
                        DataCell(Text('1')),
                        DataCell(Text('option1')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('item2')),
                        DataCell(Text('dis2')),
                        DataCell(Text('20')),
                        DataCell(Text('purpos2')),
                        DataCell(Text('124')),
                        DataCell(Text('2')),
                        DataCell(Text('option2')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('item3')),
                        DataCell(Text('dis3')),
                        DataCell(Text('30')),
                        const DataCell(Text('purpos3')),
                        DataCell(Text('125')),
                        DataCell(Text('3')),
                        DataCell(Text('option3')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('item4')),
                        DataCell(Text('dis4')),
                        DataCell(Text('40')),
                        DataCell(Text('purpos4')),
                        DataCell(Text('126')),
                        DataCell(Text('4')),
                        DataCell(Text('option4')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('item5')),
                        DataCell(Text('dis5')),
                        DataCell(Text('50')),
                        DataCell(Text('purpos5')),
                        DataCell(Text('127')),
                        DataCell(Text('5')),
                        DataCell(Text('option5')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
        onExpansionChanged: (isExpanded) => {},
      ),
    );
  }

  List<Step> getSteps() => [
        //<------------------- step 04 -------------------------
        Step(
          isActive: currentStep >= 3,
          title: const Text('Step 4'),
          content: Container(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // requistion number
                    //buildRequistionNumberTitle(),

                    // const SizedBox(
                    //   height: 10,
                    // ),

                    // reqNo
                    //buildReqNo(),

                    // const SizedBox(
                    //   height: 20,
                    // ),

                    // serial number search box
                    buildSearchSerialNumber(),

                    // const SizedBox(
                    //   height: 20,
                    // ),

                    Center(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 150,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              // height: 100,
                              // width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                    color: Theme.of(context).primaryColor),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'Items',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.ubuntu(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        fontSize: 10,
                                      ),
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 5, 55, 0),
                                  ),
                                  //****************************************************************************************************************

                                  // item drop down
                                  buildItemDropDown(),
                                ],
                              ),
                              // padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // Expanded(
                          //   flex: 1,
                          //   child: Container(
                          //     // height: 70,
                          //     // width: 200,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: Colors.white,
                          //       border: Border.all(
                          //           color: Theme.of(context).primaryColor),
                          //     ),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: <Widget>[
                          //         Container(
                          //           child: Text(
                          //             'Serial Number',
                          //             textAlign: TextAlign.left,
                          //             style: GoogleFonts.ubuntu(
                          //               textStyle: TextStyle(
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //               fontSize: 10,
                          //             ),
                          //           ),
                          //           padding: EdgeInsets.fromLTRB(10, 5, 55, 0),
                          //         ),
                          //         //****************************************************************************************************************
                          //         // serial number drop down
                          //         buildSerialDropDown(),
                          //       ],
                          //     ),
                          //     // padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                          //   ),
                          // ),
                          const SizedBox(
                            width: 150,
                          ),
                        ],
                      ),
                    ),

                    // const SizedBox(
                    //   height: 20,
                    // ),

                    // show chipers
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                width: double.infinity,
                                color: Colors.amber,
                                child: buildChipBox(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // clickable selected serial number
                    //buildCilckableSerialNumber(),

                    const SizedBox(
                      height: 20,
                    ),

                    //stream widget
                    //buildTestingStream(),
                    //buildTestingStream2(),

                    // data table
                    //buildDataTable(),

                    //show one row
                    //oneRow(),
                    // show rows
                    //buildRows(),

                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Total Cost :',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '$totalCost',
                            style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        //<------------------- close of step 04 -------------------------
      ];

  @override
  void initState() {
    super.initState();
    getToken();
  }

  // methods

  // serarch serial info
  searchSerialInfo(String searchSerialNumber) async {
    
      // show serial no in chiper box
      try {
        setState(() {
          blistOfDrofDownValues.clear();
        });
        // blistOfDrofDownValues =
        //     (await getDropvalueobj.getDropDownValuesForSerialNumbers(token,
        //         'get-serial?serialsearch=$searchSerialNumber'))!;   // retgert
        setState(() {});
      } catch (e) {
        print(e.toString());
      }

      // geting serial info using this search Serial Number
  }

  // delete selected serial numbers from interface
  Future<void> deleteChips(int index, String serial_no) async {
    try {
      print('remove index --> $index');
      final index1 =
          blistOfDrofDownValues.indexWhere((element) => element.index == index);
      if (index1 != -1) {
        blistOfDrofDownValues.removeAt(index1);

        clickableSerialNumber = serial_no;
        await getSerialInfo(clickableSerialNumber);
        addStreamData();
      }

      //blistOfDrofDownValues.add(DropDownTypesSerialNumbers(serial_no: 'dasun'));
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  reload(int bindexOfSelectedItem) {
    //blistOfDrofDownValues = [];
    List<dynamic> newlist =
        blistOfDrofDownValues.removeAt(bindexOfSelectedItem) as List;
    //blistOfDrofDownValues =

    print(newlist);
  }

  // get serial info for table rows
  getSerialInfo(String clickableSerialNumber) async {
    await getSelectedSerialNumberInfo(
        token, 'get-serial-info/$clickableSerialNumber');
    //await getSelectedSerialNumberInfo(token, 'get-serial-info/drpshp000000497');
  }

  // --------------------------------------------------------------------------
  // *************************** get seleted serial number info *************************

  Future<void> getSelectedSerialNumberInfo(
      // Map<String,dynamic> returnMap;

      String token,
      String endPoint) async {
    final responseType =
        await http.get(Uri.parse("${Config.BACKEND_URL}$endPoint"), headers: {
      'Authorization': 'Bearer $token',
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
    });

    if (responseType.statusCode == 200) {
      //print('200 ok -----------------------------------------------------');
      Map decodedMap = jsonDecode(responseType.body);
      bool isSuccess = decodedMap['success'];
      String msg = decodedMap['message'];
      Map<String, dynamic> responseMapPart = decodedMap['data'];

      print(responseMapPart);

      if (isSuccess) {
        if (responseMapPart.isNotEmpty) {
          //print('$isSuccess -----------------------------------------------------');
          // var item = responseMapPart['serial_no'];
          // var quantity = responseMapPart['quantity'];
          // var purpose = responseMapPart['purpose'];
          // var uprice = responseMapPart['uprice'];
          // var serial_no = responseMapPart['serial_no'];
          double sp = double.parse(responseMapPart['sp']);
          totalCost = totalCost + sp;
          // var item_des = responseMapPart['item_des'];
          // var std_cost_per_unit = responseMapPart['std_cost_per_unit'];
          // var uom = responseMapPart['uom'];
          // SerialInfo serialInfoObj = SerialInfo(
          //     item: item,
          //     quantity: quantity,
          //     purpose: purpose,
          //     uprice: uprice,
          //     serial_no: serial_no,
          //     sp: sp,
          //     item_des: item_des,
          //     std_cost_per_unit: std_cost_per_unit,
          //     uom: uom);

          //SerialInfo serialInfoObj = SerialInfo.fromJson(responseMapPart);
          listOfSelectedSerialNumbersInfo.add(responseMapPart);
          //addStreamData(responseMapPart);
          //addStreamData();

          //print(serialInfoObj.toJson());
        } else {
          Fluttertoast.showToast(
            msg: 'Sorry ! currnently not available Serial Number Info',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: 'Request failed with status: $msg',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      print('Request failed with status: ${responseType..statusCode}');

      Fluttertoast.showToast(
        msg: 'Request failed with status: ${responseType.statusCode}',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}

// 01 - fill items drop down
// 02 - fill serial drop down using selected item
// 03 - fill selected serial number txt box using selected serial value
// 04 - delete this serial number from serial drop down
// 05 - fill data table using txt box value

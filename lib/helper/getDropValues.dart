// import 'dart:convert';
// import 'dart:math';
// import 'package:tab4/models/dropdowntypesItems.dart';
// import 'package:tab4/models/dropdowntypesSerialNumbers.dart';
// import 'package:tab4/models/serialInfo.dart';

// import '../../services/config.dart';
// import 'package:http/http.dart' as http;
// import '../models/DropDownTypes.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class getDropvalue {
//   List<DropDownTypesItems> alistOfDrofDownValues = [];
//   List<DropDownTypesSerialNumbers> blistOfDrofDownValues = [];
//   List<SerialInfo> listOfDrofSelectedSerialNumberInfo = [];

//   Future<List<DropDownTypesItems>?> getDropDownValuesForItems(
//       String token, String endPoint) async {
//     final responseType =
//         await http.get(Uri.parse("${Config.BACKEND_URL}$endPoint"), headers: {
//       'Authorization': 'Bearer $token',
//       // 'Content-Type': 'application/json',
//       // 'Accept': 'application/json',
//     });

//     if (responseType.statusCode == 200) {
//       //print('200 ok -----------------------------------------------------');
//       Map decodedMap = jsonDecode(responseType.body);
//       bool isSuccess = decodedMap['success'];
//       String msg = decodedMap['message'];
//       List<dynamic> responseListPart = decodedMap['data'];

//       //print(responseListPart);

//       if (isSuccess) {
//         if (responseListPart.isNotEmpty) {
//           //print('$isSuccess -----------------------------------------------------');
//           for (var element in responseListPart) {
//             var item_code = element['item_code'];
//             var item_des = element['item_des'];
//             var item_id = element['item_id'];
//             var std_cost_per_unit = element['std_cost_per_unit'];
//             var min_qty = element['min_qty'];

//             DropDownTypesItems dropDownTypesItemsobj = DropDownTypesItems(
//                 item_code: item_code,
//                 item_dec: item_des,
//                 item_id: item_id,
//                 std_cost_per_unit: std_cost_per_unit,
//                 min_qty: min_qty);
//             alistOfDrofDownValues.add(dropDownTypesItemsobj);

//             //print('$item_code-----------------------------------------------');
//           }

//           //print(alistOfDrofDownValues[0].item_code);

//           return alistOfDrofDownValues;
//         } else {
//           Fluttertoast.showToast(
//             msg: 'Sorry ! currnently not available Items',
//             toastLength: Toast.LENGTH_LONG,
//             gravity: ToastGravity.BOTTOM,
//           );
//         }
//       } else {
//         Fluttertoast.showToast(
//           msg: 'Request failed with status: $msg',
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.BOTTOM,
//         );
//       }
//     } else {
//       print('Request failed with status: ${responseType..statusCode}');

//       Fluttertoast.showToast(
//         msg: 'Request failed with status: ${responseType.statusCode}',
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//       );
//       return null;
//     }
//     return null;
//   }

//   // --------------------------------------------------------------------------
//   // *************************** get serial numbers for drop down *************************

//   Future<List<DropDownTypesSerialNumbers>?> getDropDownValuesForSerialNumbers(
//       String token, String endPoint) async {
//     final responseType =
//         await http.get(Uri.parse("${Config.BACKEND_URL}$endPoint"), headers: {
//       'Authorization': 'Bearer $token',
//       // 'Content-Type': 'application/json',
//       // 'Accept': 'application/json',
//     });

//     if (responseType.statusCode == 200) {
//       //print('200 ok -----------------------------------------------------');
//       Map decodedMap = jsonDecode(responseType.body);
//       bool isSuccess = decodedMap['success'];
//       String msg = decodedMap['message'];
//       List<dynamic> responseListPart = decodedMap['data'];

//       print(responseListPart);

//       if (isSuccess) {
//         if (responseListPart.isNotEmpty) {
//           //print('$isSuccess -----------------------------------------------------');
//           int index = 0;
//           for (var element in responseListPart) {
//             //int index = element;
//             var serial_no = element['serial_no'];
//             DropDownTypesSerialNumbers dropDownTypesSerialNumbersobj =
//                 DropDownTypesSerialNumbers(index: index, serial_no: serial_no);

//             blistOfDrofDownValues.add(dropDownTypesSerialNumbersobj);

//             //print('$item_code-----------------------------------------------');
//             print(index);
//             index++;
//           }

//           //print(blistOfDrofDownValues[0].serial_no);

//           return blistOfDrofDownValues;
//         } else {
//           Fluttertoast.showToast(
//             msg: 'Sorry ! currnently not available Serial Numbers',
//             toastLength: Toast.LENGTH_LONG,
//             gravity: ToastGravity.BOTTOM,
//           );
//           return null;
//         }
//       } else {
//         Fluttertoast.showToast(
//           msg: 'Request failed with status: $msg',
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.BOTTOM,
//         );
//       }
//     } else {
//       print('Request failed with status: ${responseType..statusCode}');

//       Fluttertoast.showToast(
//         msg: 'Request failed with status: ${responseType.statusCode}',
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//       );
//       return null;
//     }
//     return null;
//   }

//   // // --------------------------------------------------------------------------
//   // // *************************** get seleted serial number info *************************

//   // Future<Map<String,dynamic>> getSelectedSerialNumberInfo(
//   //   // Map<String,dynamic> returnMap;

//   //   String token, String endPoint) async {
//   //   final responseType =
//   //       await http.get(Uri.parse("${Config.BACKEND_URL}$endPoint"), headers: {
//   //     'Authorization': 'Bearer $token',
//   //     // 'Content-Type': 'application/json',
//   //     // 'Accept': 'application/json',
//   //   });

//   //   if (responseType.statusCode == 200) {
//   //     //print('200 ok -----------------------------------------------------');
//   //     Map decodedMap = jsonDecode(responseType.body);
//   //     bool isSuccess = decodedMap['success'];
//   //     String msg = decodedMap['message'];
//   //     Map<String,dynamic> responseMapPart = decodedMap['data'];

//   //     print(responseMapPart);

//   //     if (isSuccess) {
//   //       if (responseMapPart.isNotEmpty) {
//   //         //print('$isSuccess -----------------------------------------------------');
//   //         // var item = responseMapPart['serial_no'];
//   //         // var quantity = responseMapPart['quantity'];
//   //         // var purpose = responseMapPart['purpose'];
//   //         // var uprice = responseMapPart['uprice'];
//   //         // var serial_no = responseMapPart['serial_no'];
//   //         // var sp = responseMapPart['sp'];
//   //         // var item_des = responseMapPart['item_des'];
//   //         // var std_cost_per_unit = responseMapPart['std_cost_per_unit'];
//   //         // var uom = responseMapPart['uom'];
//   //         // SerialInfo serialInfoObj = SerialInfo(
//   //         //     item: item,
//   //         //     quantity: quantity,
//   //         //     purpose: purpose,
//   //         //     uprice: uprice,
//   //         //     serial_no: serial_no,
//   //         //     sp: sp,
//   //         //     item_des: item_des,
//   //         //     std_cost_per_unit: std_cost_per_unit,
//   //         //     uom: uom);

//   //         SerialInfo serialInfoObj = SerialInfo.fromJson(responseMapPart);

//   //         //print(serialInfoObj.toJson());
//   //       } else {
//   //         Fluttertoast.showToast(
//   //           msg: 'Sorry ! currnently not available Serial Number Info',
//   //           toastLength: Toast.LENGTH_LONG,
//   //           gravity: ToastGravity.BOTTOM,
//   //         );
//   //       }
//   //     } else {
//   //       Fluttertoast.showToast(
//   //         msg: 'Request failed with status: $msg',
//   //         toastLength: Toast.LENGTH_LONG,
//   //         gravity: ToastGravity.BOTTOM,
//   //       );
//   //     }
//   //   } else {
//   //     print('Request failed with status: ${responseType..statusCode}');

//   //     Fluttertoast.showToast(
//   //       msg: 'Request failed with status: ${responseType.statusCode}',
//   //       toastLength: Toast.LENGTH_LONG,
//   //       gravity: ToastGravity.BOTTOM,
//   //     );
//   //   }
//   // }
// }

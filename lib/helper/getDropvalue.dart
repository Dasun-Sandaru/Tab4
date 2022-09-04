import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../models/DropDownTypes.dart';
import '../models/dropdowntypesItems.dart';
import '../models/dropdowntypesSerialNumbers.dart';
import '../models/serialInfo.dart';
import '../services/config.dart';

class getDropvalue {

  List<DropDownTypes> listOfDrofDownValues = [];

  Future<List<DropDownTypes>?> getDropDownValues(String token, String endPoint) async {

    final responseType = await http.get(
        Uri.parse("${Config.BACKEND_URL}$endPoint"),
        headers: {
          'Authorization': 'Bearer $token',
          // 'Content-Type': 'application/json',
          // 'Accept': 'application/json',
        });

    if (responseType.statusCode == 200) {
      Map decodedMap = jsonDecode(responseType.body);
      bool isSuccess = decodedMap['success'];
      String msg = decodedMap['messages'];
      List<dynamic> responseListPart = decodedMap['data'];

      if(isSuccess) {
        for (var element in responseListPart) {
          var drop_id = element['drop_id'];
          var drop_value = element['drop_value'];

          DropDownTypes dropDownTypesObj = DropDownTypes(drop_id: drop_id, drop_value: drop_value);
          listOfDrofDownValues.add(dropDownTypesObj);
        }

        return listOfDrofDownValues;
        }
      else {
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
      return null;
    }
    return null;
  }

  List<DropDownTypesSerialNumbers> blistOfDrofDownValues = [];
  List<SerialInfo> listOfDrofSelectedSerialNumberInfo = [];
  List<DropDownTypesItems> alistOfDrofDownValues = [];

  Future<List<DropDownTypesItems>?> getDropDownValuesForItems(
      String token, String endPoint) async {
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
      List<dynamic> responseListPart = decodedMap['data'];

      print(responseListPart);

      if (isSuccess) {
        if (responseListPart.isNotEmpty) {
          //print('$isSuccess -----------------------------------------------------');
          for (var element in responseListPart) {
            var item_code = element['item_code'];
            var item_des = element['item_des'];
            var item_id = element['item_id'];
            var std_cost_per_unit = element['std_cost_per_unit'];
            var min_qty = element['min_qty'];

            DropDownTypesItems dropDownTypesItemsobj = DropDownTypesItems(
                item_code: item_code,
                item_dec: item_des,
                item_id: item_id,
                std_cost_per_unit: std_cost_per_unit,
                min_qty: min_qty);
            alistOfDrofDownValues.add(dropDownTypesItemsobj);

            //print('$item_code-----------------------------------------------');
          }

          print(alistOfDrofDownValues[0].item_code);

          return alistOfDrofDownValues;
        } else {
          Fluttertoast.showToast(
            msg: 'Sorry ! currnently not available Items',
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
      return null;
    }
    return null;
  }


  // *************************** get serial numbers for drop down *************************

  Future<List<DropDownTypesSerialNumbers>?> getDropDownValuesForSerialNumbers(
      String token, String endPoint) async {
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
      List<dynamic> responseListPart = decodedMap['data'];

      print(responseListPart);

      if (isSuccess) {
        if (responseListPart.isNotEmpty) {
          //print('$isSuccess -----------------------------------------------------');
          int index = 0;
          for (var element in responseListPart) {
            //int index = element;
            var serial_no = element['serial_no'];
            DropDownTypesSerialNumbers dropDownTypesSerialNumbersobj =
            DropDownTypesSerialNumbers(index: index, serial_no: serial_no);

            blistOfDrofDownValues.add(dropDownTypesSerialNumbersobj);

            //print('$item_code-----------------------------------------------');
            print(index);
            index++;
          }

          //print(blistOfDrofDownValues[0].serial_no);

          return blistOfDrofDownValues;
        } else {
          Fluttertoast.showToast(
            msg: 'Sorry ! currnently not available Serial Numbers',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
          );
          return null;
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
      return null;
    }
    return null;
  }
}

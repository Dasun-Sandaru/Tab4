import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tab4/helper/widgets/tableview.dart';
import 'package:tab4/models/search_info.dart';
import '../services/config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GetSearchInfo {
  // // variable

  List data = [];

  Future<List> getsearchInfo(String token, Map json) async {
    final response = await http.post(
        Uri.parse("${Config.BACKEND_URL}searchrslt"),
        body: json,
        headers: {
          'Authorization': 'Bearer $token',
          // 'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedMap = jsonDecode(response.body);
        data = decodedMap['data'];
        return data;
      } else {
        print('Request failed with status: ${response.statusCode}');

        Fluttertoast.showToast(
          msg: 'Request failed with status: ${response.statusCode}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      print(e.toString());
    }

    return data;
  }
}

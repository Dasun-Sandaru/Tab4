import 'package:shared_preferences/shared_preferences.dart';


class SharedPref {
  // store token in phone Db
  Future<void> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Token', token);
    print('Token Store In Local Db');

  }

  // get state of assest code
  Future<void> saveAssestState(bool state) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('stateOfAssest', state);
    print('dddddddddddddddddddddddddddddddddddddd$state');
  }


  // read emp No in phone Db
  // Future<String?> readEmpId() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? empNo = pref.getString('EmpId');
  //   print('Emp ID In Local Db : ${empNo}');
  //   return empNo;
  //
  // }


  // read token
  Future <String?> readToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('Token');
    print('Token ID In Local Db : ${token}');
    return token;
  }

  // read get state of assest code
  Future <bool?> readAssestState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? AssestState = pref.getBool('stateOfAssest');
    return AssestState;
  }

  // remove saved token
  Future<void> removeToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('Token') != null) {
      pref.remove('Token');
    }
    print('Token Removed');
  }

  // remove assest state
  Future<void> removeAssestState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getBool('stateOfAssest') != true) {
      pref.remove('stateOfAssest');
    }
  }

}
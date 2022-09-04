import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:tab4/screens/chip.dart';
import 'package:tab4/screens/dash_board.dart';

import '../../services/config.dart';
import '../../services/sharedPref.dart';
import '../models/loginData.dart';
import 'package:tab4/screens/tab01.dart';
// import '../home/tab01.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // get response message from api
  // late String responseMsg;

  // key of form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // get access to shared preferance
  SharedPref sharedPref = SharedPref();

  // get text field values
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //debugShowCheckedModeBanner: false,    // remove debug banner
      //routes: <String, WidgetBuilder> {
      //'/FirstTab' : (BuildContext context) => new FirstTab(),
      //},
      // home: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //<------------------ title box -------------------------
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                minHeight: 100,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(0, 197, 255, .6),
                    Color.fromRGBO(0, 114, 255, 1),
                  ]),
                ),
                padding: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text('System Force I.T.',
                          style: GoogleFonts.gelasio(
                            textStyle: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child:
                          Text('The Force behind Personalised I.T. Solutions',
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54,
                                ),
                              )),
                    )
                  ],
                ),
              ),
            ),
            //<------------------ close of title -------------------------
            //<------------------ logo -------------------------
            // SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.all(50),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/logo_system_foce.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  //buildImage(),

                  //<------------------ logo -------------------------
                  SizedBox(
                    width: 20,
                  ),

                  //<------------------ text view -------------------------
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 114, 255, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10),
                                        )
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            // border: Border(
                                            //     bottom: BorderSide(
                                            //         color: Colors.grey),
                                            // ),
                                        ),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              // border: InputBorder.none,
                                              border: OutlineInputBorder(),
                                              labelText: "Email Address",
                                              hintText: "Email Address",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                          controller: _email,
                                          keyboardType: TextInputType.emailAddress,
                                          validator: MultiValidator(
                                              [
                                                RequiredValidator(errorText: 'Cannot be empty...!'),
                                                EmailValidator(errorText: 'Provide valide email...!')
                                              ]
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            // border: Border(
                                            //     bottom: BorderSide(
                                            //         color: Colors.grey)),
                                        ),
                                        child: TextFormField(
                                          obscureText: true,
                                          decoration: InputDecoration(
                                              // border: InputBorder.none,
                                            border: OutlineInputBorder(),
                                              labelText: "Password",
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                          controller: _password,
                                          validator: MultiValidator(
                                              [
                                                LengthRangeValidator(min: 6, max: 25, errorText: 'Password must be longer than 6 characters..!'),
                                                RequiredValidator(errorText: 'Cannot be empty...!')
                                              ]
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(0, 114, 255, 1),
                                            Color.fromRGBO(0, 197, 255, .6),
                                          ]),
                                        ),
                                        padding: EdgeInsets.all(15),
                                        child: GestureDetector(
                                          onTap: () {
                                            // code here what happen when log in button pressed
                                            //Navigator.of(context).pushNamed('/FirstTab');
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(builder: (context) => const FirstTab()),
                                            // );

                                            //<---------- log in -------------------------------------
                                            login(_email.text, _password.text);
                                          },
                                          child: Text(
                                            'Log In',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))

                  //<------------------ end of text view -------------------------
                ],
              ),
            )
          ],
        ),
      ),
      //),
    );
  }

  Widget buildImage() => Image.asset('assets/images/logo_system_foce.png');

// login method
  Future<void> login(String email, String password) async {
    // chack internet available
    // if (activeInternet) {
    // when internet available
    try {
      LoginData logindata = LoginData(
        email: email,
        password: password,
          // ip: '127.0.0.1',
          // imei_no: '000999888'
          );

      final response = await http.post(
        Uri.parse("${Config.BACKEND_URL}auth/login"),
        body: logindata.toJson(),
      );

      if (response.statusCode == 200) {
        // print('account created successfully');

        var data = jsonDecode(response.body);

        LoginResponse loginResponse = LoginResponse.fromJson(data);
        // print(loginResponse.message);
        print(loginResponse.token);
        // print(loginResponse.userName);

        // responseMsg = loginResponse.message;
        // String userName = loginResponse.userName;
        //print(data['token']);

        // // save emp Id & emp Name in local DB
        // sharedPref.saveEmpIdName(empNo, userName);
        // save token in local DB
        sharedPref.saveToken(loginResponse.token);

        // show toast
        // Fluttertoast.showToast(
        //   msg: responseMsg,
        //   toastLength: Toast.LENGTH_SHORT,
        //   gravity: ToastGravity.BOTTOM,
        // );
        Fluttertoast.showToast(
          msg: 'Successfully Log In',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );

        //navigate to home
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DashBoard(),
          ),
        );
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
      Fluttertoast.showToast(
        msg: 'failed : ${e.toString()}',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
    // } else {
    //   // when internet not available
    //   print('you are offline');
    //   Fluttertoast.showToast(
    //         msg: 'You are Offline',
    //         toastLength: Toast.LENGTH_LONG,
    //         gravity: ToastGravity.BOTTOM,
    //   );
    // }
  }
}

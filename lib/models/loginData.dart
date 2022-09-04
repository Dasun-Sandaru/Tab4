class LoginData {

  late final String email;
  late final String password;

  LoginData({
    required this.email,
    required this.password,
  });

  factory LoginData.fromJson(Map<String,dynamic> logindata){
    return LoginData(
      email: logindata['username'],
      password: logindata['password'],
    );
  }


  Map<String,dynamic> toJson(){
    final Map<String,dynamic> loginData = Map <String,dynamic>();
    loginData['username'] = email;
    // loginData['badgenumber'] = badgenumber;
    // loginData['password'] = password;
    loginData['password'] = password;


    return loginData;
  }
}

class LoginResponse{

  //Data data;
  // late final String message;
  // late final bool success;
  var token;
  // String userName;

  LoginResponse({
    // required this.message,
    // required this.success,
    // required this.userName,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String,dynamic> loginData){
    return LoginResponse(

      token : loginData['access_token'],
      // userName : loginData['data']['name'],
      // message: loginData['message'],
      // success: loginData['success'],
    );
  }

}

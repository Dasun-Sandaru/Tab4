class Config{
  static const BACKEND_URL = String.fromEnvironment('BACKEND_URL',
    defaultValue: 'https://serviceportal.systemforce.net/api/');

  // static Map<String,dynamic> header(){
  //   final Map<String,dynamic> header = Map <String,dynamic>();
  //   header['Content-Type'] = "application//json";
  //   header['Accept'] = application/json;
  //   header['Authorization'] = 'Bearer $token';
  //   return header;
  // }
}

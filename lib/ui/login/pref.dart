
import 'package:shared_preferences/shared_preferences.dart';

void saveToken(String value) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('token', value);
}

Future<String> getToken() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String token = preferences.getString('token');
  if( token != null ) {
    return token;
  } else {
    return "";
  }

}

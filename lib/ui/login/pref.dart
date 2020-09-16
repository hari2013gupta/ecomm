
import 'package:shared_preferences/shared_preferences.dart';

void saveTokenToSF(String value) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('pref_token', value);
  // prefs.remove("stringValue");//hari remove demo
  //bool CheckValue = prefs.containsKey('value');//hari check pref
}

Future<String> getTokenSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('pref_token');
  if( token != null ) {
    return token;
  } else {
    return "";
  }

}

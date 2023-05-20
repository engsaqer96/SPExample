import 'package:shared_preferences/shared_preferences.dart';

class SPHelper{
  SPHelper._();

  static SPHelper spHelper=SPHelper._();
   SharedPreferences? prefs;
  initSharedPreference() async{
    prefs=await SharedPreferences.getInstance();
    print('done');
  }
  Future<bool?> setValue(String key,String value) async{
    return await prefs?.setString(key, value);
  }
  Future<String?> getValue(String key) async{
    return await prefs?.getString(key);
  }
  Future<bool> isExist(String key) async{
    return await prefs?.containsKey(key)??false;
  }
}
import 'package:flutter/material.dart';
import 'package:localstorage/DBHelper/SPHelper.dart';

import 'Screens/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SPHelper.spHelper.initSharedPreference();
  runApp( MaterialApp(
    home: HomeScreen(),
  ));
}

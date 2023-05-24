import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/DBHelper/SPHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences?  prefs;
  bool? flag=false;
  initSharedPreferences() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs=SPHelper.spHelper.prefs;
  }
   setSavedData()async {
    print('save');
    if(await SPHelper.spHelper.isExist('user_name')){
      Ucontroller.text=(await SPHelper.spHelper.getValue('user_name'))!;
    }
   }
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),
    () => setSavedData());

    super.initState();
  }
  var Ucontroller=TextEditingController();
  var Pcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Quiz'),),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: Ucontroller,
                decoration:  InputDecoration(
                  label: Text('User Name'),
                  border: OutlineInputBorder
                    (borderRadius:BorderRadius.circular(10))

                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                obscureText: true,
                controller: Pcontroller,
                decoration:  InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder
                      (borderRadius:BorderRadius.circular(10))

                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(value: flag,
                    onChanged: (value) {
                   flag=value;
                   print(flag);
                   setState(() {

                   });
                  },
                  ),
                  Text('Remember me')
                ],
              ),

            ),
            SizedBox(height: 5,),
           ElevatedButton(onPressed: () async {
             if(flag??false) {
               bool? b=await SPHelper.spHelper.setValue('user_name', Ucontroller.text);
               print('user name status $b');
               SPHelper.spHelper.setValue('password', Pcontroller.text);
             }
           }, child: Text('Login',style:  TextStyle(fontSize: 20)),)

          ],
        ),
      ),
    );
  }

   Future<String> getIniData() async {
    return  prefs!.containsKey('data')?
    await prefs!.getString("data")??"":"";
  }
}
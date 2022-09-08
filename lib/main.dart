import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isolution/helper/config.dart';
import 'package:isolution/view/home.dart';
import 'view/login.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Login(),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
      },
    );
  }

  notif(context, msg, status) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (params) {
        return AlertDialog(
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
          content: Container(
            // color: Colors.red,
            height: SizeConfig.blockSizeVertical! * 25,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  status == true
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green[600],
                          size: SizeConfig.blockSizeVertical! * 20,
                        )
                      : Icon(
                          Icons.highlight_off,
                          color: Colors.red[600],
                          size: SizeConfig.blockSizeVertical! * 20,
                        ),
                  status == true
                      ? Text(
                          "Success",
                          style: TextStyle(
                              color: Colors.green[600],
                              fontSize: SizeConfig.blockSizeVertical! * 2,
                              fontWeight: FontWeight.w600),
                        )
                      : Text(
                          "Failed",
                          style: TextStyle(
                              color: Colors.red[600],
                              fontSize: SizeConfig.blockSizeVertical! * 2,
                              fontWeight: FontWeight.w600),
                        ),
                  Text(
                    msg,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: SizeConfig.blockSizeVertical! * 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

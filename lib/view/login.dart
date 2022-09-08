import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isolution/helper/config.dart';
import 'package:isolution/view/home.dart';

import '../logic/login.dart';

// ignore: use_key_in_widget_constructors
class Login extends StatelessWidget {
  final errmsg = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.blockSizeHorizontal! * 100,
          height: SizeConfig.blockSizeVertical! * 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "I - Solution",
                style: TextStyle(
                    color: const Color(0xFF1A6EA9),
                    fontSize: SizeConfig.blockSizeVertical! * 5,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Evending machine demo",
                style: TextStyle(
                  color: const Color.fromARGB(255, 136, 204, 253),
                  fontSize: SizeConfig.blockSizeVertical! * 2,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 10,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 70,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFF1A6EA9),
                        width: 3,
                      ),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFF1A6EA9),
                        width: 1,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFF1A6EA9),
                        width: 1,
                      ),
                    ),
                    filled: true,
                    labelStyle: const TextStyle(
                      color: Color(0xFF1A6EA9),
                    ),
                    label: const Text("Email"),
                    hintStyle: const TextStyle(color: Colors.amber),
                    fillColor: const Color.fromARGB(255, 165, 207, 237),
                  ),
                  cursorColor: const Color(0xFF1A6EA9),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 70,
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color(0xFF1A6EA9),
                          width: 3,
                        )),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFF1A6EA9),
                        width: 1,
                      ),
                    ),
                    filled: true,
                    labelStyle: const TextStyle(
                      color: Color(0xFF1A6EA9),
                    ),
                    label: const Text("Password"),
                    hintStyle: const TextStyle(color: Colors.amber),
                    fillColor: const Color.fromARGB(255, 165, 207, 237),
                  ),
                  cursorColor: const Color(0xFF1A6EA9),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 85, 168, 227)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color(0xFF1A6EA9),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => Home(email: "Guest"));
                      },
                      child: Text("Guest".toUpperCase(),
                          style: const TextStyle(fontSize: 14))),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF1A6EA9)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Color(0xFF1A6EA9),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (!LoginController().emailcheck(email.text)) {
                          Home(
                            email: email.text,
                          ).notif(context, "check format email: ${email.text}",
                              false);
                        } else {
                          showSnackBarBot(context, "login berhasil!");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(
                                email: email.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text("Login".toUpperCase(),
                          style: const TextStyle(fontSize: 14)))
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 2,
              ),
              TextButton(
                  onPressed: () {
                    showSnackBarBot(context, "Dalam Tahap Pengembangan");
                  },
                  child: const Text("Register"))
            ],
          ),
        ),
      ),
    );
  }

  showSnackBarBot(BuildContext context, data) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF1A6EA9),
        content: Text(
          data,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isolution/helper/config.dart';
import 'package:isolution/logic/home.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final H = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 221, 241, 255),
      width: SizeConfig.blockSizeHorizontal! * 70,
      height: SizeConfig.blockSizeVertical! * 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 6,
                ),
                Container(
                  // width: SizeConfig.blockSizeHorizontal! * 100,
                  height: SizeConfig.blockSizeHorizontal! * 30,
                  child:
                      Image.network("https://freesvg.org/img/Male-Avatar.png"),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      height: SizeConfig.blockSizeVertical! * 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[100],
                        border: Border.all(
                            color: const Color(0xFF1A6EA9), width: 3),
                      ),
                      child: Stack(children: [
                        Align(
                          alignment: Alignment(0, -0.60),
                          child: Icon(
                            Icons.account_balance_wallet,
                            size: SizeConfig.blockSizeHorizontal! * 15,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.70),
                          child: Text(
                            "Rp ${H.profile[0].saldo}",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4),
                          ),
                        )
                      ]),
                    ),
                    Container(
                      // color: Colors.red,
                      width: SizeConfig.blockSizeHorizontal! * 30,
                      height: SizeConfig.blockSizeVertical! * 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue[100],
                        border: Border.all(
                            color: const Color(0xFF1A6EA9), width: 3),
                      ),
                      child: Stack(children: [
                        Align(
                          alignment: Alignment(0, -0.60),
                          child: Icon(
                            Icons.receipt_long,
                            size: SizeConfig.blockSizeHorizontal! * 15,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, 0.70),
                          child: Text(
                            H.profile[0].transaction.toString(),
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal! * 10),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                GestureDetector(
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.payment,
                        color: Color.fromARGB(255, 11, 71, 120),
                      ),
                      Text(
                        " Top Up Credit",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 2,
                ),
                Row(
                  children: const <Widget>[
                    Icon(
                      Icons.history,
                      color: Color.fromARGB(255, 11, 71, 120),
                    ),
                    Text(
                      " History Transaction",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Sign Out",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

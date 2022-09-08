import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isolution/helper/config.dart';
import 'package:isolution/logic/home.dart';
import 'package:isolution/view/home.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  final H = Get.put(HomeLogic());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          color: Color.fromARGB(255, 232, 245, 255),
          width: SizeConfig.blockSizeHorizontal! * 100,
          height: SizeConfig.blockSizeVertical! * 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 6,
                ),
                SizedBox(
                  child: TextButton(
                      onPressed: () {
                        H.removeCart();
                      },
                      child: Text("Remove carts")),
                ),
                Container(
                  width: SizeConfig.blockSizeHorizontal! * 100,
                  height: SizeConfig.blockSizeVertical! * 40,
                  child: ListView.builder(
                    itemCount: H.carts.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                              child: GestureDetector(
                                child: Card(
                                  // color: Colors.orange,
                                  elevation: 11,
                                  child: ListTile(
                                    title: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 4,
                                          child: Container(
                                              child: Text(
                                            H.carts[index].name,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          )),
                                        ),
                                        const Spacer(
                                          flex: 2,
                                        ),
                                        Text(
                                          H.f.format(H.carts[index].total),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      '${H.carts[index].qty} x ${H.f.format(H.carts[index].price)}',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Subtotal ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        )),
                    Text(
                      H.f.format(H.subtotal.value),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: SizeConfig.blockSizeHorizontal! * 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 7,
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
                          message(context, "Please Input ", false);

                          //fake process data to APi
                          Timer(const Duration(seconds: 10), () {
                            Navigator.of(context).pop();
                            message(context, "Success Cash Payments", true);
                            Timer(const Duration(seconds: 5), () {
                              Navigator.of(context).pop();
                              H.removeCart();
                            });
                          });
                        },
                        child: Text("Cash payment".toUpperCase(),
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
                          qrcode(context);

                          //fake process data to APi
                          Timer(const Duration(seconds: 10), () {
                            Navigator.of(context).pop();
                            message(context, "Success qris payment", true);

                            Timer(const Duration(seconds: 5), () {
                              Navigator.of(context).pop();
                              H.removeCart();
                            });
                          });
                        },
                        child: Text("qris payment".toUpperCase(),
                            style: const TextStyle(fontSize: 14)))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  message(context, msg, status) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (params) {
        return AlertDialog(
          content: SizedBox(
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
                          Icons.local_atm,
                          color: Colors.amber[600],
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
                          "Please Input Money to Machine",
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

  qrcode(context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (params) {
        return AlertDialog(
          content: SizedBox(
            height: SizeConfig.blockSizeVertical! * 25,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 40,
                    height: SizeConfig.blockSizeHorizontal! * 40,
                    child: QrImage(
                      data:
                          'https://www.linkedin.com/in/elmo-agusti-6106751a8/',
                      version: QrVersions.auto,
                      size: 500,
                      gapless: false,
                      embeddedImage: AssetImage('assets/logo.png'),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(50, 50),
                      ),
                    ),
                  ),
                  Text(
                    "Demo API Gateway",
                    style: TextStyle(
                        color: Colors.green[600],
                        fontSize: SizeConfig.blockSizeVertical! * 2,
                        fontWeight: FontWeight.w600),
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

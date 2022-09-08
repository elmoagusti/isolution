import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/config.dart';
import '../logic/home.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    Key? key,
    required this.img,
    required this.name,
    required this.description,
    required this.price,
  }) : super(key: key);

  final String name;
  final String description;
  final int price;
  final String img;

  final qty = TextEditingController(text: "1");

  final H = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 233, 241, 248),
        width: SizeConfig.blockSizeHorizontal! * 100,
        height: SizeConfig.blockSizeVertical! * 100,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: SizeConfig.blockSizeHorizontal! * 100,
                height: SizeConfig.blockSizeHorizontal! * 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover),
                  // border: Border.all(color: Colors.white, width: 1),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Rp $price",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      qty.text = (int.parse(qty.text) - 1).toString();
                    },
                    icon: const Icon(
                      Icons.minimize,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Center(
                      child: TextField(
                        controller: qty,
                        enabled: false,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      qty.text = (int.parse(qty.text) + 1).toString();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 30,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF1A6EA9)),
                child: TextButton(
                  onPressed: () {
                    H.addCart(name, price, int.parse(qty.text));
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "Add To Cart",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

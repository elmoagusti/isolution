import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isolution/helper/config.dart';
import 'package:isolution/logic/home.dart';
import 'package:isolution/view/cartpage.dart';
import 'package:isolution/view/detailpage.dart';
import 'package:isolution/view/profilepage.dart';

class Home extends StatelessWidget {
  Home({super.key, required this.email});
  final String email;

  final H = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfilePage(),
      endDrawer: CartPage(),
      body: Obx(
        () => Container(
          width: SizeConfig.blockSizeHorizontal! * 100,
          height: SizeConfig.blockSizeVertical! * 100,
          color: const Color.fromARGB(255, 233, 241, 248),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal! * 80,
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            Builder(builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                  MaterialLocalizations.of(context)
                                      .openAppDrawerTooltip;
                                },
                                child: const CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                      "https://freesvg.org/img/Male-Avatar.png"),
                                  backgroundColor: Colors.transparent,
                                ),
                              );
                            }),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 1,
                            ),
                            Text(
                              "welcome back, ",
                              style: TextStyle(
                                  // fontWeight: FontWeight.w500,
                                  fontSize: SizeConfig.blockSizeVertical! * 2,
                                  color: const Color(0xFF1A6EA9)),
                            ),
                            Flexible(
                              child: Text(
                                email,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeConfig.blockSizeVertical! * 2.5,
                                    color: const Color(0xFF1A6EA9)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Stack(
                          children: [
                            Builder(builder: (context) {
                              return GestureDetector(
                                  onTap: () {
                                    Scaffold.of(context).openEndDrawer();
                                    MaterialLocalizations.of(context)
                                        .openAppDrawerTooltip;
                                  },
                                  child: Center(
                                      child: Icon(
                                    Icons.shopping_cart,
                                    color: Color(0xFF1A6EA9),
                                  )));
                            }),
                            Align(
                              alignment: const Alignment(-1, -1),
                              child: H.carts.isNotEmpty
                                  ? Container(
                                      width: SizeConfig.blockSizeVertical! * 2,
                                      height: SizeConfig.blockSizeVertical! * 2,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child:
                                              Text(H.carts.length.toString())),
                                    )
                                  : const Text(""),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 5,
                  ),
                  SizedBox(
                    // color: Colors.red,
                    width: SizeConfig.blockSizeHorizontal! * 100,
                    height: SizeConfig.blockSizeVertical! * 70,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                            childAspectRatio: 1.0,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => Hero(
                              tag: H.products[index].name,
                              child: GestureDetector(
                                onTap: () => Get.to(
                                  () => DetailPage(
                                    name: H.products[index].name,
                                    price: H.products[index].price,
                                    description: H.products[index].description,
                                    img: H.products[index].imgpath,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.blockSizeHorizontal! * 40,
                                      height:
                                          SizeConfig.blockSizeHorizontal! * 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue[100],
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                H.products[index].imgpath),
                                            fit: BoxFit.cover),
                                        border: Border.all(
                                            color: const Color(0xFF1A6EA9),
                                            width: 3),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      H.products[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16),
                                    ),
                                    Text("Rp ${H.products[index].price}"),
                                  ],
                                ),
                              ),
                            ),
                            childCount: H.products.length,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  notif(context, msg, status) {
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

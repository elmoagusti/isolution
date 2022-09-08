import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:isolution/models/cart.dart';
import 'package:isolution/models/product.dart';
import 'package:isolution/models/profile.dart';

class HomeLogic extends GetxController {
  RxList<ProfileModel> profile = <ProfileModel>[].obs;
  RxList<ProductModel> products = <ProductModel>[].obs;

  RxList<CartModel> carts = <CartModel>[].obs;
  RxInt subtotal = 0.obs;

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  final f = NumberFormat("Rp #,##0", "en_US");

  //dummy data // fake APi
  getdata() {
    //fake Api profile page
    const profileApi = [
      {
        "name": "Elmo Agusti",
        "email": "elmoagusti.ea@gmail.com",
        "saldo": 1100000,
        "transaction": 3,
      }
    ];

    //fake Api product page
    const productApi = [
      {
        "id": 1,
        "name": "Chocolate Bars",
        "description":
            "A chocolate bar (Commonwealth English) or candy bar (some dialects of American English) is a confection containing chocolate, which may also contain layerings or mixtures that include nuts, fruit, caramel, nougat, and wafers. A flat, easily breakable, chocolate bar is also called a tablet.",
        "price": 12000,
        "imgpath":
            "https://media.istockphoto.com/photos/various-chocolate-bar-dessert-food-chocolates-background-picture-id1223104208?k=20&m=1223104208&s=170667a&w=0&h=onIu68JgDyRKBKiMLtPf2N7g-rvuQi-MUeOdpkQAbe8=",
      },
      {
        "id": 2,
        "name": "Chips",
        "description":
            "A chip (American English and Australian English) or crisp (British English) is a snack food in the form of a crisp, flat or slightly bowl shaped, bite-sized unit. Some chips can be made into dishes and served as an appetizer, side, hors d'oeuvre, etc.",
        "price": 8000,
        "imgpath":
            "https://assets3.thrillist.com/v1/image/2811006/414x310/crop;webp=auto;jpeg_quality=60;progressive.jpg",
      },
      {
        "id": 3,
        "name": "Wafers",
        "description":
            "A wafer is a crisp, often sweet, very thin, flat, light and dry biscuit, often used to decorate ice cream, and also used as a garnish on some sweet dishes. Wafers can also be made into cookies with cream flavoring sandwiched between them.",
        "price": 7000,
        "imgpath":
            "https://nationaltoday.com/wp-content/uploads/2021/07/shutterstock_790849423-min-640x514.jpg",
      },
      {
        "id": 4,
        "name": "Biskuit",
        "description":
            "biscuit, in the United States, a small quick bread usually made from flour, salt, and butter or vegetable shortening, with baking powder as a leavening agent. The dough is kneaded briefly and rolled out, and the biscuits are cut with a round cutter.",
        "price": 11000,
        "imgpath": "https://s1.bukalapak.com/img/10182628102/large/data.jpeg",
      },
      {
        "id": 5,
        "name": "Misol",
        "description":
            "Double cheese puffs topped with loads of parmesan and edam cheese, baked to crisp perfection.",
        "price": 15000,
        "imgpath":
            "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//88/MTA-7224532/misol_double_cheese_puffs_kue_kering_misol_netto_100_gr_kemasan_plastik_full06_immo4kvu.jpg",
      },
      {
        "id": 6,
        "name": "Teh Botol",
        "description":
            "Teh Botol Sosro adalah merek teh beraroma melati yang dipasarkan oleh PT. Sinar Sosro. Teh Botol Sosro sangat populer di Indonesia dan kini juga dijual di berbagai negara di luar Indonesia. Menurut hasil penelitian majalah SWA, Teh Botol Sosro bahkan lebih digemari masyarakat Indonesia daripada Coca-Cola.",
        "price": 6000,
        "imgpath":
            "https://i0.wp.com/harga.web.id/wp-content/uploads/Ilustrasi-Menuangkan-Teh-Botol-Sosro-Facebook-Tehbotol-Sosro.jpg?resize=680%2C300&ssl=1",
      },
    ];

    profile.value =
        profileApi.map<ProfileModel>(ProfileModel.fromJson).toList();
    products.value =
        productApi.map<ProductModel>(ProductModel.fromJson).toList();
  }

  addCart(name, int price, int qty) {
    final total = price * qty;
    final data = CartModel(
      name: name,
      price: price,
      qty: qty,
      total: total,
    );
    carts.add(data);

    subtotal.value += total;
  }

  removeCart() {
    carts.value = [];
    subtotal.value = 0;
  }
}

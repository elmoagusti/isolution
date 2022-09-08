class CartModel {
  final String name;
  final int price;
  final int qty;
  final int total;

  CartModel({
    required this.name,
    required this.price,
    required this.qty,
    required this.total,
  });

  static CartModel fromJson(json) => CartModel(
        name: json["name"],
        price: json["price"],
        qty: json["qty"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "qty": qty,
        "total": total,
      };
}

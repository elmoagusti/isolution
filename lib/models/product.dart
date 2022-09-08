class ProductModel {
  final int id;
  final String name;
  final int price;
  final String description;
  final String imgpath;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imgpath,
  });

  static ProductModel fromJson(json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        imgpath: json["imgpath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "imgpath": imgpath,
      };
}

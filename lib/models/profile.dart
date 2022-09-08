class ProfileModel {
  final String name;
  final String email;
  final int saldo;
  final int transaction;

  ProfileModel({
    required this.name,
    required this.email,
    required this.saldo,
    required this.transaction,
  });

  static ProfileModel fromJson(json) => ProfileModel(
        name: json["name"],
        email: json["email"],
        saldo: json["saldo"],
        transaction: json["transaction"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "saldo": saldo,
        "transaction": transaction,
      };
}

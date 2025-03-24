class Data {
  String? email;
  List<dynamic>? favoriteProducts;
  int? id;
  dynamic imagePath;
  String? name;
  String? phone;

  Data({
    this.email,
    this.favoriteProducts,
    this.id,
    this.imagePath,
    this.name,
    this.phone,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json['email'] as String?,
        favoriteProducts: json['favorite_products'] as List<dynamic>?,
        id: json['id'] as int?,
        imagePath: json['image_path'] as dynamic,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'favorite_products': favoriteProducts,
        'id': id,
        'image_path': imagePath,
        'name': name,
        'phone': phone,
      };
}

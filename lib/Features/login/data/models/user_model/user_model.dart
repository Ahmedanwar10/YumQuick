import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  dynamic imagePath;

  @HiveField(2)
  String? accessToken;

  @HiveField(3)
  String? refreshToken;

  @HiveField(4)
  List<dynamic>? favoriteProducts;

  @HiveField(5)
  int? id;

  @HiveField(6)
  String? phone;

  @HiveField(7)
  String? email;

  // ✅ تعديل الـ Constructor ليكون أكثر وضوحًا
  UserModel ({
    this.id,
    this.phone,
    this.email,
    this.name,
    this.imagePath,
    this.accessToken,
    this.refreshToken,
    this.favoriteProducts,
  });

  // ✅ تحويل JSON إلى Object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      imagePath: json['image_path'], // يمكن أن يكون أي نوع (String / null)
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      favoriteProducts: json['favorite_products'] as List<dynamic>?,
    );
  }

  // ✅ تحويل Object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'email': email,
      'name': name,
      'image_path': imagePath,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'favorite_products': favoriteProducts,
    };
  }
}

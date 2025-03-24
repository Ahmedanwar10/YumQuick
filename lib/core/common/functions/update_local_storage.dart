import 'package:hive/hive.dart';
import 'package:yum_quick/Features/login/data/models/user_model/user_model.dart';
import 'package:yum_quick/const.dart';

Future<void> updateUserField({
  required String fieldName,
  required dynamic newValue,
}) async {
  try {
    var box = await Hive.openBox<UserModel>(kUserModelBox);
    UserModel? user = box.get(0);

    if (user != null) {
      UserModel updatedUser = _updateField(user, fieldName, newValue);

      await box.put(0, updatedUser);
      print('Field updated successfully');
    } else {
      print('User not found');
    }
  } catch (e) {
    print('Error updating field: $e');
  }
}

UserModel _updateField(UserModel user, String fieldName, dynamic newValue) {
  switch (fieldName) {
    case 'name':
      return UserModel(
        name: newValue,
        imagePath: user.imagePath,
        id: user.id,
        phone: user.phone,
        email: user.email,
        favoriteProducts: user.favoriteProducts,
      );
    case 'imagePath':
      return UserModel(
        name: user.name,
        imagePath: newValue,
        id: user.id,
        phone: user.phone,
        email: user.email,
        favoriteProducts: user.favoriteProducts,
      );
    case 'id':
      return UserModel(
        name: user.name,
        imagePath: user.imagePath,
        id: newValue,
        phone: user.phone,
        email: user.email,
        favoriteProducts: user.favoriteProducts,
      );
    case 'phone':
      return UserModel(
        name: user.name,
        imagePath: user.imagePath,
        id: user.id,
        phone: newValue,
        email: user.email,
        favoriteProducts: user.favoriteProducts,
      );
    case 'email':
      return UserModel(
        name: user.name,
        imagePath: user.imagePath,
        id: user.id,
        phone: user.phone,
        email: newValue,
        favoriteProducts: user.favoriteProducts,
      );
    case 'favoriteProducts':
      return UserModel(
        name: user.name,
        imagePath: user.imagePath,
        id: user.id,
        phone: user.phone,
        email: user.email,
        favoriteProducts: newValue,
      );
    default:
      throw Exception('Invalid field name: $fieldName');
  }
}

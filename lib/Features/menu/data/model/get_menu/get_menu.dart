import 'category.dart';

class GetMenu {
  List<Category>? categories;
  bool? status;

  GetMenu({this.categories, this.status});

factory GetMenu.fromJson(Map<String, dynamic> json) => GetMenu(
  categories: json['categories'] is List
      ? (json['categories'] as List)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList()
      : (json['categories'] is Map<String, dynamic>) 
          ? [Category.fromJson(json['categories'])] // هنا لو كانت Map نحولها لقائمة
          : [], // إذا لم يكن List أو Map، رجّع قائمة فارغة
  status: json['status'] as bool?,
);


  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}

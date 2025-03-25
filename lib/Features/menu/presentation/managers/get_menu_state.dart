part of 'get_menu_cubit.dart';

@immutable
abstract class GetMenuState {}

class GetMenuInitial extends GetMenuState {}

class GetMenuLoading extends GetMenuState {}

class GetMenuSuccess extends GetMenuState {
  final List<GetMenu> products; // ✅ اسم أكثر وضوحًا

  GetMenuSuccess(this.products);
}

class GetMenuFailure extends GetMenuState {
  final String errorMessage;

  GetMenuFailure({required this.errorMessage});
}

part of 'fav_cubit.dart';

@immutable
abstract class FavState {}

class FavInitial extends FavState {}

class FavLoading extends FavState {}

class FavSuccess extends FavState {
  final List<Product> products;
  FavSuccess(this.products);
}

class FavFailure extends FavState {
  final String errorMessage;

  FavFailure({required this.errorMessage});
}


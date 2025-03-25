part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

abstract class LanguageCubitState {}

class LanguageCubitInitial extends LanguageCubitState {}

class LanguageChange extends LanguageCubitState {
  final String selectedLanguage;
  LanguageChange(this.selectedLanguage);
}

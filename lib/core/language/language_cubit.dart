import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageCubitState> {
  LanguageCubit() : super(LanguageCubitInitial());

  String getCurrentLanguage() {
    if (state is LanguageChange) {
      return (state as LanguageChange).selectedLanguage;
    }
    return 'English'; // Default language
  }

  void changeLanguage(String selectedLanguage) {
    if (state is LanguageChange &&
        (state as LanguageChange).selectedLanguage == selectedLanguage) {
      return; // Avoid unnecessary state updates
    }
    emit(LanguageChange(selectedLanguage));
  }
}

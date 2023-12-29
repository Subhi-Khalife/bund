part of 'theme_bloc.dart';

enum AppLanguage { arabic, english }

extension GetLanguageTitle on AppLanguage {
  get lang {
    switch (this) {
      case AppLanguage.arabic:
        return "ar";
      case AppLanguage.english:
        return "en";
    }
  }

  get title {
    switch (this) {
      case AppLanguage.arabic:
        return "عربي";
      case AppLanguage.english:
        return "English";
    }
  }
}

class ThemeState {
  ThemeState({
    required this.themeData,
    this.appLanguage = AppLanguage.english,
  });
  final AppLanguage appLanguage;
  final MainColors themeData;
  ThemeState copyWith({
    MainColors? themeData,
    AppLanguage? appLanguage,
  }) {
    return ThemeState(
      appLanguage: appLanguage ?? this.appLanguage,
      themeData: themeData ?? this.themeData,
    );
  }
}

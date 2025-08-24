part of 'language_bloc.dart';

sealed class LanguageState extends Equatable {
  final Locale locale;

  const LanguageState(this.locale);

  @override
  List<Object> get props => [locale];
}

final class LanguageInitial extends LanguageState {
  const LanguageInitial(super.initialLocale);
}

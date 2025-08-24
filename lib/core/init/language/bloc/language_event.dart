part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

final class ChangeLanguage extends LanguageEvent {
  final Locale locale;
  final BuildContext context;

  const ChangeLanguage({required this.locale, required this.context});

  @override
  List<Object> get props => [locale, context];
}

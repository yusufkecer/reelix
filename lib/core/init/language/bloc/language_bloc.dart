import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reelix/core/index.dart';

part 'language_event.dart';
part 'language_state.dart';

@injectable
final class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({required Locale initialLocale}) : super(LanguageInitial(initialLocale)) {
    on<ChangeLanguage>((event, emit) async {
      try {
        await EasyLocalization.of(event.context)?.setLocale(event.locale);

        emit(LanguageInitial(event.locale));
      } on Exception catch (e) {
        'LanguageBloc error: $e'.logError();
      }
    });
  }
}

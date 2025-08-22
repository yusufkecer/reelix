import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(const UploadImageInitial());

  Future<void> uploadProfileImage(File imageFile) async {
    try {
      emit(const UploadImageLoading());

      emit(const UploadImageSuccess(''));
    } on Exception catch (e) {
      emit(UploadImageFailure(e.toString()));
    }
  }
}

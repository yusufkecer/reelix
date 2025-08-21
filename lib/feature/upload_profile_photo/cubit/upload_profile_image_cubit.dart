import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'upload_profile_image_state.dart';

class UploadProfileImageCubit extends Cubit<UploadProfileImageState> {
  UploadProfileImageCubit() : super(UploadProfileImageInitial());
}

part of 'upload_photo_cubit.dart';

sealed class UploadPhotoState extends Equatable {
  const UploadPhotoState();

  @override
  List<Object?> get props => [];
}

final class UploadPhotoInitial extends UploadPhotoState {
  const UploadPhotoInitial();
}

final class UploadPhotoLoading extends UploadPhotoState {
  const UploadPhotoLoading();
}

final class UploadPhotoSuccess extends UploadPhotoState {
  final String imageUrl;

  const UploadPhotoSuccess(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

final class UploadPhotoSuccessWithFile extends UploadPhotoState {
  final XFile imageFile;

  const UploadPhotoSuccessWithFile(this.imageFile);

  @override
  List<Object?> get props => [imageFile];
}

final class UploadPhotoFailure extends UploadPhotoState {
  final String message;
  const UploadPhotoFailure(this.message);

  @override
  List<Object?> get props => [message];
}

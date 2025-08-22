part of 'upload_image_cubit.dart';

sealed class UploadImageState extends Equatable {
  const UploadImageState();

  @override
  List<Object?> get props => [];
}

final class UploadImageInitial extends UploadImageState {
  const UploadImageInitial();
}

final class UploadImageLoading extends UploadImageState {
  const UploadImageLoading();
}

final class UploadImageSuccess extends UploadImageState {
  final String imageUrl;

  const UploadImageSuccess(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

final class UploadImageFailure extends UploadImageState {
  final String message;
  const UploadImageFailure(this.message);

  @override
  List<Object?> get props => [message];
}

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/upload_photo/cubit/upload_image_cubit.dart';
import 'package:reelix/injection/locator.dart';

part 'widgets/select_photo.dart';
part 'upload_photo_view_model.dart';

@immutable
final class UploadPhotoView extends StatefulWidget {
  const UploadPhotoView({super.key});

  @override
  State<UploadPhotoView> createState() => _UploadPhotoViewState();
}

class _UploadPhotoViewState extends State<UploadPhotoView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Locator.sl<UploadImageCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.upload_photo_appbar_title.tr()),
        ),
        body: const _UploadPhotoViewBody(),
      ),
    );
  }
}

@immutable
final class _UploadPhotoViewBody extends StatefulWidget {
  const _UploadPhotoViewBody();

  @override
  State<_UploadPhotoViewBody> createState() => _UploadPhotoViewBodyState();
}

class _UploadPhotoViewBodyState extends State<_UploadPhotoViewBody> with Dialogs, UploadPhotoViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        return BlocListener<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            if (state is UploadImageSuccessWithFile) {
              setState(() {
                selectedImage = state.imageFile;
              });
            } else if (state is UploadImageFailure) {
              showErrorDialog(context, state.message);
            }
          },
          child: Padding(
            padding: AppPadding.horizontalThirtyNine(),
            child: Column(
              children: [
                VerticalSpace.fifty(),
                Text(
                  LocaleKeys.upload_photo_title.tr(),
                  style: context.general.appTheme.textTheme.displayLarge,
                ),
                VerticalSpace.s(),
                Text(
                  LocaleKeys.upload_photo_explain.tr(),
                  textAlign: TextAlign.center,
                  style: context.general.appTheme.textTheme.bodyLarge,
                ),
                VerticalSpace.fortySeven(),
                _SelectPhotoButton(
                  onTap: onTapUploadButton,
                  image: selectedImage,
                ),
                VerticalSpace.twoHundredFifty(),
                SizedBox(
                  height: 50.h,
                  child: CustomButton(
                    onPressed: (state is UploadImageLoading || selectedImage == null) ? null : onTapContinueButton,
                    child: state is UploadImageLoading
                        ? const CustomLoading()
                        : Text(LocaleKeys.upload_photo_button.tr()),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

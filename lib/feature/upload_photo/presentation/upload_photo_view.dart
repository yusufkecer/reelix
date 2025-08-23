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
@RoutePage(name: 'UploadPhotoView')
final class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Locator.sl<UploadImageCubit>(),
      child: const Scaffold(
        body: _UploadPhotoViewBody(),
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

class _UploadPhotoViewBodyState extends State<_UploadPhotoViewBody>
    with Dialogs, UploadPhotoViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        return BlocListener<UploadImageCubit, UploadImageState>(
          listener: (context, state) {
            if (state is UploadImageSuccessWithFile) {
              selectedImage = state.imageFile;
            } else if (state is UploadImageFailure) {
              showErrorDialog(context, state.message);
            }
          },
          child: Column(
            children: [
              VerticalSpace.fifty(),
              CustomAppBar(title: LocaleKeys.upload_photo_appbar_title.tr()),
              Padding(
                padding: AppPadding.horizontalThirtyNine(),
                child: Column(
                  children: [
                    VerticalSpace.thirtyFive(),
                    Text(
                      LocaleKeys.upload_photo_title.tr(),
                      style: context.general.appTheme.textTheme.displayLarge,
                    ),
                    VerticalSpace.xs(),
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
                      height: SizeValues.fifty.value.h,
                      width: context.sized.width,
                      child: CustomButton(
                        onPressed: (state is UploadImageLoading)
                            ? null
                            : onTapContinueButton,
                        child: Text(LocaleKeys.upload_photo_button.tr()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

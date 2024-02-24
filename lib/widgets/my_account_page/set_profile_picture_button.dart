import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/my_account_cubit.dart';

class SetProfilePictureButton extends StatelessWidget {
  const SetProfilePictureButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 26,
      child: InkWell(
        child: const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.camera_alt_rounded,
            color: Colors.black,
          ),
        ),
        onTap: () async {
          await showDialog<ImageSource>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Select a photo source'),
              actions: [
                TextButton(
                  child: const Text('Gallery'),
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                ),
                TextButton(
                  child: const Text('Camera'),
                  onPressed: () => Navigator.pop(context, ImageSource.camera),
                ),
              ],
            ),
          ).then((imageSource) {
            if (imageSource != null) {
              context
                  .read<MyAccountCubit>()
                  .selectImage(imageSource: imageSource);
            }
          });
        },
      ),
    );
  }
}

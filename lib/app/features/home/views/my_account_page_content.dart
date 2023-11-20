import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/my_account_cubit.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'package:this_is_your_training/components/profile_picture2.dart';
import 'package:this_is_your_training/app/features/widgets/my_account_page/delete_account_button.dart';
import 'package:this_is_your_training/app/features/widgets/my_account_page/logout_button.dart';
import 'package:this_is_your_training/app/features/widgets/my_account_page/set_profile_picture_button.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyAccountCubit>(
      create: (context) => getIt(),
      child: BlocBuilder<MyAccountCubit, MyAccountState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              title: const Text(
                'Profile',
              ),
              centerTitle: true,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 140, 74, 253),
                    Color.fromARGB(255, 134, 67, 250),
                    Color.fromARGB(255, 143, 78, 254),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 137, 72, 248),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(4, 8)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          const Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 95,
                                backgroundColor: Colors.white,
                                child: ProfilePicture2(
                                  radius: 90,
                                ),
                              ),
                              SetProfilePictureButton(),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              if (state.selectedImage != null) {
                                context
                                    .read<MyAccountCubit>()
                                    .uploadImage(state.selectedImage!)
                                    .then((downloadURL) {
                                  context
                                      .read<MyAccountCubit>()
                                      .setAvatarUrl(downloadURL);
                                }).catchError((error) {});
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 40,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 42, 44, 87),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Logged in as: $email',
                            style: TextStyle(color: Colors.deepPurple[200]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 135),
                  const LogoutButton(),
                  const SizedBox(height: 30),
                  const DeleteAccountButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

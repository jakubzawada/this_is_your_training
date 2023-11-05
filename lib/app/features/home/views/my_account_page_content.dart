import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/app.dart';
import 'package:this_is_your_training/app/cubit/root_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/my_account_cubit.dart';
import 'package:this_is_your_training/app/injection_container.dart';
import 'package:this_is_your_training/components/profile_picture2.dart';

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
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              const CircleAvatar(
                                radius: 95,
                                backgroundColor: Colors.white,
                                child: ProfilePicture2(
                                  radius: 90,
                                ),
                              ),
                              Positioned(
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
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title:
                                            const Text('Select a photo source'),
                                        actions: [
                                          TextButton(
                                            child: const Text('Gallery'),
                                            onPressed: () => Navigator.pop(
                                                context, ImageSource.gallery),
                                          ),
                                          TextButton(
                                            child: const Text('Camera'),
                                            onPressed: () => Navigator.pop(
                                                context, ImageSource.camera),
                                          ),
                                        ],
                                      ),
                                    ).then((imageSource) {
                                      if (imageSource != null) {
                                        context
                                            .read<MyAccountCubit>()
                                            .selectImage(
                                                imageSource: imageSource);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 4,
                            child: InkWell(
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
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Logged in as: $email',
                            style: TextStyle(color: Colors.deepPurple[200]),
                          ),
                          const SizedBox(height: 155),
                          InkWell(
                            onTap: () {
                              context.read<RootCubit>().signOut();
                            },
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple[200],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Confirmation'),
                                    content: const Text(
                                        'Are you sure you want to delete your account?'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      BlocProvider<MyAccountCubit>(
                                        create: (context) => getIt(),
                                        child: BlocBuilder<MyAccountCubit,
                                            MyAccountState>(
                                          builder: (context, state) {
                                            return TextButton(
                                              onPressed: () async {
                                                context
                                                    .read<MyAccountCubit>()
                                                    .deleteAccount();

                                                final state = context
                                                    .read<MyAccountCubit>()
                                                    .state;
                                                if (state.user != null) {
                                                  try {
                                                    state.user?.delete();
                                                    bool success = true;
                                                    if (success) {
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const RootPage()),
                                                      );
                                                    }
                                                  } catch (e) {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Error'),
                                                          content: Text(
                                                              'An error occurred while deleting the account: $e'),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: const Text(
                                                                  'OK'),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                }
                                              },
                                              child: const Text('Delete'),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 194, 68, 59),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete_sharp,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Delete account',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

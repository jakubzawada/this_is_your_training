import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/app.dart';
import 'package:this_is_your_training/app/cubit/root_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:this_is_your_training/app/features/home/views/cubit/my_account_cubit.dart';
import 'package:this_is_your_training/components/profile_picture.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyAccountCubit(),
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
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 158, 108, 238),
                    Color.fromARGB(255, 111, 60, 193),
                    Colors.deepPurple,
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
                                radius: 85,
                                backgroundColor: Colors.white,
                                child: ProfilePicture(
                                  radius: 80,
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
                                    final imageSource =
                                        await showDialog<ImageSource>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                            'Wybierz źródło zdjęcia'),
                                        actions: [
                                          TextButton(
                                            child: const Text('Galeria'),
                                            onPressed: () => Navigator.pop(
                                                context, ImageSource.gallery),
                                          ),
                                          TextButton(
                                            child: const Text('Aparat'),
                                            onPressed: () => Navigator.pop(
                                                context, ImageSource.camera),
                                          ),
                                        ],
                                      ),
                                    );

                                    final myAccountCubit =
                                        // ignore: use_build_context_synchronously
                                        BlocProvider.of<MyAccountCubit>(
                                            context);
                                    myAccountCubit.selectImage(
                                        imageSource: imageSource);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 4,
                            child: InkWell(
                              onTap: () {
                                DocumentsRepository repository =
                                    DocumentsRepository();
                                if (state.selectedImage != null) {
                                  repository
                                      .uploadImage(state.selectedImage!)
                                      .then((downloadURL) {})
                                      .catchError((error) {});
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
                                      'Zapisz',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
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
                            'Zalogowany jako: $email',
                            style: TextStyle(color: Colors.deepPurple[200]),
                          ),
                          const SizedBox(height: 140),
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
                                        'Wyloguj',
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
                                    title: const Text('Potwierdzenie'),
                                    content: const Text(
                                        'Czy na pewno chcesz usunąć swoje konto?'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Anuluj'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      BlocProvider(
                                        create: (context) => MyAccountCubit(),
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
                                                    await state.user?.delete();
                                                    bool success = true;
                                                    if (success) {
                                                      // ignore: use_build_context_synchronously
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
                                                              'Błąd'),
                                                          content: Text(
                                                              'Wystąpił błąd podczas usuwania konta: $e'),
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
                                              child: const Text('Usuń'),
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
                                      'Usuń konto',
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

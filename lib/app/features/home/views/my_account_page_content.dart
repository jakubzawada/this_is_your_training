import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/app.dart';
import 'package:this_is_your_training/app/cubit/root_cubit.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:this_is_your_training/components/profile_picture.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class MyAccountPageContent extends StatefulWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  State<MyAccountPageContent> createState() => _MyAccountPageContentState();
}

class _MyAccountPageContentState extends State<MyAccountPageContent> {
  List<String> backgroundImages = [
    'https://img.freepik.com/free-photo/young-fitness-man-studio_7502-5008.jpg?size=626&ext=jpg&ga=GA1.2.87063883.1686850499&semt=ais',
    'https://img.freepik.com/free-photo/strong-man-training-gym_1303-23478.jpg?size=626&ext=jpg&ga=GA1.2.87063883.1686850499&semt=ais',
    'https://img.freepik.com/free-photo/woman-holding-weights-near-barbells_651396-1617.jpg?size=626&ext=jpg&ga=GA1.2.87063883.1686850499&semt=ais',
    'https://img.freepik.com/free-photo/athletic-man-woman-with-dumbbells_155003-11801.jpg?size=626&ext=jpg&ga=GA1.2.87063883.1686850499&semt=ais',
  ];
  int selectedBackgroundIndex = 0;

  File? _selectedImage;
  final imagePicker = ImagePicker();
  String? downloadURL;
  late Stream<String?> imagesStream;

  @override
  void initState() {
    super.initState();
    imagesStream = DocumentsRepository().getLatestImageStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
            children: [
              Stack(alignment: Alignment.center, children: [
                buildCoverImage(),
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
                            )),
                        onTap: () {
                          imagePickerMethod();
                        },
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 4,
                  child: InkWell(
                    onTap: () {
                      DocumentsRepository repository = DocumentsRepository();
                      if (_selectedImage != null) {
                        repository
                            .uploadImage(_selectedImage!)
                            .then((downloadURL) {
                          // Tutaj możesz wykorzystać zmienną downloadURL po przesłaniu obrazka
                        }).catchError((error) {
                          // Obsłuż błąd, jeśli wystąpił
                        });
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
                            'Zapisz ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  child: buildBackgroundButtons(),
                ),
              ]),
              const SizedBox(height: 160),
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
                  showConfirmationDialog();
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
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCoverImage() {
    String selectedImageUrl = backgroundImages[selectedBackgroundIndex];

    return Container(
      color: Colors.grey,
      child: Image.network(
        selectedImageUrl,
        width: double.infinity,
        height: 320,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildBackgroundButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(backgroundImages.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedBackgroundIndex = index;
            });
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selectedBackgroundIndex == index
                    ? Colors.white
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: ClipOval(
              child: Image.network(
                backgroundImages[index],
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }),
    );
  }

  void saveSelectedBackgroundToDatabase(String selectedBackgroundUrl) {
    final database = FirebaseDatabase.instance;
    final user = FirebaseAuth.instance.currentUser;

    // Tworzenie referencji do węzła przechowującego informacje o tle użytkownika
    DatabaseReference backgroundRef =
        database.ref().child('users/${user!.uid}/background');

    // Zapisywanie wybranego tła
    backgroundRef.set(selectedBackgroundUrl);
  }

  Future<void> imagePickerMethod() async {
    final imageSource = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Wybierz źródło zdjęcia'),
        actions: [
          TextButton(
            child: const Text('Galeria'),
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
          ),
          TextButton(
            child: const Text('Aparat'),
            onPressed: () => Navigator.pop(context, ImageSource.camera),
          ),
        ],
      ),
    );

    if (imageSource != null) {
      final pickedImage = await ImagePicker().pickImage(source: imageSource);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
        });
      }
    }
  }

  void deleteAccount() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.delete();
        bool success = true;
        if (success && mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const RootPage()),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Błąd'),
              content: Text('Wystąpił błąd podczas usuwania konta: $e'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Potwierdzenie'),
          content: const Text('Czy na pewno chcesz usunąć swoje konto?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Anuluj'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: deleteAccount,
              child: const Text('Usuń'),
            ),
          ],
        );
      },
    );
  }
}

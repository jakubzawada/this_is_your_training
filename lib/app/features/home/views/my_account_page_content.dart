import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:this_is_your_training/app/cubit/root_cubit.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:this_is_your_training/components/profile_picture.dart';
import 'package:this_is_your_training/repositories/documents_repository.dart';

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 85,
                    backgroundColor: Colors.deepPurple[200],
                    child: const ProfilePicture(
                      radius: 80,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 35,
                    child: InkWell(
                      child: const Icon(Icons.camera_alt_rounded),
                      onTap: () {
                        imagePickerMethod();
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  DocumentsRepository repository = DocumentsRepository();
                  if (_selectedImage != null) {
                    repository.uploadImage(_selectedImage!).then((downloadURL) {
                      // Tutaj możesz wykorzystać zmienną downloadURL po przesłaniu obrazka
                    }).catchError((error) {
                      // Obsłuż błąd, jeśli wystąpił
                    });
                  }
                },
                child: const Text('Upload Image'),
              ),
              const SizedBox(height: 20),
              Container(
                width: 340,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 35, 38, 97),
                      Color.fromARGB(255, 42, 44, 87),
                      Color(0xFF232441),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(4, 8)),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${widget.email}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<RootCubit>().signOut();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent),
                child: const Text(
                  'Wyloguj',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {},
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
}

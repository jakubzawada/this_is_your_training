import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) {}
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const MakroPageContent();
        }
        if (currentIndex == 1) {
          return const TrainingPageContent();
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          iconSize: 30,
          selectedIconTheme: const IconThemeData(
            color: Color(0xFF200087),
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.black12,
          ),
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.local_dining),
              ),
              label: 'Jadłospis',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.fitness_center),
              ),
              label: 'Trening',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              label: 'Moje konto',
            ),
          ],
        ),
      ),
    );
  }
}

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Jesteś zalogowany jako $email'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text('Wyloguj'),
          ),
        ],
      ),
    );
  }
}

class TrainingPageContent extends StatelessWidget {
  const TrainingPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Dwa'),
    );
  }
}

class MakroPageContent extends StatelessWidget {
  const MakroPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: height * 0.38,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey,
              height: height * 0.09,
            ),
          ),
          Positioned(
            top: height * 0.5,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey,
              height: height * 0.09,
            ),
          ),
          Positioned(
            top: height * 0.62,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey,
              height: height * 0.09,
            ),
          ),
          Positioned(
            top: height * 0.74,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey,
              height: height * 0.09,
            ),
          ),
        ],
      ),
    );
  }
}

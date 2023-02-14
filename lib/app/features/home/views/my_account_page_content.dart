import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                  image: AssetImage('images/Profile.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 340,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black12),
                color: const Color(0xFF232441),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Text(
                '$email',
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
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
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
              onTap: () async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .delete();

                try {
                  await FirebaseAuth.instance.currentUser!.delete();
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'requires-recent-login') {
                    const Text(
                        'The user must reauthenticate before this operation can be executed.');
                  }
                }
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
    );
  }
}

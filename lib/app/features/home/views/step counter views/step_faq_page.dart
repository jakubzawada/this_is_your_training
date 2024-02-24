import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepFaqPage extends StatelessWidget {
  const StepFaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.deepPurple),
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
              Color.fromARGB(255, 174, 133, 244),
              Colors.white,
            ],
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                'FAQ',
                style: GoogleFonts.bebasNeue(
                  fontSize: 50,
                  color: Colors.black,
                  letterSpacing: 1.8,
                ),
              ),
            ),
            const FaqTile(
              question: 'Liczenie podczas jazdy samochodem?',
              answer:
                  'Niekiedy podczas jazdy samochodem lub innym środkiem transportu system może zczytywać kroki, z powodu ograniczeń systemowych.\n\n'
                  'Zalecamy podczas jazdy środkami transportu użycie przycisku PAUZY, aby wstrzymać licznik kroków.',
            ),
            const FaqTile(
              question: 'Liczenie podczas potrząsania telefonem?',
              answer:
                  'Naliczanie kroków podczas potrząsanie telefonem jest spowodowane działaniem wbudowanego czujnika ruchu w telefonie. ',
            ),
            const FaqTile(
              question:
                  'Resetowanie się licznika po ponownym uruchomieniu telefonu?',
              answer: 'Licznik kroków korzysta z wbudowanych sensorów.\n\n'
                  'Dane są przechowywywane tymczasowo w pamięci urządzenia, więc gdy następuje ponowne uruchomienie telefonu, te dane zostają wyczyszczone, co powoduje zresetowanie licznika kroków. \n\n'
                  'Cały czas pracujemy nasd rozwiązaniem tego problemu. Przepraszamy za wszelkie związane z tym niedogodności',
            ),
            const FaqTile(
              question: 'Liczba kroków nie zczytuje się do wykresu kroków?',
              answer:
                  'Dane na temat kroków, są zczytywane do bazy danych podczas korzystania z aplikacji. \n\n'
                  'Aby dane zczytały się prawidło do wykresu kroków zalecamy odpalenie aplikacji. \n\n'
                  'Cały czas pracujemy nasd rozwiązaniem tego problemu. Przepraszamy za wszelkie związane z tym niedogodności',
            ),
            const FaqTile(
              question: 'Jaka jest dokładność licznika kroków?',
              answer:
                  'Używamy wbudowanego czujnika w telefonie, który za pomocą sensorów śledzi ruch i określa liczbę kroków. ',
            ),
            const FaqTile(
              question: 'Spalane kalorie i przebyty dystans',
              answer:
                  'Aktualnie obliczamy spalane kalorie i przebyty dystans uśredniając dane dla przeciętnej osoby. \n\n'
                  'Stale pracujemy nad tym, aby dodać obliczanie spalanych kalorii i przebytego dystansu na podstawie, ustawienia wagi oraz wzrostu ',
            ),
          ],
        ),
      ),
    );
  }
}

class FaqTile extends StatefulWidget {
  final String question;
  final String answer;

  const FaqTile({
    required this.question,
    required this.answer,
    Key? key,
  }) : super(key: key);

  @override
  FaqTileState createState() => FaqTileState();
}

class FaqTileState extends State<FaqTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          title: Text(
            widget.question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          trailing: _isExpanded
              ? const Icon(Icons.keyboard_arrow_up)
              : const Icon(Icons.keyboard_arrow_down),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.answer,
            ),
          ),
      ],
    );
  }
}

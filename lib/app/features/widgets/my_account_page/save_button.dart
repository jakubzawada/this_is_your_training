import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final Function()? onPressed;

  const SaveButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
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
    );
  }
}

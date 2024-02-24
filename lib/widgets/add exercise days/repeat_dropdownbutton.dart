import 'package:flutter/material.dart';

class RepeatDropdownButton extends StatelessWidget {
  const RepeatDropdownButton({
    super.key,
    required this.items2,
    required this.value,
    required this.onChanged,
  });

  final List<String> items2;
  final int? value;
  final Function(int?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 3,
              color: Color(0xFF232441),
            ),
          ),
        ),
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        value: value,
        dropdownColor: Colors.deepPurple.shade200,
        items: List.generate(
          items2.length,
          (index) => DropdownMenuItem<int>(
            value: int.parse(items2[index]),
            child: Text(items2[index]),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

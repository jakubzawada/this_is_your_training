import 'package:flutter/material.dart';

class SeriesDropdownButton extends StatelessWidget {
  const SeriesDropdownButton({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  final List<String> items;
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
          items.length,
          (index) => DropdownMenuItem<int>(
            value: int.parse(items[index]),
            child: Text(items[index]),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

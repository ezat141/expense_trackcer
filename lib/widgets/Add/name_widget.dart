import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  final String? selectedItem;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const NameWidget({
    super.key,
    required this.selectedItem,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xffC5C5C5), width: 2),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Row(
                    children: [
                      Text(e, style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              )
              .toList(),
          hint: const Text(
            'Name',
            style: TextStyle(color: Color(0xffC5C5C5)),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

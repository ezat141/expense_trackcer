import 'package:flutter/material.dart';

class SaveWidget extends StatelessWidget {
  final VoidCallback onSave;
  final bool isDarkMode;

  const SaveWidget({
    super.key,
    required this.onSave, required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSave,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff368983),
        ),
        width: 120,
        height: 50,
        child: Text(
          'Save',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isDarkMode?  Colors.black : Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

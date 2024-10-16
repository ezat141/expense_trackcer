import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final bool isDarkMode;
  const BackgroundContainer({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child:  Icon(Icons.arrow_back, color: isDarkMode?  Colors.black: Colors.white,),
                    ),
                    Text(
                      'Adding',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode?  Colors.black : Colors.white,),
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: isDarkMode?  Colors.black : Colors.white
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

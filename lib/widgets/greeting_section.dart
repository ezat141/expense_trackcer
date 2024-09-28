
import 'package:flutter/material.dart';
import 'package:test_ui/core/utils/styles.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
              color: Color(0xff429690),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Stack(
            children: [
              Positioned(
                top: 35,
                left: 340,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.67),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.white.withOpacity(0.05999999865889549),
                      child: const Icon(
                        Icons.notification_add_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good afternoon',
                      style: Styles.style14,
                    ),
                    Text(
                      'Ezzat Mohamed',
                      style: Styles.style20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

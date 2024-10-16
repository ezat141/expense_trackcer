import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_ui/widgets/bottomnavigationbar.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  // @override
  // void initState() {
  //   super.initState();
  //   // Simulate a delay, then navigate to Bottom widget
  //   Future.delayed(Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => Bottom()),
  //     );
  //   });
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _checkFirstLaunch();
  // }


  // void _checkFirstLaunch() async{
  //   var settingsBox = await Hive.box('settingsBox');
  //   bool isFirstLaunch = settingsBox.get('isFirstLaunch', defaultValue: true);

  //   if (isFirstLaunch) {
  //     Future.delayed(Duration(seconds: 3), () {
  //       // Set first launch as false after showing splash
  //       settingsBox.put('isFirstLaunch', false);
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => Bottom()),
  //       );
  //     });
  //   } else {
  //     // Directly navigate to the main screen if not the first launch
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => Bottom()),
  //     );

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Group 38.png',
                height: 400), // Adjust the height and image path
            SizedBox(height: 20),
            Text(
              "Spend Smarter\nSave More",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF438883),
                fontSize: 36,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => Bottom()));
            //   },
            //   style: ElevatedButton.styleFrom(
                
            //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //   ),
            //   child: Text(
            //     "Get Started",
            //     style: TextStyle(fontSize: 18, color: Colors.teal),
            //   ),
            // ),

            GestureDetector(
              onTap: () {
                
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Bottom()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  width: 358,
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF68AEA9), Color(0xFF3E8681)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.12,
                          letterSpacing: -0.36,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_ui/cubits/settings_cubit/settings_cubit.dart';
import 'package:test_ui/views/about.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(height: 200, color: Colors.teal),
          Positioned(
              top: 160,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[100],
                  backgroundImage: const AssetImage("assets/images/avatar.png"),
                ),
              )),
        ]),
        const SizedBox(height: 100),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              BlocBuilder<SettingsCubit, bool>(
                builder: (context, isDarkMode) {
                  return ListTile(
                    // onTap: () {},
                    trailing: Switch(
                        onChanged: (val) {
                          BlocProvider.of<SettingsCubit>(context)
                              .toggleDarkMode();
                        },
                        value: isDarkMode,
                        activeColor: Colors.teal),
                    title: const Text("Dark Mode"),
                  );
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
                },
                trailing: const Icon(Icons.help_outline_rounded),
                title: const Text("About us"),
              ),
              ListTile(
                onTap: () async {
                  await launchUrl(Uri.parse('tel: +201068185275'));
                },
                trailing: const Icon(Icons.phone_callback_outlined),
                title: const Text("Contact us"),
              ),
            ]),
          ),
        )
      ],
    );
  }
}

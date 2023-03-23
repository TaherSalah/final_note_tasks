import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:new_task/screens/calendar/calendar_screen.dart';
import 'package:new_task/shard/cubit/cubit.dart';
import 'package:new_task/shard/cubit/states.dart';
import 'package:new_task/shard/widgets/navigators.dart';
import '../../shard/widgets/my_divider.dart';
import '../about/about_us.dart';
import '../help/help_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ListView(
              children: [
                // User card

                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'General Settings',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

                myDivider(),
                const SizedBox(
                  height: 8,
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Theme Mode',
                  subtitle: isDark ? "Dark Mode" : 'Night Mode',
                  subtitleStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: Colors.grey),
                  titleStyle: Theme.of(context).textTheme.bodyLarge,
                  trailing: Switch.adaptive(
                    value: isDark,
                    onChanged: (value) {
                      setState(() {
                        isDark = value;
                        ThemeCubit.get(context).changeMode();
                        // ignore: avoid_print
                        print(value);
                      });
                    },
                  ),
                ),
                SettingsItem(
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    navigate(context, const  CalendarScreen());
                  },
                  icons: Icons.calendar_month_sharp,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  subtitleStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: Colors.grey),
                  titleStyle: Theme.of(context).textTheme.bodyLarge,
                  title: 'Calendar',
                  subtitle: "Calendar Table",
                ),

                SettingsItem(
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    navigate(context, const AboutScreen());
                  },
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.teal
                    ,
                  ),
                  subtitleStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: Colors.grey),
                  titleStyle: Theme.of(context).textTheme.bodyLarge,
                  title: 'About Us  ',
                  subtitle: "Know more about us",
                ),
                SettingsItem(
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    navigate(context, const HelpScreen());
                  },
                  icons: CupertinoIcons.question_circle,
                  iconStyle: IconStyle(),
                  subtitleStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: Colors.grey),
                  titleStyle: Theme.of(context).textTheme.bodyLarge,
                  title: 'Help',
                  subtitle: "Provide more assistance for using the program",
                ),
                const SizedBox(
                  height: 15,
                ),
                myDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    'Account Setting',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                // You can add a settings title
                SettingsItem(
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                  onTap: () {},
                  icons: Icons.exit_to_app_rounded,
                  iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      backgroundColor: Colors.greenAccent),
                  title: "Sign out",
                  subtitleStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: Colors.grey),
                  titleStyle: Theme.of(context).textTheme.bodyLarge,
                ),
                SettingsItem(
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  iconStyle: IconStyle(
                      iconsColor: Colors.white, backgroundColor: Colors.red),
                  title: "Delete Account",
                  subtitleStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 12, color: Colors.grey),
                  titleStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

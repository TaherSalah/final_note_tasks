import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_task/screens/on_boarding/on_boarding_screen.dart';
import 'package:new_task/screens/splash/splash_screen.dart';
import 'package:new_task/shard/components/theme.dart';
import 'package:new_task/shard/cubit/states.dart';
import 'package:new_task/shard/network/cachHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shard/cubit/cubit.dart';
import 'model/todo_model.dart';

const String todoBoxName = "todos";
int? initalScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
 initalScreen= sharedPreferences.getInt('initalScreen');
  sharedPreferences.setInt('initalScreen', 1);
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<TodoModel>(todoBoxName);
  runApp(const MyApp());
}

bool? isDark = CacheHelper.getBoolean(key: 'isDark');

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({Key? key, this.isDark = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()..getBox()),
        BlocProvider(
            create: (context) => ThemeCubit()..changeMode(fromShard: isDark)),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: ThemeCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
                initialRoute: initalScreen == 0 || initalScreen == null? 'onBoardingScreen' : 'splashScreen',
                routes: {
                  'onBoardingScreen' :(context)=> const OnBoardingScreen(),
                  'splashScreen' : (context)=>  const SplashScreen()
                },
          );
        },
      ),
    );
  }
}

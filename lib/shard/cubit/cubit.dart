import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_task/shard/cubit/states.dart';
import '../../model/todo_model.dart';
import '../../screens/add_notes/add_notes_screen.dart';
import '../../screens/home/all_tasks_screen.dart';
import '../../screens/archived/archives_screen.dart';
import '../../screens/done/done_screen.dart';
import '../../screens/settings/settings_screen.dart';
import '../network/cachHelper.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(InitialAppState());

  static TodoCubit get(context) => BlocProvider.of(context);

  // controllers

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  // date time picker
  var initalDate = DateTime.now();

  setDate(BuildContext context) {
    showDatePicker(
      context: context,
      currentDate: initalDate,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      if (value != null) {
        initalDate = value;
      }
      emit(SetDateState());
    });
  }

  List<TodoModel>? todosList = [];
  List<int>? keys = [];

  getBox() async {
    var box = await Hive.openBox<TodoModel>('todos');
    keys = [];
    keys = box.keys.cast<int>().toList();
    todosList = [];
    for (var key in keys!) {
      todosList!.add(box.get(key)!);
    }
    box.close();
    emit(GetBobState());
  }

  addTodo(TodoModel todoModel) async {
    await Hive.openBox<TodoModel>('todos')
        .then((value) => value.add(todoModel))
        .then(
          (value) => getBox(),
        );
    emit(AddTotodosListState());
  }

  updateTodo(TodoModel todoModel) async {
    await Hive.openBox<TodoModel>('todos').then((value) {
      final Map<dynamic, TodoModel> todoMap = value.toMap();
      dynamic desiredKey;
      todoMap.forEach((key, value) {
        if (value.title == todoModel.title) {
          desiredKey = key;
        }
      });
      return value.put(desiredKey, todoModel);
    }).then(
      (value) => getBox(),
    );
  }

  deleteTodo(TodoModel todoModel) async {
    await Hive.openBox<TodoModel>('todos').then((value) {
      final Map<dynamic, TodoModel> todoMap = value.toMap();
      dynamic desiredKey;
      todoMap.forEach((key, value) {
        if (value.title == todoModel.title) {
          desiredKey = key;
        }
      });
      return value.delete(desiredKey);
    }).then(
      (value) => getBox(),
    );
  }

  clearController() {
    descriptionController.clear();
    titleController.clear();
  }

  int currentIndex = 0;

  List<Widget> screens = [
    const AllTodosScreen(),
    const DoneScreen(),
    const AddNotesScreen(),
    const ArchivesScreen(),
    const SettingsScreen()
  ];
  List<String> screenTitles = [
    "All Notes",
    "Done",
    "Add Screen",
    "Archives",
    "Settings",
  ];

  setBottomIndex(int index) {
    currentIndex = index;
    emit(SetCurrentIndexAppState());
  }

///// Theme cubit ////

}

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(InitialThemeState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  ThemeMode darkTheme = ThemeMode.dark;

  void changeMode({bool? fromShard}) {
    if (fromShard != null) {
      isDark = fromShard;
      emit(ChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeState());
      });
    }
  }
}

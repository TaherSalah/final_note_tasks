import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:new_task/screens/add_notes/add_notes_screen.dart';
import 'package:new_task/shard/widgets/navigators.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';
import '../model/todo_model.dart';
import '../shard/widgets/def_navBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TodoCubit.get(context);
          bool isDark = false;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                cubit.screenTitles[cubit.currentIndex],
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.amber,
                    fontFamily: 'cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 2),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    navigate(context, const AddNotesScreen());
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      ThemeCubit.get(context).changeMode();
                      isDark = !isDark;
                    });
                  },
                  icon: const Icon(
                    Icons.brightness_4_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: defualtBottomNavigationBar(
                tabs: [
                  const GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  const GButton(
                    icon: Icons.done,
                    text: 'Done',
                  ),
                  const GButton(
                    icon: Icons.add,
                    text: 'Add',
                  ),
                  const GButton(
                    icon: Icons.archive_outlined,
                    text: 'Archived',
                  ),
                  const GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ],
                onTabChange: (value) {
                  cubit.setBottomIndex(value);
                },
                currentIndex: cubit.currentIndex,
                context: context),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.amberAccent,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    scrollable: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    title: Center(
                        child: Text(
                      'Add Short Task !',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.amber, fontFamily: 'cairo'),
                    )),
                    icon: Image.asset(
                      'assets/images/addNewNotes.png',
                      color: Theme.of(context).primaryColor,
                      width: 50,
                      height: 50,
                    ),
                    // To display the title it is optional
                    content: BlocBuilder<TodoCubit, TodoStates>(
                        builder: (context, state) {
                      return Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge,
                              controller: cubit.titleController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontFamily: 'cairo',
                                      fontSize: 16,
                                    ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily: 'cairo', fontSize: 16),
                                labelText: 'Task Title',
                                hintText: 'Enter your Task Title',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'hey Pro don\'\t leave it empty';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge,
                              controller: cubit.descriptionController,
                              // minLines: 10,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily: 'cairo', fontSize: 16),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontFamily: 'cairo', fontSize: 16),
                                labelText: 'Task Description',
                                hintText: 'Enter your Task Description',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'hey Pro don\'\t leave it empty';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.amber.withOpacity(0.8),
                                    maximumSize: Size.infinite),
                                onPressed: () {
                                  cubit.setDate(context);
                                },
                                icon: const Icon(Icons.date_range),
                                label: Text(
                                  // Formatted Date
                                  DateFormat.yMMMEd()

                                      // displaying formatted date
                                      .format(cubit.initalDate),
                                )),
                          ],
                        ),
                      );
                    }),
                    actions: [
                      Row(
                        children: [
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.withOpacity(0.8),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                cubit.clearController();
                              },
                              icon: const Icon(Icons.cancel),
                              label: const Text('Cancle',style: TextStyle(fontFamily: 'cairo',fontWeight: FontWeight.bold),)),
                          const SizedBox(
                            height: 20,
                          ),
                          const Spacer(),
                          ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.withOpacity(0.8),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.addTodo(TodoModel(
                                    title: cubit.titleController.text,
                                    description:
                                        cubit.descriptionController.text,
                                    date: cubit.initalDate,
                                    isDone: false,
                                    isArchived: false,
                                  ));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    showCloseIcon: true,
                                    content: Center(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.done),
                                          Text(
                                            '${cubit.titleController.text} Has been added To All Tasks',
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                    backgroundColor: Colors.green,
                                  ));
                                  Navigator.pop(context);

                                  cubit.clearController();
                                }
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Add',style: TextStyle(fontFamily: 'cairo',fontWeight: FontWeight.bold),)),
                        ],
                      )
                    ],
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
            ),
          );
        });
  }
}

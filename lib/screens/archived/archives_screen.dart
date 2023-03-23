import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shard/cubit/cubit.dart';
import '../../shard/cubit/states.dart';
import '../../model/todo_model.dart';
import '../../shard/widgets/todo_tile.dart';


class ArchivesScreen extends StatelessWidget {
  const ArchivesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoStates>(builder: (context, state) {
      var cubit = TodoCubit.get(context);
      List<TodoModel>? todosList = [];
      for (var item in cubit.todosList!) {
        if (item.isArchived) {
          todosList.add(item);
        }
      }
      return todosList.isEmpty
          ?  Center(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/arch.png',fit: BoxFit.cover),
            ],
          ),
        ),            )
          : ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20,),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CardBuilder(todoModel: todosList[index]),
                );
              },
              itemCount: todosList.length,
              shrinkWrap: true,
            );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../cubit/cubit.dart';
import '../../model/todo_model.dart';

// class TodoTile extends StatelessWidget {
//   const TodoTile({
//     required this.todoModel,
//     Key? key,
//   }) : super(key: key);
//   final TodoModel todoModel;
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit = TodoCubit.get(context);
//     return ListTile(
//       title: Row(
//         children: [
//           Text(todoModel.title),
//           const Spacer(),
//           IconButton(
//             icon: const Icon(Icons.delete),
//             color: Colors.red,
//             onPressed: () {
//               cubit.deleteTodo(todoModel);
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.arrow_back),
//             color: Colors.amber,
//             onPressed: () {
//               cubit.updateTodo(TodoModel(
//                 title: todoModel.title,
//                 description: todoModel.description,
//                 date: todoModel.date,
//                 isDone: false,
//                 isArchived: false,
//               ));
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.done),
//             color: Colors.green,
//             onPressed: () {
//               cubit.updateTodo(TodoModel(
//                 title: todoModel.title,
//                 description: todoModel.description,
//                 date: todoModel.date,
//                 isDone: true,
//                 isArchived: false,
//               ));
//             },
//           ),
//           IconButton(
//               onPressed: () {
//                 cubit.updateTodo(TodoModel(
//                   title: todoModel.title,
//                   description: todoModel.description,
//                   date: todoModel.date,
//                   isDone: false,
//                   isArchived: true,
//                 ));
//               },
//               icon: const Icon(
//                 Icons.book,
//               ))
//         ],
//       ),
//       subtitle: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(todoModel.description),
//             Text(
//               // Formatted Date
//               DateFormat.yMMMEd().format(todoModel.date),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CardBuilder extends StatefulWidget {
  const CardBuilder({Key? key, required this.todoModel}) : super(key: key);

  @override
  State<CardBuilder> createState() => _CardBuilderState();
  final TodoModel todoModel;
}

class _CardBuilderState extends State<CardBuilder> {
  @override
  Widget build(BuildContext context) {
    var cubit = TodoCubit.get(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 4),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Card(
            elevation: 1.8,
            color: const Color(0xfffaee9e),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Slidable(
                  startActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: ((context) {
                        setState(() {
                          cubit.updateTodo(TodoModel(
                            title: widget.todoModel.title,
                            description: widget.todoModel.description,
                            date: widget.todoModel.date,
                            isDone: true,
                            isArchived: false,
                          ));
                        });
                      }),
                      backgroundColor: Colors.blueAccent,
                      icon: Icons.check_box,
                      flex: 2,
                    ),
                    SlidableAction(
                      onPressed: ((context) {
                        cubit.updateTodo(TodoModel(
                          title: widget.todoModel.title,
                          description: widget.todoModel.description,
                          date: widget.todoModel.date,
                          isDone: false,
                          isArchived: true,
                        ));
                      }),
                      flex: 2,
                      backgroundColor: Colors.black,
                      icon: Icons.archive_outlined,
                    )
                  ]),
                  endActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: ((context) {
                        setState(() {
                          cubit.deleteTodo(widget.todoModel);
                        });
                      }),
                      backgroundColor: Colors.red,
                      flex: 3,
                      icon: Icons.delete_forever_outlined,
                    ),
                    // SlidableAction(
                    //   onPressed: ((context) {
                    //     setState(() {
                    //       // navigate(context, EditeScreen(notesModel: widget.todoModel,));
                    //     });
                    //   }),
                    //   backgroundColor: Colors.green,
                    //   flex: 3,
                    //   icon: Icons.edit,
                    // )
                  ]),
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 1,
                            widget.todoModel.title,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'cairo',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Text(
                            widget.todoModel.date.toString().split(" ")[0],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Colors.grey,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          textAlign: TextAlign.justify,
                          maxLines: widget.todoModel.description.hashCode,
                          widget.todoModel.description,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 17,
                              color: Colors.black,
                              fontFamily: 'cairo'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

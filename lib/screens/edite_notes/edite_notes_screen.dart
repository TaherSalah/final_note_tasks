// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:new_task/model/todo_model.dart';
// import 'package:new_task/shard/cubit/cubit.dart';
// import 'package:new_task/shard/cubit/states.dart';
//
// import '../../shard/widgets/button.dart';
// import '../../shard/widgets/custom_form_faild.dart';
//
// class EditeScreen extends StatefulWidget {
//   EditeScreen({Key? key, required this.notesModel}) : super(key: key);
//
//   @override
//   State<EditeScreen> createState() => _EditeScreenState();
//   final TodoModel notesModel;
// }
//
// class _EditeScreenState extends State<EditeScreen> {
//   String? title, subtitle;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<TodoCubit, TodoStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(
//               'Edite Notes',
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyText1!
//                   .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.only(top: 15.0),
//                     child: Text('Edit Your Note Now !!',
//                         style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                             fontSize: 20, fontWeight: FontWeight.bold))),
//                 Column(
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       height: 2,
//                       width: 30,
//                       color: Colors.amber,
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     Container(
//                       height: 2,
//                       width: 50,
//                       color: Colors.amber,
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     Container(
//                       height: 2,
//                       width: 30,
//                       color: Colors.amber,
//                     ),
//                   ],
//                 ),
//                 const Padding(
//                     padding: EdgeInsets.symmetric(
//                   vertical: 8,
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: CustomFormField(
//                     controller: TextEditingController(),
//                     hint: widget.notesModel.title,
//                     onChanged: (value) {
//                       title = value;
//                       setState(() {});
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: CustomFormField(
//                     hint: widget.notesModel.description,
//                     maxLines: 18,
//                     onChanged: (value) {
//                       subtitle = value;
//                       setState(() {});
//                     },
//                     controller: TextEditingController(),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: defaultButton(
//                     context: context,
//                     name: 'Save Change ',
//                     onPressed: () {
//                       widget.notesModel.title =
//                           title ?? widget.notesModel.title;
//                       widget.notesModel.description =
//                           subtitle ?? widget.notesModel.description;
//
//                       // widget.notesModel.();
//                       BlocProvider.of<TodoCubit>(context).updateTodo(TodoModel(
//                           title: widget.notesModel.title,
//                           description: widget.notesModel.description,
//                           date: DateTime.now(),
//                           isDone: false,
//                           isArchived: false,));
//                       Navigator.pop(context);
//
//                       setState(() {});
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:new_task/layout/home_screen.dart';
import 'package:new_task/model/todo_model.dart';
import 'package:new_task/shard/widgets/button.dart';
import 'package:new_task/shard/widgets/navigators.dart';
import '../../shard/cubit/cubit.dart';
import '../../shard/cubit/states.dart';
import '../../shard/widgets/custom_form_faild.dart';
import '../../shard/widgets/validation.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({Key? key}) : super(key: key);

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: SingleChildScrollView(child: AddNotesForm()),
    );
  }
}

class AddNotesForm extends StatefulWidget {
  const AddNotesForm({Key? key}) : super(key: key);

  @override
  State<AddNotesForm> createState() => _AddNotesFormState();
}

class _AddNotesFormState extends State<AddNotesForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        if (state is NotesSuccessState) {

          
        }
      },
      builder: (context, state) {
        var cubit = TodoCubit.get(context);
        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text('Add New Notes',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 25, fontWeight: FontWeight.bold))),
              Column(
                children: [
                  const SizedBox(
                    height: 10
                  ),
                  Container(
                    height: 3,
                    width: 30,
                    color: Colors.red
                  ),
                  const SizedBox(
                    height: 3
                  ),
                  Container(
                    height: 3,
                    width: 50,
                    color: Colors.amber
                  ),
                  const SizedBox(
                    height: 3
                  ),
                  Container(
                    height: 3,
                    width: 30,
                    color: Colors.red
                  ),
                ],
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(
                vertical: 8,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomFormField(
                  controller: cubit.titleController,

                  hint: 'Note Title',
                  onSaved: (value) {
                    title = value;
                    setState(() {});
                  },
                  onChanged: (value) {},
                  validator: Validator.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomFormField(

                  controller: cubit.descriptionController,
                  hint: 'Title Description',
                  maxLines: 10,
                  onSaved: (value) {
                    subTitle = value;
                    setState(() {});
                  },
                  onChanged: (value) {},
                  validator: Validator.name,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size.infinite,
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.all(15)),
                  onPressed: () {
                    cubit.setDate(context);
                  },
                  icon: const Icon(Icons.date_range),

                  label: Text(

                    // Formatted Date
                    DateFormat.yMMMEd()

                        // displaying formatted date
                        .format(cubit.initalDate),
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: defaultButton(
                  context: context,
                  name: 'Add Notes',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.addTodo(TodoModel(
                        title: cubit.titleController.text.toString(),
                        description:
                            cubit.descriptionController.text.toString(),
                        date: cubit.initalDate,
                        isDone: false,
                        isArchived: false,
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        showCloseIcon: true,

                        content: Center(

                          child: Row(
                            children: [
                              const Icon(Icons.done),
                              Text('${cubit.titleController.text} Has been added To All Tasks',textAlign: TextAlign.center,)
                            ],
                          ),
                        ),
                        backgroundColor: Colors.green,
                      ));
                      cubit.clearController();
                      navigateAndFinish(context, const HomeScreen());
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// class TrainingDialog extends StatelessWidget {
//   const TrainingDialog({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Dialog(
//       backgroundColor: Theme.of(context).cardColor,
//       insetPadding: EdgeInsets.symmetric(horizontal: 15),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
//         width: screenSize.width,
//         height:screenWidth<600? screenSize.height * 0.6:screenSize.height * 0.4,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Center(
//               child: TextWidget(
//                 title: 'قبل أن تبدأ',
//                 fontWeight: FontWeight.w600,
//                 fontSize: ResponsiveUtil.isTablet(context)?11.5.sp: 14.5.sp,
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             _buildChecklistItem(
//                 'انتبه للوقت، وحاول أن تنتهي من إجاباتك قبل نهاية الوقت',context),
//             _buildChecklistItem('اقرأ الأسئلة وفكر جيداً، ثم أجب',context),
//             _buildChecklistItem('افعل كل ما في وسعك للإجابة على كل الأسئلة',context),
//             _buildChecklistItem(
//                 'إذا لم تستطع الإجابة على السؤال يمكنك أن تخطيه والانتقال إلى السؤال التالي',context),
//             _buildChecklistItem('التأكد من اتصال حاسوبك الخاص بك بالإنترنت.',context),
//             _buildChecklistItem(
//                 'نتيجة الاختبار تظهر لك تلقائيا بعد الانتهاء من الإجابة على كافة الأسئلة وتأكبد تقديم الإجابة',context),
//             _buildChecklistItem(
//                 'في التدريب يمكنك الحصول على التغذية الراجعة لمعرفة إجاباتك الصحيحة والخطأ',context),
//             _buildChecklistItem(
//                 'في التدريب أيضا يمكنك عرض [شرح الإجابة] لكل سؤال',context),
//             const SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ButtonsWidgets.defButton(
//                     onTap: () {
//                       Navigator.pushNamed(context, Routes.questionRoute,
//                           arguments: examId);
//                       KStorage.i.setIsTraining(false);
//                     },
//                     buttonPadding:
//                     EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
//                     backgroundColor: KColors.greenColor,
//                     context: context,
//                     borderRadius: BorderRadius.circular(10.r),
//                     titleColor: KColors.whiteColor,
//                     fontSize: ResponsiveUtil.isTablet(context)?10.sp: 13.sp,
//                     fontWeight: FontWeight.w500,
//                     btnTitle: 'ابدأ الاختبار'),
//                 ButtonsWidgets.defButton(
//                     onTap: () {
//                       Navigator.pushNamed(context, Routes.trainingRoute,
//                           arguments: examId);
//                       KStorage.i.setIsTraining(true);
//                     },
//                     buttonPadding:
//                     EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
//                     backgroundColor: KColors.transparentColor,
//                     context: context,
//                     borderColor: KColors.blackColor,
//                     borderRadius: BorderRadius.circular(10.r),
//                     titleColor: KColors.primary,
//                     fontWeight: FontWeight.w500,
//                     fontSize:ResponsiveUtil.isTablet(context)?10.sp: 13.sp,
//                     btnTitle: 'تدرب أولاً'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildChecklistItem(String text ,BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             child: TextWidget(
//               title: text,
//               fontWeight: FontWeight.w400,
//               fontSize: screenWidth<600?12.5.sp:10.sp,
//               textAlign: TextAlign.right, // Align text to the right
//             ),
//           ),
//           const SizedBox(width: 8.0),
//           Icon(
//             Icons.check_circle,
//             color: KColors.greenColor.withOpacity(0.5),
//             size: 14.sp,
//           ),
//         ],
//       ),
//     );
//   }
// }



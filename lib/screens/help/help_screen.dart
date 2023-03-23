import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:new_task/model/help_model.dart';
import '../../shard/widgets/my_divider.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: Text(
            'Help Me',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.amber,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 2),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) =>
                  // ignore: prefer_is_empty
                  guidesImage.length > 0,
              widgetBuilder: (BuildContext context) => Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        Expanded(child: myDivider()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${titles[index]}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Expanded(child: myDivider()),
                      ],
                    ),
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: guidesImage.length,
                  itemBuilder: (context, index) =>
                      Image.asset('${guidesImage[index]}'),
                ),
              ),
              fallbackBuilder: (BuildContext context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ],
        ));
  }
}

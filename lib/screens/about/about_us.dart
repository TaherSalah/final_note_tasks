import 'package:flutter/material.dart';
import 'package:new_task/shard/components/constance.dart';
import 'package:new_task/shard/widgets/my_divider.dart';
import '../../shard/components/rat_bar.dart';
import '../../shard/components/social_media_icons.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 2,
        title: Text(
          'About Us',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: Colors.amber,
              fontFamily: 'cairo',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 2),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 130,
                width: 150,
                child: Image.asset(
                  'assets/images/logo_about.png',
                  height: 130,
                  width: 150,
                ),
              ),
            ),
            Text(
              'Note Tasks',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 25, letterSpacing: 2),
            ),
            Text('version : 1.0.0',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16.5,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.copyright_sharp,
                  size: 20,
                  color: Colors.grey,
                ),
                Text(
                  'All Rights Reseved by Dev Taher Salah \u{1f60e}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: myDivider()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'عن البرنامج',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Expanded(child: myDivider()),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      selectionColor: Colors.amber,
                      'برنامج Note Tasks هو رفيقك الاول في تسجيل مهامك اليومية ومتابعتها بشكل مستمر فمن خلاله تستطيع تسجيل كل ماتريد من ملاحظات يومية بكل سهولة ويسر دون خوف من ضياع هذة الملاحظات في اي وقت بشكل او باخر اترك لك تجربة ممتعه لهذا البرنامج واذا كان لديك اي اقتراحات لتطوير هذا البرنامج قم بمراسلتي من خلال روابط السوشيال ميديا الموجودة اسفل هذة الصفحة.',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.5, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(child: myDivider()),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            'تواصل معنا',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Expanded(child: myDivider()),
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                                left: BorderSide(
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                                right: BorderSide(
                                  color: Colors.grey.withOpacity(0.7),
                                ))),
                        // ignore: prefer_const_constructors
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: const SocialIcons(),
                        )),
                    Row(
                      children: [
                        Expanded(child: myDivider()),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            'تقييم التطبيق',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Expanded(child: myDivider()),
                      ],
                    ),
                    const RetBar(),
                    Row(
                      children: [
                        Expanded(child: myDivider()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'تطوير',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Expanded(child: myDivider()),
                      ],
                    ),
                    SizedBox(
                      child: Image.asset(
                        logo,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Text(
                      'Mobile Application Developer',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

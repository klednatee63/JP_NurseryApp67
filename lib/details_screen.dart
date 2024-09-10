import 'package:flutter/material.dart';
import 'package:jp_nursery_app/home.dart';

class DetailsScreen extends StatefulWidget {
  static const routeName = '/details_screen';

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final student = ModalRoute.of(context)!.settings.arguments as Student;

    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  child: Image.asset(
                    student.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: Text(
                          //  'เบอร์มือถือ :' + student.mobile.toString(),
                          'อายุ :' + student.age.toString() + ' ขวบ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: Text(
                          'ชื่อผู้ปกครอง :' + student.parentname.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: Text(
                          'เบอร์มือถือ :' + student.mobile.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jp_nursery_app/details_screen.dart';

class Student {
  String name;
  int age;
  String parentname;
  String mobile;
  String image;

  Student({
    required this.name,
    required this.age,
    required this.parentname,
    required this.mobile,
    required this.image,
  });
}

class Home extends StatefulWidget {
  Home({super.key});

  List<Student> students = [
    Student(
      name: '1 น้องกรวีย์',
      mobile: '081-7894561',
      parentname: 'สมยศ ใจมั่น',
      age: 4,
      image: 'images/student_01.jpg',
    ),
    Student(
      name: '2 น้องวิน',
      mobile: '081-7894562',
      parentname: 'นารี ใจดี',
      age: 4,
      image: 'images/student_02.jpg',
    ),
    Student(
      name: '3 น้องปีเตอร์',
      mobile: '081-7894563',
      parentname: 'นงลักษณ์ จักทอง',
      age: 4,
      image: 'images/student_03.jpg',
    ),
    Student(
      name: '4 ก้อย',
      mobile: '081-7894564',
      parentname: 'ผกากรอง แย้มยิ้ม',
      age: 3,
      image: 'images/student_04.jpg',
    ),
    Student(
      name: '5 น้องเจี๊ยบ',
      mobile: '081-7894565',
      parentname: 'ติ๋ม สมัครสมาน',
      age: 4,
      image: 'images/student_05.jpg',
    ),
    Student(
      name: '6 น้องตู่',
      mobile: '081-7894566',
      parentname: 'นงคราญ หาญกล้า',
      age: 4,
      image: 'images/student_06.jpg',
    ),
    Student(
      name: '7 น้องเลซี่',
      mobile: '081-7894567',
      parentname: 'จันทรา ปารณี',
      age: 4,
      image: 'images/student_01.jpg',
    ),
    Student(
      name: '8 น้องเต้',
      mobile: '081-7894568',
      parentname: 'จักรี ปรีเปรม',
      age: 4,
      image: 'images/student_02.jpg',
    ),
    Student(
      name: '9 น้องอ้อม',
      mobile: '081-7894569',
      parentname: 'ทอง ทันใจ',
      age: 3,
      image: 'images/student_03.jpg',
    ),
    Student(
      name: '10 น้องไมค์',
      mobile: '081-7894510',
      parentname: 'เกง เร่งรีบ',
      age: 5,
      image: 'images/student_04.jpg',
    ),
    Student(
      name: '11 น้องจี',
      mobile: '081-7894511',
      parentname: 'ขจร นอนเร็ว',
      age: 3,
      image: 'images/student_05.jpg',
    ),
    Student(
      name: '12 น้องภิงญา',
      mobile: '081-7894512',
      parentname: 'จักรี ปรีเปรม',
      age: 4,
      image: 'images/student_06.jpg',
    ),
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Japan Nursery App.'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: widget.students.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(DetailsScreen.routeName,
                arguments: (widget.students[index]));
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // แก้ไขปัญหา overflow ด้วยการใช้ mainAxisSize
              children: [
                Image.asset(
                  widget.students[index].image,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Text(widget.students[index].name),
                Text(widget.students[index].parentname.toString()),
                Text(widget.students[index].mobile.toString()),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            alignment: MainAxisAlignment.center,
            overflowSpacing: 5.0,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    shadowColor = !shadowColor;
                  });
                },
                icon: Icon(
                  shadowColor ? Icons.visibility_off : Icons.visibility,
                ),
                label: const Text('shadow color'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  if (scrolledUnderElevation == null) {
                    setState(() {
                      scrolledUnderElevation = 4.0;
                    });
                  } else {
                    setState(() {
                      scrolledUnderElevation = scrolledUnderElevation! + 1.0;
                    });
                  }
                },
                child: Text(
                  'scrolledUnderElevation: ${scrolledUnderElevation ?? 'default'}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

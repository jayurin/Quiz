import 'package:flutter/material.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Courses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CourseListScreen(),
    );
  }
}

class CourseListScreen extends StatefulWidget {
  @override
  _CourseListScreenState createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  List<Map<String, dynamic>> registeredCourses = [];

  // รายการคอร์สที่ให้เลือก
  List<Map<String, String>> courses = [
    {'name': 'คอร์ส ไทย', 'price': '2000'},
    {'name': 'คอร์ส จีน', 'price': '1500'},
    {'name': 'คอร์ส อังกฤษ', 'price': '1800'},
  ];

  void _navigateToScreen2(Map<String, dynamic> course) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Screen2(selectedCourse: course),
      ),
    );

    if (result != null) {
      setState(() {
        registeredCourses.add(result);
      });
    }
  }

  void _deleteCourse(Map<String, dynamic> course) {
    setState(() {
      registeredCourses.remove(course); // ลบข้อมูลที่เลือก
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("รายการคอร์สเรียน")),
      backgroundColor: const Color.fromARGB(255, 228, 226, 228),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(course['name']!,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text("ราคา: ${course['price']} บาท"),
                      trailing: ElevatedButton(
                        onPressed: () => _navigateToScreen2(course),
                        child: const Text("สมัครเรียน"),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen1(
                        registeredCourses: registeredCourses,
                        onDelete:
                            _deleteCourse), // ส่งฟังก์ชัน _deleteCourse ไปที่ Screen1
                  ),
                );
              },
              child: const Text("ดูข้อมูลที่สมัครแล้ว"),
            ),
          ],
        ),
      ),
    );
  }
}

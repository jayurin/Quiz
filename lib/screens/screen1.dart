import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  final List<Map<String, dynamic>> registeredCourses;
  final Function(Map<String, dynamic>) onDelete;

  const Screen1(
      {super.key, required this.registeredCourses, required this.onDelete});

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ข้อมูลที่สมัครแล้ว")),
      body: widget.registeredCourses.isEmpty
          ? const Center(child: Text("ไม่มีข้อมูลการสมัคร"))
          : ListView.builder(
              itemCount: widget.registeredCourses.length,
              itemBuilder: (context, index) {
                final course = widget.registeredCourses[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text("${course['name']} ${course['surname']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("คอร์ส: ${course['course']}"),
                        Text("ระดับ: ${course['level']}"),
                        Text("จำนวน: ${course['quantity']} คอร์ส"),
                        Text("เวลาที่สมัคร: ${course['timestamp']}"),
                        Text("รวมราคา: ${course['totalPrice']} บาท"),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // เรียกฟังก์ชัน onDelete พร้อมข้อมูลที่ต้องการลบ
                        widget.onDelete(course);
                        // รีเฟรชหน้าจอหลังจากลบ
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// lib/course/course.dart
class Course {
  final String name;
  final double price;
  final int duration; // ระยะเวลาเรียน (ชั่วโมง)

  Course({required this.name, required this.price, required this.duration});
}

// รายการคอร์สเรียน
List<Course> courses = [
  Course(name: "ภาษาไทย", price: 1000, duration: 30),
  Course(name: "ภาษาจีน", price: 2000, duration: 40),
  Course(name: "ภาษาอังกฤษ", price: 3000, duration: 50),
];

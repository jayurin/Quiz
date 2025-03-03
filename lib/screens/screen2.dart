import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final Map<String, dynamic> selectedCourse;

  const Screen2({super.key, required this.selectedCourse});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _quantityController = TextEditingController();
  String? selectedLevel;
  final int pricePerCourse = 1000; // กำหนดราคาต่อคอร์ส

  void _submitForm() {
    int quantity = int.tryParse(_quantityController.text) ?? 0;

    if (selectedLevel != null && quantity > 0) {
      int totalPrice = quantity * pricePerCourse;
      String timestamp = DateTime.now().toString();

      Navigator.pop(context, {
        'name': _nameController.text,
        'surname': _surnameController.text,
        'course': widget.selectedCourse['name'],
        'level': selectedLevel,
        'quantity': quantity,
        'totalPrice': totalPrice,
        'timestamp': timestamp,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("สมัครเรียน")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("สมัครเรียน: ${widget.selectedCourse['name']}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "ชื่อ"),
            ),
            TextField(
              controller: _surnameController,
              decoration: const InputDecoration(labelText: "นามสกุล"),
            ),
            DropdownButtonFormField<String>(
              hint: const Text("เลือกระดับการเรียน"),
              value: selectedLevel,
              items: ['ระดับ 1', 'ระดับ 2', 'ระดับ 3'].map((level) {
                return DropdownMenuItem(value: level, child: Text(level));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLevel = value;
                });
              },
            ),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "จำนวนคอร์ส"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text("สมัครเรียน"),
            ),
          ],
        ),
      ),
    );
  }
}

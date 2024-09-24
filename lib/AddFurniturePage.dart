import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddFurniturePage extends StatefulWidget {
  const AddFurniturePage({Key? key}) : super(key: key);

  @override
  _AddFurniturePageState createState() => _AddFurniturePageState();
}

class _AddFurniturePageState extends State<AddFurniturePage> {
  String? _selectedFurnitureType;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  final List<String> _furnitureTypes = ['Sofa', 'Chair', 'Table', 'Bed'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Furniture'),
      ),
      backgroundColor: Colors.brown[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Upload Picture',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final pickedFile =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _image =
                            pickedFile != null ? File(pickedFile.path) : null;
                      });
                    },
                    child: const Text(
                      'Upload Image',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Furniture Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Edit Furniture Price',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Description about the furniture',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Edit Furniture Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedFurnitureType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
                items: _furnitureTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type), // Display the furniture type
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFurnitureType = newValue;
                  });
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[900], // Background color
                ),
                onPressed: () {
                  // TODO: Implement furniture adding functionality
                },
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

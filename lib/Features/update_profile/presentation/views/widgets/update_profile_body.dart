import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yum_quick/core/resources/color_managers.dart';

class UpdateProfileBody extends StatefulWidget {
  const UpdateProfileBody({super.key});

  @override
  _UpdateProfileBodyState createState() => _UpdateProfileBodyState();
}

class _UpdateProfileBodyState extends State<UpdateProfileBody> {
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/mainScreen');
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              const SizedBox(width: 15),
              const Text(
                "My profile",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          _image != null ? FileImage(File(_image!.path)) : null,
                      backgroundColor: Colors.grey[300],
                    ),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                        ),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(Icons.camera_alt,
                            color: Colors.white, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildTextField(label: "Full Name", value: "John Smith"),
                const SizedBox(height: 15),
                _buildTextField(label: "Phone Number", value: "+123 567 89000"),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    "Update Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.yellow[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          controller: TextEditingController(text: value),
        ),
      ],
    );
  }
}

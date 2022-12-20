import 'dart:io';

import 'package:dating_app/screens/widgets/account_botton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileDetail extends StatefulWidget {
  ProfileDetail({Key? key}) : super(key: key);
  static const String routeName = '/profileDetail';
  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String _date = "";
  late XFile? _image = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  "Profile details",
                  style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () async {
                    _image = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: _image == null
                            ? Icon(
                                Icons.account_circle,
                                size: 100,
                                color: Colors.pink.shade400,
                              )
                            : SizedBox(
                                width: 95,
                                height: 95,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    File(_image!.path),
                                    fit: BoxFit.fill,
                                  ),
                                ),),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 2,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.pink.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _firstNameController,
                  style: const TextStyle(fontSize: 17),
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "First name",
                    hintText: 'First name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _lastNameController,
                  style: const TextStyle(fontSize: 17),
                  autofocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Last name",
                    hintText: 'Last name',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.maxFinite,
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          _date = formattedDate; //set output date to TextField value.
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.pink,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          _date == "" ? "Choose birthday date" : _date,
                          style: TextStyle(color: Colors.pink, fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.maxFinite,
                    height: 50,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

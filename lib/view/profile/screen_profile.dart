import 'dart:io';

import 'package:file_manager/model/document_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class StudentView extends StatelessWidget {
  final box = Hive.box<Document>('Document');
  final List<Document> obj;
  final int index;
  StudentView({Key? key, required this.obj, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 92, 100),
      appBar: AppBar(
        toolbarHeight: 150,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(70),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 31, 41, 47),
        title: const Text('Student Details'),
        centerTitle: true,
        elevation: 15,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Name : ${obj[index].name}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Place : ${obj[index].path}',
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              // Text(
              //   ('Age : ${obj[index].age}'),
              //   style: const TextStyle(color: Colors.white, fontSize: 25),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   ('Qualification : ${obj[index].qualification}'),
              //   style: const TextStyle(color: Colors.white, fontSize: 20),
              // ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

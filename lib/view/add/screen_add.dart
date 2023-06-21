// import 'dart:io';
// import 'dart:core';

// import 'package:file_manager/core/constants/constants.dart';
// import 'package:file_manager/model/document_model.dart';
// import 'package:file_manager/view/widgets/icon_widgets.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path/path.dart' as path;

// List<FileSystemEntity> _files = [];

// class AddStudent extends StatefulWidget {
//   const AddStudent({Key? key}) : super(key: key);

//   @override
//   State<AddStudent> createState() => _AddstudentState();
// }

// class _AddstudentState extends State<AddStudent> {
//   var box = Hive.box<Document>(documentKey);

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController nameController = TextEditingController();
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             child: getFileIcon(''),
//           ),
//           IconButton(
//               onPressed: () {
//                 _pickFile(nameController.text);
//               },
//               icon: const Icon(Icons.add)),
//           TextField(
//             controller: nameController,
//           )
//         ],
//       ),
//     );
//   }

// //   Future<void> _pickFile() async {
// //   final result = await FilePicker.platform.pickFiles(allowMultiple: false);
// //   if (result != null) {
// //     final file = File(result.files.single.path!);
// //     final documentBox = Hive.box<Document>('documents');
// //     final document = Document()
// //   ..name = result.files.single.name
// //   ..path = file.path;
// // documentBox.add(document);
// //     _loadFiles();
// //   }
// // }
// }

// // String? _documentsDirectoryPath;

// Future<String> getDocumentsDirectoryPath() async {
//   final directory = await getApplicationDocumentsDirectory();
//   return directory.path;
// }

// void _loadFiles() {
//   final documentBox = Hive.box<Document>('Documents');
//   final files = documentBox.values.toList();
//   _files = files.cast<FileSystemEntity>();
// }

// // Future<void> _deleteFile(String filePath) async {
// //   final file = File(filePath);
// //   await file.delete();
// //   _loadFiles();
// // }

// Future<void> _openFile(String filePath) async {
//   final file = File(filePath);
//   await OpenFile.open(filePath, type: await fileExtension(filePath));
// }

// Future<String> fileExtension(String filePath) async {
//   return await path.extension(filePath);
// }

// // Future<void> _pickImage() async {
// //   final picker = ImagePicker();
// //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
// //   if (pickedFile != null) {
// //     final imageFile = File(pickedFile.path);
// //     // Implement your logic for image handling here
// //   }
// // }

// Future _pickFile(String discription) async {
//   final result = await FilePicker.platform.pickFiles(allowMultiple: false);
//   if (result != null) {
//     final file = File(result.files.single.path!);
//     final documentBox = Hive.box<Document>(documentKey);
//     final document = Document(
//         name: result.files.single.name,
//         path: file.path,
//         discription: discription);
//     documentBox.add(document);
//     _loadFiles();
//   }
// }

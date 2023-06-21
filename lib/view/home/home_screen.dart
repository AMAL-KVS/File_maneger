import 'dart:developer';
import 'dart:io';

import 'package:file_manager/core/color/colors.dart';
import 'package:file_manager/core/constants/constants.dart';
import 'package:file_manager/core/style/text_styles.dart';
import 'package:file_manager/model/document_model.dart';
import 'package:file_manager/view/widgets/icon_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:core';
import 'package:path/path.dart' as path;

import 'package:open_file/open_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon myIcon = const Icon(Icons.search);
  Widget myField = const Text('Document Manager');
  String searchInput = "";
  String? _documentsDirectoryPath;
  List<FileSystemEntity> _files = [];
  @override
  void initState() {
    _loadFiles();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        title: myField,
        centerTitle: true,
        elevation: 10,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Document>(documentKey).listenable(),
        builder: (context, Box<Document> value, child) {
          List keys = value.keys.toList();
          if (keys.isEmpty) {
            return const Center(
              child: Text('List is empty', style: hometextStyle),
            );
          } else {
            List<Document> data = value.values
                .toList()
                .where(
                  (element) => element.name.toUpperCase().contains(
                        searchInput.toUpperCase(),
                      ),
                )
                .toList();
            if (data.isEmpty) {
              return const Center(
                child: Text('Sorry, no results found ', style: hometextStyle),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    log('oping the file path');
                    _openFile(data[index].path);
                  },
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Are you sure? '),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No')),
                              TextButton(
                                  onPressed: () {
                                    data[index].delete();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Yes'))
                            ],
                          );
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kwhitecolors),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    width: 100,
                    height: 100,
                    child: Column(
                      children: [
                        getFileIcon(data[index].path.toString()),
                        Text(
                          data[index].name,
                          style: const TextStyle(color: kwhitecolors),
                        )
                      ],
                    ),
                  ),
                );
              },

              itemCount: data.length,
              // separatorBuilder: Divider(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickFile,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      final file = File(result.files.single.path!);
      final documentBox = Hive.box<Document>('Document');
      final document =
          Document(name: result.files.single.name, path: file.path);
      documentBox.add(document);
      //  log('Pick file working');
      _loadFiles();
    }
  }

  void _loadFiles() {
    final documentBox = Hive.box<Document>('Document');
    final files = documentBox.values.toList();

    _files = files.cast<FileSystemEntity>();
  }

  Future<void> _deleteFile(String filePath) async {
    final file = File(filePath);
    await file.delete();
    _loadFiles();
  }

  Future<void> _openFile(String filePath) async {
    //final file = File(filePath);
    await OpenFile.open(
      filePath,
    );
  }

  Future<String> fileExtension(String filePath) async {
    return await path.extension(filePath);
  }
}

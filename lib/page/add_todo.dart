import 'package:flutter/material.dart';
import 'package:tesmobile/model/todo.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerNameClass = TextEditingController();
    TextEditingController controllerNameStudent = TextEditingController();
    TextEditingController controllerNim = TextEditingController();
    TextEditingController controllerAlamat = TextEditingController();
    TextEditingController controllerKelas = TextEditingController();
    //after make thsi varoable you should call variable to Textfiedld
    AppBar myappbar = AppBar(
      title: const Text(
        'Add Todo',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
    double heightBody = MediaQuery.of(context).size.height -
        myappbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // ignore: prefer_is_empty
            if (controllerNameClass.text.isNotEmpty ||
                // ignore: prefer_is_empty
                controllerNameStudent.text.isNotEmpty ||
                // ignore: prefer_is_empty
                controllerNim.text.isNotEmpty ||
                // ignore: prefer_is_empty
                controllerAlamat.text.isNotEmpty ||
                // ignore: prefer_is_empty
                controllerKelas.text.isNotEmpty) {
              final int? nimParsed = int.tryParse(controllerNim.text);
              dataTodo.add(Todo(
                  id: DateTime.now().toString(),
                  // ignore: unrelated_type_equality_checks, prefer_is_empty
                  nameClass: controllerNameClass.text.isEmpty
                      ? 'No title'
                      : controllerNameClass.text,
                  // ignore: unrelated_type_equality_checks, prefer_is_empty
                  nameStudent: controllerNameStudent.text.isEmpty
                      ? 'No Desc'
                      : controllerNameStudent.text,
                  nim: controllerNim.text.isEmpty
                      ? " No Nim"
                      : controllerNim.text,
                  alamat: controllerAlamat.text.isEmpty
                      ? 'No Desc'
                      : controllerAlamat.text,
                  kelas: controllerKelas.text.isEmpty
                      ? 'No Desc'
                      : controllerKelas.text,
                  isCompleted: false));
            }

            print(dataTodo);
            //code ini adalah untuk add data atau menambahkan data pada HomePage
            Navigator.pop(context);
          },
          child: const Icon(Icons.add_task),
        ),
        appBar: myappbar,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: widthBody,
            child: Column(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: TextField(
                      controller: controllerNameClass,
                      //ini adalah cara memanggil code controller di atas
                      maxLines: 3,
                      maxLength: 20,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          hintText: 'Nama Kelas', border: InputBorder.none)),
                ),
                SizedBox(height: heightBody * 0.05),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: TextField(
                      controller: controllerNameStudent,
                      //ini adalah cara memanggil code controller di atas
                      maxLines: 3,
                      maxLength: 20,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          hintText: 'Nama Anda', border: InputBorder.none)),
                ),
                SizedBox(height: heightBody * 0.05),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: TextField(
                      controller: controllerNim,
                      //ini adalah cara memanggil code controller di atas
                      maxLines: 3,
                      maxLength: 20,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          hintText: 'Nim', border: InputBorder.none)),
                ),
                SizedBox(height: heightBody * 0.05),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: TextField(
                      controller: controllerAlamat,
                      //ini adalah cara memanggil code controller di atas
                      maxLines: 3,
                      maxLength: 20,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          hintText: 'Alamat', border: InputBorder.none)),
                ),
                SizedBox(height: heightBody * 0.05),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12),
                  child: TextField(
                      controller: controllerKelas,
                      //ini adalah cara memanggil code controller di atas
                      maxLines: 3,
                      maxLength: 20,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          hintText: 'Kelas', border: InputBorder.none)),
                ),
                SizedBox(height: heightBody * 0.05),
              ],
            ),
          ),
        ));
  }
}

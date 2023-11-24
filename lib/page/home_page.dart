import 'package:flutter/material.dart';
import 'package:tesmobile/model/data.dart';
//TO CAN UNCEKLIS AT CHECKBOXLISTITLE MAKE VALUE IS "FALSE" !

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<DataStudent> data = [];
  //variable di atas adalah untuk mengambil data dari file Model
  @override
  void initState() {
    super.initState();
    data = dataStudent;
  }

  void updateTodos() {
    setState(() {
      data = dataStudent; // Memperbarui daftar todos dari dataStudent
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar myappbar = AppBar(
      title: const Text(
        'Data Mahasiwa',
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
    //function search
    void searchData(String query) {
      final input = query.toLowerCase();
      final dataFilter = dataStudent.where((data) {
        final todoTitile = data.nameClass.toLowerCase();

        return todoTitile.contains(input);
      }).toList();
      setState(() {
        data = dataFilter;
      });
      //this code how to making function search bar
      //after that you must call name method "searchData" at Textfield bar
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_data')
              .then((value) => updateTodos());
        },
        child: const Icon(Icons.add),
      ),
      appBar: myappbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: widthBody,
              height: MediaQuery.of(context).size.height * 1 / 7,
              // color: Colors.amber,
              child: TextField(
                onChanged: (value) => searchData(value),
                //so variable searchTodo from method function search bar
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Cari data!',
                    hintStyle: TextStyle(color: Colors.white)),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            if (data.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: widthBody,
                height: heightBody * 0.8,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final todo = data[index];
                    return Container(
                      child: ListTile(
                        title: Text(
                          todo.nameClass,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Untuk align ke kiri
                          children: [
                            Text(
                              todo.nameStudent,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              todo.nim.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              todo.alamat,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              todo.kelas,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Optional: Tambahkan aksi ketika ListTile diklik
                        },
                      ),
                    );
                  },
                ),
              )
            else
              Container(
                child: const Text('Mohon isi data'),
              )
          ],
        ),
      ),
    );
  }
}

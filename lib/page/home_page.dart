import 'package:flutter/material.dart';
import 'package:tesmobile/model/todo.dart';
//TO CAN UNCEKLIS AT CHECKBOXLISTITLE MAKE VALUE IS "FALSE" !

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = dataTodo;
  //variable di atas adalah untuk mengambil data dari file Model
  @override
  void initState() {
    super.initState();
    updateTodos();
  }

  void updateTodos() {
    setState(() {
      todos = dataTodo; // Memperbarui daftar todos dari dataTodo
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar myappbar = AppBar(
      title: const Text(
        'To do List Bojew',
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
    void searchTodo(String query) {
      final todoFilter = dataTodo.where((todo) {
        // So you must make variable and take data from "dataTodo".
        final todoTitile = todo.nameClass.toLowerCase();
        //todoTitle adalah variable untuk memanggil parameter title di model maka jadi nya "todo.title"
        final input = query;
        return todoTitile.contains(input);
      }).toList();
      setState(() {
        todos = todoFilter;
      });
      //this code how to making function search bar
      //after that you must call name method "searchTodo" at Textfield bar
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_todo')
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
                onChanged: searchTodo,
                //so variable searchTodo from method function search bar
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Silahkan cari di sini ler !',
                    hintStyle: TextStyle(color: Colors.white)),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            if (todos.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: widthBody,
                height: heightBody * 0.8,
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
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
                              todo.nim,
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
                child: const Text('Tidak adat data cuy'),
              )
          ],
        ),
      ),
    );
  }
}

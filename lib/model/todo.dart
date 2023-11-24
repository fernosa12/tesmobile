class Todo {
  final String id;
  final String nameClass;
  final String nameStudent;
  final String nim;
  final String alamat;
  final String kelas;
  bool isCompleted;

  Todo(
      {required this.id,
      required this.nameClass,
      required this.nameStudent,
      required this.nim,
      required this.alamat,
      required this.kelas,
      required this.isCompleted});

  @override
  String toString() {
    return 'Todo{nameClass: $nameClass, nameStudent: $nameStudent, nim: $nim}';
  }
}

List<Todo> dataTodo = [
  Todo(
      id: DateTime.now().toString(),
      nameClass: '',
      nameStudent: '',
      nim: "",
      alamat: '',
      kelas: '',
      isCompleted: false),
];

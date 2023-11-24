class DataStudent {
  final String id;
  final String nameClass;
  final String nameStudent;
  int? nim;
  final String alamat;
  final String kelas;

  DataStudent({
    required this.id,
    required this.nameClass,
    required this.nameStudent,
    this.nim,
    required this.alamat,
    required this.kelas,
  });

  @override
  String toString() {
    return 'Todo{nameClass: $nameClass, nameStudent: $nameStudent, }';
  }
}

List<DataStudent> dataStudent = [];

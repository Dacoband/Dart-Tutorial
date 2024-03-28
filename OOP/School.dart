// Định nghĩa lớp Student
class Student {
  int id;
  String name;
  int age;
  String subject;
  double gpa;
  double height;
  double weight;

  // Constructor của lớp Student
  Student(this.id, this.name, this.age, this.subject, this.gpa, this.height, this.weight);
}

// Định nghĩa lớp Teacher
class Teacher {
  int TeacherId;
  String name;
  String subject;

  // Constructor của lớp Teacher
  Teacher(this.TeacherId,this.name, this.subject);
}

// Định nghĩa lớp Classroom
class Classroom {
  String className;
  List<Student> students;
  Teacher teacher;

  // Constructor của lớp Classroom
  Classroom(this.className, this.students, this.teacher);

  // Phương thức để hiển thị thông tin lớp học
  void displayInfo() {
    print('Class: $className');
    print('TeacherId: ${teacher.TeacherId},Name : ${teacher.name}, Subject: ${teacher.subject}');
    print('Students:');
    for (var student in students) {
      print(' - ID: ${student.id}, Name: ${student.name}, Age: ${student.age}, Subject: ${student.subject}, GPA: ${student.gpa}, Height: ${student.height}, Weight: ${student.weight}');
    }
    print('----------------------');
  }
}

// Định nghĩa lớp Department
class Department {
  String name;
  List<Teacher> teachers;

  // Constructor của lớp Department
  Department(this.name, this.teachers);

  // Phương thức để hiển thị thông tin phòng ban
  void displayInfo() {
    print('Department: $name');
    print('Teachers:');
    for (var teacher in teachers) {
      print(' - ${teacher.name}, Subject: ${teacher.subject}');
    }
    print('----------------------');
  }
}

// Định nghĩa lớp Principal
class Principal {
  String name;

  // Constructor của lớp Principal
  Principal(this.name);
}

void main() {
  // Tạo đối tượng giáo viên
  var teachers = [
    Teacher(1,'Mark Maton', 'Math'),
    Teacher(2,'Violet Scrum', 'English'),
    Teacher(3,'Chalender Sivlerd', 'Science'),
    Teacher(4,'Kim Lee', 'History'),
  ];

  // Tạo đối tượng học sinh
  var students = List.generate(
    320,
    (index) => Student(
      index + 1,
      'Student${index + 1}',
      12 + index % 6,
      'Subject${index % 4 + 1}',
      (index % 5 + 6).toDouble(),
      140.0 + index % 20,
      40.0 + index % 30,
    ),
  );

  // Tạo danh sách lớp học
  var classrooms = [
    Classroom('6A1', students.sublist(0, 20), teachers[0]),
    Classroom('6A2', students.sublist(20, 40), teachers[1]),
    Classroom('6A3', students.sublist(40, 60), teachers[2]),
    Classroom('6A4', students.sublist(60, 80), teachers[3]),
    Classroom('7A1', students.sublist(80, 100), teachers[0]),
    Classroom('7A2', students.sublist(100, 120), teachers[1]),
    Classroom('7A3', students.sublist(120, 140), teachers[2]),
    Classroom('7A4', students.sublist(140, 160), teachers[3]),
    Classroom('8A1', students.sublist(160, 180), teachers[0]),
    Classroom('8A2', students.sublist(180, 200), teachers[1]),
    Classroom('8A3', students.sublist(200, 220), teachers[2]),
    Classroom('8A4', students.sublist(220, 240), teachers[3]),
    Classroom('9A1', students.sublist(240, 260), teachers[0]),
    Classroom('9A2', students.sublist(260, 280), teachers[1]),
    Classroom('9A3', students.sublist(280, 300), teachers[2]),
    Classroom('9A4', students.sublist(300, 320), teachers[3]),
  ];

  // Tạo đối tượng phòng ban giáo viên
  var department = Department('Teacher Department', teachers);

  // Hiển thị thông tin từng lớp học
  for (var classroom in classrooms) {
    classroom.displayInfo();
  }

  // Hiển thị thông tin phòng ban giáo viên
  department.displayInfo();
}

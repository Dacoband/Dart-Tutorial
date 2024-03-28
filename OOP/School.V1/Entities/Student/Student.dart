import 'dart:math';

class Student {
  String id;
  String name;
  int age;
  String cmnd;
  String hometown;
  String grade;
  String classCode;
  double grade10;
  double grade11;
  double grade12;
  Map<String, double> subjectGrades;
  String teacher;
  String phoneNumber;

  Student(
    this.id,
    this.name,
    this.age,
    this.cmnd,
    this.hometown,
    this.grade,
    this.classCode,
    this.grade10,
    this.grade11,
    this.grade12,
    this.subjectGrades,
    this.teacher,
    this.phoneNumber,
  );
}

class Classroom {
  String grade;
  String classCode;
  int maxStudents;
  List<Student> students;

  Classroom(this.grade, this.classCode, this.maxStudents, this.students);
}

class Teacher {
  String name;
  String grade;
  String subject;

  Teacher(this.name, this.grade, this.subject);
}

class School {
  List<Classroom> classrooms;
  List<Teacher> teachers;

  School(this.classrooms, this.teachers);

  void displayClassroomInfo() {
    for (var classroom in classrooms) {
      print('Class: ${classroom.grade} ${classroom.classCode}');
      print('Max Students: ${classroom.maxStudents}');
      print('Students:');
      for (var student in classroom.students) {
        print(' - ID: ${student.id}, Name: ${student.name}, Age: ${student.age}, Grade: ${student.grade}, Class: ${student.classCode}');
      }
      print('----------------------');
    }
  }

  void displayTeacherInfo() {
    print('Teachers:');
    for (var teacher in teachers) {
      print(' - Name: ${teacher.name}, Grade: ${teacher.grade}, Subject: ${teacher.subject}');
    }
    print('----------------------');
  }
}

void main() {
  var school = generateSchool();
  school.displayClassroomInfo();
  school.displayTeacherInfo();
}

School generateSchool() {
  var classrooms = <Classroom>[];
  var teachers = <Teacher>[];

  // Generate Bang Tu Nhien classrooms
  for (var grade in ['10', '11', '12']) {
    for (var classCode = 1; classCode <= 8; classCode++) {
      var maxStudents = Random().nextInt(3) + 38; // Random between 38 and 40
      var students = generateStudents('TN', grade, 'A$classCode', maxStudents);
      classrooms.add(Classroom(grade, 'A$classCode', maxStudents, students));
    }
  }

  // Generate Bang Xa Hoi classrooms
  for (var grade in ['10', '11', '12']) {
    for (var classCode = 9; classCode <= 14; classCode++) {
      var maxStudents = Random().nextInt(3) + 38; // Random between 38 and 40
      var students = generateStudents('XH', grade, 'A$classCode', maxStudents);
      classrooms.add(Classroom(grade, 'A$classCode', maxStudents, students));
    }
  }

  // Generate Teachers
  for (var grade in ['10', '11', '12']) {
    teachers.add(Teacher('Teacher ${grade}', grade, 'Subject ${Random().nextInt(3) + 1}'));
  }

  return School(classrooms, teachers);
}

List<Student> generateStudents(String bang, String grade, String classCode, int maxStudents) {
  var students = <Student>[];
  for (var i = 1; i <= maxStudents; i++) {
    var idPrefix = bang == 'TN' ? 'TN' : 'XH';
    var id = '${idPrefix}${grade}${classCode}${i.toString().padLeft(2, '0')}';
    var name = 'Student $id';
    var age = Random().nextInt(6) + 16; // Random between 16 and 21
    var cmnd = 'CMND$id';
    var hometown = 'Hometown$id';
    var studentGrade = 'Grade$grade';
    var subjectGrades = generateSubjectGrades(bang);
    var teacher = 'Teacher ${grade}';
    var phoneNumber = 'Phone$id';
    students.add(Student(id, name, age, cmnd, hometown, studentGrade, classCode, 0.0, 0.0, 0.0, subjectGrades, teacher, phoneNumber));
  }
  return students;
}

Map<String, double> generateSubjectGrades(String bang) {
  var grades = <String, double>{};
  for (var subject in ['Sử', 'Địa', 'Giáo dục công dân', 'Văn', 'Tiếng Anh']) {
    var grade = Random().nextDouble() * 10; // Random between 0 and 10
    grades[subject] = grade;
  }
  return grades;
}

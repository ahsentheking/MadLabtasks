void main() { 
   // part 1 
//  printWelcome("Course Roaster Manager"); 
   // part 2 
  const int maxCapacity = 4; 
  final DateTime createdAt = DateTime.now(); 
  String courseTitle='cs201:Mobile App develpment'; 
  int capacity = maxCapacity; 
  double credithours = 3.0; 
  bool isOpen = true; 
  List<String> enrolledStudents = ['Adnen', 'Rafay','Jamal']; 
  Set<String> waitlist = {'ahmed','ahsen'}; 
  Map <String , int > attendanceCount ={ 
    'Adnen': 4, 
    'Rafay': 5, 
    'Jamal': 6 
  }; 
  print ('$courseTitle | capacity: $capacity |Enrolled : ${enrolledStudents.length}'); 

   // part 3 
   String? instructorEmail; 

   late String enrollmentCode = generateCode("CS493"); 

   print ('enrollmentCode: CS493'); 
   print(instructorEmail?..length); 

 } 

// void printWelcome (String appn){ 
//   print('$appn'); 
// } 
// // part3 
// String generateCode(String title) => 
//     title.substring(0, 2).toUpperCase() + '101'; 

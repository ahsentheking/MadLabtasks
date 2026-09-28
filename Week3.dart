final List<Map<String, dynamic>> books = [
  {
    'title': 'Dart in Action',
    'author': 'Ada',
    'year': 2021,
    'copies': 3,
    'tags': ['dart', 'programming']
  },
  {
    'title': 'Flutter Basics',
    'author': 'Sam',
    'year': 2023,
    'copies': 0,
    'tags': ['flutter', 'mobile']
  },
  {
    'title': 'Clean Code',
    'author': 'Martin',
    'year': 2008,
    'copies': 2,
    'tags': ['programming', 'design']
  },
  {
    'title': 'Algorithms',
    'author': 'Knuth',
    'year': 1968,
    'copies': 1,
    'tags': ['programming', 'math']
  },
  {
    'title': 'UI Design',
    'author': 'Nora',
    'year': 2019,
    'copies': 4,
    'tags': ['design', 'mobile']
  },
];

// Part 1

double lateFee(int daysLate,double ratePerDay) =>
    daysLate * ratePerDay;

String formatTitle(String title,[String? author]) {
  if (author == null) {
    return title;
  }
  return '$title by $author';
}

  Map<String,dynamic> makeBook({
  required String title,
  required String  author,
  int year = 2024,
  int copies = 1,
}) {
  return {
    'title':  title,
    'author':author,
    'year':  year,
    'copies': copies,
  };
}
bool isClassic(int year) => year < 2000;


// Part 2 

List<String> transformAll(
    List<String> items,String Function(String) fn) {
  return items.map(fn).toList();
}

int Function()makeCounter() {
  int count = 0;
  return () {
    count++;
    return count;
  };
}
double Function(int) makeFeeCalculator(double rate) {
  return (int days) => days * rate;
}
int sumDigits(int n) {
  if (n < 10) {
    return n;
  }
  return (n % 10) + sumDigits(n ~/ 10);
}


//Part 3

Map<String, int> buildStock() {
  return {
    for (var book in books)
      book['title'] as String: book['copies'] as int
  };
}


//Part 4

class Box<T> {
  T value;
  Box(this.value);
}
T firstOr<T>(List<T> items, T fallback) {
  if (items.isEmpty) {
    return fallback;
  }
  return items.first;
}
class Pair<A, B> {
  A first;
  B second;
  Pair(this.first, this.second);
  @override
  String toString() {
    return '($first, $second)';
  }
}
// Main 
void main() async {
  part1();
  part2();
  part3();
  part4();
}


//Part 1 

void part1() {
  print('--- Part 1 ---');
  print('Late fee: ${lateFee(5, 0.5)}');
  print(formatTitle('Dart in Action'));
  print(formatTitle('Dart in Action', 'Ada'));
  print(makeBook(
    title: 'Clean Code',
    author: 'Martin',
  ));
  print(makeBook(
    title: 'Algorithms',
    author: 'Knuth',
    year: 1968,
  ));
  print(isClassic(1968));
  print(isClassic(2021));
}


// Part2 
void part2() {
  print('--- Part 2 ---');
  final titles = ['Dart in Action', 'Clean Code'];
  final upperCaseTitles = transformAll(
    titles,
    (title) => title.toUpperCase(),
  );
  print(upperCaseTitles);
  final exclamationTitles = transformAll(
    titles,
    (title) => '$title!',
  );
  print(exclamationTitles);
  final desk1 = makeCounter();
  final desk2 = makeCounter();
  print(desk1());
  print(desk1());
  print(desk1());
  print(desk2());
  final studentFee = makeFeeCalculator(0.25);
  final staffFee = makeFeeCalculator(0.10);
  print('Student fee: ${studentFee(4)}');
  print('Staff fee: ${staffFee(4)}');
  print('Sum of digits: ${sumDigits(116)}');
}


// Part3
void part3() {
  print('--- Part 3 ---');
  final titles = books
      .map((book) => book['title'] as String)
      .toList();
  print('Titles: $titles');
  final available = books
      .where((book) => (book['copies'] as int) > 0)
      .map((book) => book['title'] as String)
      .toList();
  print('Available: $available');
  final totalCopies = books.fold<int>(
    0,
    (sum, book) => sum + (book['copies'] as int),
  );
  print('Total copies: $totalCopies');
  final years = books
      .map((book) => book['year'] as int)
      .toList();
  final oldestYear = years.reduce(
    (a, b) => a < b ? a : b,
  );
  print('Oldest year: $oldestYear');
  final byYear = List<Map<String, dynamic>>.from(books);
  byYear.sort(
    (a, b) => (a['year'] as int).compareTo(b['year'] as int),
  );
  final sortedTitles = byYear
      .map((book) => book['title'] as String)
      .toList();
  print('By year: $sortedTitles');
  final stock = buildStock();
  print('Stock: $stock');
  stock.forEach((title, copies) {
    if (copies == 0) {
      print('Out of stock: $title');
    }
  });
  print('Copies of Unknown: ${stock['Unknown'] ?? 0}');
  final allTags = <String>{
    for (var book in books)
      ...((book['tags'] as List).cast<String>())
  };
  print('All tags: $allTags');
  final a = {
    'Dart in Action',
    'Clean Code',
    'Algorithms',
  };
  final b = {
    'Clean Code',
    'Flutter Basics',
    'Algorithms',
  };
  print('Union: ${a.union(b)}');
  print('Common: ${a.intersection(b)}');
  print('Only in A: ${a.difference(b)}');
}


//Part 4 

void part4() {
  print('--- Part 4 ---');
  final intBox = Box<int>(5);
  final stringBox = Box<String>('dart');
  print('Box<int>: ${intBox.value}');
  print('Box<String>: ${stringBox.value}');
  print(firstOr<String>(
    ['Dart in Action'],
    'z',
  ));
  print(firstOr<String>(
    [],
    'z',
  ));
  final pair = Pair<String, int>(
    'Dart in Action',
    3,
  );
  print(pair);
}

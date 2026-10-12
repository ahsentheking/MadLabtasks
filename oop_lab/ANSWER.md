# CS442 Lab Week 5 — Reflection Answers

**Name:** Your Name  
**Roll Number:** Your Roll Number

### Q1. What can a subclass using extends use for free that a class using implements has to write itself?

A subclass using `extends` inherits the parent's fields and implemented methods. A class using `implements` must implement the required members itself.

### Q2. Book and Dvd both use Renewable. When would you pick a mixin, and when an abstract parent class?

I would use a mixin to share functionality between classes that need the same behavior without changing their inheritance relationship. I would use an abstract parent class when the classes share a common identity, properties, and required methods.

### Q3. Why must you override hashCode whenever you override ==?

Equal objects must have the same hash code. Otherwise, sets and maps may handle equal objects incorrectly.

### Q4. An extension method on String and a subclass of String both add behaviour. Why does Dart let you write the first one but not the second?

Dart allows extension methods to add functionality to existing types without changing their original classes. However, `String` is a final type in Dart, so it cannot be subclassed.

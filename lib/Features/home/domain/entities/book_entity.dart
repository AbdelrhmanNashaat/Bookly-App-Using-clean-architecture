/* Entity is a Data Representation (Describe data will present in the ui)
 Model is a Data Transfer Object (Describe data will transfer from api or database)
*/
import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? imagePath;
  @HiveField(1)
  final String? bookId;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? author;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final num? ratingsCount;

  BookEntity({
    required this.imagePath,
    required this.title,
    required this.bookId,
    required this.author,
    required this.price,
    required this.rating,
    this.ratingsCount,
  });
}

/* Entity is a Data Representation (Describe data will present in the ui)
 Model is a Data Transfer Object (Describe data will transfer from api or database)
*/
class BookEntity {
  final String imagePath;
  final String title;
  final String author;
  final num price;
  final num rating;

  BookEntity({
    required this.imagePath,
    required this.title,
    required this.author,
    required this.price,
    required this.rating,
  });
}

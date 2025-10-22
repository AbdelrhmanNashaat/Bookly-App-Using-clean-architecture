import 'package:hive/hive.dart';
import '../../Features/home/domain/entities/book_entity.dart';

void saveLocalData({required List<BookEntity> books, required String boxName}) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}

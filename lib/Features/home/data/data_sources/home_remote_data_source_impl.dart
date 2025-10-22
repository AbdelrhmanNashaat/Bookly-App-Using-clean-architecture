import 'package:bookly_app_clean_architecture/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_clean_architecture/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_clean_architecture/constants.dart';
import 'package:bookly_app_clean_architecture/core/utils/api_service.dart';
import '../../../../core/functions/save_box_data.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    final data = await apiService.get(
      url: 'volumes?q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = parseBooks(data['items']);
    saveLocalData(books: books, boxName: kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    final data = await apiService.get(
      url: 'volumes?Sorting=newest&q=programming&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = parseBooks(data['items']);
    saveLocalData(books: books, boxName: kNewestBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({int pageNumber = 0}) async {
    final data = await apiService.get(
      url: 'volumes?q=computers&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = parseBooks(data['items']);
    saveLocalData(books: books, boxName: kSimilarBooks);
    return books;
  }

  List<BookEntity> parseBooks(List<dynamic> items) {
    return items.map((item) => BookModel.fromJson(item)).toList();
  }
}

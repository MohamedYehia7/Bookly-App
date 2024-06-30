import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepository homeRepository;

  FetchFeaturedBooksUseCase({required this.homeRepository});

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    return await homeRepository.fetchFeaturedBooks();
  }
}
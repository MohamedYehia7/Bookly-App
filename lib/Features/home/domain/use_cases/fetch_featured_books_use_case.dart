import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/repositories/home_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepository homeRepository;

  FetchFeaturedBooksUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param = 0]) async {
    return await homeRepository.fetchFeaturedBooks(
      pageNumber: param,
    );
  }
}

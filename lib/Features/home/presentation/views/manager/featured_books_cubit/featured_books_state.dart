part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

final class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String error;

  FeaturedBooksPaginationFailure(this.error);
}

final class FeaturedBooksFailed extends FeaturedBooksState {
  final String error;

  FeaturedBooksFailed(this.error);
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}

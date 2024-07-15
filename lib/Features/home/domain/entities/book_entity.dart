class BookEntity {
  final String bookId;
  final String? image;
  final String title;
  final String? author;
  final num? rate;
  final num? price;

  BookEntity(
      {required this.bookId,
      required this.image,
      required this.title,
      required this.author,
      required this.rate,
      required this.price});
}

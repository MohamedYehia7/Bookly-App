import 'package:bookly_app/Features/home/presentation/views/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'custom_list_view_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  _FeaturedBooksListViewState createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    var currentPosition = _scrollController.position.pixels;
    var maxPosition = _scrollController.position.maxScrollExtent;
    if (_scrollController.position.atEdge) {
      if (currentPosition != 0) {
        // Check if we are at the bottom
        final threshold = 0.7 * maxPosition;
        if (currentPosition >= threshold) {
          // Trigger fetchFeaturedBooks
          BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomListViewItem(image: widget.books[index].image ?? ''),
        ),
      ),
    );
  }
}

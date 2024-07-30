import 'package:bookly_app/Features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/build_error_snack_bar.dart';
import '../../../domain/entities/book_entity.dart';
import '../manager/featured_books_cubit/featured_books_cubit.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() =>
      _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState
    extends State<FeaturedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccess) {
        books = state.books;
      }
      if (state is FeaturedBooksPaginationFailure) {
        ScaffoldMessenger.of(context).showSnackBar(buildErrorSnackBar(state.error));
      }
    }, builder: (context, state) {

      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPaginationLoading ||
          state is FeaturedBooksPaginationFailure) {
        return FeaturedBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailed) {
        return Text(state.error);
      } else {
        return const FeaturedBooksListViewLoadingIndicator();
      }
    });
  }
}

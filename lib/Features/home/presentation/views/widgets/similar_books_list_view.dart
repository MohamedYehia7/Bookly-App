import 'package:flutter/material.dart';
import 'custom_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: CustomListViewItem(image: '',),
              )),
    );
  }
}

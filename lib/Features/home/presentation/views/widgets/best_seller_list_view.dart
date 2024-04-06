import 'package:flutter/cupertino.dart';

import 'best_seller_item.dart';

class BestSellerViewList extends StatelessWidget {
  const BestSellerViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (index, context) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: BestSellerListViewItem(),
      ),
      itemCount: 10,
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(FontAwesomeIcons.solidStar, color: Color(0xffFFDD4F),size: 15,),
        SizedBox(
          width: 6.3,
        ),
        Text(
          '4.8',
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            '(2390)',
            style: Styles.textStyle14,
          ),
        )
      ],
    );
  }
}

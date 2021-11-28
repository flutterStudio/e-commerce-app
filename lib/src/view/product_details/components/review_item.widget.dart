import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewItem extends StatelessWidget {
  final Evaluation review;
  const ReviewItem({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("${review.user?.firstName} ${review.user?.lastName}"),
            const Spacer(),
            const Text("Date of review")
          ],
        ),
        Text("${review.comment}"),
        RatingBar(
          ratingWidget: RatingWidget(
              empty: const Icon(Icons.star_outline_outlined),
              half: const Icon(Icons.star_half_outlined),
              full: const Icon(Icons.star_rate)),
          onRatingUpdate: (value) {},
        )
      ],
    );
  }
}

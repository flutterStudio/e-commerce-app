import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewItem extends StatelessWidget {
  final Evaluation review;
  const ReviewItem({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConfig.horizontalSpace * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryVariant),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.background,
              ),
              const Spacer(),
              Text("${review.user?.firstName} ${review.user?.lastName}"),
              const Spacer(
                flex: 10,
              ),
              const Text("Date of review")
            ],
          ),
          const SizedBox(
            height: SizeConfig.verticalSpace,
          ),
          Text("${review.comment}"),
          const SizedBox(
            height: SizeConfig.verticalSpace,
          ),
          RatingBar(
            itemSize: ICONSIZE.md,
            glow: true,
            allowHalfRating: true,
            minRating: 1,
            initialRating: 1,
            unratedColor: Theme.of(context).colorScheme.secondary,
            glowColor: Theme.of(context).colorScheme.primary,
            ratingWidget: RatingWidget(
                empty: const Icon(
                  Icons.star_outline_outlined,
                ),
                half: Icon(
                  Icons.star_half_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                full: Icon(
                  Icons.star_rate,
                  color: Theme.of(context).colorScheme.primary,
                )),
            onRatingUpdate: (value) {},
          )
        ],
      ),
    );
  }
}

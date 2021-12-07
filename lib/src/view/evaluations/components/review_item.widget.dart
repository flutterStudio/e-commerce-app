import 'package:e_commerce/src/config/size.config.dart';
import 'package:e_commerce/src/model/evaluation.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewItem extends StatelessWidget {
  final Evaluation review;
  const ReviewItem(
      {Key? key,
      required this.review,
      this.updatable = false,
      this.showOptiona = false,
      this.onOptionsClick})
      : super(key: key);
  final bool updatable;
  final bool showOptiona;
  final VoidCallback? onOptionsClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConfig.horizontalSpace),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryVariant),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: onOptionsClick,
                child: const Icon(
                  Icons.more_vert_rounded,
                  size: ICONSIZE.sm,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: SizeConfig.horizontalSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.background,
                    ),
                    const SizedBox(
                      width: SizeConfig.horizontalSpace * 2,
                    ),
                    Text("${review.user?.firstName} ${review.user?.lastName}"),
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
                  itemSize: ICONSIZE.sm,
                  glow: true,
                  maxRating: updatable ? 5 : review.rate ?? 0.0,
                  minRating: updatable ? 0 : review.rate ?? 0.0,
                  allowHalfRating: true,
                  initialRating: review.rate ?? 0.0,
                  unratedColor: updatable
                      ? Theme.of(context).colorScheme.secondary.withAlpha(100)
                      : null,
                  glowColor:
                      updatable ? Theme.of(context).colorScheme.primary : null,
                  updateOnDrag: updatable,
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
                  onRatingUpdate: (double value) {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

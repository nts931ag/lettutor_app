import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/widgets/icon/circle_box_widget.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/theme/text_theme.dart';



class CommentItem extends StatelessWidget {
  Widget image;
  String name;
  String time;
  double rating;
  String message;
  CommentItem({
    Key? key,
    required this.image,
    required this.name,
    required this.time,
    required this.rating,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleBox(size: 40.w, child: image),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: text15.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5.w),
                Text(
                  time,
                  style: text13.copyWith(color: Colors.grey),
                )
              ],
            ),
            RatingBar.builder(
              initialRating: rating,
              minRating: rating,
              maxRating: rating,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15,
              itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
                size: 5,
              ),
              onRatingUpdate: (rating) {},
            ),
            SizedBox(
              width: Get.width - 100.w,
              child: Text(
                message,
                style: text13,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
          ],
        )
      ],
    );
  }
}

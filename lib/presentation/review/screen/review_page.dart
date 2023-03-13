// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lettutor_app/presentation/common/screens/base/base_screen.dart';
import 'package:lettutor_app/presentation/review/screen/review_controller.dart';
import 'package:lettutor_app/presentation/review/widgets/comment_item.dart';
import 'package:lettutor_app/res/dimens.dart';
import 'package:lettutor_app/res/gen/assets.gen.dart';


class ReviewPage extends BaseScreen<ReviewController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
          ),
          ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) => Column(
                children: [
                  CommentItem(
                    image: Assets.images.img.image(fit: BoxFit.cover),
                    message:
                        'good course',
                    name: 'Anonymous',
                    time: '4 months ago',
                    rating: 5,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

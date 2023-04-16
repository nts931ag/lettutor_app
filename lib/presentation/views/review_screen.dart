// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/widgets/review/comment_item.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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


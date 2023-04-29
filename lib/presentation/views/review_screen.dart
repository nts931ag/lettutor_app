import 'package:flutter/material.dart';
import 'package:lettutor_app/domain/models/Feedback.dart' as FeedBack;
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:lettutor_app/presentation/widgets/review/comment_item.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/utils/resource/gen/assets.gen.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key, required this.feedbacks}) : super(key: key);

  final List<FeedBack.Feedback>? feedbacks;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidgetCustom(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            ...feedbacks!.map((e) => Column(
                  children: [
                    CommentItem(
                      image: Image.network(
                        e.firstInfo.avatar,
                        errorBuilder: (context, exception, stackTrace) {
                          return Assets.images.img.image(fit: BoxFit.cover);
                        },
                      ),
                      message: e.content,
                      name: e.firstInfo.name,
                      time: e.createdAt,
                      rating: e.rating,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

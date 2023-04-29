import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor_app/presentation/widgets/commons/icon/circle_box_widget.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:lettutor_app/config/theme/text_theme.dart';

import '../../../utils/utils.dart';

class CommentItem extends StatelessWidget {
  Widget image;
  String name;
  DateTime time;
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
    // return Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     CircleBox(size: 40.w, child: image),
    //     SizedBox(width: 10.w),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: [
    //             Text(
    //               name,
    //               style: text15.copyWith(fontWeight: FontWeight.w600),
    //             ),
    //             SizedBox(width: 5.w),
    //             Text(
    //               time,
    //               style: text13.copyWith(color: Colors.grey),
    //             )
    //           ],
    //         ),
    //         RatingBar.builder(
    //           initialRating: rating,
    //           minRating: rating,
    //           maxRating: rating,
    //           direction: Axis.horizontal,
    //           allowHalfRating: true,
    //           itemCount: 5,
    //           itemSize: 15,
    //           itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
    //           itemBuilder: (context, _) => const Icon(
    //             Icons.star,
    //             color: Colors.amber,
    //             size: 5,
    //           ),
    //           onRatingUpdate: (rating) {},
    //         ),
    //         SizedBox(
    //           width: Get.width - 100.w,
    //           child: Text(
    //             message,
    //             style: text13,
    //             overflow: TextOverflow.ellipsis,
    //             maxLines: 4,
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2.r,
                blurRadius: 3.r,
                offset: Offset(0, 3))
          ]),
      child: Column(
        children: <Widget>[
          Container(
              child: Row(
                children: <Widget>[
                  CircleBox(size: 40.w, child: image),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            name,
                            style: text15.copyWith(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            timeUntil(time),
                            style: text13.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${rating}',
                            style: TextStyle(color: Colors.amber),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            width: 100.w,
                            child: RatingBar.builder(
                              initialRating: rating,
                              minRating: rating,
                              maxRating: rating,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                              const EdgeInsets.symmetric(horizontal: 3.0),
                              itemBuilder: (context, _) =>
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 5,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width - 100.w,
            child: Text(
              message,
              style: text13,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          )
        ],
      ),
    );
    ;
  }
}
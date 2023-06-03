import 'package:flutter/material.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';

import '../../../config/theme/text_theme.dart';
import '../../../utils/resource/colors/colors_core.dart';

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({Key? key, required this.text, required this.isMe})
      : super(key: key);
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      child: Row(
        mainAxisAlignment:
        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe) ...[
            ProfileContainer(isMe: isMe),
            SizedBox(
              width: 10.w,
            ),
          ],
          Container(
              padding: EdgeInsets.all(15.w),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              // TODO: ChangeColor
              decoration: BoxDecoration(
                color:
                isMe ? Theme.of(context).colorScheme.secondary : greyColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r),
                  bottomLeft: Radius.circular(isMe ? 15.r : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 15.r),
                ),
              ),
              child: Text(
                text,
                // TODO: ChangeColor

                style: text16.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary),
              )),
          if (!isMe)
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // TODO: ChangeColor
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(4.w),
                ),
                onPressed: () async {
                  // await sendMessageFCT(chatProvider: chatProvider);
                  // await TextToSpeech.speak(text);
                },
                child: Icon(
                  Icons.play_circle,
                  size: 22.w,
                )),
          if (isMe)
            SizedBox(
              width: 10.w,
            ),
          if (isMe) ProfileContainer(isMe: isMe)
        ],
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({Key? key, required this.isMe}) : super(key: key);
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        // TODO: ChangeColor
        color: isMe ? Theme.of(context).colorScheme.secondary : greyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
          bottomLeft: Radius.circular(isMe ? 0 : 15.r),
          bottomRight: Radius.circular(isMe ? 15.r : 0),
        ),
      ),
      child: Icon(
        isMe ? Icons.person : Icons.computer,
        // TODO: ChangeColor
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}

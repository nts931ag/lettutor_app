import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/chat/providers/chats_provider.dart';
import 'package:lettutor_app/presentation/chat/widgets/chat_item_widget.dart';
import 'package:lettutor_app/presentation/chat/widgets/text_input_message_widget.dart';
import 'package:lettutor_app/presentation/widgets/base/base_scaffold_custom_widget.dart';
import 'package:provider/provider.dart';

enum InputMode { text, voice }

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ScrollController _listScrollController;

  @override
  void initState() {
    _listScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_listScrollController.hasClients) {
        _listScrollController.animateTo(_listScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);
      }
    });
    return SafeArea(
      child: BaseScaffoldWidgetCustom(
        ishaveTrailing: true,
        resizeToAvoidBottomInset: true,
        isPaddingDefault: false,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _listScrollController,
                itemCount: chatProvider.chatList.length,
                itemBuilder: (context, index) => ChatItemWidget(
                  text: chatProvider.chatList[index].content,
                  isMe: chatProvider.chatList[index].role == 'user'
                      ? true
                      : false,
                ),
              ),
            ),
            // if (_isTyping) ...[
            //   SpinKitThreeBounce(
            //     color: Colors.white,
            //     size: 18.w,
            //   )
            // ],
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextInputMessageWidget(
                  scrollToBottom: scrollListToEnd,
                )),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  void scrollListToEnd() {
    // _listScrollController.animateTo(
    //     _listScrollController.position.maxScrollExtent,
    //     duration: const Duration(seconds: 2),
    //     curve: Curves.easeOut);
  }
}

import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/chat/widgets/toggle_button_widget.dart';
import 'package:lettutor_app/presentation/widgets/commons/text_field/baset_text_field_widget.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../utils/resource/colors/colors_core.dart';
import '../chat_screen.dart';
import '../providers/chats_provider.dart';

class TextInputMessageWidget extends StatefulWidget {
  const TextInputMessageWidget({Key? key, required scrollToBottom})
      : _scrollToBottom = scrollToBottom;
  final VoidCallback _scrollToBottom;

  @override
  State<TextInputMessageWidget> createState() => _TextInputMessageWidgetState();
}

class _TextInputMessageWidgetState extends State<TextInputMessageWidget> {
  late TextEditingController textEditingController;
  var _isListening = false;
  bool _isReplying = false;
  InputMode _inputMode = InputMode.voice;
  late FocusNode focusNode;

  // final VoiceHandler voiceHandler = VoiceHandler();

  @override
  void initState() {
    focusNode = FocusNode();
    textEditingController = TextEditingController();
    // voiceHandler.initSpeech();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    // final voiceProvider = Provider.of<VoiceProvider>(context);
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) {
              value.isNotEmpty
                  ? setInputMode(InputMode.text)
                  : setInputMode(InputMode.voice);
            },
            focusNode: focusNode,
            controller: textEditingController,
            onSubmitted: (value) async {
              await sendMessageFCT(
                chatProvider: chatProvider, /*voiceProvider: voiceProvider*/
              );
            },
            // TODO: ChangeColor
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              /*border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    // TODO: ChangeColor
                    color: Theme.of(context).colorScheme.onSecondary),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),*/
              border: underLineIntputBorder(
                  width: 2, color: greyBorderColor, radius: 5.0),
              focusedBorder: underLineIntputBorder(
                  width: 2, color: greyBorderColor, radius: 5.0),
              enabledBorder: underLineIntputBorder(
                  width: 2, color: greyBorderColor, radius: 5.0),
              errorBorder: underLineIntputBorder(
                  width: 2, color: redColor, radius: 5.0),
              focusedErrorBorder: underLineIntputBorder(
                  width: 2, color: redColor, radius: 5.0),
            ),
          ),
        ),
        SizedBox(
          width: 6.w,
        ),
        ToggleButton(
          inputMode: _inputMode,
          sendMsgByText: () {
            sendMessageFCT(
              chatProvider: chatProvider, /*voiceProvider: voiceProvider*/
            );
          },
          sendMsgByVoice: () {
            // sendVoiceMessage(
            //     chatProvider: chatProvider, voiceProvider: voiceProvider);
          },
          isListening: _isListening,
          isReplying: _isReplying,
        )
      ],
    );
  }

  void setReplyingState(bool isReplying) {
    setState(() {
      _isReplying = isReplying;
    });
  }

  void setListeningState(bool value) {
    setState(() {
      _isListening = value;
    });
  }

  void setInputMode(InputMode inputMode) {
    setState(() {
      _inputMode = inputMode;
    });
  }

/*
  void sendVoiceMessage(
      {required ChatProvider chatProvider,
        required VoiceProvider voiceProvider}) async {
    if (voiceHandler.speechToText.isListening) {
      await voiceHandler.stopListening();
      setListeningState(false);
    } else {
      setListeningState(true);
      final result = await voiceHandler.startListening();
      setListeningState(false);
      textEditingController.text = result;
      sendMessageFCT(chatProvider: chatProvider, voiceProvider: voiceProvider);
    }
  }

  */
  Future<void> sendMessageFCT({
    required ChatProvider chatProvider,
    /*required VoiceProvider voiceProvider*/
  }) async {
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter your message"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final message = textEditingController.text;

      setState(() {
        _isReplying = true;
        chatProvider.addUserMessage(content: message);
        chatProvider.addTypingMessage();
        _inputMode = InputMode.voice;
        textEditingController.clear();
        focusNode.unfocus();
      });

      final chatModel = await chatProvider.sendMessageAndGetAnswers();
      // if (voiceProvider.autoVoice == true) {
      //   await TextToSpeech.speak(chatModel.content);
      // }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setReplyingState(false);
      widget._scrollToBottom();
    }
  }
}

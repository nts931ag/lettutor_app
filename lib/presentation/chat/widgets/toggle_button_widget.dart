import 'package:flutter/material.dart';
import 'package:lettutor_app/presentation/chat/chat_screen.dart';
import 'package:lettutor_app/utils/resource/dimens.dart';


class ToggleButton extends StatefulWidget {
  const ToggleButton(
      {Key? key,
        required InputMode inputMode,
        required VoidCallback sendMsgByText,
        required VoidCallback sendMsgByVoice,
        required bool isListening,
        required bool isReplying})
      : _inputMode = inputMode,
        _sendMsgByText = sendMsgByText,
        _sendMsgByVoice = sendMsgByVoice,
        _isListening = isListening,
        _isReplying = isReplying;

  final _inputMode;
  final VoidCallback _sendMsgByVoice;
  final VoidCallback _sendMsgByText;
  final bool _isListening;
  final bool _isReplying;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          // TODO: ChangeColor
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          shape: const CircleBorder(),
          padding: EdgeInsets.all(15.w),
        ),
        onPressed: widget._isReplying
            ? null
            : widget._inputMode == InputMode.text
            ? widget._sendMsgByText
            : widget._sendMsgByVoice,
        child: Icon(
          widget._inputMode == InputMode.text
              ? Icons.send
              : widget._isListening
              ? Icons.mic_off
              : Icons.mic,
          size: 22.w,
        ));
  }
}

import 'package:carrot_market/models/chat_message.dart';
import 'package:carrot_market/screens/components/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../theme.dart';

class ChatContainer extends StatelessWidget {
  final ChatMessage chatMessage;
  const ChatContainer({Key? key, required this.chatMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      height: 100,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            ImageContainer(
                borderRadius: 25,
                imageUrl: chatMessage.profileImage,
                width: 50,
                height: 50),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: chatMessage.sender, style: textTheme().bodyText1),
                    TextSpan(text: chatMessage.location),
                    TextSpan(text: ' - ${chatMessage.sendDate}')
                  ])),
                  Spacer(),
                  Text(
                    chatMessage.message,
                    style: textTheme().bodyText1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                ],
              ),
            ),
            Visibility(
              visible: chatMessage.imageUri != null,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageContainer(
                    width: 50,
                    height: 50,
                    borderRadius: 8,
                    imageUrl: chatMessage.imageUri ?? '',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

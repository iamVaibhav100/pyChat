import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.isMe, {
    this.key,
  });

  final Key key;
  final String userName;
  final String userImage;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: isMe ? null : 18,
          right: isMe ? 18 : null,
          child: Text(
            userName,
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.grey[600],
            ),
          ),
        ),
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  bottomLeft: isMe ? Radius.circular(12.0) : Radius.circular(0),
                  bottomRight:
                      isMe ? Radius.circular(0) : Radius.circular(12.0),
                ),
              ),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    message,
                    style: GoogleFonts.montserratAlternates(
                      textStyle: TextStyle(
                        color: isMe
                            ? Theme.of(context).colorScheme.onSecondary
                            : Colors.black,
                      ),
                    ),
                    textAlign: isMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isMe)
          Positioned(
            top: -7,
            right: 245,
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
      ],
      clipBehavior: Clip.none,
    );
  }
}

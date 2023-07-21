import 'package:carbon_voice/domain/models/chat_entry_model.dart';
import 'package:carbon_voice/domain/models/chat_message.dart';
import 'package:carbon_voice/domain/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class MessageTile extends StatelessWidget {
  final ChatMessage message;
  final ChatEntry chat;
  final User user;

  const MessageTile({
    super.key,
    required this.message,
    required this.user,
    required this.chat,
  });

  bool get isMe => message.senderUid == user.uid;

  String get senderName {
    if (!isMe) {
      return chat.contact!.username;
    } else {
      return user.username;
    }
  }

  String get formattedDate {
    DateFormat dateFormat = DateFormat('MM/dd HH:mm');
    return dateFormat.format(message.createdAt);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        message.message,
        textAlign: textAlign,
      ),
      subtitle: Text(
        '$senderName · $formattedDate',
        textAlign: textAlign,
      ),
      leading: !isMe ? avatar : null,
      trailing: isMe ? avatar : null,
    );
  }

  CircleAvatar get avatar {
    return CircleAvatar(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: SvgPicture.asset(
          'assets/svg/user_picture_placeholder.svg',
        ),
      ),
    );
  }

  TextAlign get textAlign {
    return isMe ? TextAlign.end : TextAlign.start;
  }
}

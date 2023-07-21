import 'package:carbon_voice/domain/models/chat_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatTile extends StatelessWidget {
  final ChatEntry chat;
  final VoidCallback onTap;

  const ChatTile({super.key, required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chat.contact!.username),
      subtitle: Text(chat.message),
      leading: CircleAvatar(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.0),
          child: SvgPicture.asset(
            'assets/svg/user_picture_placeholder.svg',
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

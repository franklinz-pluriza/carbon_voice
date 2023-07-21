import 'package:carbon_voice/domain/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactTile extends StatelessWidget{
  final Contact contact;
  final VoidCallback onTap;

  const ContactTile({super.key, required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.username),
      subtitle: Text(contact.email),
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
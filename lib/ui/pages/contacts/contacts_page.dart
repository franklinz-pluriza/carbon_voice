import 'package:carbon_voice/ui/controllers/chat_controller.dart';
import 'package:carbon_voice/ui/controllers/comms_controller.dart';
import 'package:carbon_voice/ui/enums/app_routes.dart';
import 'package:carbon_voice/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/contact_tile.dart';

class ContactsPage extends GetView<CommsController> {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.separated(
            itemCount: controller.contacts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 2),
            itemBuilder: (context, index) => ContactTile(
              contact: controller.contacts[index],
              onTap: () {
                final chatController = Get.find<ChatController>();
                chatController.selectContact(controller.contacts[index]);
                AppRouter.off(AppRoute.chat);
              },
            ),
          ),
        ),
      ),
    );
  }
}

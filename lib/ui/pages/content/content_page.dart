import 'package:carbon_voice/ui/controllers/auth_controller.dart';
import 'package:carbon_voice/ui/controllers/chat_controller.dart';
import 'package:carbon_voice/ui/controllers/comms_controller.dart';
import 'package:carbon_voice/ui/enums/app_routes.dart';
import 'package:carbon_voice/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/chat_tile.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  State<ContentPage> createState() => _State();
}

class _State extends State<ContentPage> {
  late final CommsController controller;
  late final AuthController authController;
  late final Future<void> initializationFuture;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    authController = Get.find();
    // We fetch the contacts here because we want to fetch them only once, but we do it as a background task,
    // so we don't block the UI thread.
    controller.fetchContacts();
    initializationFuture = controller.init(authController.currentUser!);
    // Handling chat history as a future because if we were making requests to an API, this would be asynchronous.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carbon Voice'),
        actions: [
          IconButton(
            onPressed: () => authController.signOut(),
            icon: const Icon(
              Icons.power_settings_new,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: initializationFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // We fetch the chat history each time the page is rendered, not just the first time,
              // because in the case one user logout and another login, we want to show the chat history of the new user.
              // This doesn't mean is going to be slow every time, because in a real app we'd be fetching this data from a local database, adn triggering a network request only when necessary.
              return FutureBuilder(
                future: controller.fetchChatHistory(authController.currentUser!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Obx(
                      () => ListView.separated(
                        itemCount: controller.chats.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemBuilder: (context, index) => ChatTile(
                          chat: controller.chats[index],
                          onTap: () {
                            final chatController = Get.find<ChatController>();
                            final chat = controller.chats[index];
                            chatController.selectContact(chat.contact);
                            chatController.selectChat(chat);
                            AppRouter.to(AppRoute.chat);
                          },
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppRouter.to(AppRoute.contacts);
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}

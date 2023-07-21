import 'package:carbon_voice/ui/controllers/auth_controller.dart';
import 'package:carbon_voice/ui/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/message_tile.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _State();
}

class _State extends State<ChatPage> {
  late final ChatController controller;
  late final AuthController authController;
  late final Future<void> initializationFuture;
  late final TextEditingController messageController;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    authController = Get.find();
    initializationFuture = controller.getMessages(authController.currentUser!);
    messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.selectContact(null);
        controller.selectChat(null);
        controller.clearMessages();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(
              controller.contact?.username ?? 'Chat',
            ),
          ),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: initializationFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Obx(
                        () => ListView.separated(
                          reverse: true,
                          itemCount: controller.chatMessages.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, index) => MessageTile(
                            message: controller.chatMessages[index],
                            chat: controller.chat!,
                            user: authController.currentUser!,
                          ),
                        ),
                      ),
                    ),
                    const Divider(height: 1),
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a message',
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () {
                              controller.sendMessage(
                                authController.currentUser!,
                                messageController.text,
                              );
                              messageController.clear();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}

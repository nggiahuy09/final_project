import 'package:final_project/consts/app_color.dart';
import 'package:final_project/utils/global_methods.dart';
import 'package:final_project/views/chatbot_ai/develop_chat_bot_ai.dart';
import 'package:final_project/views/chats/history_thread_chats.dart';
import 'package:final_project/widgets/dropdown_model_ai.dart';
import 'package:final_project/widgets/tab_bar_widget.dart';
import 'package:final_project/widgets/input_image_item.dart';
import 'package:flutter/material.dart';

class PreviewChatbot extends StatefulWidget {
  const PreviewChatbot({super.key});

  @override
  State<PreviewChatbot> createState() => _MainChatPageState();
}

class _MainChatPageState extends State<PreviewChatbot> {
  final List<String> messages = ['hehe', 'hihi', 'huhu', 'haha'];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Preview Chatbot',
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.inverseTextColor,
      ),
      // drawer: const Drawer(),
      drawer: const TabBarWidget(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Text(
                        messages[messages.length - 1 - index],
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Flexible(child: DropdownModelAI()),                   
                    Row(
                      children: [
                        IconButton(
                          tooltip: 'Edit',
                          onPressed: () {
                            Utils.showBottomSheet(
                              context,
                              sheet: const HistoryThreadChatPage(),
                              showFullScreen: true,
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        IconButton(
                          tooltip: 'Develop',
                          onPressed: () {
                            Utils.showBottomSheet(
                              context,
                              sheet: const DevelopChatbotAI(),
                              showFullScreen: true,
                            );
                          },
                          icon: const Icon(
                            Icons.developer_board,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        IconButton(
                          tooltip: 'Add KB',
                          onPressed: () {
                            Utils.showBottomSheet(
                              context,
                              sheet: const HistoryThreadChatPage(),
                              showFullScreen: true,
                            );
                          },
                          icon: const Icon(
                            Icons.access_time_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.backgroundColor2,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _controller,
                          minLines: 1,
                          maxLines: 4,
                          expands: false,
                          onSubmitted: (value) {},
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ask me anything',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.settings_suggest_outlined),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.image,
                                  color: AppColors.primaryColor,
                                ),
                                onPressed: () {
                                  Utils.showBottomSheet(
                                  context,
                                  sheet: const InputImage(),
                                  showFullScreen: true,
                                );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  color: AppColors.primaryColor,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChatMessage {
  final String message;
  final bool isOperator;
  final String time;

  ChatMessage({
    required this.message,
    required this.isOperator,
    required this.time,
  });
}

class ChatScreen extends StatefulWidget {
  final String title;
  final List<ChatMessage> initialMessages;

  const ChatScreen({
    super.key,
    required this.title,
    this.initialMessages = const [],
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late List<ChatMessage> messages;

  @override
  void initState() {
    super.initState();
    messages = List.from(widget.initialMessages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB4C5D1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB4C5D1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: message.isOperator
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          if (message.isOperator)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5A7A8F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.flight,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Go2Airport',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ],
              ),
            ),
          Row(
            mainAxisAlignment: message.isOperator
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (message.isOperator) const SizedBox(width: 48),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: message.isOperator
                        ? Colors.white
                        : const Color(0xFFFFEB3B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    message.message,
                    style: const TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                message.time,
                style: const TextStyle(color: Colors.black38, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.grey),
              onPressed: () {},
              padding: EdgeInsets.zero,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Send a Message to Operator',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

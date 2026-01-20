import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> chatList = const [
    {'name': 'Alice', 'message': '안녕하세요. 홍길동입니다.', 'time': '10:30 오전', 'image': 'https://i.pinimg.com/736x/0e/51/88/0e51888aa8722c45dd597a6d3fbc7e36.jpg', 'title': 'Chat with Alice'},
    {'name': 'Bob', 'message': '나중에 만나서 얘기하자.', 'time': '9:15 오전', 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfVcBBWEY0bwU98ny9V2IicloGNvKkgjhAuw&s', 'title': 'Chat with Bob'},
    {
      'name': 'Charlie',
      'message': '어젯밤 경기 봤어?',
      'time': '어제',
      'image': 'https://i.pinimg.com/originals/7c/60/03/7c6003e2f783b2560d7f727a7b506496.jpg',
      'title': 'Chat with Charlie'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar with title and icons
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '채팅',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Icons on the right side
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 20,
              children: [
                Icon(Icons.search, color: Colors.black),
                Icon(Icons.sms_rounded, color: Colors.black),
                Icon(Icons.settings, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              // Buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      '천체',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      '안읽음',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      '친구',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text(
                      '직장',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Banner
              Container(
                height: 100,
                width: 350,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(238, 228, 228, 228),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    // Texts in banner
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '오늘의 카카오가 궁금하다면?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '카카오소식 보러가기',
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 48, 48, 48),

                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 6,
                      children: [
                        Icon(
                          Icons.houseboat_sharp,
                          color: Colors.green,
                          size: 27,
                        ),
                        Icon(
                          Icons.speaker_sharp,
                          color: Colors.yellow,
                          size: 27,
                        ),
                        Icon(Icons.calendar_month),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListView.builder(itemCount: chatList.length, shrinkWrap: true, itemBuilder: (context, index) {
                      final chat = chatList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(chat['image']!),
                        ),
                        title: Text(
                          chat['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(chat['message']!),
                        trailing: Text(
                          chat['time']!,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatScreen(title: chat['title']!)),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chat_sudaman_app/chatGPT/chat_gpt_page.dart';
import 'package:chat_sudaman_app/defines/color_defines.dart';
import 'package:chat_sudaman_app/defines/font_defines.dart';
import 'package:chat_sudaman_app/home/home_page.dart';
import 'package:chat_sudaman_app/imageGPT/image_gpt_page.dart';
import 'package:chat_sudaman_app/search/search_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // 현재 선택된 아이템 인덱스

  final List<Widget> _pages = [
    const HomePage(),
    const ChatGPTPage(),
    const ImageGPTPage(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: ColorDefines.bgWhite,
        child: Center(child: Text('drawer menu'),),
      ),
      appBar: AppBar(
        title: Text('수다맨', style: FontDefines.headlineTitle),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.person_outline)
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded), label: '챗'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: '이미지'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
        ],
        iconSize: 20,
        selectedItemColor: ColorDefines.iconPointColor,
        selectedFontSize: 12,
        unselectedItemColor: ColorDefines.iconDark,
        unselectedFontSize: 12,
        currentIndex: _selectedIndex, // 현재 선택된 아이템 인덱스
        onTap: _onItemTapped, // 아이템을 탭했을 때 처리할 함수
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 아이템 인덱스 업데이트
    });
  }
}
import 'package:chat_sudaman_app/defines/color_defines.dart';
import 'package:chat_sudaman_app/defines/font_defines.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: ColorDefines.bgWhite,
        child: Center(child: Text('asd'),),
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
      body: const Center(child: Text('body'),),
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
      ),
    );
  }
}
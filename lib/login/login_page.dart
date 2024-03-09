import 'package:chat_sudaman_app/defines/button_defines.dart';
import 'package:chat_sudaman_app/defines/font_defines.dart';
import 'package:chat_sudaman_app/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50,0,50,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to', style: FontDefines.contentsDefaultTxt),
              Text('Suda Man', style: FontDefines.crewName),
              const SizedBox(height: 100),
              ElevatedButton.icon(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                },
                icon: SvgPicture.asset(
                  'assets/icon/icon_kakao_login.svg',
                  width: 20,
                ),
                label: Text('카카오 로그인', style: FontDefines.kakaoLoginBtnBlack),
                style: ButtonDefines.kakaoLoginElBtn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
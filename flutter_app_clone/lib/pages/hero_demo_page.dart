import 'package:flutter/material.dart';

class HeroAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          tag: 'avatar', //unique mark, animation page's hero tag must be same
          child: ClipOval(
            child: Image.asset(
              'assets/images/avatar.png',
              width: 50,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(pageBuilder:
              (BuildContext context, Animation animtion,
                  Animation secondartAnimation) {
            return FadeTransition(
              opacity: animtion,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('原图'),
                ),
                body: HeroAnimationPageB(),
              ),
            );
          }));
        },
      ),
    );
  }
}

class HeroAnimationPageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Hero(
          tag: 'avatar',
          child: Image.asset('assets/images/avatar.png'),
        ),
      ),
    );
  }
}

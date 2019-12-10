import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  @override
  _ScaleAnimationPageState createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends State<ScaleAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    // create controller
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

// create animtion rule,return a animation object(contains a sequence value in a certain duration)
    // animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
    //   ..addListener(() {
    //     setState(() {});
    //   });

// add a curve
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
// use AnimatedWidget
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

// controller begin
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(animation: animation);

    // return Center(
    //   child: Image.asset(
    //     'assets/images/avatar.png',
    //     width: animation.value,
    //     height: animation.value,
    //   ),
    // );
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
        child: Image.asset('assets/images/avatar.png',
            width: animation.value, height: animation.value));
  }
}

//extract animation widget
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              return new Container(
                width: animation.value,
                height: animation.value,
                child: child,
              );
            }));
  }
}

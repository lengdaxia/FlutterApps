import 'package:flutter/material.dart';


class ProgressPage extends StatefulWidget {
  @override

  _ProgressPageState createState() => _ProgressPageState();
}


class _ProgressPageState extends State<ProgressPage> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState((){

    }));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            // 模糊进度条，会执行一个动画
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            Divider(height: 30,),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            Divider(height: 30,),

            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            Divider(height: 30,),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: 0.5,
            ),
            Divider(height: 30,),

            // 指定进度条的高度和大小
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ),
            Divider(height: 30,),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.7,
              ),
            ),
            Divider(height: 30,),
            Padding(
              padding: EdgeInsets.all(16),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.grey, end: Colors.blue).animate(_animationController),
                value: _animationController.value,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// class ProgressPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Column(
//           children: <Widget>[
//             // 模糊进度条，会执行一个动画
//             LinearProgressIndicator(
//               backgroundColor: Colors.grey[200],
//               valueColor: AlwaysStoppedAnimation(Colors.blue),
//             ),
//             Divider(height: 30,),
//             LinearProgressIndicator(
//               backgroundColor: Colors.grey[200],
//               valueColor: AlwaysStoppedAnimation(Colors.blue),
//               value: .5,
//             ),
//             Divider(height: 30,),

//             CircularProgressIndicator(
//               backgroundColor: Colors.grey[200],
//               valueColor: AlwaysStoppedAnimation(Colors.blue),
//             ),
//             Divider(height: 30,),
//             CircularProgressIndicator(
//               backgroundColor: Colors.grey[200],
//               valueColor: AlwaysStoppedAnimation(Colors.blue),
//               value: 0.5,
//             ),
//             Divider(height: 30,),

//             // 指定进度条的高度和大小
//             SizedBox(
//               height: 3,
//               child: LinearProgressIndicator(
//                 backgroundColor: Colors.grey[200],
//                 valueColor: AlwaysStoppedAnimation(Colors.blue),
//                 value: .5,
//               ),
//             ),
//             Divider(height: 30,),
//             SizedBox(
//               height: 100,
//               width: 100,
//               child: CircularProgressIndicator(
//                 backgroundColor: Colors.grey[200],
//                 valueColor: AlwaysStoppedAnimation(Colors.blue),
//                 value: 0.7,
//               ),
//             )

//           ],
//         ),
//       ),
//     );
//   }
// }
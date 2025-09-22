import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/View/rate_food_screens/ratefood_screen.dart';

class CallScreen extends StatefulWidget {
  final String userName;
  final String userImage;

  const CallScreen({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User image
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(widget.userImage),
              ),
            ),
            const SizedBox(height: 20),

            // User name
            Text(
              widget.userName,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Call duration
            Text(
              _formatDuration(_seconds),
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(height: 40),

            // End call button
            Spacer(),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            IconButton(
              onPressed: () {
                Navigator.pop(context); // End call
              },
              icon: const Icon(Icons.volume_up, color: Colors.white, size: 40),
              style: IconButton.styleFrom(
                backgroundColor: Colors.green[100],
                padding: const EdgeInsets.all(20),
                shape: const CircleBorder(),
              ),
            ),
            SizedBox(width: 10,),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RatefoodScreen() )); // End call
              },
              icon: const Icon(Icons.close, color: Colors.white, size: 40),
              style: IconButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(20),
                shape: const CircleBorder(),
              ),
            )

            ],
           ),
           SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}

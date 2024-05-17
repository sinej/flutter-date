import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D163D),
      body: SafeArea(
        top: true,
        bottom: false,
        child: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            children: [
              // 텍스트
              _Top(
                  selectedDate: selectedDate,
                  onPressed: onHeartButtonPressed,
              ),
              // 이미지
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }

  void onHeartButtonPressed() {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              maximumDate: DateTime.now(),
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
              dateOrder: DatePickerDateOrder.ymd,
            ),
          ),
        );
      },
    );
  }
}


class _Top extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback? onPressed;

  const _Top({
    required this.selectedDate,
    required this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme
        .of(context)
        .textTheme;

    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              "U&I",
              style: textTheme.displayLarge,
            ),
            Text(
              "우리 처음 만난 날",
              style: textTheme.bodyLarge,
            ),
            Text(
              "${selectedDate.year}.${selectedDate.month}.${selectedDate.day}",
              style: textTheme.bodyMedium,
            ),
            IconButton(
                iconSize: 60.0,
                color: Colors.red[500],
                onPressed: onPressed,
                icon: Icon(Icons.favorite)
            ),
            Text(
              "D+${now
                  .difference(selectedDate)
                  .inDays + 1}",
              style: textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.green,
        child: Image.asset('asset/image/middle_image.png'),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzify/controller/quiz_controller.dart';
import 'package:quizzify/utils/colors.dart';
import 'package:quizzify/utils/text_styles.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuizController>(context, listen: false).startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QuizController>(context);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.blue,
                AppColors.darkBlue,
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColors.lightGrey,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.xmark,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        controller.seconds.toString(),
                        style: AppStyles.textStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                        width: size.width * 0.2,
                        child: CircularProgressIndicator(
                          value: controller.seconds / 60,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          backgroundColor: AppColors.lightGrey,
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.lightGrey,
                        width: 2,
                      ),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: Text(
                        "Like",
                        style: AppStyles.textStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

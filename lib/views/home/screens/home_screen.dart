import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzify/utils/assets.dart';
import 'package:quizzify/utils/colors.dart';
import 'package:quizzify/utils/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.xmark,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              Image.asset(AppAssets.balloon2),
              const SizedBox(height: 20),
              Text(
                "Welcome to our app",
                style: AppStyles.textStyle(
                  color: AppColors.lightGrey,
                  fontSize: 19,
                ),
              ),
              Text(
                "Quiz App",
                style: AppStyles.textStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Do you feel confident? Here you can test your knowledge and learn new things.",
                style: AppStyles.textStyle(
                  color: AppColors.lightGrey,
                  fontSize: 17,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(
                      size.width - 100,
                      size.height / 15,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    "Continue",
                    style: AppStyles.textStyle(
                      color: AppColors.blue,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

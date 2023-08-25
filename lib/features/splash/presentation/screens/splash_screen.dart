import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_seeker/constants/app_colors.dart';
import 'package:job_seeker/features/jobs/presentation/screens/my_jobs_list_screen.dart';
import 'package:job_seeker/widgets/common_widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {


  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    navigateToHomeScreen();
    super.initState();
  }

  Future<void> navigateToHomeScreen() async {
    await getPermission();
    await Future.delayed(const Duration(seconds: 3)).then((value)  {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
      const MyJobsList()), (Route<dynamic> route) => false,);});
    }


  Future<void> getPermission() async {
    await Permission.location.request().then((value) async {
      if (await Permission.location.isGranted) {
        log('permission granted');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColor,
        body: Center(
            child: Container(
          height: 150,
          width: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: textWidget(
              title: 'Job Seeker',
              textAlign: TextAlign.center,
              fontSize: 20,
              textColor: Colors.white,
            ),
          ),
        )));
  }
}

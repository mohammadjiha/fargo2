import 'package:fargo/constant/color_app/color_app.dart';
import 'package:fargo/view/selct_language/screen/selct_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingScreen extends StatefulWidget{
  static const String routName='LoadingScreen';
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      if(mounted) {
        Navigator.of(context).pushReplacementNamed(LoadingScreen.routName);
      }});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.background,
      body: Center(
        child:SvgPicture.asset('assets/svg/logo.svg') ,
      ),
    );
  }
}
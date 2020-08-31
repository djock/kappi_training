import 'package:flutter/material.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/utils.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: AppColors.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(Utils.getLoadingScreenText(), style: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
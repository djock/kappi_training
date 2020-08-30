import 'package:flutter/material.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/safe_screen.dart';
import 'package:kappi_training/widgets/programs_swiper_widget.dart';
import 'package:kappi_training/widgets/workouts_swiper_widget.dart';

class ProgramsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeScreen(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          title: Text(
            'Kappi Training',
            style: TextStyle(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProgramsSwiperWidget(
                isFavourite: true,
              ),
              SizedBox(
                height: 30,
              ),
              ProgramsSwiperWidget(
                isFavourite: false,
              ),
              SizedBox(
                height: 30,
              ),
              WorkoutsSwiperWidget(),
            ],
          ),
        ));
  }
}

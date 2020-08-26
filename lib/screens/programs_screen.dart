import 'package:flutter/material.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/safe_screen.dart';
import 'package:kappi_training/widgets/programs_swiper_widget.dart';
import 'package:kappi_training/widgets/workouts_vertical_list_widget.dart';

class ProgramsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeScreen(
        appBar: AppBar(
          title: Text(
            'Kappi Training',
            style: TextStyle(color: AppColors.textColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProgramsSwiperWidget(),
              SizedBox(
                height: 30,
              ),
              WorkoutsVerticalListWidget(),
            ],
          ),
        ));
  }
}

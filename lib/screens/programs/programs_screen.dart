import 'package:flutter/material.dart';
import 'package:kappi_training/utilities/utils.dart';
import 'package:kappi_training/widgets/safe_screen.dart';
import 'package:kappi_training/widgets/programs/programs_swiper_widget.dart';
import 'package:kappi_training/widgets/workouts/workouts_swiper_widget.dart';

class ProgramsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeScreen(
        appBar: Utils.buildAppBar(context, 'Kappi Training'),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProgramsSwiperWidget(),
              SizedBox(height: 30),
              WorkoutsSwiperWidget(),
            ],
          ),
        ));
  }
}

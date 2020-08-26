import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kappi_training/models/program.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/widgets/program_card_widget.dart';

class ProgramsSwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Program> _programs = AppState.programs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              'Programs',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.mainColor),
            )),
        Container(
          height: 200,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ProgramCardWidget(program: _programs[index]);
            },
            itemCount: _programs.length,
            loop: false,
            viewportFraction: 0.83,
            scale: 0.9,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kappi_training/models/program_model.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/utilities/app_theme.dart';
import 'package:kappi_training/widgets/programs/program_swiper_card_widget.dart';

class ProgramsSwiperWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<ProgramModel> _programs = AppState.programs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              'Programs',
              style: AppTheme.headerDarkStyle(),
            )),
        Container(
          height: 200,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ProgramSwiperCardWidget(program: _programs[index]);
            },
            itemCount: _programs.length,
            loop: false,
            viewportFraction: _programs.length != 1 ?  0.93 : 1,
            control: new SwiperControl(
              padding: EdgeInsets.all(10.0),
              color: Colors.black12.withOpacity(0.2),
              disableColor: Colors.transparent,
            ),
            scale: 1,
            fade: 0.5,
          ),
        ),
      ],
    );
  }
}

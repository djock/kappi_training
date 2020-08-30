import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kappi_training/models/program.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/widgets/program_card_widget.dart';

class ProgramsSwiperWidget extends StatelessWidget {
  final bool isFavourite;

  const ProgramsSwiperWidget({Key key, this.isFavourite}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Program> _programs = AppState.programs;

    if(isFavourite)
      _programs = _programs.where((element) => element.favourite).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              isFavourite ? 'Favourite Programs' : 'Programs',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.mainColor),
            )),
        Container(
          height: 200,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ProgramCardWidget(program: _programs[index], isFavourite: isFavourite,);
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

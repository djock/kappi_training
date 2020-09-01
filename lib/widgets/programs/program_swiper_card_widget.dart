import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kappi_training/models/program_model.dart';
import 'package:kappi_training/screens/programs/program_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/utilities/app_theme.dart';
import 'package:kappi_training/widgets/info_text.dart';

class ProgramSwiperCardWidget extends StatelessWidget {
  final ProgramModel program;

  const ProgramSwiperCardWidget({Key key, this.program}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProgramDetailsScreen(
                      programModel: program,
                    )));
      },
      child: new Card(
        color: AppColors.mainColor,
        margin: EdgeInsets.only(left: 10, right: 10, top: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [AppColors.mainColor, Colors.redAccent])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                program.name,
                style: AppTheme.headerLightStyle(),
              ),
              SizedBox(height: 10,),
              InfoText(info: 'Type:', value: program.type, icon: FontAwesomeIcons.shieldAlt,),
              InfoText(info: 'Levels:', value: program.levelsCount.toString(), icon: FontAwesomeIcons.signal,),
              InfoText(info: 'From:', value: program.author, icon: FontAwesomeIcons.userAlt,),
            ],
          ),
        ),
      ),
    );
  }
}

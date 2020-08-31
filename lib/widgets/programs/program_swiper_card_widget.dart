import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kappi_training/models/program_model.dart';
import 'package:kappi_training/screens/programs/program_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';

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
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [AppColors.mainColor, Colors.red])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  program.name,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              _buildInfoText('Type:', program.type, FontAwesomeIcons.shieldAlt),
              _buildInfoText('Levels:', program.levelsCount.toString(),
                  FontAwesomeIcons.signal),
              _buildInfoText('From:', program.author, FontAwesomeIcons.userAlt),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoText(String info, String value, IconData icon) {
    if (value.isNotEmpty && value != '1') {
      return Row(
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.textColor,
            size: 16,
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text(
              info + ' ' + value,
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 14),
            ),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}

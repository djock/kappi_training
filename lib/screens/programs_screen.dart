import 'package:flutter/material.dart';
import 'package:kappi_training/screens/program_details_screen.dart';
import 'package:kappi_training/screens/workout_details_screen.dart';
import 'package:kappi_training/utilities/app_colors.dart';
import 'package:kappi_training/utilities/app_state.dart';
import 'package:kappi_training/utilities/safe_screen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ProgramsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _programs = AppState.programs;

    return SafeScreen(
        appBar: AppBar(
          title: Text('Kappi Training', style: TextStyle(color: AppColors.textColor),),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
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
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProgramDetailsScreen(
                                      programModel: _programs[index],
                                    )));
                      },
                      child: new Card(
                        color: AppColors.mainColor,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 13),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ListTile(
                                leading: SizedBox(
                                    child: IconButton(
                                  icon: Icon(Icons.fitness_center,
                                      color: AppColors.textColor),
                                  onPressed: null,
                                )),
                                title: Text(
                                  _programs[index].name,
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                  fontSize: 20),
                                ),
                               subtitle: Text('Type: ' +
                                  _programs[index].type,
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                onTap: null),
                            ListTile(
                              leading: SizedBox(
                                  child: IconButton(
                                icon: Icon(Icons.account_circle,
                                    color: AppColors.textColor),
                                onPressed: null,
                              )),
                              title: Text(
                                'Created by ' + _programs[index].author,
                                style: TextStyle(color: AppColors.textColor),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProgramDetailsScreen(
                                              programModel: _programs[index],
                                            )));
                              },
                              focusColor: AppColors.mainColor,
                              hoverColor: AppColors.mainColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: _programs.length,
                  loop: false,
                  viewportFraction: 0.83,
                  scale: 0.9,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    'Workouts',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.mainColor),
                  )),
              Container(
                child: new ListView.builder(
                  shrinkWrap: true,
                  itemCount: AppState.individualWorkouts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: SizedBox(
                          child: IconButton(
                            icon: Icon(Icons.filter_tilt_shift, color: AppColors.mainColor),
                            onPressed: null,
                          )),
                      title: Text(
                          AppState.individualWorkouts[index].name),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WorkoutDetailsScreen(
                                    workout: AppState.individualWorkouts[index],
                                  )));
                        }
                    );
                  }
                ),
              ),
            ],
          ),
        ));
  }
}

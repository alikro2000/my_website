import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_website/constants.dart';
import 'package:my_website/data/datasource/remote/remote_data_source.dart';
import 'package:my_website/data/repository/repository_impl.dart';
import 'package:my_website/domain/usecase/get_skills.dart';
import 'package:my_website/presentation/bloc/chip_bloc.dart';
import 'package:my_website/presentation/bloc/skill_chip_state.dart';
import 'home_screen_left_rectangle.dart';
import 'home_screen_top_menu_bar.dart';
import 'rounded_button.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ChipCubit chipCubit;
  late Size _screenSize;

  @override
  void initState() {
    RemoteDataSourceImpl remoteDataSourceImpl = RemoteDataSourceImpl();
    RepositoryImpl repositoryImpl = RepositoryImpl(remoteDataSourceImpl);
    GetSkills getSkills = GetSkills(repositoryImpl);
    chipCubit = ChipCubit(getSkills);
    chipCubit.loadData();
  }

  @override
  void dispose() {
    chipCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => chipCubit,
      child: Scaffold(
        body: Container(
          width: _screenSize.width,
          child: Stack(
            children: [
              HomeScreenLeftRectangle(screenSize: _screenSize),
              Positioned(
                right: 0,
                top: 150,
                child: Container(
                  // height: double.infinity,
                  width: _screenSize.width / 2,
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(360),
                        child: Image.asset(
                          'assets/images/pp.png',
                          width: 400,
                        ),
                      ),
                      SizedBox(height: 50),
                      RoundedButton(
                        text: 'Download my CV',
                        width: 320,
                        prefixImageLocation: 'assets/images/pdf_logo_01.png',
                        onClickedURL: 'https://www.google.com',
                      ),
                      SizedBox(height: 50),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Things I can help with',
                          style: kChipTextStyle,
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: BlocBuilder<ChipCubit, SkillChipState>(
                          bloc: chipCubit,
                          builder: (context, state) {
                            if (state is SkillChipInitial) {
                              return Text('Initial');
                            } else if (state is SkillChipLoading) {
                              return CircularProgressIndicator(
                                color: kTextColor,
                                backgroundColor: kLightBrownColor,
                              );
                            } else if (state is SkillChipLoaded) {
                              return Wrap(children: getSkillChips(state.skills));
                            } else if (state is SkillChipError) {
                              return Text('ERROR');
                            } else {
                              return Text('wtf :/');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              HomeScreenTopMenuBar(),
            ],
          ),
        ),
      ),
    );
  }

  List<Chip> getSkillChips(List<String> skills) {
    List<Chip> chips = [];
    for (int i = 0; i < skills.length; ++i) {
      chips.add(
        Chip(
            padding: EdgeInsets.all(8),
            label: Text('${skills[i]}', style: kChipTextStyle),
            backgroundColor: kLightBrownColor),
      );
    }
    return chips;
  }
}

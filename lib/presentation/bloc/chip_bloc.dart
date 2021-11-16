import 'package:bloc/bloc.dart';
import 'package:my_website/domain/usecase/get_skills.dart';
import 'package:my_website/domain/usecase/no_params.dart';
import 'package:my_website/presentation/bloc/skill_chip_state.dart';

class ChipCubit extends Cubit<SkillChipState> {
  final GetSkills getSkills;

  ChipCubit(this.getSkills) : super(SkillChipInitial());

  void loadData() async {
    emit(SkillChipLoading());

    final result = await getSkills(NoParams());
    result.fold(
      (l) => emit(SkillChipError('ERROR')),
      (r) => emit(SkillChipLoaded(r)),
    );
  }
}

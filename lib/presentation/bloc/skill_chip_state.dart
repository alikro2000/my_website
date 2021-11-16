import 'package:equatable/equatable.dart';

class SkillChipState extends Equatable {
  SkillChipState();

  @override
  List<Object?> get props => [];
}

class SkillChipInitial extends SkillChipState {
  SkillChipInitial();
}

class SkillChipLoading extends SkillChipState {
  SkillChipLoading();
}

class SkillChipLoaded extends SkillChipState {
  final List<String> skills;

  SkillChipLoaded(this.skills);

  @override
  List<Object> get props => skills;
}

class SkillChipError extends SkillChipState {
  final String message;

  SkillChipError(this.message);

  @override
  List<Object> get props => [message];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_gym_app/models/workout.dart';

abstract class WorkoutState extends Equatable{
  final Workout? workout;
  final int? elapsed;

  const WorkoutState(this.workout, this.elapsed);
}

class WorkoutInitialState extends WorkoutState{
  const WorkoutInitialState() : super(null, 0);
  @override
  List<Object?> get props => [];
}

class WorkoutEditingState extends WorkoutState{
  final int index;

  const WorkoutEditingState(Workout? workout, this.index):super(workout, 0);
  @override
  List<Object?> get props => [workout, index];
}
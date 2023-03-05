import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_gym_app/states/workout_state.dart';

import '../models/workout.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(const WorkoutInitialState());

  editWorkout(Workout workout, int index) => emit(WorkoutEditingState(workout, index));
}

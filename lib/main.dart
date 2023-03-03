import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_gym_app/blocs/workouts_cubit.dart';
import 'package:flutter_bloc_gym_app/models/workout.dart';

void main() => runApp(const WorkoutTime());

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Workout',
      theme: ThemeData(
        primaryColor: Colors.teal,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color.fromARGB(255, 66, 74, 96)),
        ),
      ),
      home: BlocProvider<WorkoutsCubit>(
        create: (context) {
          WorkoutsCubit workoutsCubit = WorkoutsCubit();
          if (workoutsCubit.state.isEmpty) {
            workoutsCubit.getWorkouts();
          }
          return workoutsCubit;
        },
        child: BlocBuilder<WorkoutsCubit, List<Workout>>(
          builder: (context, state) {
            return const Center(
              child: Text('aaaaa'),
            );
          },
        ),
      ),
    );
  }
}

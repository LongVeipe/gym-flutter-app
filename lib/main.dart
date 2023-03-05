import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_gym_app/blocs/workout_cubit.dart';
import 'package:flutter_bloc_gym_app/blocs/workouts_cubit.dart';
import 'package:flutter_bloc_gym_app/models/workout.dart';
import 'package:flutter_bloc_gym_app/screens/home_page.dart';
import 'package:flutter_bloc_gym_app/states/workout_state.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WorkoutsCubit>(
            create: (context) {
              WorkoutsCubit workoutsCubit = WorkoutsCubit();
              if (workoutsCubit.state.isEmpty) {
                workoutsCubit.getWorkouts();
              }
              return workoutsCubit;
            },
          ),
          BlocProvider<WorkoutCubit>(create: (context) => WorkoutCubit())
        ],
        child: BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (context, state) {
            if(state is WorkoutInitialState){
              print(11111);
              return const HomePage();
            }
            if(state is WorkoutEditingState){
              print(222222);
              return Container();
            }
            return Container();
          },
        ),
      )
    );
  }
}

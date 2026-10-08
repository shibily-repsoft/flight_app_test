import 'package:flight_app_test/features/flight_list/data/repository/flights_repo_impl.dart';
import 'package:flight_app_test/features/flight_list/presentation/cubits/flights_cubit.dart';
import 'package:flight_app_test/features/flight_list/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart' as getit;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FlightsCubit>(
      create: (_) => getit.getIt<FlightsCubit>()..getFlights(),
      child: BlocBuilder<FlightsCubit, FlightsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
              theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const SplashView(),
        );
      })
    );
  }
}

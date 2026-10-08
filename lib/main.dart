import 'package:flight_app_test/core/injection.dart';
import 'package:flight_app_test/features/flight_list/presentation/cubits/flights_cubit.dart';
import 'package:flight_app_test/features/flight_list/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart' as getit;
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
    print(
    'FlightsCubit registered: ${getIt.isRegistered<FlightsCubit>()}',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FlightsCubit>(
      create: (_) => getit.GetIt.instance<FlightsCubit>()..getFlights(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
          theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const SplashView(),
              )
    );
  }
}

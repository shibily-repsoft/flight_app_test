import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/features/flight_list/domain/entities/flight_entitiy.dart';
import 'package:flight_app_test/features/flight_list/presentation/cubits/flights_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightListView extends StatefulWidget {
  const FlightListView({super.key});

  @override
  State<FlightListView> createState() => _FlightListViewState();
}

class   _FlightListViewState extends State<FlightListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF0862A4),
       leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:  Container(height: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/app_bar.png'),
              fit: BoxFit.contain,
            ),
          ), 
          // child: Image.asset('assets/fontisto_plane.png'),
        ), 
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child:
              Column(
                children: [
                  Text(
                    '17 Octobar | 2 Travallers | 25 Flights ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            
        ),
   
        actions: [
        IconButton(
          icon: Icon(Icons.edit_note_rounded,color: Colors.white,),
          onPressed: () {
           
          },
        ),
      ],
      ),
     
      body:BlocBuilder<FlightsCubit, FlightsState>(
  builder: (context, state) {
    if (state is FlightsLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is FlightsError) {
      return Center(
        child: Text(state.message),
      );
    }

    if (state is FlightsLoaded) {
      return state.flights.when(
        success: (FlightEntity data) {
          return ListView.builder(
            itemCount: data.flightTrips!.length,
            itemBuilder: (context, index) {
              final trip = data.flightTrips![index];

              return ListTile(
                title: Text(trip.flightTripKey),
              );
            },
          );
        },
        failure: (ErrorResultModel error) {
          return Center(
            child: Text(
              error.message ?? 'Something went wrong',
            ),
          );
        },
      );
    }

    return const SizedBox.shrink();
  },
)
    );
  }
}
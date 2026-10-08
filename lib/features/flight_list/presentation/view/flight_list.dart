import 'package:flight_app_test/core/entities/api_result_model.dart';
import 'package:flight_app_test/features/flight_list/data/modals/flight_modal.dart';
import 'package:flight_app_test/features/flight_list/presentation/cubits/flights_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightListView extends StatefulWidget {
  const FlightListView({super.key});

  @override
  State<FlightListView> createState() => _FlightListViewState();
}

class _FlightListViewState extends State<FlightListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0862A4),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: 30,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/app_bar.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(35.0),
          child: Column(
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
            icon: const Icon(Icons.edit_note_rounded, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<FlightsCubit, FlightsState>(
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
              success: (FlightModal data) {
                final trips = data.flightTrips ?? [];
                return ListView.separated(
                  itemCount: trips.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final trip = trips[index];
                    final fare = trip.fareDetails;
                    final journey = trip.flightJourneys?.isNotEmpty == true
                        ? trip.flightJourneys!.first
                        : null;
                    final flightItem = journey?.flightItems?.isNotEmpty == true
                        ? journey!.flightItems!.first
                        : null;

                    final airline = flightItem?.flightInfo?.name ?? '';
                    final flightNum = flightItem?.flightInfo?.number ?? '';
                    final fromCity = flightItem?.departure?.cityName ?? '';
                    final fromCode = flightItem?.departure?.airportCode?.name ?? '';
                    final toCity = flightItem?.arrival?.cityName ?? '';
                    final toCode = flightItem?.arrival?.airportCode?.name ?? '';
                    final depTime = flightItem?.departure?.dateTime?.toString() ?? '';
                    final arrTime = flightItem?.arrival?.dateTime?.toString() ?? '';
                    final duration = journey?.tripDuration;
                    final stops = journey?.totalStops ?? 0;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trip.flightTripKey ?? 'Trip ${index + 1}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Text('Airline: $airline ($flightNum)'),
                          Text('Route: $fromCity ($fromCode) -> $toCity ($toCode)'),
                          Text('Departure: $depTime'),
                          Text('Arrival: $arrTime'),
                          if (duration != null)
                            Text('Duration: ${duration.hours ?? 0}h ${duration.minutes ?? 0}m | Stops: $stops'),
                          const SizedBox(height: 4),
                          Text(
                            'Price: ${fare?.total ?? ''} ${fare?.currency ?? ''}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              failure: (ErrorResultModel error) {
                return Center(
                  child: Text(error.message ?? 'Something went wrong'),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
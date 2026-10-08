import 'package:flight_app_test/features/flight_list/presentation/view/flight_list.dart';
import 'package:flight_app_test/features/flight_list/presentation/widgets/splash_button.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: const BoxDecoration(
     image: DecorationImage(
      colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
      fit: BoxFit.cover,
     image: AssetImage('assets/splash.gif'),
     
      )),
      
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              SizedBox(height: 50),
          Image.asset('assets/app_logo.png',width: 150,height: 150,),
              Spacer(),
              
             Text(
                'DISCOVER THE WORLD WITH THE BEST FLIGHT',
                style: TextStyle(
                height: 1,letterSpacing: 0.8,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(height: 50,width: double.infinity,
                child: SplashButton(
                  text: 'CONTINUE',
                  onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FlightListView()),
                );
                  },
                ),
              ),
              const SizedBox(height: 40),
              
            ],
          ),
        ),
      )),
    );
  }
}   
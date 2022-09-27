import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/business_logic/cubit/country_cubit.dart';
import 'package:myapp/data/repository/country_repository.dart';
import 'package:myapp/data/web_services/country_web_services.dart';
import 'package:myapp/presentation/screen/home.dart';
import 'package:myapp/presentation/screen/splashscreen.dart';

class RouterPages {
  late CountryRepository countryRepository;
  late CountryCubit countryCubit;

  RouterPages() {
    countryRepository = CountryRepository(CountryWebServices());
    countryCubit = CountryCubit(countryRepository);
  }

  static const String homeRoute = "/";

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CountryCubit(countryRepository),
            child: const SplashScreen(),
          ),
        );
    }
  }
}

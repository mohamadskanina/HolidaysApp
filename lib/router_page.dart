import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/screen/home.dart';
import 'package:myapp/presentation/screen/splashscreen.dart';
import 'business_logic/cubit/country_cubit.dart';
import 'data/repository/country_code_repository.dart';
import 'data/web_services/country_code_services.dart';

class RouterPages {
  late CountryCodeRepository countryRepository;
  late CountryCubit countryCubit;

  RouterPages() {
    countryRepository = CountryCodeRepository(CountryCodeServices());
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
      case "/home":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CountryCubit(countryRepository),
            child: const HomePage(),
          ),
        );
    }
    return null;
  }
}

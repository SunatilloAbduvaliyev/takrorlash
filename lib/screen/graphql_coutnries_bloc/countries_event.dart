part of 'countries_bloc.dart';

sealed class CountriesEvent {}

class FetchCountries extends CountriesEvent{
  final String continent;
  FetchCountries(this.continent);
}
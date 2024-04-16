import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/data/my_response/my_response.dart';

import '../../data/graphql_api/api/api_provider.dart';
import '../../data/model/country_model/country_model.dart';

part 'countries_event.dart';

part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc({required this.apiClient}) : super(CountriesInitial()) {
    on<FetchCountries>((FetchCountries event, emit) async {
      emit(CountriesLoading());

      MyResponse networkResponse =
      await apiClient.getCountriesByContinents(event.continent);
      if (networkResponse.errorMessage.isEmpty) {
        countries = networkResponse.data;
        emit(CountriesSuccess(networkResponse.data as List<CountryModel>));
      } else {
        emit(CountriesError(networkResponse.errorMessage));
      }
    });
  }
  List<CountryModel> countries = [];
  final ApiClient apiClient;
}
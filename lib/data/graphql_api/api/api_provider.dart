import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:takrorlash/data/my_response/my_response.dart';

import '../../model/country_model/country_model.dart';
import '../queries/country.dart';

class ApiClient {
  ApiClient({required this.graphQLClient});

  factory ApiClient.create() {
    final httpLink = HttpLink('https://countries.trevorblades.com');
    final link = Link.from([httpLink]);
    return ApiClient(
      graphQLClient: GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );
  }

  final GraphQLClient graphQLClient;

  Future<MyResponse> getCountries() async {
    try {
      var result = await graphQLClient.query(
        QueryOptions(document: gql(countriesQuery)),
      );

      if (result.hasException) {
        return MyResponse(
            errorMessage: result.exception!.graphqlErrors.toString());
      } else {
        List<CountryModel> countries = (result.data?['countries'] as List?)
            ?.map((dynamic e) =>
            CountryModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
            [];
        debugPrint("LIST LENGTH:${countries.length}");
        return MyResponse(data: countries);
      }
    } catch (error) {
      debugPrint("ERROR:$error");
    }

    return MyResponse();
  }

  Future<MyResponse> getCountriesByContinents(String continentCode) async {
    try {
      var result = await graphQLClient.query(
        //MutationOptions(document: gql(""))
        QueryOptions(document: gql(getCountryQueryByContinent(continentCode))),
      );

      if (result.hasException) {
        return MyResponse(
            errorMessage: result.exception!.graphqlErrors.toString());
      } else {
        List<CountryModel> countries = (result.data?['countries'] as List?)
            ?.map((dynamic e) =>
            CountryModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
            [];
        debugPrint("LIST LENGTH:${countries.length}");
        return MyResponse(data: countries);
      }
    } catch (error) {
      debugPrint("ERROR:$error");
    }

    return MyResponse();
  }
}
import 'package:flutter/material.dart';
import 'package:takrorlash/utils/style/app_text_style.dart';

import '../../../data/model/country_model/country_model.dart';

class SearchTask extends SearchDelegate {
  SearchTask({
    required this.country,
  });

  final List<CountryModel> country;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<CountryModel> searchCountry = country.where((searchResult) {
      final result = searchResult.name.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: searchCountry.length,
      itemBuilder: (context, index) {
        CountryModel country = searchCountry[index];
        return ListTile(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     RichText(
                       text: TextSpan(
                         text: "Country: ",
                         style: AppTextStyle.semiBold,
                         children: [
                           TextSpan(
                             text: "${country.name}   ",
                             style: AppTextStyle.regular,
                           ),
                           WidgetSpan(
                             child: Text(
                               country.emoji
                             ),
                           )
                         ]
                       )
                     ),
                      RichText(
                        text: TextSpan(
                          text: 'The Continent: ',
                          style: AppTextStyle.semiBold,
                          children: [
                            TextSpan(
                              text: country.continentName,
                              style: AppTextStyle.regular,
                            )
                          ]
                        )
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'The capital: ',
                              style: AppTextStyle.semiBold,
                              children: [
                                TextSpan(
                                  text: country.capital,
                                  style: AppTextStyle.regular,
                                )
                              ]
                          )
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Phone Number: ',
                              style: AppTextStyle.semiBold,
                              children: [
                                TextSpan(
                                  text: country.code,
                                  style: AppTextStyle.regular,
                                ),
                                TextSpan(
                                  text: " (+${country.phone})...",
                                  style: AppTextStyle.regular,
                                )
                              ]
                          )
                      ),
                    ],
                  ),
                );
              },
            );
          },
          title: Text(searchCountry[index].name),
          trailing: Text(searchCountry[index].emoji),
          subtitle: Text(searchCountry[index].continentName),
        );
      },
    );
  }
}

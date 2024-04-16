import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takrorlash/screen/countries/widget/search.dart';

import '../graphql_coutnries_bloc/countries_bloc.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("EUROPE COUNTRIES"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchTask(
                  country: context.read<CountriesBloc>().countries,
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CountriesError) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is CountriesSuccess) {
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CountriesBloc>().add(FetchCountries('EU'));
                        },
                        icon: Image.asset(
                          'assets/images/all.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CountriesBloc>().add(FetchCountries('AF'));
                        },
                        icon: Image.asset(
                          'assets/images/afrika.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CountriesBloc>().add(FetchCountries('NA'));
                        },
                        icon: Image.asset(
                          'assets/images/north_america.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CountriesBloc>().add(FetchCountries('SA'));
                        },
                        icon: Image.asset(
                          'assets/images/south_america.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CountriesBloc>().add(FetchCountries('AS'));
                        },
                        icon: Image.asset(
                          'assets/images/asia.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CountriesBloc>().add(FetchCountries('AF'));
                        },
                        icon: Image.asset(
                          'assets/images/australia.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(state.countries[index].name),
                        trailing: Text(state.countries[index].emoji),
                        subtitle: Text(state.countries[index].continentName),
                      );
                    },
                  ),
                )
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

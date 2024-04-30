import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:takrorlash/screen/bloc/currency_bloc.dart';
import 'package:takrorlash/screen/bloc/currency_event.dart';
import 'package:takrorlash/screen/bloc/currency_state.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CurrencyBloc, CurrencyState>(
        builder: (BuildContext context, CurrencyState state) {
          if(state is CurrencyInitialState){
            return const Center(
              child: SizedBox(),
            );
          }
          if(state is CurrencySuccessState){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(state.data[index].title,style: const TextStyle(color: Colors.black),),
                  );
                },
              ),
            );
          }
          if(state is CurrencyNetworkState){
            return Center(
              child: ElevatedButton(
                onPressed: (){
                  context.read<CurrencyBloc>().add(GetNetworkCurrencyEvent());
                },
                child: const Text('Refresh'),
              ),
            );
          }
          return Center(
            child: Lottie.asset('assets/lottie/loading.json'),
          );
        },
        listener: (BuildContext context, CurrencyState state) {
          debugPrint("___________________________state $state");
          if(state is CurrencyNetworkState){
            if(state.isLocal){
              showDialog(context: context, builder:(context){
                return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('No internet connection'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Ok'),
                    ),
                  ],
                );
              });
            }
            else{
              context.read<CurrencyBloc>().add(GetLocalCurrencyEvent());
            }
          }
        },
      ),
    );
  }
}

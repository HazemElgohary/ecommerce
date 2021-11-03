
import 'package:ecommerce/layout/home_screen/cubit/home_cubit.dart';
import 'package:ecommerce/modules/first_screen/frist_screen.dart';
import 'package:ecommerce/modules/graph_screen/graph_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Orders Screen'),
      ),
      body: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/orders.json'),
            builder: (context, snapshot) {
              cubit.parseJson(snapshot.data.toString());
              return BlocConsumer<HomeCubit,HomeState>(
                bloc: cubit,
                listener: (context, state) {},
                builder: (context, state) {
                  if(state is HomeLoading){
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                  if(state is HomeLoaded){
                    return state.data.isNotEmpty
                        ? FirstScreen(data: state.data)
                        : const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                  if(state is HomeCantLoad){
                    return Center(child: Text(state.msg));
                  }
                  return const SizedBox();
                },
              );
            }),

      ),
    );
  }
}

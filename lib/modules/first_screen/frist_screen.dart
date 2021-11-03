import 'package:ecommerce/models/data_model.dart';
import 'package:ecommerce/modules/graph_screen/graph_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/first_screen_cubit.dart';

class FirstScreen extends StatelessWidget {
  final List<Data> data;

  const FirstScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => FirstScreenCubit(data),
      child: BlocConsumer<FirstScreenCubit, FirstScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          if(state is FirstScreenLoaded){
            return SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      title: const Text('Orders Total Count'),
                      subtitle: Text(data.length.toString()),
                    ),
                  ),
                  // TextButton(onPressed: ()=>getAveragePrice(data), child: const Text('show average')),
                  Card(
                    child: ListTile(
                      title: const Text('Average Price'),
                      subtitle: Text(state.average.toStringAsFixed(3)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Text('Number of Returns'),
                      subtitle: Text(state.returns.toString()),
                    ),
                  ),

                  SizedBox(height: size.height * .1,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.lightBlue,
                      ),
                      child: MaterialButton(onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => GraphScreen(data: data),
                          ),
                        );
                      },
                        child: const Text('Go to Graph Screen',
                          style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

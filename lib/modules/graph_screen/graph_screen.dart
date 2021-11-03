import 'package:ecommerce/models/data_model.dart';
import 'package:ecommerce/modules/graph_screen/cubit/graph_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphScreen extends StatelessWidget {
  final List<Data> data;

  const GraphScreen({Key? key, required this.data}) : super(key: key);

  static const double barWidth = 22;
  final int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final cubit = GraphCubit(data);
    return BlocProvider(
      create: (context) => GraphCubit(data),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Graph Screen'),
        ),
        body: BlocConsumer<GraphCubit, GraphState>(
          listener: (context, state) {},
          builder: (context, state) {
            if(state is GraphGetCountSuccess){
              return AspectRatio(
                aspectRatio: 0.8,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: const Color(0xff020227),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.center,
                        maxY: data.length.toDouble(),
                        minY: 0,
                        groupsSpace: 12,
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (context, value) => const TextStyle(
                                color: Colors.white, fontSize: 10),
                            margin: 10,
                            rotateAngle: 0,
                            getTitles: (double value) {
                              final length=cubit.formatedDate.length;
                              // switch (value.toInt()) {
                              //   case 0:
                              //     return 'Mon';
                              //   case 1:
                              //     return 'Tue';
                              //   case 2:
                              //     return 'Wed';
                              //   case 3:
                              //     return 'Thu';
                              //   case 4:
                              //     return 'Fri';
                              //   case 5:
                              //     return 'Sat';
                              //   case 6:
                              //     return 'Sun';
                              //   default:
                              //     return '';
                              // }
                              while(value.toInt() <= length){
                                cubit.getOrdersCountInDate(data, cubit.formatedDate[value.toInt()]);
                                return cubit.formatedDate[value.toInt()];
                              }
                              return cubit.formatedDate[99];
                            },
                          ),
                          leftTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (context, value) =>
                            const TextStyle(color: Colors.white, fontSize: 10),
                            rotateAngle: 45,
                            getTitles: (double value) {
                              if (value == 0) {
                                return '0';
                              }
                              return '${value.toInt()}';
                            },
                            interval: 5,
                            margin: 8,
                            reservedSize: 30,
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          checkToShowHorizontalLine: (value) => value % 5 == 0,
                          getDrawingHorizontalLine: (value) {
                            if (value == 0) {
                              return FlLine(
                                  color: const Color(0xff363753), strokeWidth: 3);
                            }
                            return FlLine(
                              color: const Color(0xff2a2747),
                              strokeWidth: 0.8,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                y: state.count.toDouble(),
                                width: barWidth,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6)),
                                rodStackItems: [
                                  BarChartRodStackItem(
                                      0,
                                      2,
                                      const Color(0xff2bdb90),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 0 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      2,
                                      5,
                                      const Color(0xffffdd80),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 0 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      5,
                                      7.5,
                                      const Color(0xffff4d94),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 0 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      7.5,
                                      15.5,
                                      const Color(0xff19bfff),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 0 ? 2 : 0)),
                                ],
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                y: state.count.toDouble(),
                                width: barWidth,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    topLeft: Radius.circular(6)),
                                rodStackItems: [
                                  BarChartRodStackItem(
                                      0,
                                      -1.8,
                                      const Color(0xff2bdb90),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 1 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      -1.8,
                                      -4.5,
                                      const Color(0xffffdd80),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 1 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      -4.5,
                                      -7.5,
                                      const Color(0xffff4d94),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 1 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      -7.5,
                                      -14,
                                      const Color(0xff19bfff),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 1 ? 2 : 0)),
                                ],
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                y: state.count.toDouble(),
                                width: barWidth,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6)),
                                rodStackItems: [
                                  BarChartRodStackItem(
                                      0,
                                      1.5,
                                      const Color(0xff2bdb90),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 2 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      1.5,
                                      3.5,
                                      const Color(0xffffdd80),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 2 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      3.5,
                                      7,
                                      const Color(0xffff4d94),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 2 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      7,
                                      13,
                                      const Color(0xff19bfff),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 2 ? 2 : 0)),
                                ],
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                y: state.count.toDouble(),
                                width: barWidth,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6)),
                                rodStackItems: [
                                  BarChartRodStackItem(
                                      0,
                                      1.5,
                                      const Color(0xff2bdb90),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 3 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      1.5,
                                      3,
                                      const Color(0xffffdd80),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 3 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      3,
                                      7,
                                      const Color(0xffff4d94),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 3 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      7,
                                      13.5,
                                      const Color(0xff19bfff),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 3 ? 2 : 0)),
                                ],
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                y: state.count.toDouble(),
                                width: barWidth,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    topLeft: Radius.circular(6)),
                                rodStackItems: [
                                  BarChartRodStackItem(
                                      0,
                                      -2,
                                      const Color(0xff2bdb90),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 4 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      -2,
                                      -4,
                                      const Color(0xffffdd80),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 4 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      -4,
                                      -9,
                                      const Color(0xffff4d94),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 4 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      -9,
                                      -18,
                                      const Color(0xff19bfff),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 4 ? 2 : 0)),
                                ],
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 5,
                            barRods: [
                              BarChartRodData(
                                y: state.count.toDouble(),
                                width: barWidth,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    topLeft: Radius.circular(6)),
                                rodStackItems: [
                                  BarChartRodStackItem(
                                      0,
                                      -1.2,
                                      const Color(0xff2bdb90),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 5 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      -1.2,
                                      -2.7,
                                      const Color(0xffffdd80),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 5 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      -2.7,
                                      -7,
                                      const Color(0xffff4d94),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 5 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      -7,
                                      -17,
                                      const Color(0xff19bfff),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 5 ? 2 : 0)),
                                ],
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 6,
                            barRods: [
                              BarChartRodData(
                                y: state.count.toDouble(),
                                width: barWidth,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6)),
                                rodStackItems: [
                                  BarChartRodStackItem(
                                      0,
                                      1.2,
                                      const Color(0xff2bdb90),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 6 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      1.2,
                                      6,
                                      const Color(0xffffdd80),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 6 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      6,
                                      11,
                                      const Color(0xffff4d94),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 6 ? 2 : 0)),
                                  BarChartRodStackItem(
                                      11,
                                      17,
                                      const Color(0xff19bfff),
                                      BorderSide(
                                          color: Colors.white,
                                          width: touchedIndex == 6 ? 2 : 0)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return AspectRatio(
              aspectRatio: 0.8,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                color: const Color(0xff020227),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      maxY: data.length.toDouble(),
                      minY: 0,
                      groupsSpace: 12,
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (context, value) => const TextStyle(
                              color: Colors.white, fontSize: 10),
                          margin: 10,
                          rotateAngle: 0,
                          getTitles: (double value) {
                            final length=cubit.formatedDate.length;
                            // switch (value.toInt()) {
                            //   case 0:
                            //     return 'Mon';
                            //   case 1:
                            //     return 'Tue';
                            //   case 2:
                            //     return 'Wed';
                            //   case 3:
                            //     return 'Thu';
                            //   case 4:
                            //     return 'Fri';
                            //   case 5:
                            //     return 'Sat';
                            //   case 6:
                            //     return 'Sun';
                            //   default:
                            //     return '';
                            // }
                            while(value.toInt() <= length){
                              return cubit.formatedDate[value.toInt()];
                            }
                            return cubit.formatedDate[99];
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10),
                          rotateAngle: 45,
                          getTitles: (double value) {
                            if (value == 0) {
                              return '0';
                            }
                            return '${value.toInt()}';
                          },
                          interval: 5,
                          margin: 8,
                          reservedSize: 30,
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        checkToShowHorizontalLine: (value) => value % 5 == 0,
                        getDrawingHorizontalLine: (value) {
                          if (value == 0) {
                            return FlLine(
                                color: const Color(0xff363753), strokeWidth: 3);
                          }
                          return FlLine(
                            color: const Color(0xff2a2747),
                            strokeWidth: 0.8,
                          );
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                              y: 15.1,
                              width: barWidth,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
                              rodStackItems: [
                                BarChartRodStackItem(
                                    0,
                                    2,
                                    const Color(0xff2bdb90),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 0 ? 2 : 0)),
                                BarChartRodStackItem(
                                    2,
                                    5,
                                    const Color(0xffffdd80),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 0 ? 2 : 0)),
                                BarChartRodStackItem(
                                    5,
                                    7.5,
                                    const Color(0xffff4d94),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 0 ? 2 : 0)),
                                BarChartRodStackItem(
                                    7.5,
                                    15.5,
                                    const Color(0xff19bfff),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 0 ? 2 : 0)),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                              y: 14,
                              width: barWidth,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  topLeft: Radius.circular(6)),
                              rodStackItems: [
                                BarChartRodStackItem(
                                    0,
                                    -1.8,
                                    const Color(0xff2bdb90),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 1 ? 2 : 0)),
                                BarChartRodStackItem(
                                    -1.8,
                                    -4.5,
                                    const Color(0xffffdd80),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 1 ? 2 : 0)),
                                BarChartRodStackItem(
                                    -4.5,
                                    -7.5,
                                    const Color(0xffff4d94),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 1 ? 2 : 0)),
                                BarChartRodStackItem(
                                    -7.5,
                                    -14,
                                    const Color(0xff19bfff),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 1 ? 2 : 0)),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                              y: 13,
                              width: barWidth,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
                              rodStackItems: [
                                BarChartRodStackItem(
                                    0,
                                    1.5,
                                    const Color(0xff2bdb90),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 2 ? 2 : 0)),
                                BarChartRodStackItem(
                                    1.5,
                                    3.5,
                                    const Color(0xffffdd80),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 2 ? 2 : 0)),
                                BarChartRodStackItem(
                                    3.5,
                                    7,
                                    const Color(0xffff4d94),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 2 ? 2 : 0)),
                                BarChartRodStackItem(
                                    7,
                                    13,
                                    const Color(0xff19bfff),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 2 ? 2 : 0)),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                              y: 13.5,
                              width: barWidth,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
                              rodStackItems: [
                                BarChartRodStackItem(
                                    0,
                                    1.5,
                                    const Color(0xff2bdb90),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 3 ? 2 : 0)),
                                BarChartRodStackItem(
                                    1.5,
                                    3,
                                    const Color(0xffffdd80),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 3 ? 2 : 0)),
                                BarChartRodStackItem(
                                    3,
                                    7,
                                    const Color(0xffff4d94),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 3 ? 2 : 0)),
                                BarChartRodStackItem(
                                    7,
                                    13.5,
                                    const Color(0xff19bfff),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 3 ? 2 : 0)),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                              y: 18,
                              width: barWidth,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  topLeft: Radius.circular(6)),
                              rodStackItems: [
                                BarChartRodStackItem(
                                    0,
                                    -2,
                                    const Color(0xff2bdb90),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 4 ? 2 : 0)),
                                BarChartRodStackItem(
                                    -2,
                                    -4,
                                    const Color(0xffffdd80),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 4 ? 2 : 0)),
                                BarChartRodStackItem(
                                    -4,
                                    -9,
                                    const Color(0xffff4d94),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 4 ? 2 : 0)),
                                BarChartRodStackItem(
                                    -9,
                                    -18,
                                    const Color(0xff19bfff),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 4 ? 2 : 0)),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 5,
                          barRods: [
                            BarChartRodData(
                              y: 17,
                              width: barWidth,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  topLeft: Radius.circular(6)),
                              rodStackItems: [
                                BarChartRodStackItem(
                                    0,
                                    -1.2,
                                    const Color(0xff2bdb90),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 5 ? 2 : 0)),
                                BarChartRodStackItem(
                                    -1.2,
                                    -2.7,
                                    const Color(0xffffdd80),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 5 ? 2 : 0)),
                                BarChartRodStackItem(
                                    -2.7,
                                    -7,
                                    const Color(0xffff4d94),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 5 ? 2 : 0)),
                                BarChartRodStackItem(
                                    -7,
                                    -17,
                                    const Color(0xff19bfff),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 5 ? 2 : 0)),
                              ],
                            ),
                          ],
                        ),
                        BarChartGroupData(
                          x: 6,
                          barRods: [
                            BarChartRodData(
                              y: 16,
                              width: barWidth,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  topRight: Radius.circular(6)),
                              rodStackItems: [
                                BarChartRodStackItem(
                                    0,
                                    1.2,
                                    const Color(0xff2bdb90),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 6 ? 2 : 0)),
                                BarChartRodStackItem(
                                    1.2,
                                    6,
                                    const Color(0xffffdd80),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 6 ? 2 : 0)),
                                BarChartRodStackItem(
                                    6,
                                    11,
                                    const Color(0xffff4d94),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 6 ? 2 : 0)),
                                BarChartRodStackItem(
                                    11,
                                    17,
                                    const Color(0xff19bfff),
                                    BorderSide(
                                        color: Colors.white,
                                        width: touchedIndex == 6 ? 2 : 0)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:electrical_project/src/constants/app_consts.dart';
import 'package:electrical_project/src/features/series/data/series_rest_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SeriesResistanceCalc extends ConsumerStatefulWidget {
  const SeriesResistanceCalc({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeriesResistanceCalcState();
}

class _SeriesResistanceCalcState extends ConsumerState<SeriesResistanceCalc> {
  final TextEditingController _seriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var seriesData = ref.watch(seriesRestDataProvider);
    var seriesDataModify = ref.watch(seriesRestDataProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
            tag: 'SERIES RESISTANCE CALC.',
            child: Text('SERIES RESISTANCE CALC.')),
        centerTitle: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.4),
                                      BlendMode.color),
                                  child: Image.asset(
                                    'assets/series.png',
                                  ),
                                )),
                            h20,
                            (seriesData != null)
                                ? Text(
                                    'Series Resistance: \n$seriesData Ohms',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )
                                : Text('Series Resistance: \n0 Ohms',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                          ],
                        ))),
                h20,
                TextField(
                  controller: _seriesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter resistances for Series (comma separated)",
                  ),
                ),
                h20,
                ElevatedButton(
                  onPressed: () {
                    final resistanceList = _seriesController.text
                        .split(',')
                        .map((e) => double.tryParse(e.trim()))
                        .where((e) => e != null)
                        .map((e) => e!)
                        .toList();
                    seriesDataModify.calulate(resistanceList);
                  },
                  child: const Text('Calculate Series Resistance'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

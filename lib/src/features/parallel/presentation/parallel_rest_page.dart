import 'package:electrical_project/src/constants/app_consts.dart';
import 'package:electrical_project/src/features/parallel/data/parallel_rest_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParallelResistanceCalc extends ConsumerStatefulWidget {
  const ParallelResistanceCalc({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ParallelResistanceCalcState();
}

class _ParallelResistanceCalcState
    extends ConsumerState<ParallelResistanceCalc> {
  final TextEditingController _parallelController = TextEditingController();

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    var parallelData = ref.watch(parallelRestDataProvider);
    var parallelDataModify = ref.watch(parallelRestDataProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Hero(
            flightShuttleBuilder: _flightShuttleBuilder,
            tag: 'PARALLEL RESISTANCE CALC.',
            child: const Text('PARALLEL RESISTANCE CALC.')),
        centerTitle: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                                    'assets/parallel.png',
                                  ),
                                )),
                            h20,
                            (parallelData != null)
                                ? Text(
                                    'Parallel Resistance: \n$parallelData Ohms',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )
                                : Text('Parallel Resistance: \n0 Ohms',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                          ],
                        ))),
                const SizedBox(height: 20),
                TextField(
                  controller: _parallelController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText:
                        "Enter resistances for Parallel (comma separated)",
                  ),
                ),
                h20,
                ElevatedButton(
                  onPressed: () {
                    final resistanceList = _parallelController.text
                        .split(',')
                        .map((e) => double.tryParse(e.trim()))
                        .where((e) => e != null)
                        .map((e) => e!)
                        .toList();

                    parallelDataModify.calulate(resistanceList);
                  },
                  child: const Text('Calculate Parallel Resistance'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:electrical_project/src/constants/app_consts.dart';
import 'package:electrical_project/src/features/delta_star/data/delta_to_star_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeltaToStarConverter extends ConsumerStatefulWidget {
  const DeltaToStarConverter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeltaToStarConverterState();
}

class _DeltaToStarConverterState extends ConsumerState<DeltaToStarConverter> {
  double r1 = 0.0;
  double r2 = 0.0;
  double r3 = 0.0;
  @override
  Widget build(BuildContext context) {
    var deltaToStar = ref.watch(deltaToStarProvider);
    var deltaToStarMoify = ref.watch(deltaToStarProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
            tag: 'DELTA → STAR CONVERTER',
            child: Text('DELTA → STAR CONVERTER')),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h20,
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).primaryColor.withOpacity(0.4),
                              BlendMode.color),
                          child: Image.asset('assets/delta_star.png'),
                        ),
                      ),
                      h20,
                      Text(
                        "Star Ra: ${deltaToStar.raS}",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      h10,
                      Text(
                        "Star Rb: ${deltaToStar.rbS}",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      h10,
                      Text(
                        "Star Rc: ${deltaToStar.rcS}",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
              ),
              h20,
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) => r1 = double.tryParse(value) ?? 0.0,
                decoration: const InputDecoration(
                  hintText: "Delta R1",
                ),
              ),
              h20,
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) => r2 = double.tryParse(value) ?? 0.0,
                decoration: const InputDecoration(
                  hintText: "Delta R2",
                ),
              ),
              h20,
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) => r3 = double.tryParse(value) ?? 0.0,
                decoration: const InputDecoration(
                  hintText: "Delta R3",
                ),
              ),
              h20,
              ElevatedButton(
                onPressed: () {
                  deltaToStarMoify.deltaToStar(r1, r2, r3);
                },
                child: const Text("Convert to Star"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

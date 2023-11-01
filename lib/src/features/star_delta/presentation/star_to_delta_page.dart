import 'package:electrical_project/src/constants/app_consts.dart';
import 'package:electrical_project/src/features/star_delta/data/star_to_delta_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StarToDeltaConverter extends ConsumerStatefulWidget {
  const StarToDeltaConverter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StarToDeltaConverterState();
}

class _StarToDeltaConverterState extends ConsumerState<StarToDeltaConverter> {
  double ra = 0.0;
  double rb = 0.0;
  double rc = 0.0;

  @override
  Widget build(BuildContext context) {
    var starToDelta = ref.watch(starToDeltaProvider);
    var starToDeltaMoify = ref.watch(starToDeltaProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
            tag: 'STAR → DELTA CONVERTER',
            child: Text('STAR → DELTA CONVERTER')),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h20,
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).primaryColor.withOpacity(0.4),
                              BlendMode.color),
                          child: Image.asset(
                            'assets/delta_star.png',
                          ),
                        )),
                    h20,
                    Text(
                      "Delta R1: ${starToDelta.r1S}",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    h10,
                    Text(
                      "Delta R2: ${starToDelta.r2S}",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    h10,
                    Text(
                      "Delta R3: ${starToDelta.r3S}",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ]),
                ),
              ),
              h20,
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) => ra = double.tryParse(value) ?? 0.0,
                decoration: const InputDecoration(
                  hintText: "Star Ra",
                ),
              ),
              h20,
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) => rb = double.tryParse(value) ?? 0.0,
                decoration: const InputDecoration(
                  hintText: "Star Rb",
                ),
              ),
              h20,
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) => rc = double.tryParse(value) ?? 0.0,
                decoration: const InputDecoration(
                  hintText: "Star Rc",
                ),
              ),
              h20,
              ElevatedButton(
                onPressed: () {
                  starToDeltaMoify.starToDelta(ra, rb, rc);
                },
                child: const Text("Convert to Delta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

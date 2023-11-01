import 'package:electrical_project/src/features/categories/domain/card_view_model.dart';

final List<CardViewModel> cardsToDisplay = [
  CardViewModel(
    backdropAssetPath:
        'https://pimylifeup.com/wp-content/uploads/2019/09/calculating-parallel-resistors-guide-thumbnail.jpg',
    address: 'PARALLEL RESISTANCE CALC.',
    description: 'Calculate Resistances Which are Connected in Parallel',
  ),
  CardViewModel(
    backdropAssetPath:
        'https://pimylifeup.com/wp-content/uploads/2019/09/series-resistor-calculation-guide-thumbnail.jpg',
    address: 'SERIES RESISTANCE CALC.',
    description: 'Calculate Resistances Which are Connected in Series',
  ),
  CardViewModel(
    backdropAssetPath:
        'https://images.pexels.com/photos/8386440/pexels-photo-8386440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    address: 'AI HELPBOT',
    description:
        'Ask Anything Regarding Electrical, Other type of Questions are Not Allowed :)',
  ),
  CardViewModel(
    backdropAssetPath:
        'https://images.pexels.com/photos/2628105/pexels-photo-2628105.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    address: 'DELTA → STAR CONVERTER',
    description:
        'Convert the Given Values of Delta Connected Resistances to Star',
  ),
  CardViewModel(
    backdropAssetPath:
        'https://images.pexels.com/photos/3665442/pexels-photo-3665442.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    address: 'STAR → DELTA CONVERTER',
    description:
        'Convert the Given Values of Star Connected Resistances to Delta',
  ),
];

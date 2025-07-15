import 'package:registro_panela/features/stage1_delivery/domain/stage1_form_data.dart';

final mockStage1Projects = <Stage1FormData>[
  Stage1FormData(
    id: 'p1',
    name: 'Molienda A',
    date: DateTime.now().subtract(const Duration(days: 10)),
    photoPath: null,
    phone: '+57 300 000 0001',
    basketsQuantity: 100,
    preservativesWeight: 12.0,
    preservativesJars: 4,
    limeWeight: 2.0,
    limeJars: 2,
    gaveras: [
      GaveraData(quantity: 2, referenceWeight: 970),
      GaveraData(quantity: 1, referenceWeight: 950),
    ],
  ),
  Stage1FormData(
    id: 'p2',
    name: 'Molienda B',
    date: DateTime.now().subtract(const Duration(days: 8)),
    photoPath: null,
    phone: '+57 300 000 0002',
    basketsQuantity: 80,
    preservativesWeight: 8.0,
    preservativesJars: 3,
    limeWeight: 1.5,
    limeJars: 1,
    gaveras: [
      GaveraData(quantity: 2, referenceWeight: 950),
      GaveraData(quantity: 2, referenceWeight: 700),
    ],
  ),
  Stage1FormData(
    id: 'p3',
    name: 'Molienda C',
    date: DateTime.now().subtract(const Duration(days: 6)),
    photoPath: null,
    phone: '+57 300 000 0003',
    basketsQuantity: 60,
    preservativesWeight: 6.0,
    preservativesJars: 2,
    limeWeight: 1.0,
    limeJars: 1,
    gaveras: [
      GaveraData(quantity: 1, referenceWeight: 970),
      GaveraData(quantity: 2, referenceWeight: 700),
    ],
  ),
];

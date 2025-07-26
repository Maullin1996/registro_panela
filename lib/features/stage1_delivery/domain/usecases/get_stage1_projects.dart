import 'package:registro_panela/features/stage1_delivery/domain/entities/stage1_form_data.dart';
import 'package:registro_panela/features/stage1_delivery/domain/repositories/stage1_repository.dart';

class GetStage1Projects {
  final Stage1Repository repository;

  GetStage1Projects(this.repository);

  Future<List<Stage1FormData>> call() {
    return repository.getAll();
  }
}

part of managers;

abstract class VirusManager {
  RxCommand<void, List<Virus>> getViruses;
}

class VM implements VirusManager {
  @override
  RxCommand<void, List<Virus>> getViruses;

  VM() {
    getViruses =
        RxCommand.createAsyncNoParam<List<Virus>>(sl<APIService>().getViruses);
  }
}

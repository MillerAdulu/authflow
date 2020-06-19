part of services;

abstract class APIService {
  Future<List<Virus>> getViruses();
}

class APIServiceInstance implements APIService {
  NetworkUtil _networkUtil = NetworkUtil();
  String _baseUrl = AuthflowConfig.instance.values.baseAPIUrl;

  @override
  Future<List<Virus>> getViruses() async {
    final String virusesUrl = '$_baseUrl/virus';

    List<dynamic> response = await _networkUtil.getReq(
      virusesUrl,
    );

    return response.map<Virus>((e) => Virus.fromResponse(e)).toList();
  }
}

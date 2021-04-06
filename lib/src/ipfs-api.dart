import 'package:chopper/chopper.dart';

part 'ipfs-api.chopper.dart';

@ChopperApi(baseUrl: '/api/v0')
abstract class Ipfs extends ChopperService {

  @Get(path: '/swarm/peers')
  Future<Response> getPeers();

  @Get(path: '/dag/get?arg={cid}')
  Future<Response> getDag(@Path('cid') String cid);

  static Ipfs create() {
    final client = ChopperClient(baseUrl: 'http://127.0.0.1:5001', 
    services: [
      _$Ipfs(),
    ],
    converter: JsonConverter()
    );
    return _$Ipfs(client);
  }
}
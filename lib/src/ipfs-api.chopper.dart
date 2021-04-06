// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipfs-api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$Ipfs extends Ipfs {
  _$Ipfs([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Ipfs;

  @override
  Future<Response> getPeers() {
    final $url = '/api/v0/swarm/peers';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getDag(String cid) {
    final $url = '/api/v0/dag/get?arg=$cid';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}

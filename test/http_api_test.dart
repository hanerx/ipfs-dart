import 'package:ipfs/ipfs.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    var getObj = Ipfs().getObject('bafybeifx7yeb55armcsxwwitkymga5xf53dxiarykms3ygqic223w5sk3m');
    var resolveDag = Ipfs().resolveDag('bafybeifx7yeb55armcsxwwitkymga5xf53dxiarykms3ygqic223w5sk3m');
    var peers = Ipfs().getPeers();

    test('First Test', () async {
      await resolveDag;
      await getObj;
      await peers;
    });
  });
}

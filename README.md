An IPFS client library for Dart developers.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

```dart
import 'package:ipfs/ipfs.dart';

void main() {

  Ipfs ipfs = Ipfs();

  // This method will return a list of peers in the swarm
  ipfs.getPeers(); 

  // The cid or content identifier has to be of type string
  String cid = 'bafybeifx7yeb55armcsxwwitkymga5xf53dxiarykms3ygqic223w5sk3m';

  // Fetches an ipfs object 
  ipfs.getObject(cid);

  // Traverses through a DAG given its root cid
  ipfs.resolveDag(cid);

}
```
The response should be 

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme

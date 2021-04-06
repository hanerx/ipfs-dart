import 'package:ipfs/ipfs.dart';

void main() {

  var ipfs = Ipfs();

  // This method will return a list of peers in the swarm
  ipfs.getPeers(); 

  // The cid or content identifier has to be of type string
  var cid = 'bafybeifx7yeb55armcsxwwitkymga5xf53dxiarykms3ygqic223w5sk3m';

  // Fetches an ipfs object 
  ipfs.getObject(cid);

  // Traverses through a DAG given its root cid
  ipfs.resolveDag(cid);

}

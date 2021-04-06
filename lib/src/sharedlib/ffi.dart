import 'dart:convert';
import 'dart:ffi';
import 'dart:ffi' as ffi;


typedef CgoFunction = ffi.Void Function();

typedef LitePeer = void Function();

final dylib = ffi.DynamicLibrary.open('/Users/aidanm/Documents/GitHub/dart-ipfs-http-api/http-api/lib/src/sharedlib/ipfslite.dylib');

final LitePeer startPeer = dylib.lookup<ffi.NativeFunction<CgoFunction>>('main').asFunction();

main() async {
 await startPeer();

}
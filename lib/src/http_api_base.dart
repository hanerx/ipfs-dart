//import 'dart:ffi';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:convert' as JSON;

//import 'package:ipfs/ipfs.dart'; // TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
class Ipfs {
  final String baseUrl;
  final int port;
  Dio dio;

  Ipfs({this.baseUrl: '127.0.0.1', this.port: 5001}){
    dio=Dio();
  }

  Ipfs.dio({this.baseUrl:'127.0.0.1',this.port:5001,this.dio});

  Future getPeers() async {
    try {
      final response =
          await dio.post('http://$baseUrl:$port/api/v0/swarm/peers');
      var data = response.toString();
      var json = JSON.jsonDecode(data);
      var encoder = JsonEncoder.withIndent('  ');
      var prettyprint = encoder.convert(json);
      return prettyprint;
    } catch (e) {
      print(e);
    }
  }

  Future resolveDag(String cid) async {
    try {
      final response =
          await dio.post('http://$baseUrl:$port/api/v0/object/get?arg=$cid');
      var data = response.toString();
      var json = JSON.jsonDecode(data);

      var encoder = JsonEncoder.withIndent('  ');
      var prettyprint = encoder.convert(json);
      print(prettyprint);
      return json;
    } catch (e) {
      print(e);
    }
  }

  Future getObject(String cid) async {
    try {
      final response =
          await dio.post('http://$baseUrl:$port/api/v0/object/get?arg=$cid');
      var data = response.toString();
      var json = JSON.jsonDecode(data);

      //JsonEncoder encoder = JsonEncoder.withIndent('  ');
      //String prettyprint = encoder.convert(json);

      var object = Object.fromJson(json);
      return object.data;
      //print(prettyprint);
    } catch (e) {
      print(e);
    }
  }

  Future<List<int>> catBytes(String cid) async {
    try {
      final response = await dio.post(
          'http://$baseUrl:$port/api/v0/cat?arg=$cid',
          options: Options(responseType: ResponseType.bytes));
      return response.data;
    } catch (e) {
      throw e;
    }
    return null;
  }

  Future objectStats() async {
    try {
      final response = await dio.post(
          'http://$baseUrl:$port/api/v0/object/stat?arg=QmYWquTmxMJbeA6AnAedb5CxaPhW8KyTBVkezfKjJTy5jH');
      var data = response.toString();
      var json = JSON.jsonDecode(data);

      var encoder = JsonEncoder.withIndent('  ');
      var prettyprint = encoder.convert(json);

      print(prettyprint);

      var obj = ObjectStats.fromJson(json);
      print(json.toString());
      print(obj.blockSize);
      print(obj.dataSize);
      print(obj.hash);
      print(obj.numLinks);
    } catch (e) {
      print(e);
    }
  }
}

class Object {
  List links;

  //String cid;
  String data;

  Object({
    this.links,
    //this.cid,
    this.data,
  });

  factory Object.fromJson(Map<String, dynamic> parsedJson) {
    return Object(data: parsedJson['Data'], links: parsedJson['Links']);
  }
}

class ObjectStats {
  int blockSize;
  int cumulative;
  int dataSize;
  String hash;
  int linkSize;
  int numLinks;

  ObjectStats(
      {this.hash,
      this.blockSize,
      this.cumulative,
      this.dataSize,
      this.linkSize,
      this.numLinks});

  factory ObjectStats.fromJson(Map<String, dynamic> parsedJson) {
    return ObjectStats(
        blockSize: parsedJson['BlockSize'],
        cumulative: parsedJson['CumulativeSize'],
        dataSize: parsedJson['DataSize'],
        hash: parsedJson['Hash'],
        linkSize: parsedJson['LinksSize'],
        numLinks: parsedJson['NumLinks']);
  }
}

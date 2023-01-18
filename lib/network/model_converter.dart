import 'package:chopper/chopper.dart';

// 1

class ModelConverter implements Converter {
  // 2
  @override
  Request ConvertRequest(Request request) {
    // 3
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );
    // 4
    return encodeJson(req);
  }

  Request encodeJson(Request request) {}

  Response decodeJson<BodyType, InnerType>(Response response) {}

  @override
  Response<BodyType> ConvertResponse<BodyType, InnerType>(Response response) {}
}

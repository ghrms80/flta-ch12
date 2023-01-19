import 'package:chopper/chopper.dart';
import 'package:recipes/network/model_converter.dart';
import 'package:recipes/network/model_response.dart';
import 'package:recipes/network/recipe_model.dart';
part 'recipe_service.chopper.dart';

const String apiId = '77e2510d';
const String apiKey = 'aa92b790e63322651aefc27a92cd05fe';
const String apiUrl = 'https://api.edamam.com';

// 1
@ChopperApi()
// 2
abstract class RecipeService extends ChopperService {
  // 3
  @Get(path: 'search')
  // 4
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
    // 5
    @Query('q') String query,
    @Query('from') int from,
    @Query('to') int to,
  );
  static RecipeService create() {
    // 1
    final client = ChopperClient(
      // 2
      baseUrl: apiUrl,
      // 3
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      // 4
      converter: ModelConverter(),
      // 5
      errorConverter: const JsonConverter(),
      // 6
      services: [
        _$RecipeService(),
      ],
    );
    // 7
    return _$RecipeService(client);
  }
}

Request _addQuery(Request req) {
  // 1
  final params = Map<String, dynamic>.from(req.parameters);
  // 2
  params['app_id'] = apiId;
  params['app_key'] = apiKey;
  // 3
  return req.copyWith(parameters: params);
}

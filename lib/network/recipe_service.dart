import 'package:chopper/chopper.dart';
import 'package:recipes/network/model_response.dart';
import 'package:recipes/network/recipe_model.dart';

const String apiId = '77e2510d';
const String apiKey = 'aa92b790e63322651aefc27a92cd05fe';
const String apiUrl = 'https://api.edamam.com/search';

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
  // TODO: Add create()
}
// TODO: Add _addQuery()

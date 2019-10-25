import 'package:graphql_flutter/graphql_flutter.dart';

class Config {
  static HttpLink link = HttpLink(uri: 'https://rickandmortyapi.com/graphql');

  static GraphQLClient client = GraphQLClient(
    link: link,
    cache: InMemoryCache(),
  );
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  static final SupabaseHelper _instance = SupabaseHelper._internal();

  factory SupabaseHelper() => _instance;

  SupabaseHelper._internal();

  static final String supabaseUrl = "${dotenv.env['SUPABASE_URL']}";
  static final String supabaseKey = "${dotenv.env['SUPABASE_KEY']}";

  final SupabaseClient _client = SupabaseClient(supabaseUrl, supabaseKey);

  SupabaseClient get client => _client;

  Future<List<Map<String, dynamic>>> fetchFromTable(String tableName) {
    final response =
        _client.from(tableName).select<List<Map<String, dynamic>>>();
    return response;
  }
}

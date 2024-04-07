import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.recipetap.com';
  static const Duration timeout = Duration(seconds: 30);
  
  static Future<Map<String, dynamic>> getRecipes() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/recipes'),
      ).timeout(timeout);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      debugPrint('Error fetching recipes: $e');
      rethrow;
    }
  }
  
  static Future<Map<String, dynamic>> searchRecipes(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search?q=$query'),
      ).timeout(timeout);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to search recipes');
      }
    } catch (e) {
      debugPrint('Error searching recipes: $e');
      rethrow;
    }
  }
  
  static Future<Map<String, dynamic>> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/categories'),
      ).timeout(timeout);
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      debugPrint('Error fetching categories: $e');
      rethrow;
    }
  }
}

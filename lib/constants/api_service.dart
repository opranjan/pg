import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://mintcream-dolphin-875931.hostingersite.com/api";

  Future<Map<String, dynamic>> fetchOverview(String buildingId) async {
    final url = Uri.parse('$baseUrl/overview?building_id=$buildingId');
    
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}

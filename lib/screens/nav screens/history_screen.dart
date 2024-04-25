import 'package:flutter/material.dart';
import 'package:myapp/const/color.dart';

// Assuming you have a class to represent virus detection history
class VirusDetection {
  final String name;
  final DateTime detectionDateTime;

  VirusDetection({required this.name, required this.detectionDateTime});
}

// Dummy function to fetch virus detection history from backend
Future<List<VirusDetection>> fetchVirusDetectionHistory() async {
  // Here you would make actual API call to fetch data from backend
  // For demonstration purposes, returning dummy data
  await Future.delayed(const Duration(seconds: 2)); // Simulating network delay
  return [
    VirusDetection(name: 'COVID-19', detectionDateTime: DateTime(2023, 1, 15)),
    VirusDetection(name: 'Influenza', detectionDateTime: DateTime(2023, 2, 20)),
    VirusDetection(name: 'Ebola', detectionDateTime: DateTime(2023, 3, 25)),
  ];
}

class MyHistoryScreen extends StatefulWidget {
  const MyHistoryScreen({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<MyHistoryScreen> {
  late Future<List<VirusDetection>> _futureHistory;
  Color white = Colors.white;
  @override
  void initState() {
    super.initState();
    _futureHistory = fetchVirusDetectionHistory();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: bg,
        title: const Text(
          'Detection History',
          style: TextStyle(
            color: Colors.white,
            // fontWeight: FontWeight.bold,
            fontFamily: 'Abril Fatface',
          ),
        ),
      ),
      body: Stack(
        children: [
          const Center(
            child: Image(
              image: AssetImage(
                'assets/images/security.png',
              ),
              // width: 125,
            ),
          ),
          FutureBuilder<List<VirusDetection>>(
            future: _futureHistory,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'Abril Fatface',
                  ),
                ));
              } else {
                List<VirusDetection> history = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final detection = history[index];
                    return ListTile(
                      title: Text(detection.name,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: 'Abril Fatface',
                          )),
                      subtitle:
                          Text('Detected on: ${detection.detectionDateTime}',
                              style: TextStyle(
                                color: white,
                                fontSize: 22,
                              )),
                              
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// Future<List<VirusDetection>> fetchVirusDetectionHistory() async {
//   final url =
//       'your_backend_api_url_here'; // Replace with your actual backend API URL
//   try {
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((json) => VirusDetection.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to fetch virus detection history');
//     }
//   } catch (error) {
//     throw Exception('Failed to fetch virus detection history: $error');
//   }
// }

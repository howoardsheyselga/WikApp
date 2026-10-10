// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart' as p;

// void main() {
//   runApp(const MyApp());
// }

// // --- DATABASE HELPER (Retained for your offline SQLite functionality) ---
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._init();
//   static Database? _database;

//   DatabaseHelper._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('wikapp.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = p.join(dbPath, filePath);
//     return await openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute(
//         'CREATE TABLE progress (id INTEGER PRIMARY KEY, topic TEXT, percent INTEGER)',
//       );
//     });
//   }
// }

// // --- MAIN APPLICATION ---
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Activity Dashboard',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: const Color(0xFFF4F4F6),
//         fontFamily: 'Roboto',
//         useMaterial3: true,
//       ),
//       home: const ActivityDashboardScreen(),
//     );
//   }
// }

// class ActivityDashboardScreen extends StatefulWidget {
//   const ActivityDashboardScreen({super.key});

//   @override
//   State<ActivityDashboardScreen> createState() =>
//       _ActivityDashboardScreenState();
// }

// class _ActivityDashboardScreenState extends State<ActivityDashboardScreen> {
//   int _selectedPeriodIndex = 1; // 0: Daily, 1: Weekly, 2: Monthly
//   int _selectedBottomNavIndex = 2; // Center purple button selected

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 1. TOP APP BAR
//               _buildAppBar(),
//               const SizedBox(height: 20),

//               // 2. SEGMENTED PERIOD SELECTOR (Daily, Weekly, Monthly)
//               _buildSegmentedTab(),
//               const SizedBox(height: 20),

//               // 3. MAIN ORANGE CHART CARD
//               _buildChartCard(),
//               const SizedBox(height: 24),

//               // 4. PROGRESS SECTION HEADER
//               const Text(
//                 'Progress',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1E1E24),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // 5. PROGRESS GRID CARDS
//               _buildProgressGrid(),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),

//       // 6. CUSTOM BOTTOM NAVIGATION BAR
//       bottomNavigationBar: _buildBottomNavigationBar(),
//     );
//   }

//   // --- WIDGET BUILDERS ---

//   Widget _buildAppBar() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildSquareIconButton(
//           icon: Icons.arrow_back,
//           onTap: () {},
//         ),
//         const Text(
//           'Activity',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF1E1E24),
//           ),
//         ),
//         _buildSquareIconButton(
//           icon: Icons.more_horiz,
//           onTap: () {},
//         ),
//       ],
//     );
//   }

//   Widget _buildSquareIconButton({required IconData icon, required VoidCallback onTap}) {
//     return Container(
//       width: 44,
//       height: 44,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.03),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: IconButton(
//         icon: Icon(icon, color: const Color(0xFF1E1E24), size: 20),
//         onPressed: onTap,
//       ),
//     );
//   }

//   Widget _buildSegmentedTab() {
//     final periods = ['Daily', 'Weekly', 'Monthly'];
//     return Container(
//       height: 52,
//       padding: const EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE5E5EA),
//         borderRadius: BorderRadius.circular(26),
//       ),
//       child: Row(
//         children: List.generate(periods.length, (index) {
//           final isSelected = _selectedPeriodIndex == index;
//           return Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _selectedPeriodIndex = index;
//                 });
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 decoration: BoxDecoration(
//                   color: isSelected ? Colors.white : Colors.transparent,
//                   borderRadius: BorderRadius.circular(22),
//                   boxShadow: isSelected
//                       ? [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.06),
//                             blurRadius: 6,
//                             offset: const Offset(0, 3),
//                           ),
//                         ]
//                       : [],
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   periods[index],
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
//                     color: isSelected ? const Color(0xFF1E1E24) : const Color(0xFF8E8E93),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   Widget _buildChartCard() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFFDE5838), // Burnt Orange
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFFDE5838).withOpacity(0.3),
//             blurRadius: 16,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               RichText(
//                 text: const TextSpan(
//                   text: 'Total hours : ',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.white70,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: '4hr ',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     TextSpan(
//                       text: '20 min',
//                       style: TextStyle(
//                         color: Colors.white70,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: Colors.white.withOpacity(0.3)),
//                 ),
//                 child: const Row(
//                   children: [
//                     Text(
//                       '3, Feb 2026',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(width: 4),
//                     Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),

//           // Custom Graph & Tooltip
//           SizedBox(
//             height: 140,
//             width: double.infinity,
//             child: CustomPaint(
//               painter: ChartPainter(),
//             ),
//           ),
//           const SizedBox(height: 12),

//           // X-Axis Date Labels
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('09', style: TextStyle(color: Colors.white60, fontSize: 12)),
//               Text('10', style: TextStyle(color: Colors.white60, fontSize: 12)),
//               Text('11', style: TextStyle(color: Colors.white60, fontSize: 12)),
//               Text('12', style: TextStyle(color: Colors.white60, fontSize: 12)),
//               Text('13', style: TextStyle(color: Colors.white60, fontSize: 12)),
//               Text('14', style: TextStyle(color: Colors.white60, fontSize: 12)),
//               Text('15', style: TextStyle(color: Colors.white60, fontSize: 12)),
//               Text('16', style: TextStyle(color: Colors.white60, fontSize: 12)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProgressGrid() {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       crossAxisSpacing: 14,
//       mainAxisSpacing: 14,
//       childAspectRatio: 1.45,
//       children: [
//         _buildProgressCard(
//           title: 'Kasaysayan',
//           percentage: '60%',
//           status: 'Normal',
//           statusColor: const Color(0xFF27AE60),
//           progressValue: 0.6,
//           gaugeColor: Colors.blueAccent,
//         ),
//         _buildProgressCard(
//           title: 'Likas na Yaman',
//           percentage: '50%',
//           status: 'Below',
//           statusColor: const Color(0xFFE67E22),
//           progressValue: 0.5,
//           gaugeColor: Colors.amber,
//         ),
//         _buildProgressCard(
//           title: 'Pamahalaan',
//           percentage: '80%',
//           status: 'Normal',
//           statusColor: const Color(0xFF27AE60),
//           progressValue: 0.8,
//           gaugeColor: Colors.blueAccent,
//         ),
//         _buildProgressCard(
//           title: 'Ekonomiya',
//           percentage: '30%',
//           status: 'Above',
//           statusColor: const Color(0xFFEB5757),
//           progressValue: 0.3,
//           gaugeColor: Colors.redAccent,
//         ),
//       ],
//     );
//   }

//   Widget _buildProgressCard({
//     required String title,
//     required String percentage,
//     required String status,
//     required Color statusColor,
//     required double progressValue,
//     required Color gaugeColor,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.03),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Left Content
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 13,
//                   color: Color(0xFF8E8E93),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 percentage,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1E1E24),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               Row(
//                 children: [
//                   Icon(Icons.check_circle, size: 12, color: statusColor),
//                   const SizedBox(width: 4),
//                   Text(
//                     status,
//                     style: TextStyle(
//                       fontSize: 11,
//                       fontWeight: FontWeight.w600,
//                       color: statusColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),

//           // Right Vertical Gauge Widget
//           _buildVerticalGauge(progressValue: progressValue, color: gaugeColor),
//         ],
//       ),
//     );
//   }

//   Widget _buildVerticalGauge({required double progressValue, required Color color}) {
//     return Container(
//       width: 12,
//       height: 52,
//       decoration: BoxDecoration(
//         color: const Color(0xFFF0F0F3),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           FractionallySizedBox(
//             heightFactor: progressValue,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.3),
//                 borderRadius: BorderRadius.circular(6),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: (52 * progressValue) - 6,
//             child: Container(
//               width: 10,
//               height: 10,
//               decoration: BoxDecoration(
//                 color: color,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: color.withOpacity(0.4),
//                     blurRadius: 4,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomNavigationBar() {
//     return Container(
//       height: 80,
//       margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 20,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             icon: const Icon(Icons.home_outlined, color: Color(0xFF8E8E93)),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.menu_book_outlined, color: Color(0xFF8E8E93)),
//             onPressed: () {},
//           ),
//           // Center Purple Action Button
//           Container(
//             width: 52,
//             height: 52,
//             decoration: const BoxDecoration(
//               color: Color(0xFF5E4B8B), // Deep Purple
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   color: Color(0x405E4B8B),
//                   blurRadius: 10,
//                   offset: Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: IconButton(
//               icon: const Icon(Icons.insert_chart_outlined, color: Colors.white),
//               onPressed: () {},
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.emoji_events_outlined, color: Color(0xFF8E8E93)),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.grid_view, color: Color(0xFF8E8E93)),
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }

// // --- CUSTOM PAINTER FOR LINE CHART & TOOLTIP ---
// class ChartPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final linePaint = Paint()
//       ..color = Colors.white.withOpacity(0.85)
//       ..strokeWidth = 2.5
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final dotPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     // Line Path Data Nodes
//     final points = [
//       Offset(0, size.height * 0.8),
//       Offset(size.width * 0.14, size.height * 0.82),
//       Offset(size.width * 0.28, size.height * 0.55),
//       Offset(size.width * 0.42, size.height * 0.72),
//       Offset(size.width * 0.52, size.height * 0.25), // Selected Peak Node
//       Offset(size.width * 0.62, size.height * 0.8),
//       Offset(size.width * 0.74, size.height * 0.45),
//       Offset(size.width * 0.86, size.height * 0.55),
//       Offset(size.width, size.height * 0.2),
//     ];

//     // Highlight vertical gradient beam under selected node (Day 13)
//     final highlightBeamPaint = Paint()
//       ..shader = LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [
//           Colors.white.withOpacity(0.5),
//           Colors.white.withOpacity(0.0),
//         ],
//       ).createShader(Rect.fromLTWH(
//           points[4].dx - 12, points[4].dy, 24, size.height - points[4].dy));

//     canvas.drawRRect(
//       RRect.fromRectAndRadius(
//         Rect.fromLTWH(
//             points[4].dx - 10, points[4].dy, 20, size.height - points[4].dy),
//         const Radius.circular(10),
//       ),
//       highlightBeamPaint,
//     );

//     // Draw Smooth Line
//     final path = Path();
//     path.moveTo(points[0].dx, points[0].dy);
//     for (int i = 0; i < points.length - 1; i++) {
//       final p1 = points[i];
//       final p2 = points[i + 1];
//       final controlPoint1 = Offset(p1.dx + (p2.dx - p1.dx) / 2, p1.dy);
//       final controlPoint2 = Offset(p1.dx + (p2.dx - p1.dx) / 2, p2.dy);
//       path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
//           controlPoint2.dy, p2.dx, p2.dy);
//     }
//     canvas.drawPath(path, linePaint);

//     // Draw Dots on Nodes
//     for (int i = 0; i < points.length; i++) {
//       canvas.drawCircle(points[i], 3.5, dotPaint);
//     }

//     // Draw Tooltip Bubble above Node #4
//     final tooltipRect = RRect.fromRectAndRadius(
//       Rect.fromCenter(
//         center: Offset(points[4].dx, points[4].dy - 28),
//         width: 72,
//         height: 34,
//       ),
//       const Radius.circular(10),
//     );

//     canvas.drawRRect(
//       tooltipRect,
//       Paint()..color = Colors.white,
//     );

//     // Tooltip Text inside Bubble
//     const textStyle = TextStyle(
//       color: Color(0xFF1E1E24),
//       fontSize: 10,
//       fontWeight: FontWeight.bold,
//       height: 1.1,
//     );
//     const textSpan = TextSpan(text: '1 hour\n20 min', style: textStyle);
//     final textPainter = TextPainter(
//       text: textSpan,
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     textPainter.paint(
//       canvas,
//       Offset(points[4].dx - (textPainter.width / 2),
//           points[4].dy - 34 - (textPainter.height / 4)),
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
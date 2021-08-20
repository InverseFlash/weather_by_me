// import 'package:flutter/material.dart';
// import '../blocs/location_provider.dart';

// class LandingPage extends StatelessWidget {
//   const LandingPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final locationBloc = LocationProvider.of(context);
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder(
//           stream: locationBloc.locationRequestStream,
//           builder: (context, AsyncSnapshot<String> snapshot) {
//             if (snapshot.data == 'Pass') {
//               Navigator.pushNamed(context, '/landing_page');
//             }
//             if (!snapshot.hasData) {
//               return Text('Awaiting location response');
//             }
//             return Text(
//               snapshot.data,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

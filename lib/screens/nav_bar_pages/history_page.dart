import 'package:flutter/material.dart';

class Historyp extends StatefulWidget {
  const Historyp({super.key});

  @override
  State<Historyp> createState() => _HistorypState();
}

class _HistorypState extends State<Historyp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Center(
        child: Text('HIS'),
      ),
    );
  }
}

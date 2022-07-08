import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/pages/main_page/main_page.dart';


void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,        
      darkTheme: ThemeData.dark(),
      theme: ThemeData.dark(),
      home: const MainPage(),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/toko_provider/search_provider.dart';
import 'package:mobile_flutter/models/toko_provider/search_menu_provider.dart';
import 'package:mobile_flutter/utils/themes/theme.dart';
import 'package:mobile_flutter/utils/widget/bottom_navbar/custom_navbar_provider.dart';
import 'package:mobile_flutter/view_model/aunt_viewmodel/validator_aunt_provider.dart';
import 'package:mobile_flutter/view/home/screen/home_screen.dart';
import 'package:mobile_flutter/view_model/email_kami_provider.dart';
import 'package:mobile_flutter/view_model/home_provider.dart';
import 'package:mobile_flutter/view_model/masukan_saran_provider.dart';
import 'package:mobile_flutter/view_model/profile_provider.dart';
import 'package:mobile_flutter/view_model/statistik_penanaman_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/add_progress_provider.dart';
import 'package:mobile_flutter/view_model/ubah_kata_sandi_provider.dart';
import 'package:mobile_flutter/view_model/ubah_nama_provider.dart';
import 'package:mobile_flutter/view_model/dashboard_viewmodel/dashboard_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/plant_gridview_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/detail_progress_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/edit_nama_tanaman_provider.dart';
import 'package:mobile_flutter/view_model/tanamanku_viewmodel/tanamanku_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomNavbarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UbahNamaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UbahKataSandiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StatistikaPenanamanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EmailKamiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MasukanSaranProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ValidatorProvider(),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (context) => SearchProvider(products: []),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TanamankuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PlantGridviewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditNamaTanamanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailProgressProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddProgressProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agriplan - App',
        theme: agriplantLight,
        home: const HomeScreen(),
      ),
    );
  }
}

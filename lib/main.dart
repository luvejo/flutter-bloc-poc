import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/blocs/contests/contests_bloc.dart';
import 'package:todo/blocs/contests_filter/contests_filter_bloc.dart';
import 'package:todo/models/contest.dart';
import 'package:todo/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ContestsBloc()
              ..add(
                LoadContests(contests: [
                  Contest(
                    id: 1,
                    deadline: DateTime.parse("2023-07-25"),
                    name:
                        "55° de los Premios Nacionales de Cultura UDEA - 2° Premio Internacional de Cuento en Lengua Castellana",
                    genres: const ["Cuento"],
                    topPrize: "\$ 60,000,000",
                    link:
                        "https://www.udea.edu.co/wps/portal/udea/web/generales/interna/!ut/p/z1/xVNNc9owEP0r9MDRaGUbML05xgNxKIaAQ9ClI8syuLUtxx846a-v-Jg0JAHaSTvVRVpp9-3qvV1E0D0iKd1EK1pGIqWxtJek89XoWSo2dRgNbh0LzI5l2t3Z3Ug1VLQ4doAb3AZzak_Gc9ea9B0VEfk8nrZtrFowMmZgwNRwh57q2doV7h7i4cQy4ffizziQ8_XfIYIIS8usXKNlJvKSxlXAaRNocWytRcL3Z1bFZZXLQ5bzJBJFI6VsxxYvGgFvPD_Tgom05GkUiGJrBbwoKaM7KxV5IjneRAENFJpWqUQotqVkLArQUlfbEECPKZgyruhG6Cs9jJmiy-vAD1jIuuFr6t_-jZxndrHN9xLB7btSvE7fHs6xppnQOTg8s-teazZMe-P2RBtcq3pXe43wjvyXqnAQWcXC3_eamfqasUIk5yHPed6qcnm9Lsus-NyEJtR13VoJsYp5i4mkCe-FrEVRovtjT7SUVHVPUuVitNhEvEbeTpYYzf5QiSFcyKDDBzPs4X8JAaoUwr1yBqMvGFxL_SvwJ6vH_xT-5qPVO5eGXLZJ9O3hgZhy1Lcj-Sg75H_PepZ4npcY2pPy_Xb4Y8QXytLZ1PU8TCzfOGxPtfnpJxhcq5A!/dz/d5/L2dBISEvZ0FBIS9nQSEh/?page=udea.generales.interna&urile=wcm%3Apath%3A%2FPortalUdeA%2FasPortalUdeA%2FasHomeUdeA%2FCultura%2FPremios%2BNacionales%2Bde%2BCultura%2FasContenidos%2FasDestacados%2Fnormatividad-anuncios",
                    viaEmail: true,
                  ),
                  Contest(
                    id: 2,
                    name:
                        "IV Premio Estímulo a la Escritura 'Todos los tiempos el tiempo' (Argentina)",
                    deadline: DateTime.parse("2023-07-20"),
                    genres: const [
                      "Guión",
                      "Dramaturgia",
                      "Novela",
                      "Relato",
                      "Crónica",
                      "Ensayo",
                      "Novela gráfica",
                      "Cómic",
                      "Álbum ilustrado"
                    ],
                    topPrize: "AR\$ 600,000",
                    link: "https://todoslostiempos.org/",
                    viaEmail: true,
                  ),
                ]),
              ),
          ),
          BlocProvider(
            create: (context) => ContestsFilterBloc(
              contestsBloc: BlocProvider.of<ContestsBloc>(context),
            ),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ));
  }
}

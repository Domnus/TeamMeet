import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/get_user.dart';
import '../data/save_data.dart';
import '../models/user.dart';
import 'login.dart';

class Ajustes extends StatefulWidget {
  const Ajustes({Key? key}) : super(key: key);

  @override
  State<Ajustes> createState() => _AjustesState();
}

class _AjustesState extends State<Ajustes> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController dataController = TextEditingController();
  final prefs = SharedPreferences.getInstance();
  final ImagePicker _picker = ImagePicker();
  final dateFormat = DateFormat('yyyy-MM-dd');
  final inputDateFormat = DateFormat('dd/MM/yyyy');
  var maskDate = MaskTextInputFormatter(
      mask: 'xx/xx/xxxx', filter: {"x": RegExp(r'[0-9]')});
  late Usuario usuario;
  XFile? image;
  File imageFile = File('');
  String userFoto = '';

  Future<Usuario> _getUser() async {
    return await getUser() ?? Usuario(0, '', '', '', '', '');
  }

  Future<bool> _getFromGallery() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image!.path);
      bool success = await saveData('foto', imageFile);
      if (success) {
        return Future<bool>.value(true);
      }
    }
    return Future<bool>.value(false);
  }

  void refreshPage() {
    setState(() {});
  }

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: const [],
      future: _getUser(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;

          case ConnectionState.waiting:
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [CircularProgressIndicator(), Text('Carregando')],
            ));

          case ConnectionState.active:
            break;

          case ConnectionState.done:
            final usuario = snapshot.data as Usuario;
            userFoto = usuario.foto;

            return ListView(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        userFoto,
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          bool success = await _getFromGallery();

                          if (success) {
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Foto atualizada com sucesso!',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              duration: const Duration(milliseconds: 1500),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Ocorreu um erro! Tente novamente mais tarde.',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              duration: const Duration(milliseconds: 1500),
                            ));
                          }
                        },
                        icon: const Icon(Icons.mode_edit),
                        color: Colors.black),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFf7f5f5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0.0, 1.75))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFd9d9d9),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0.0, 1.75))
                          ],
                        ),
                        child: ExpansionTile(
                          title: const Text(
                            'Nome',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: nomeController,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText: usuario.nome,
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      onPressed: () async {
                                        bool success = await saveData(
                                            'nome', nomeController.text);

                                        if (success) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                'Nome atualizado com sucesso!',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary)),
                                            duration: const Duration(
                                                milliseconds: 1500),
                                          ));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Ocorreu um erro! Tente novamente mais tarde.',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                              ),
                                              duration: const Duration(
                                                  milliseconds: 1500),
                                            ),
                                          );
                                        }

                                        refreshPage();
                                      },
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFd9d9d9),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: const Offset(0.0, 1.75))
                          ],
                        ),
                        child: ExpansionTile(
                          title: const Text(
                            'Data de Nascimento',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    controller: dataController,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    inputFormatters: [maskDate],
                                    decoration: InputDecoration(
                                        hintText: usuario.dataNascimento,
                                        contentPadding: const EdgeInsets.all(0),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.black)),
                                    onSubmitted: (date) async {},
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: () async {
                                  if (dataController.text.isNotEmpty) {
                                    var inputDate = inputDateFormat
                                        .parse(dataController.text);

                                    bool success = await saveData(
                                        'data',
                                        dateFormat
                                            .parse(inputDate.toString())
                                            .toString());
                                    if (success) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Data de nascimento atualizada com sucesso!',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary)),
                                        duration:
                                            const Duration(milliseconds: 1500),
                                      ));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Ocorreu um erro! Tente novamente mais tarde.',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary)),
                                          duration: const Duration(
                                              milliseconds: 1500),
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Insira uma data!',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary)),
                                        duration:
                                            const Duration(milliseconds: 1500),
                                      ),
                                    );
                                  }
                                  refreshPage();
                                },
                                child: Text(
                                  "Salvar",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFd9d9d9),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0.0, 1.75))
                    ],
                  ),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 189, 189, 189)),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size.fromHeight(90))),
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Sair',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold))),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('isLoggedIn', false);
                        prefs.remove('usuario');
                        prefs.remove('senha');
                        Get.off(const Login(),
                            transition: Transition.circularReveal);
                      }),
                ),
              ),
            ]);
        }
        return const Text('');
      },
    );
  }
}

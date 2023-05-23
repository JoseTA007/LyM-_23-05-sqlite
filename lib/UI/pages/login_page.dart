import 'package:flutter/material.dart';
import 'package:lym_proyect/UI/base_datos/registro_clientes.dart';

class Iniciar extends StatefulWidget {
  static String id = 'iniciar_page';

  const Iniciar({super.key});

  @override
  State<Iniciar> createState() => _IniciarState();
}

class _IniciarState extends State<Iniciar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/imagenes/logo_LyM.png',
                height: 200,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5.0,
                    ),
                    colocarUsuario(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    colocarContrasena(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: olvidoContrasena(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        botonIngresar(),
                        const SizedBox(
                          width: 20,
                        ),
                        bottonRegistrate(),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    invitado(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Image.asset(
                      "assets/imagenes/shop.gif",
                      height: 200,
                      width: 200,
                    ),
                    Center(
                        child: Align(
                      alignment: Alignment.center,
                      child: terminosYcondiciones(),
                    )),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  colocarUsuario() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              enableInteractiveSelection: false,
              obscureText: false,
              decoration: InputDecoration(
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'ejemplo@correo.com',
                  labelText: 'CORREO ELECTRONICO',
                  labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red))),
              onChanged: (value) {},
            ),
          ],
        ));
  }

  colocarContrasena() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        enableInteractiveSelection: false,
        autofocus: false,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            icon: const Icon(
              Icons.lock,
              color: Colors.black,
            ),
            hintText: 'Colocar contraseña',
            labelText: 'CONTRASEÑA',
            labelStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red))),
        onChanged: (value) {},
      ),
    );
  }
}

olvidoContrasena() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return GestureDetector(
          child: Text(
            'Olvidastes tu contraseña?',
            style: TextStyle(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/olvido_contrasena_page');
          },
        );
      });
}

botonIngresar() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/listado_clientes');
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
              child: const Text('INGRESAR'),
            ));
      });
}

bottonRegistrate() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/registrate_page',
                  arguments: Cliente(
                      id: 0,
                      nombre: "",
                      apellidos: "",
                      contrasena: "",
                      comfirmarContrasena: "",
                      dni: "",
                      eMail: ""));
            },
            child: const Text('REGISTRATE'));
      });
}

invitado() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: () {
              Navigator.pushNamed(context, "/home_page");
            },
            child: const Text(
              'CONTINUAR COMO INVITADO',
              style: TextStyle(color: Colors.black),
            ));
      });
}

terminosYcondiciones() {
  return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return GestureDetector(
          child: Text(
            'Terminos y condiciones',
            style: TextStyle(
                color: Colors.red.shade900,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/terminos_condiciones_page');
          },
        );
      });
}

import 'package:flutter/material.dart';
import 'package:api_data_example/models/user.dart';

class DatosPersonajes extends StatefulWidget {
  final User user;

  const DatosPersonajes({Key? key, required this.user}) : super(key: key);

  @override
  State<DatosPersonajes> createState() => _DatosPersonajesState();
}

class _DatosPersonajesState extends State<DatosPersonajes>
    with SingleTickerProviderStateMixin {
  late Ability selectedAbility; // Habilidad seleccionada
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    // Establece la primera habilidad como la habilidad seleccionada por defecto
    selectedAbility = widget.user.abilities.first;

    // Configura la animación
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0), // Desde la derecha fuera de la pantalla
      end: Offset.zero, // Hasta el centro de la pantalla
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Inicia la animación al cargar la pantalla
    _controller.forward();
  }

  @override
  void dispose() {
    // Asegúrate de liberar los recursos del controlador de animación
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 189, 70, 62),
        title: const Text(
          "Lista Agentes",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Texto en color blanco
          ),
        ),
      ),
      body: Container(
        color: Colors.black, // Fondo negro
        child: Column(
          children: [
            // Barra horizontal con el nombre, rol e icono del rol
            Container(
              color: const Color.fromARGB(
                  255, 189, 70, 62), // Cambiado a color rojo
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nombre del agente
                  Text(
                    widget.user.firstName,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Texto en color blanco
                    ),
                  ),
                  // Espaciador flexible para ocupar el espacio restante
                  const Spacer(),
                  // Rol e icono del rol
                  Row(
                    children: [
                      Text(
                        'Rol: ${widget.user.rol}',
                        style: const TextStyle(
                            fontSize: 16.0, color: Colors.white),
                      ),
                      const SizedBox(width: 8.0),
                      Image.network(
                        widget.user.iconoRol,
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Contenido principal de la pantalla
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Imagen grande del agente con animación
                      SlideTransition(
                        position: _offsetAnimation,
                        child: Container(
                          margin: const EdgeInsets.only(top: 16.0),
                          height: 200, // Ajusta la altura según tu preferencia
                          width: 200, // Ajusta el ancho según tu preferencia
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.user.fotoGrande),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      // Descripción centrada
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          widget.user.description,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white, // Texto en color blanco
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // Otros detalles del agente...

                      // Botones de habilidades
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.user.abilities
                            .map((ability) => IconButton(
                                  icon: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(ability.displayIcon),
                                    radius: 20.0,
                                  ),
                                  onPressed: () {
                                    // Al hacer clic en la habilidad, actualiza la información
                                    setState(() {
                                      selectedAbility = ability;
                                    });
                                  },
                                ))
                            .toList(),
                      ),

                      // Información de la habilidad seleccionada
                      Container(
                        color: const Color.fromARGB(
                            255, 189, 70, 62), // Cambiado a color rojo
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              'Información de la Habilidad',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Texto en color blanco
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Nombre: ${selectedAbility.displayName}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white, // Texto en color blanco
                              ),
                            ),
                            Text(
                              'Descripción: ${selectedAbility.description}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white, // Texto en color blanco
                              ),
                            ),
                            // Otros detalles de la habilidad...
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

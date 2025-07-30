part of '../page/intro_page.dart';

class _IntroBody extends StatefulWidget {
  const _IntroBody();

  @override
  State<StatefulWidget> createState() => _IntroBodyState();
}

class _IntroBodyState extends State<_IntroBody> {
  final List<String> _imagePaths = [
    'assets/images/background_default_1.jpg',
    'assets/images/background_default_2.jpg',
    'assets/images/background_default_3.jpg',
    'assets/images/background_default_4.jpg',
  ];

  int _currentIndex = 0;
  Timer? _timer;
  final int _changeIntervalInSeconds = 5; // Cambia cada 5 segundos

  // Variable para controlar la imagen que se muestra en AnimatedSwitcher
  // y permitir una transición suave
  late Widget _currentImageWidget;

  @override
  void initState() {
    super.initState();
    if (_imagePaths.isNotEmpty) {
      _currentImageWidget = _buildImageWidget(_imagePaths[_currentIndex]);
      _startTimer();
    }
  }

  void _startTimer() {
    // Cancela cualquier timer existente para evitar múltiples timers corriendo
    _timer?.cancel();
    _timer =
        Timer.periodic(Duration(seconds: _changeIntervalInSeconds), (timer) {
      if (!mounted) {
        // Verificar si el widget sigue montado
        timer.cancel();
        return;
      }
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imagePaths.length;
        // Actualizamos el widget de la imagen para que AnimatedSwitcher lo detecte
        _currentImageWidget = _buildImageWidget(_imagePaths[_currentIndex]);
      });
    });
  }

  Widget _buildImageWidget(String imagePath) {
    // Usamos un Key único para cada imagen para que AnimatedSwitcher detecte el cambio
    // correctamente, especialmente si BoxFit y otros parámetros no cambian.
    // ValueKey es una buena opción aquí.
    return Image.asset(
      // O Image.network(imagePath) para URLs
      imagePath,
      key: ValueKey<String>(imagePath),
      // Importante para la transición
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Center(
            child: Icon(Icons.error, color: Colors.red, size: 50));
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Muy importante cancelar el timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (_imagePaths.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('No hay imágenes para mostrar.'),
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Fondo Cambiante'),
      // ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Imagen de fondo con transición
          AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            // Duración de la transición (ej. fade)
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _currentImageWidget, // El widget que cambia
          ),

          // Otro contenido encima del fondo (opcional)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withAlpha(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: size.height / 1.75,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  //borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: WidthValues.spacingSm,
                  children: [
                    Text(
                      'Welcome User!',
                      style:
                          ExtendedTextTheme.displayTitleSmall(context).copyWith(
                        color: ColorValues.fgBrandPrimary(context),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Get ready to dive into the greatest stories in TV and Film',
                      style: ExtendedTextTheme.textLarge(context),
                      textAlign: TextAlign.center,
                    ),
                    Gap(WidthValues.padding),
                    _IntroPremiumPlansButton(),
                    _IntroLoginButton(),
                    _IntroSignUpTextButton(),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            top: size.height * 0.15,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/icons/logos/stream_lite_full_logo-removebg-preview.png',
              height: Adaptive.h(16),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: _TermAndConditionsMessage(),
          ),
        ],
      ),
      // Opcional: Botón para reiniciar/cambiar el timer manualmente si es necesario
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     if (_imagePaths.isNotEmpty) {
      //       setState(() {
      //         _currentIndex = (_currentIndex + 1) % _imagePaths.length;
      //         _currentImageWidget = _buildImageWidget(_imagePaths[_currentIndex]);
      //       });
      //       _startTimer(); // Reinicia el timer con el nuevo punto de partida
      //     }
      //   },
      //   child: const Icon(Icons.refresh),
      // ),
    );
  }
}

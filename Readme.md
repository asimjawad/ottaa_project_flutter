![image](https://ottaaproject.com/img/ottaa-project.svg)

# Welcome to OTTAA Project wiki #

OTTAA Project is an Alternative Augmentative Communication System, intended for people with speech
impairments. It is a mobile, fast and effective tool that significantly improves the quality of life
and facilitates social and labor integration.

We had already improved more than 40000 people lifestyle in 11 countries, our App helps people with
Cerebral Palsy, Aphasia, Autism, Down Syndrome & mild ALS. You can be part of this life-changer
tech, join us in this social impact open source project.

[![](http://img.youtube.com/vi/zAL7yWxc-gU/0.jpg)](http://www.youtube.com/watch?v=zAL7yWxc-gU "Video")

# Project Info #

*[creating models]

- run `flutter pub get` to get the dependencies.
- run `flutter pub run build_runner build` to generate the model class code.
- run `flutter run` to run the project.
- run `flutter packages pub run build_runner build --delete-conflicting-outputs` if there are some
  errors for models building.
- run `flutter build web --release --web-renderer canvaskit` for building the project.
- run `flutter deploy` for deploying it on the master.
- run `firebase deploy --only hosting:dev-ottaaproject` for deploying it on dev.

* [Web Page](https://ottaaproject.com)

## Resources

> * added some custom Icons here from the FlutterIcons website

### Libraries

The libraries used are:

### Important ones

> * [firebase_auth](https://pub.dev/packages/firebase_auth) - For authentication using the firebase

> * [firebase_core](https://pub.dev/packages/firebase_core) - For running the firebase services

> * [flutter_facebook_auth](https://pub.dev/packages/flutter_facebook_auth) - For facebook auth

> * [flutter_tts](https://pub.dev/packages/flutter_tts) - For audio and text communication

> * [get](https://pub.dev/packages/get) - State management tool for flutter apps

> * [google_sign_in](https://pub.dev/packages/google_sign_in) - For google auth

> * [json_serializable](https://pub.dev/packages/json_serializable) - For parsing the json responses

> * [json_annotation](https://pub.dev/packages/json_annotation) - Classes and helper functions that support JSON code generation via the json_serializable package.

> * [build_runner](https://pub.dev/packages/build_runner) - A build system for Dart code generation and modular compilation

> * [firebase_database](https://pub.dev/packages/firebase_database) - For accessing firebase database

> * [firebase_storage](https://pub.dev/packages/firebase_storage) - for accessing teh storage on the firebase

> * [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics) - for firebase crashlytics reports

> * [firebase_analytics](https://pub.dev/packages/firebase_analytics) - for getting the analytics from the app

> * [http](https://pub.dev/packages/http) - for receiving and sending data API's
### others
> * [animate_do](https://pub.dev/packages/animate_do) - Animations
> * [auto_size_text](https://pub.dev/packages/auto_size_text) - For some resizing of the text according to the changes of the layout
> * [flutter_signin_button](https://pub.dev/packages/flutter_signin_button) For some fancy SignIn buttons
> * [getwidget](https://pub.dev/packages/getwidget) - for pre-built-in widgets
> * [shared_preferences](https://pub.dev/packages/shared_preferences) - Flutter plugin for reading and writing simple key-value pairs. Wraps NSUserDefaults on iOS and SharedPreferences on Android.
> * [dotted_border](https://pub.dev/packages/dotted_border) - A flutter package to let users easily add a dashed border around any widget.
> * [path_provider](https://pub.dev/packages/path_provider) - for getting commonly used locations on host platform file systems, such as the temp and app data directories.
> * [cached_network_image](https://pub.dev/packages/cached_network_image) - for loading the images from the network and loading them offline after getting them once
> * [image_picker](https://pub.dev/packages/image_picker) - for picking the image from device storage
> * [package_info_plus](https://pub.dev/packages/package_info_plus) - For getting the package info of the app
> * [device_info_plus](https://pub.dev/packages/device_info_plus) - for getting the device info
> * [url_launcher](https://pub.dev/packages/url_launcher) - for launching urls from app
> * [fluttertoast](https://pub.dev/packages/fluttertoast) - for showing toast messages
> * [share_plus](https://pub.dev/packages/share_plus) - for sharing content via the platform share UI,
> * [screenshot](https://pub.dev/packages/screenshot) - For taking screenshots of the widget
> * [just_audio](https://pub.dev/packages/just_audio) - for playing audio files

### Tools Needed

Official Android developer tools

![Android Studio](https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Android_Studio_icon.svg/64px-Android_Studio_icon.svg.png)
[Android Studio](https://developer.android.com/studio)

Repository

![Bitbucket](https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Bitbucket-blue-logomark-only.svg/64px-Bitbucket-blue-logomark-only.svg.png)
[Bitbucket](https://bitbucket.org)

Pictograms

![Arasaac](https://avatars2.githubusercontent.com/u/10613455?s=200&v=4)
[Araasac](http://arasaac.org/)

Testing Platform

![Testproject](https://blog.testproject.io/wp-content/themes/testprojectblog/img/t-plogo.png)
[Testproject](http://testproject.io)

## Documentation

* [Documentation](https://ottaaproject.com/javadoc)

## Analytics Implementation

### Kind of events

* **Talk**  *-Interaction Event*
* **Erase** *- Event-related with Erase action*
* **Delete** *- Event-related with Delete a pictogram or group*
* **Accessibility** *- Event-related with accessibility*
* **Settings**   *- Event-related with setting action*
* **Pictograms** *- Event-related with action add or edit about a pictogram or group*

### List of events

#### Erase Event

| Class     | Action | Name of Event |
|-----------|--------|---------------|
| Principal | Borrar | Borrar        |

#### Talk Events

| Screen    | Action                      | Name of Event    |
|-----------|-----------------------------|--------------------|
| Principal | Hablar                      | Phrase Without NLG |
| Principal | Hablar Y Borrar             | Talk and Erase     |
| Principal | Hablar en Modo Experimental | Phrase With NLG    |

#### Accessibility

| Screen         | Action                                  | Name of Event                |
|----------------|-----------------------------------------|-------------------------------|
| Principal      | Hablar Con Dispositivo de accesibilidad | Talk with accesibility device |
| Principal      | Hablar Con Barrido de Pantalla          | Talk with Screen Scanning     |
| Principal      | Galeria Grupos                          | Group Galery                  |
| Galeria Grupos | Boton de Accion                         | Select Group                  |
| Galeria Grupos | Boton de Anterior                       | Previous Button               |
| Galeria Grupos | Boton de siguiente                      | Next Button                   |
| Galeria Grupos | Boton de Salir                          | Close Galery Groups           |
| Galeria Pictos | Editar Pictogramas                      | Edit Pictograms               |
| Galeria Pictos | Boton de Anterior                       | Previous Button               |
| Galeria Pictos | Boton de Siguiente                      | Backpress Button              |

#### Pictograms

| Screen        | Action                   | Name of Event                           |
|---------------|--------------------------|------------------------------------------|
| Editar Grupos | Asignar Tags             | Hour Tag, Location Tag,GenderTag,Age Tag |
| Editar Grupos | Agregar Pictograma Nuevo | Add Pictogram                            |
| Editar Grupos | Editar Pictograma        | Edit Pictogram                           |
| Editar Grupos | Agregar Grupo Nuevo      | Add Group                                |
| Editar Grupos | Editar Grupo             | Edit Group                               |

#### Settings

| Screen           | Action                      | Name of Event        |
|------------------|-----------------------------|-----------------------|
| Unir Pictogramas | Activar/Desactivar Repetir  | Mute                  |
| Pictogramas      | EditarPictogramas           | Edit Pictograms       |
| Pictogramas      | Tiempo entre clicks         | Time Between Clicks   |
| Pictogramas      | Hablar y borrar             | Talk and erase        |
| Prediccion       | Ubicacion                   | Location              |
| Prediccion       | Pictos Sugeridos            | Suggested Pictograms  |
| Prediccion       | Edad                        | Age User              |
| Prediccion       | Genero                      | Gender User           |
| Accesibilidad    | Mano Habil                  | Skill hand            |
| Accesibilidad    | Barrido de pantalla         | Screen Scanning       |
| Accesibilidad    | Velocidad de Barrido        | Screen Scanning Speed |
| Accesibilidad    | Velocidad del Scroll        | Scroll Speed          |
| Accesibilidad    | Orientacion del Joystick    | Joystick              |
| Accesibilidad    | Control Facial              | Facial Control        |
| Voz Y Subtitulo  | Habilitar TTS Personalizado | Custom TTS            |
| Voz Y Subtitulo  | Subtitulo Personalizado     | Custom Subtitle       |
| Idioma           | Selecciona un idioma        | Language              |
| Idioma           | OTTAA Labs                  | Experimental Mode     |

#### Touch

| Screen           | Action                               | Name of Event             |
|------------------|--------------------------------------|----------------------------|
| Principal        | Frases Mas Usadas                    | More Used Phrases          |
| Principal        | Compartir Frases                     | Share Phrases              |
| Principal        | Cargar Opciones                      | More Options               |
| Principal        | Silenciar                            | Silence                    |
| Principal        | Ubicacion                            | Location                   |
| Principal        | Galeria Grupos                       | Group Galery               |
| Principal        | Agregar Relacion                     | add Pictogram              |
| Principal        | Eliminar Relacion                    | Delete Pictogram           |
| Principal        | Editar Pictograma                    | Edit Pictogram             |
| Principal        | Entrar a Configuracion               | settings                   |
| Principal        | Entrar al informe                    | Report                     |
| Principal        | Entrar al Acerca de                  | About That                 |
| Principal        | Cerrar Sesion                        | LogOut                     |
| Galeria Grupos   | Agregar Grupo                        | Add Group                  |
| Galeria Grupos   | Bajar Pictogramas                    | Download Pictograms        |
| Galeria Grupos   | Ordenar Grupos                       | Sort Groups                |
| Galeria Grupos   | Editar Grupo                         | Edit Group                 |
| Galeria Grupos   | Eliminar Grupo                       | Delete Group               |
| Editar Grupos    | Probar Texto en voz alta             | Say Pictogram Name         |
| Editar Grupos    | Agregar Imagen                       | Select Custom Picto Image  |
| Editar Grupos    | Seleccionar Categoria del pictograma | Select Pictograms Category |
| Galeria Pictos   | Agregar Pictogramas                  | Add Pictograms             |
| Galeria Pictos   | Editar Pictogramas                   | Edit Pictograms            |
| Galeria Pictos   | Vincular Pictogramas                 | Vinculate Pictograms       |
| Galeria Pictos   | Buscar Pictograma                    | Search Pictogram           |
| Galeria Pictos   | Eliminar Pictograma                  | Delete Pictograms          |
| Galeria Pictos   | Boton de Anterior                    | Foward Button              |
| Galeria Pictos   | Boton de Siguiente                   | Next Button                |
| Galeria Pictos   | Boton Salir                          | Backpress Button           |
| Galeria Pictos   | Seleccionar Un pictograma            | Select Pictogram           |
| Galeria Pictos   | Ordenar Pictogramas del grupo        | Sort Pictograms            |
| Vincular         | Guardar Pictogramas vinculados       | Vinculate child            |
| Juegos           | Uso del boton Siguiente              | Next Button                |
| Juegos           | Uso del boton Anterior               | Previous Button            |
| Juegos           | Uso del Boton de Accion              | Select Game                |
| Unir Pictogramas | Boton Score                          | Score Dialog               |
| Unir Pictogramas | Activar/Desactivar Ayuda             | Help Action                |
| Unir Pictogramas | Activar/Desactivar Repetir           | Mute                       |
| Cual es el picto | BotonScore                           | Score Dialog               |
| Cual es el picto | Activar/Desactivar Ayuda             | Help Action                |
| Cual es el picto | Silenciar Cancion                    | Mute                       |
| LoginActivity    | Seleccionar el boton de singin       | singIn                     |
| LoginActivityStep2 | Voy al paso 3 del tutorial | Next1 |
| LoginActivityStep2 |vuelvo al login| Back1 |
| LoginActivityStep2 | llamo al calendario | calendarButton |
| LoginActivityStep3 | paso al activity siguiente| Next2 |
| LoginActivityStep3 | paso al activity anterior | Back2  |
| LoginActivityStep3 | voy al tutorial desde el login | ButtonTutorial |
| LoginActivityStep3 | voy al tutorial desde el login | ButtonTutorial |
| LoginActivityStep3 | voy al workshop desde el login | ButtonAutoWorkShop |
| LoginActivityStep3 | Reservo una charla | ButtonBookDemo |
| LoginActivityAvatar |salgo del login a la ventana principal | Next3 |
| LoginActivityAvatar |vuelvo al paso 3 del tutorial | Back3 |
| LoginActivityAvatar | elije tu avatar | buttonSelectAvatarSource |
| LoginActivityStep3 | elije tu foto | buttonSelectCameraSource |
| LoginActivityStep3 | elije una  foto  de la galeria| buttonGalerySource |
| LoginActivityStep3 | elije tu foto | buttonGalerySource |
| LoginActivityStep3 | abre el dialogo para usar el avatar o seleccionar una foto | buttonSelectAvatarSource |
| VincularFrases | ir a la frase anterior | Favorite Phrases UpButton |
| VincularFrases | ir a la frase siguiente | Favorite Phrases DownButton |
| VincularFrases | volver a la pantall principal sin guardar las frases favoritas | Favorite Phrases BackButton |
| VincularFrases | volver a la pantall principal guardando las frases favoritas | SaveFavoritePhrases |

# Information

## Contributing

### How to contribute

We would love your help. Before you start working however, please read and follow this guide.

#### Reporting Issues

Provide a lot of information about the bug. Mention the version of OTTAA Project and explain how the
problem can be reproduced.

### Code Contributions

#### Create a pull request

In order to create a pull request is necessary

* Avoid file conflicts with the source code
* Should make a description about the characteristics to apply
* Should apply the pull request in the corresponding branch

|Branch|Description|
|---|---|
|Version| Main |
|Feature| Add new features |
|Hotfix|  Hot-fix about a version|
|Bugfix|  Bug-fix about a version|

### Documentation

#### Comments

* Comment documenting the source code are required.

* Comment a class explaining the purpose of that and how to implements if that required.

* Comment should be formatted as proper English sentences.
* use Javadoc documentation.

### Code

#### Duplication

* Don't copy-paste source code. Reuse it.

#### Import Libraries

* Sort by category.

|Category|Description|
|--------|-----------|
| Google | Library related to google |
| Android | Library related to android |
|Firebase | Library related to firebase api|
|Test |Library related to test app|
| Library | Library related to different apps|

* Sort by alphabetical order.

* Use Grandle level app Example :

```
#!xml
dependencies {
   implementation 'library'
}
```

#### Indentation

Switch case

```
#!java
Align by  such as these cases :

Switch(value){
    case 0:
       // Todo action here
    break;
    Default:
       // Todo default action here
    break;
}
```

If / else or else if

```
#!java

if(value.toString().equals("Hello")){
  //To do action here
}else if{
  // To do action here
} else{
  // Todo
}

```

**Remember: **

* The attributes of the class must be protected or private

* The Method of the class must be public, private or protected

* The class must be public or private

### Naming ###

** Name:** That must be transparent and representative about the action to show us.

**Class:** should be nouns in UpperCamelCase, with the first letter of every word capitalized.
example :

```
#!java
public class Json(){

}
```

**variable:**    Local variables, instance variables, and class variables are also written in
lowerCamelCase.

example :

```
#!java

String name =" Carl";
String fileName="json.txt";
```

**Constant:** Constants should be written in uppercase characters separated by underscores.

example :

```
#!java

public static final String CONSTANT_NAME=" fileName.txt";
```

#### Firebase index:

This is the Three in firebase :

```
#!code

index
├── Edad
├── email
├── Fotos
|    ├── nombre_foto
|    └── url_foto
├── FotosUsuario
├── Frases
├── Grupos
├── Juegos
├── Pago
├── Pictos
├── PrimeraUltimaConexion
└── Usuarios
```

## Code of Conduct

### OTTAA Project Open Source Code of Conduct

In order to work in the OTTAA Project in a collaborative way and help our community grow we ask you
to comply with the following code of conduct..

** Diversity makes us grow : **  We truly believe that every user’s or developer’s age, gender,
nationality, race or sexual orientation provide content based on a plurality of experiences and
knowledge that contribute to the construction of a complete tool which reflects the real needs of
potential users of the OTTAA Project.

** Debate enriches us : ** As we consider that everyone can contribute significantly to improving
the software we seek to establish mutual respect among the members of the community, reaching a
consensus among the developers and solving the problem in the best way possible.

It is necessary to comply with the following guidelines in our conduct code:

* **Refraining from discriminating .**
* **Avoiding posting pornographic content.**
* **Refraining from publishing the user’s details or relevant information.**
* **Refraining from making heavy jokes.**
* **Avoiding insults**
* **Refraining from judging others on there religions or race**

### Reporting breaches to the code of conduct

In the case of any violation of our code of conduct, it should be reported as follows:
Share your contact details

* **Send a screenshot of the situation**
* **Explain the situation in as much detail as possible**
* **Send the email to the following address : support@ottaaproject.com**

After the revision of the report, the team assigned to analyze the case will carry out the following
actions:

* **Notify the user of the breach**
* **devise a way for the user to amend that attitude.**

the user can be expelled from the community in the following situation :

* **Repeated conduct**
* **Posting of pornographic content**




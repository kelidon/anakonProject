import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsWidget extends StatefulWidget {
  final double height;

  const AboutUsWidget({Key key, this.height}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AboutUsWidgetState(height);
}

//TODO try to do something here

///     remember:
///
///     WidgetNamingRules  (Container, TextStyle, etc.)
///     variableNamingRules  (var someCounter = 7, bool isSomething = false)
///     this_is_how_files_names_looks_like
///
///     if you want to have a private variable, you should put '_' before its name  (_somePrivateVariable)
///
///     'var' is for dynamic cast to given value:
///       var a = 0; int b = 7;  -  they both of 'int' type
///
///
///     you have setState & initState methods inside the widgets that extends State<WidgetName>, I'll show them below
///

class _AboutUsWidgetState extends State<AboutUsWidget> {
  final double height;

  _AboutUsWidgetState(this.height);

  // For instance, you have some variable (which could be passed here from outer app, by the way, but nevermind for now),
  // let it be:
  /// var someNumber;

  // and you want this variable to be zero that when this widget will be build for the first time
  // you do:

  /// @override
  /// void initState() {
  ///   super.initState();
  ///   someNumber = 0;
  /// }

  @override
  Widget build(BuildContext context) {
    //and you have some element with gesture detection here
    // for example, InkWell (by the way, InkWell has a lot of gesture detection properties, explore it)
    // and you want your variable to change when you tap on [SomeWidgetThatCouldBeTapped]
    //
    //you should cover a function that is changing your variable with setState((){ yourFunction(); }), like this:
    /**
        return InkWell(
        onTap: () {
        setState(() {

        // by doing this, variable value will change AND this widget will rebuild
        // the reason is: if you are using this variable somewhere in your widget (for instance, show the amount of likes under a photo)
        // you will probably want this widget to rebuild in order to show updated data

        someNumber++;
        });
        },
        child: SomeWidgetThatCouldBeTapped(),
        );
     **/

    // We will use all described about setState to change the border color when mouse is hovering widget (like in SoftTeco)
    // Or we could make our widgets move a bit when the user see them first time (like in Google Store) by adding something in initState()

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),

          ///  you could not put color property to the outer Container if you give it decoration property
          ///  this Container has decoration property, so color is here
          ///
          ///  probably we'll change this color or remove it - feel free to change this
          //color: Colors.grey.withOpacity(0.4),
        ),

        ///        DO NOT CHANGE !!!
        ///  this makes Container fit the user's screen on any device
        height: height,
        margin: EdgeInsets.only(top: 20, bottom: 20),

        ///  this is a contents of the Container
        ///
        ///           IN THE GAME, Mr. DEVELOPER, IN THE GAME
        ///

        child: Center(
            child: RichText(
              text: TextSpan(
                text: "",
                children: <TextSpan>[
              TextSpan(text:"ПОЧЕМУ МЫ\n",  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, )),
              TextSpan(text:"Копмания АНАКОН имеет  многолетний успешный  опыт  по управлению и эксплуатации различными объектами недвижимости – бизнес-центрами, офисными зданиями, подземными и наземными паркингами, фитнесс-центрами. Основное направление – управление, техническое обслуживание и эксплуатация зданий, арендаторами или собственниками которых являются ИТ компании.",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, )),
               ]
              ),
            )
        )
    );

  }
}

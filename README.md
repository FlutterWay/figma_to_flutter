
# figma_to_flutter
Easily transform Figma designs into Flutter codes. Carry over your Figma designs to Flutter coding space with same values responding in Flutter. 

<img src="https://raw.githubusercontent.com/FlutterWay/files/main/figma_design/figma_design_poster.png"/>

## Features 
- Convert Figma pixel values to Flutter pixel values.
- Convert text fonts easily to Flutter environment
- Utilize widgets such as FigmaContainer, FigmaText, FigmaBox and make your job easier


## Getting Started 
Don't forget to set your device measurements before using the package 

```dart
void main() {
  Figma.setup(deviceWidth: 375, deviceHeight: 812);
  runApp(const TravellApp());
}
```

## Convert Figma pixels

```dart
    double width20=Figma.of(context).px(20, Axis.horizontal);
    double height20=Figma.of(context).px(20, Axis.vertical);
```

## Padding
There are two way of using Padding

### As children of Columns/Rows
```dart
  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Figma.of(context).spacer(60, Axis.vertical),
      // diğer widgetlar
      ])
```
```dart
  Row(
      children: [
      Figma.of(context).spacer(60, Axis.horizontal),
      // diğer widgetlar
      ])
```
### With Padding
EdgeInsets.only=>Figma.of(context).paddingOnly(left: 24)
EdgeInsets.all=>Figma.of(context).paddingAll(24)
EdgeInsets.symmetric=>Figma.of(context).paddingSymmetric(horizontal: 20,vertical: 20)

```dart
  Padding(
      padding: Figma.of(context).paddingOnly(left: 24),
      child: Column()
  )
```

## TextStyle

```dart
  Text("Bashkortostan",
      style: figma.style(
          googleFont: "Rubik",
          fontSize: 34,
          color: textColor,
          fontWeight: FontWeight.w500))
```

## Ready-to-use Widgets

### FigmaText

An example of text conversion:<br></br>
<img src="https://raw.githubusercontent.com/FlutterWay/files/main/figma_design/figma-text-properties.JPG"/>

```dart
FigmaText(
  "Top 30 places",
  height: 20,
  width: 96,
  style: Figma.of(context).style(
      googleFont: "Rubik",
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.w400),
)
```

### FigmaText

An example text to convert:
<img src="https://raw.githubusercontent.com/FlutterWay/files/main/figma_design/figma-text-properties.JPG"/>

```dart
FigmaText(
  "Top 30 places",
  height: 20,
  width: 96,
  style: Figma.of(context).style(
      googleFont: "Rubik",
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.w400),
)
```

### FigmaContainer
A widget that will convert a box with pre-determined sizes into a Flutter Container

```dart
FigmaContainer(
  width: 200,
  height: 60,
  padding: figma.paddingAll(8),
  child: Row(),
)
```

### FigmaBox
A widget that will convert a box with pre-determined sizes into a Flutter SizedBox

```dart
FigmaBox(
  width: 200,
  height: 60,
  child: Row(),
)
```

## Full Example

```dart
@override
Widget build(BuildContext context) {
  var figma = Figma.of(context);
  return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: Padding(
        padding: figma.paddingOnly(left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            figma.spacer(60, Axis.vertical),
            FigmaContainer(
              height: 40,
              padding: figma.paddingOnly(right: 24),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bashkortostan",
                        style: figma.style(
                            googleFont: "Rubik",
                            fontSize: 34,
                            color: textColor,
                            fontWeight: FontWeight.w500)),
                    Image.asset(
                      "assets/icons/map.png",
                      width: figma.px(24, Axis.horizontal),
                    )
                  ]),
            ),
            figma.spacer(8, Axis.vertical),
            Padding(
              padding: figma.paddingOnly(right: 24),
              child: Text(
                "Choose another",
                style: figma.style(
                    fontSize: 12,
                    color: textColor.withOpacity(0.5),
                    fontWeight: FontWeight.w400),
              ),
            ),
            figma.spacer(24, Axis.vertical),
            Padding(
              padding: figma.paddingOnly(right: 24),
              child: FigmaContainer(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(16)),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: figma.style(
                      googleFont: "Rubik",
                      fontSize: 15,
                      color: textColor,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      hintText: "Enter name or category ",
                      hintStyle: figma.style(
                          googleFont: "Rubik",
                          fontSize: 15,
                          color: textColor.withOpacity(0.4),
                          fontWeight: FontWeight.w400),
                          contentPadding: figma.paddingOnly(left: 16),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                        color: textColor.withOpacity(0.4),
                        size: figma.px(20, Axis.horizontal),
                      )),
                ),
              ),
            ),
            figma.spacer(28, Axis.vertical),
            Text("Category",
                style: figma.style(
                    googleFont: "Rubik",
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.w500)),
            figma.spacer(16, Axis.vertical),
            FigmaBox(
              height: 52,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ViewCategory(
                      iconBackground: Color(0xFFEACB8E),
                      iconPath: "assets/icons/star.png",
                      text: "Top 30 places"),
                  ViewCategory(
                      iconBackground: Color(0xFF8DE8C7),
                      iconPath: "assets/icons/tree.png",
                      text: "Nature"),
                  ViewCategory(
                      iconBackground: Color(0xFFEB5757),
                      iconPath: "assets/icons/food.png",
                      text: "Gastro"),
                ],
              ),
            ),
            figma.spacer(28, Axis.vertical),
            FigmaBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ViewImage(
                      imagePath: "assets/images/Salavat Yulaev.png",
                      text: "Monument to Salavat Yulaev"),
                  ViewImage(
                      imagePath: "assets/images/Krasnyy klyuch.png",
                      text: "Krasnyy klyuch spring"),
                ],
              ),
            ),
            const Spacer()
          ],
        ),
      ));
}
```

Создать флоу экранов в Storyboard без кода

1. Добавить UISplitViewController

  - 1.1 В UISplitViewController добавить как master TabBarViewController

    - 1.1.1 В TabBarViewController добавить 3 таба: Feed, Benchmark, Profile

    - 1.1.2 На каждый таб добавить по NavigationViewController

    - 1.1.3 В каждом NavigationViewController добавить по UIViewController

    - 1.1.4 В каждом UIViewController добавить 1-2 из наследников UIView (UILabel, UIImageView, UISwitch, UIButton)

    - 1.1.5 В UIViewController таба Profile добавить кастомную UIButton c @IBInspectable/@IBDesignable 

  - 1.2 В UISplitViewController добавить как detail NavigationViewController

    - 1.2.1 В UISplitViewController добавить как detail NavigationViewController

    - 1.2.2 В NavigationViewController добавить от UIViewController переход по Storyboard Reference на второй Storyboard

    - 1.2.3 Сделать добавить xib-компонент заглушку

    - 1.2.4 На втором Storyboard во ViewController Scene добавить xib-компонент

2. Протестировать на iPad/iPhone симуляторах, со сменой ориентации девайса

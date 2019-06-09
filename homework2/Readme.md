1. В AppDelegate реализовать методы App Life Cycle и расставить в них print c названиями стадий или функций

  - 1.1 Для стадии запуска(Launching) приложения:

    - 1.1.1 application: willFinishLaunchingWithOptions

    - 1.1.2 application: didFinishLaunchingWithOptions

    - 1.1.3 applicationWillEnterForeground

    - 1.1.4 applicationDidBecomeActive

  - 1.2 Для стадии выключения(Terminating) приложения:

    - 1.2.1 applicationWillResignActive

    - 1.2.2 applicationDidEnterBackground

    - 1.2.3 applicationWillTerminate

2. Реализовать View controller lifecycle behaviors для вью контоллера Benchmark

  - 2.1 Добавить поведение afterAppearing c запуском таймера:

    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    
    В runTimed сделайте принт, например так print(Date())

  - 2.2 На beforeDisappearing вызвать таймеру invalidate() чтобы на других экранах он не тикал и не принтил

3. На ViewController таба Profile 

  - 3.1 написать поведение со сменой цвета статус бара и view.backgroundColor на черный

4. На ViewController(первом) таба Feed сделать кнопку

  - 4.1 По кнопке пушить новый ViewController(второй)

  - 4.2 На новом ViewController добавить еще одну кнопку и по ней показать третий ViewController

  - 4.3 Реализовать переход с третьего ViewController на первый

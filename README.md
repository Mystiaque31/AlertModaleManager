# AlertModaleManager

lertModaleManager is a library which helps you presenting easily modales composed of a UIViewController. It has a system of queue allowing you to present several UIViewControllers successively.

### Prerequisites

* iOS 13.0+
* Swift 5.0+

### Installing

You can easily install it via cocoapods using the following line

```
pod 'AlertModaleManager'
```

Then run in a terminal inside your working directory

```
pod install
```

## How to use it

In the UIViewController which will be presenting (your modale), make it inherit from UIAlertBaseVC and UIAlertBaseProtocol as following :

```
  class AlertExampleVC: UIAlertBaseVC, UIAlertBaseProtocol
```

then set the two variables "storyboardName" and "storyboardIdentifier" at the values set in the storyboard containing the modale.

To present the view just call the manager :

```
  AlertModaleManager.instance.presentView(AlertExampleVC.self, self)
```

You have an example inside the github repository.

## Communication

If you find a bug, please open an issue

## Versions

You can find the versionning of this pod in the [tag section](https://github.com/Mystiaque31/AlertModaleManager/tags)

## Authors

* **Thibault Deprez** - *AlertModaleManager* - [Mystiaque31](https://github.com/Mystiaque31)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

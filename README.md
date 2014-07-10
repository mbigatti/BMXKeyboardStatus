# BMXKeyboardStatus

A simple Swift component that provides informations about the keyboard. The supported properties are:

    var keyboardShowed = false
    var keyboardBeginFrame : CGRect?
    var keyboardEndFrame : CGRect?
    var keyboardAnimationDuration : Float?
    var keyboardAnimationCurve : UIViewAnimationCurve?

To know the frame of the shown keyboard use `keyboardEndFrame`.

## Usage

- Add the `BMXKeyboardStatus` framework to the project under *General > Linked Frameworks and Libraries*
- Import the framework in the source code with `import BMXKeyboardStatusFramework`
- Init the component in `viewDidLoad` method or `application:didFinishLaunchingWithOptions` method with `KeyboardStatus.sharedInstance`
- Query when required. For example:

`let keyboardIsShowed = KeyboardStatus.sharedInstance.keyboardShowed`

See the enclosed sample project for a complete example.

### Contact
[http://bigatti.it](http://bigatti.it)  
[@mbigatti](https://twitter.com/mbigatti)

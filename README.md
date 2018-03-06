[![Platform](https://img.shields.io/cocoapods/p/LinkedIn.swift.svg?style=flat)](https://github.com/BiAtoms/LinkedIn.swift)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/LinkedIn.swift.svg)](https://cocoapods.org/pods/LinkedIn.swift)


# LinkedIn.swift

LinkedIn SDK iOS dependency eleminating manual import of  `linkedin-sdk.framework` into your swift project

# Usage
1. Follow [LinkedIn iOS Docs](https://developer.linkedin.com/docs/ios-sdk) and set up your app
2. Add following to your `AppDelegate.swift`
    ```swift
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

        return LinkedIn.application(app,
                                    open: url,
                                    options: options)
    }
    ```
3. Now can use `LISDKSessionManager` etc classes in your project by importing LinkedInSwift module `import LinkedInSwift`.

# Features
 `LinkedIn.swift` simplifies **login and fetch user** process out of the box.
```swift
LinkedIn.login(permissions: [.basicProfile, .email] { (user: LinkedInUser?, error: Error?) in
    print(user?.jsonDict as Any, error as Any)
}
```

`LinkedInUser` stores user info in `jsonDict: [String: Any]` field and there are couple of getters to simplify the access those parameters. For more information see `LinkedInUser.swift` and other files.


## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate LinkedIn.swift into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
target '<Your Target Name>' do
    pod 'LinkedIn.swift', '~> 1.0'
end
```

Then, run the following command:

```bash
$ pod install
```
## Authors

* **Orkhan Alikhanov** - *Initial work* - [OrkhanAlikhanov](https://github.com/OrkhanAlikhanov)

See also the list of [contributors](https://github.com/BiAtoms/LinkedIn.swift/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

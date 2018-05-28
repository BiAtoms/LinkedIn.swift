[![Platform](https://img.shields.io/cocoapods/p/LinkedIn.swift.svg?style=flat)](https://github.com/BiAtoms/LinkedIn.swift)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/LinkedIn.swift.svg)](https://cocoapods.org/pods/LinkedIn.swift)
[![Carthage Compatible](https://img.shields.io/badge/carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/github/license/BiAtoms/LinkedIn.swift.svg)](https://github.com/BiAtoms/LinkedIn.swift/blob/master/LICENSE)


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
3. `import LinkedInSDK`, now can use `LISDKSessionManager` etc. classes in your project.

# Features
 `LinkedIn.swift` simplifies **login and fetch user** process out of the box. import `LinkedInSwift` (not `LinkedInSDK`)
```swift
import LinkedInSwift
// ...
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

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate LinkedIn.swift into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "BiAtoms/LinkedIn.swift" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `LinkedInSwift.framework` into your Xcode project.

## Authors

* **Orkhan Alikhanov** - *Initial work* - [OrkhanAlikhanov](https://github.com/OrkhanAlikhanov)

See also the list of [contributors](https://github.com/BiAtoms/LinkedIn.swift/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/BiAtoms/LinkedIn.swift/blob/master/LICENSE) file for details

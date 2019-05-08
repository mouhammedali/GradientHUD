# GradientHUD

[![CI Status](https://img.shields.io/travis/mouhammedali/GradientHUD.svg?style=flat)](https://travis-ci.org/mouhammedali/GradientHUD)
[![Version](https://img.shields.io/cocoapods/v/GradientHUD.svg?style=flat)](https://cocoapods.org/pods/GradientHUD)
[![License](https://img.shields.io/cocoapods/l/GradientHUD.svg?style=flat)](https://cocoapods.org/pods/GradientHUD)
[![Platform](https://img.shields.io/cocoapods/p/GradientHUD.svg?style=flat)](https://cocoapods.org/pods/GradientHUD)

![](https://drive.google.com/uc?export=download&id=1KiwWDM8XmCHP_A4mxlB7RnP16Mrt_8Hk)


![](https://drive.google.com/uc?export=download&id=1L2o-ox0ISX6_TW2O6GGF1GWTBj0o0eER)

## Usage
first import GradientHUD to your class.

```swift
	import GradientHUD
```

initialize and show HUD

```swift
	let HUD = GradientHUD()
	HUD.show(on:self)
```
hide HUD


```swift
	HUD.hide()
```

## Customizations
change gradient colors 

```swift
HUD.gradientArr = [UIColor.blue.cgColor, UIColor.red.cgColor, UIColor.purple.cgColor]
```

change spinner color

```swift
HUD.spinnerView.color = UIColor.black.cgColor
```

clear background

```swift
HUD.dimBackground = true
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* iOS 9.0+
* Xcode 9.0+
* Swift 4.0

## Installation

GradientHUD is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GradientHUD'
```

## Author

* mouhammedali, mouhammedaliamer@gmail.com

* Check more of my work on [Pintrest](https://pin.it/lowsm3sscypihq)

* Hire me on [Mostaql](https://mostaql.com/u/mouhammed_ali)

## License

GradientHUD is available under the MIT license. See the LICENSE file for more info.

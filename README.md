# ALProgressView



<img align="left" src="https://github.com/alxrguz/ALProgressView/blob/main/Assets/PreviewBanner.gif" width="300"/>

### About

**ALProgressView** - is a library for displaying a progress view with 2 styles: ring and bar. 

It's easy to customize. You can adjust the gradient, line width, shadow, and more.

Also for this library, I added about 20 functions for animation, more details in the [Animation](#Animation) section

<br/>

<br/>

If you liked this library, please do not forget to put a `★ star`, it will help me in its development.

<br/>

<br/>

## Navigation

- [Requirements](#requirements)
- [Installation](#installation)
  - [Swift Package Manager](#Swift-Package-Manager)
  - [CocoaPods](#CocoaPods)
  - [Manually](#Manually)
- [Usage](#usage)
  - [Quick Start](#Quick-Start)
  - [Customization](#Customization)
    - [General](#General)
      - [Colors](#colors)
      - [Animation](#Animation)
    - [ALProgressRing](#ALProgressRing)
    - [ALProgressBar](#ALProgressBar)
- [License](#License)

## 

## Requirements

- iOS 10.0 + 
- Swift 4.2 +



## Installation

#### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate **ALProgressView** click `File -> Swift Package -> Add Package Dependency` and insert:

```ogdl
https://github.com/alxrguz/ALProgressView
```

#### CocoaPods

**ALProgressView** is available through [CocoaPods](https://cocoapods.org/pods/ALProgressView). To install it, simply add the following line to your Podfile:

```ruby
pod 'ALProgressView'
```

#### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate ALProgressView into your project manually. Put `Source/ALProgressView` folder in your Xcode project. 



## Usage

#### Quick Start

```swift
import ALProgressView

class MyViewController: UIViewController {

    private lazy var progressRing = ALProgressRing()
    private lazy var progressBar = ALProgressBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(progressRing)
        view.addSubview(progressRing)
      
      	// MARK: ALProgressRing
        
        // Setup layout 
        progressRing.translatesAutoresizingMaskIntoConstraints = false
        progressRing.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressRing.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
      	// Make sure to set the view size
        progressRing.widthAnchor.constraint(equalToConstant: 180).isActive = true
        progressRing.heightAnchor.constraint(equalToConstant: 180).isActive = true
      
      
        // MARK: ALProgressBar
      
        // Setup layout 
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.topAnchor.constraint(equalTo: progressRing.bottomAnchor, constant: 20).isActive = true
        progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBar.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        // Make sure to set the view height
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
      
       
        // Setting progress
        progressRing.setProgress(0.8, animated: true)
        progressBar.setProgress(0.6, animated: true)
    }
}
```

You can also run ExampleApp and play with the parameters there



#### Customization

##### General

###### Colors

You can customize the buttons, headers and indicators colors depending on their state.

```swift
/// Set track color
/// If you don't need a gradient, just set the same values for `startColor` and `endColor`
progressView.startColor = .systemPink 
progressView.endColor = .systemRed 

/// Set groove color
progressView.grooveColor = .systemRed 
```

###### Animation

```swift
progressView.duration = 2 // Duration of the ring's fill animation.
progressView.timingFunction = .easeOutExpo // Timing function of the ring's fill animation.

/// The following use of setProgress (_ value: Int, animated: Bool) 
/// will take into account the new parameters 
progressView.setProgress(0.8, animated: true)
```

Let's take a look at the `timingFunction` parameter, it is of type `ALTimingFunction`, which contains the following types of animations:

<img src="https://github.com/alxrguz/ALProgressView/blob/main/Assets/timingFunctions.png"/>

There is a good cheat sheet available [here](http://easings.net/).

##### AlProgressRing

```swift
progressBar.startAngle = -.pi / 2 // The start angle of the ring to begin drawing.
progressRing.endAngle = 1.5 * .pi // The end angle of the ring to end drawing. 
progressRing.startGradientPoint = .init(x: 0.5, y: 0) // The starting poin of the gradient
progressRing.endGradientPoint = .init(x: 0.5, y: 1) // The ending position of the gradient.

// Sets the line width for progress ring and "groove" ring
progressRing.lineWidth = 10
// Or, if you need to separate these parameters, use
progressRing.ringWidth = 10 
progressRing.grooveWidth = 8 
```



##### AlProgressBar

```swift
progressBar.barEdgeInset = 1.5 // Distance between groove and progress bar.
```



## License

**ALProgressView** is under MIT license. See the [LICENSE](https://github.com/alxrguz/ALProgressView/blob/main/LICENSE) file for more info.


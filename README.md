<p align="center">
<img src="./Design/Icon.png" width=200>

<p align="center"> <b> LCDropDownPicker is a custom animation type drop-down menu bar library written in SwiftUI.</b></p>


<p align="center">
  <a href="https://swiftpackageindex.com/DevLiuSir/LCDropDownPicker">
        <img src="https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/DevLiuSir/LCDropDownPicker/badge?type=swift-versions" alt="Swift Versions">
    </a>
    <a href="https://swiftpackageindex.com/DevLiuSir/LCDropDownPicker">
        <img src="https://img.shields.io/endpoint?url=https://swiftpackageindex.com/api/packages/DevLiuSir/LCDropDownPicker/badge?type=platforms" alt="Supported Platforms">
    </a>
    
<img src="https://badgen.net/badge/icon/apple?icon=apple&label">
<img src="https://img.shields.io/badge/language-swift-orange.svg">
<img src="https://img.shields.io/badge/xcode-15.3+-yellow.svg">
<img src="https://img.shields.io/badge/macOS-14.4-blue.svg">
<img src="https://img.shields.io/badge/build-passing-brightgreen">
<img src="https://img.shields.io/github/languages/top/DevLiuSir/LCDropDownPicker?color=blueviolet">
<img src="https://img.shields.io/github/license/DevLiuSir/LCDropDownPicker.svg">
<img src="https://img.shields.io/github/languages/code-size/DevLiuSir/LCDropDownPicker?color=ff69b4&label=codeSize">
<img src="https://img.shields.io/github/repo-size/DevLiuSir/LCDropDownPicker">
<img src="https://img.shields.io/github/last-commit/DevLiuSir/LCDropDownPicker">
<img src="https://img.shields.io/github/commit-activity/m/DevLiuSir/LCDropDownPicker">
<img src="https://img.shields.io/github/stars/DevLiuSir/LCDropDownPicker.svg?style=social&label=Star">
<img src="https://img.shields.io/github/forks/DevLiuSir/LCDropDownPicker?style=social">
<img src="https://img.shields.io/github/watchers/DevLiuSir/LCDropDownPicker?style=social">
<a href="https://twitter.com/LiuChuan_"><img src="https://img.shields.io/twitter/follow/LiuChuan_.svg?style=social"></a>
</p>



### Design

| **Preview 1** | **Preview 2** |
|:---|:--- |
| <img align="center" src="Design/preview-1.png" width=300> |<img align="center" src="Design/preview-2.png" width=300> |


## How to use

```swift
     LCDropDownPicker(
                    selectedItem: $selectedOption,
                    placeholder: "Select an option",
                    position: .top,
                    menuItems: items,
                    lightModeBackgroundColor: .white,
                    darkModeBackgroundColor: .black,
                    lightModeTextColor: .black,
                    darkModeTextColor: .white,
                    isBorder: false,
                    borderColor: .gray,
                    expandedHeight: 300,
                    cornerRadius: 15
                )
                .padding()
                .onChange(of: selectedOption) { (oldValue, newValue) in
                    print("Selected: \(newValue), previous old value: \(oldValue)")
                }
                
```

## SwiftPackage

Add `https://github.com/DevLiuSir/LCDropDownPicker ` in the [“Swift Package Manager” tab in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).


## License

MIT License

Copyright (c) 2024 Marvin


## Author

| [<img src="https://avatars2.githubusercontent.com/u/11488337?s=460&v=4" width="120px;"/>](https://github.com/DevLiuSir)  |  [DevLiuSir](https://github.com/DevLiuSir)<br/><br/><sub>Software Engineer</sub><br/> [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/twitter.svg" height="20" width="20"/>][1] [<img align="center" src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/github.svg" height="20" width="20"/>][2] [<img align="center" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" height="20" width="20"/>][3]|
| :------------: | :------------: |

[1]: https://twitter.com/LiuChuan_
[2]: https://github.com/DevLiuSir
[3]: https://devliusir.com/




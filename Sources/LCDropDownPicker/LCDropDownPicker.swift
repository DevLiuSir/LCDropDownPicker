//
//  LCDropDownPicker.swift
//
//  Created by DevLiuSir
//


import SwiftUI

/// 枚举：定义`下拉框`显示在按钮的`上方`还是`下方`
public enum DropDownPickerPosition {
    case top
    case bottom
}


/// 自定义下拉选择器组件，支持上方或下方显示列表。
public struct LCDropDownPicker: View {
    
    // MARK: - Public Properties
    
    /// 当前选中的项目
    @Binding public var selectedItem: String
    
    /// 占位符文本
    public var placeholder: String = ""
    /// 菜单显示位置, 默认在按钮的下方
    public var position: DropDownPickerPosition = .bottom
    /// 菜单项数组
    public var menuItems: [String]
    /// 图标名称数组，可选
    public var iconNames: [String]?
    
    public var menuBackgroundColor: Color = .white      // 菜单背景颜色
    public var listBackgroundColor: Color = Color.white // 列表背景颜色
    public var expandedHeight: CGFloat = 200            // 菜单展开高度
    public var cornerRadius: CGFloat = 15               // 菜单圆角半径
    public var pickerHeaderHeight: CGFloat = 50         // 选择器头部高度
    public var rowHeight: CGFloat = 40                  // 菜单项高度
    
    
    // 在 浅色 和 深色模式下分别指定的颜色
    public var lightModeBackgroundColor: Color = .white
    public var darkModeBackgroundColor: Color = .black
    public var lightModeTextColor: Color = .black
    public var darkModeTextColor: Color = .white
    public var isBorder = false                 // 是否需要边框
    public var borderColor: Color = .gray       // 边框颜色
    
    
    // MARK: - Private Properties
    @SceneStorage("drop_down_zindex") private var sceneZIndex = 1000.0  // 场景存储中的 Z 索引
    @Environment(\.colorScheme) private var colorScheme
    @State private var isDropdownVisible = false                        // 菜单是否可见
    @State private var currentZIndex = 1000.0                           // 当前视图 Z 索引
    
    // MARK: - Initializer
    public init(
        selectedItem: Binding<String>,
        placeholder: String,
        position: DropDownPickerPosition = .bottom,
        menuItems: [String],
        iconNames: [String]? = nil,
        lightModeBackgroundColor: Color = .white,
        darkModeBackgroundColor: Color = .black,
        lightModeTextColor: Color = .black,
        darkModeTextColor: Color = .white,
        isBorder: Bool = false,
        borderColor: Color = .gray,
        expandedHeight: CGFloat = 200,
        listBackgroundColor: Color = .clear,
        cornerRadius: CGFloat = 15
    ) {
        self._selectedItem = selectedItem
        self.placeholder = placeholder
        self.position = position
        self.menuItems = menuItems
        self.iconNames = iconNames
        self.lightModeBackgroundColor = lightModeBackgroundColor
        self.darkModeBackgroundColor = darkModeBackgroundColor
        self.isBorder = isBorder
        self.borderColor = borderColor
        self.lightModeTextColor = lightModeTextColor
        self.darkModeTextColor = darkModeTextColor
        self.expandedHeight = expandedHeight
        self.listBackgroundColor = listBackgroundColor
        self.cornerRadius = cornerRadius
    }
    
    // MARK: - Body
    public var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                if position == .top && isDropdownVisible {
                    DropdownMenuListView()
                    Divider()
                }
                
                PickerHeaderView()
                
                if position == .bottom && isDropdownVisible {
                    Divider()
                    DropdownMenuListView()
                }
            }
            .clipped()
            .background(colorScheme == .dark ? darkModeBackgroundColor : lightModeBackgroundColor)
            // 圆角
            .cornerRadius(cornerRadius)
            // 边框
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(isBorder ? borderColor : .clear)
            )
            
            .frame(height: expandedHeight, alignment: position == .top ? .bottom : .top)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: pickerHeaderHeight)
        .zIndex(currentZIndex)
    }
}




// MARK: - Private View Components
private extension LCDropDownPicker {
    
    /// 选择器头部视图
    @ViewBuilder
    func PickerHeaderView() -> some View {
        HStack {
            Text(selectedItem.isEmpty ? placeholder : selectedItem)
                .foregroundColor(selectedItem.isEmpty ? .gray : colorScheme == .dark ? darkModeTextColor : lightModeTextColor)
            
            Spacer()
            
            Image(systemName: position == .top ? "chevron.up" : "chevron.down")
                .font(.title3)
                .foregroundColor(.gray)
                .rotationEffect(.degrees(isDropdownVisible ? -180 : 0))
        }
        .frame(width: .infinity, height: pickerHeaderHeight)
        .padding(.horizontal, 15)
        .background(colorScheme == .dark ? darkModeBackgroundColor : lightModeBackgroundColor)
        .contentShape(.rect)
        .onTapGesture {
            sceneZIndex += 1
            currentZIndex = sceneZIndex
            withAnimation(.easeInOut) {
                isDropdownVisible.toggle()
            }
        }
        .zIndex(10)
    }
    
    /// 菜单项列表视图
    @ViewBuilder
    func DropdownMenuListView() -> some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(menuItems.indices, id: \.self) { index in
                    let option = menuItems[index]
                    let iconName = iconNames?[index] ?? ""  // 使用空字符串作为默认图标名
                    optionRow(option, iconName: iconName)
                }
            }
            .background(listBackgroundColor)
            .transition(.move(edge: position == .top ? .bottom : .top))
            .zIndex(1)
        }
    }
    
    /// 单个菜单项视图
    @ViewBuilder
    func optionRow(_ option: String, iconName: String) -> some View {
        HStack {
            if !iconName.isEmpty {
                Image(systemName: iconName)
                    .font(.body)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .frame(width: 28)
            }
            
            Text(option)
            Spacer()
            Image(systemName: "checkmark")
                .opacity(selectedItem == option ? 1 : 0)
                .foregroundColor(colorScheme == .dark ? darkModeTextColor : lightModeTextColor)
        }
        .foregroundColor(selectedItem == option ? (colorScheme == .dark ? darkModeTextColor : lightModeTextColor) : .gray)
        .animation(.none, value: selectedItem)
        .frame(height: rowHeight)
        .contentShape(.rect)
        .padding(.horizontal, 15)
        .background(listBackgroundColor)
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedItem = option
                isDropdownVisible.toggle()
            }
        }
    }
    
    
}


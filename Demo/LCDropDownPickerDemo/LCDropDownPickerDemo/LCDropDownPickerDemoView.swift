//
//  LCDropDownPickerDemoView.swift
//
//  LCDropDownPickerDemo
//
//  Created by DevLiuSir
//


import SwiftUI
import LCDropDownPicker


struct LCDropDownPickerDemoView: View {
    
    @State private var selectedOption1 = ""
    private let items1 = ["Apple", "Banana", "Orange", "Grape", "Mango"]
    
    @State private var selectedOption2 = ""
    private let items2 = ["首页", "消息", "设置", "关于", "退出"]
    private let iconNames2 = ["house", "message", "gear", "info.circle", "arrow.right.square"]
    
    @State private var selectedOption3 = ""
    private let items3 = ["Swift", "Objective-C", "Rust", "Python"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                
                Text("Demo 1：leadingContent 使用私有子视图（向下展开）")
                    .font(.headline)
                
                LCDropDownPicker(
                    selectedItem: $selectedOption1,
                    placeholder: "请选择水果",
                    position: .bottom,
                    menuItems: items1,
                    lightModeBackgroundColor: .white,
                    darkModeBackgroundColor: .black,
                    lightModeTextColor: .black,
                    darkModeTextColor: .white,
                    isBorder: true,
                    borderColor: .gray,
                    expandedHeight: 220,
                    cornerRadius: 12,
                    leadingContent: { text in
                        AnyView(FruitLeadingView(name: text))
                    }
                )
                .padding(.horizontal, 20)
                .onChange(of: selectedOption1) { oldValue, newValue in
                    print("[Demo1] old: \(oldValue), new: \(newValue)")
                }
                
                Text("Demo 2：带 iconNames + leadingContent，向上弹出 .top")
                    .font(.headline)
                
                LCDropDownPicker(
                    selectedItem: $selectedOption2,
                    placeholder: "Select an option",
                    position: .bottom,
                    menuItems: items2,
                    iconNames: iconNames2,
                    lightModeBackgroundColor: .white,
                    darkModeBackgroundColor: .black,
                    lightModeTextColor: .black,
                    darkModeTextColor: .white,
                    isBorder: false,
                    borderColor: .gray,
                    expandedHeight: 300,
                    cornerRadius: 15
                )
                .padding(.horizontal, 20)
                .onChange(of: selectedOption2) { oldValue, newValue in
                    print("[Demo2] old: \(oldValue), new: \(newValue)")
                }
                
                Text("Demo 3：仅 leadingContent，自定义彩色圆点")
                    .font(.headline)
                
                LCDropDownPicker(
                    selectedItem: $selectedOption3,
                    placeholder: "选择编程语言",
                    position: .bottom,
                    menuItems: items3,
                    lightModeBackgroundColor: Color(red: 0.96, green: 0.96, blue: 0.96),
                    darkModeBackgroundColor: Color(red: 0.12, green: 0.12, blue: 0.12),
                    lightModeTextColor: .black,
                    darkModeTextColor: .white,
                    isBorder: true,
                    borderColor: .blue,
                    expandedHeight: 180,
                    cornerRadius: 8,
                    leadingContent: { text in
                        AnyView(LangDotView(name: text))
                    }
                )
                .padding(.horizontal, 20)
                .onChange(of: selectedOption3) { oldValue, newValue in
                    print("[Demo3] old: \(oldValue), new: \(newValue)")
                }
                
                Spacer()
            }
            .padding(.vertical, 30)
        }
        .frame(height: 1000)
        .navigationTitle("LCDropDownPicker Demo - leadingContent")
    }
}

// MARK: - 私有子视图（给 leadingContent 使用）
private extension LCDropDownPickerDemoView {
    
    /// 水果前缀视图
    struct FruitLeadingView: View {
        let name: String
        var body: some View {
            Image(systemName: "applelogo")
                .foregroundColor(.orange)
                .frame(width: 24)
        }
    }
    
    /// 菜单标签前缀视图
    struct MenuTagView: View {
        let title: String
        var body: some View {
            Text(title.prefix(1))
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
                .background(Color.accentColor)
                .clipShape(Circle())
        }
    }
    
    /// 语言圆点标记视图
    struct LangDotView: View {
        let name: String
        var body: some View {
            Circle()
                .fill(langColor)
                .frame(width: 10, height: 10)
        }
        
        var langColor: Color {
            switch name {
            case "Swift": return .orange
            case "Objective-C": return .blue
            case "Rust": return .red
            case "Python": return .green
            default: return .gray
            }
        }
    }
}




// 预览
struct LCDropDownPickerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        LCDropDownPickerDemoView()
    }
}


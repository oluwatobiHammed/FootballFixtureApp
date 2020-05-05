//
//  ColorSet.swift
//  Football Fixture
//
//  Created by Oladipupo Oluwatobi Hammed on 03/05/2020.
//  Copyright © 2020 Oladipupo Oluwatobi. All rights reserved.
//

import Foundation
import UIKit

let SelectedThemeKey = "SelectedTheme"

enum ColorSet: UInt32 {
    case Background = 0x000000
    case Main = 0xE3BC6A
    case Accent = 0xFFFFFF
    case TextColor = 0xfdfdfd
    
    
    case BorderColor = 0x979797
    case Danger = 0xEB5757
    case Success = 0x27AE60
    case Green = 0xA2DB38
    case Gain = 0x1DB942
    case Loss = 0xF33231
    case Leaf = 0x87C700
    case IconColor = 0xCFA854
    
    case buttonStyleOneBg = 0x1C1E2E
    
    var inverse: ColorSet {
        switch self {
        case .Background:
            return .Accent
        case .TextColor:
            return .Background
        default:
            return .Background
        }
    }
    
    var asColor: UIColor {
        return UIColor.fromColorSet(colorSet: ColorSet(rawValue: self.rawValue)!)
    }
}

enum Theme: Int {
    case Default
    
    var mainColorDark: UIColor {
        switch self {
        case .Default:
            return ColorSet.IconColor.asColor
        }
    }
    
    var mainColor: UIColor {
        switch self {
        case .Default:
            return ColorSet.Main.asColor
        }
    }
    
    var accentColor: UIColor {
        switch self {
        case .Default:
            return ColorSet.Accent.asColor
        }
    }
    
    var highlighColor: UIColor {
        switch self {
        case .Default:
            return ColorSet.Accent.asColor.withAlphaComponent(0.4)
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .Default:
            //UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
            return ColorSet.Background.asColor
        }
    }
    
    var backgroundColorInverse: UIColor {
        switch self {
        case .Default:
            return ColorSet.Background.inverse.asColor
        }
    }
    
    var textColorInverse: UIColor {
        switch self {
        case .Default:
            return ColorSet.TextColor.inverse.asColor
        }
    }
    
    var textColorAccent: UIColor {
        return UIColor.lightGray.withAlphaComponent(0.6)
    }
    
    var textColorWhiteAccent: UIColor {
        return UIColor.white.withAlphaComponent(0.6)
      }
    
    var textColorGreeen: UIColor {
        return UIColor.systemGreen.withAlphaComponent(0.6)
     }
    
    var accentColorInverse: UIColor {
        switch self {
        case .Default:
            return ColorSet.Accent.inverse.asColor
        }
    }
    
    var iconColor: UIColor {
        switch self {
        case .Default:
            return ColorSet.IconColor.inverse.asColor
        }
    }
    
    var borderColor: UIColor {
        switch self {
        case .Default:
            let color = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 0.23)
            return color
        }
    }
    
    var dangerColor: UIColor? {
        switch self {
        case .Default:
            return ColorSet.Danger.asColor
        }
    }
    
    var textColor: UIColor? {
        switch self {
        case .Default:
            return ColorSet.TextColor.asColor
        }
    }
    
    //Customizing the Navigation Bar
    var barStyle: UIBarStyle {
        switch self {
        case .Default:
            return .default
        }
    }
    
    var tableSelectColor: UIColor {
        return self.mainColor.withAlphaComponent(0.1)
    }
    
    
    var navigationBackgroundImage: UIImage? {
        return self == .Default ? UIImage(named: "navBackground") : nil
    }
    
    func color(from: String)-> UIColor? {
        switch from {
        case "accent":
            return self.accentColor
        case "main":
            return self.mainColor
        case "background":
            return self.backgroundColor
        case "border":
            return self.borderColor
        case "danger":
            return self.dangerColor
        case "textColor":
            return self.textColor
        default:
            return nil
        }
    }
}

struct ThemeManager {
    
    //static let ksFormThemer = KSFormTheming()
    
    static func currentTheme() -> Theme {
        if let storedTheme = (UserDefaults.standard.value(forKey: SelectedThemeKey) as AnyObject).integerValue {
            return Theme(rawValue: storedTheme)!
        } else {
            return .Default
        }
    }
    
    static func applyTheme(theme: Theme) {
        
//        UILabel.appearance().font = FontStyle.Default.getFont()
        // First persist the selected theme using NSUserDefaults.
        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        
        // You get your current (selected) theme and apply the main color to the tintColor property of your application’s window.
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.mainColor
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barStyle = theme.barStyle
        navBarAppearance.setBackgroundImage(theme.navigationBackgroundImage, for: .default)
        
        let tableViewAppearance = UITableView.appearance()
        tableViewAppearance.separatorColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08)
        
        //self.configureKSForm()
    }
    
//    static func configureKSForm() {
//        KSFormGlobal.shared.fieldFormatCallback = {field in
//            ksFormThemer.formatField(field: field)
//        }
//
//        KSFormGlobal.shared.fieldSetupCallback = {field in
//            ksFormThemer.setupField(field: field)
//        }
//    }
    
    static func defaultFont(sizeBy: CGFloat = 0)-> UIFont {
        return FontStyle.Default.getFont(sizeBy: sizeBy)
    }
    
    static func withFont(using: FontStyle, sizeBy: CGFloat = 0)-> UIFont {
        return using.getFont(sizeBy: sizeBy)
    }
    
    static func captionFont(sizeBy: CGFloat = 4)-> UIFont {
        return FontStyle.Bold.getFont(sizeBy: sizeBy)
    }
}

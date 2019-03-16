//
//  ThemeManager.swift
//  splash
//
//  Created by Gonzo Fialho on 12/03/19.
//  Copyright © 2019 Gonzo Fialho. All rights reserved.
//

import UIKit

class ThemeManager {

    static let shared = ThemeManager()

    var theme: Theme = UserDefaults.standard.lastUsedTheme {
        didSet {
            guard theme != oldValue else {return}
            UserDefaults.standard.lastUsedTheme = theme
            NotificationCenter.default.post(name: .themeChanged, object: theme)
        }
    }
}

extension ThemeManager {
    enum Theme: String, CaseIterable {
        case light
        case dark

        var humanName: String {
            return rawValue.capitalizingFirstLetter()
        }

        var textColor: UIColor {
            switch self {
            case .light: return .black
            case .dark: return .white
            }
        }

        var backgroundColor: UIColor {
            switch self {
            case .light: return .white
            case .dark: return UIColor(hex: 0x1F1F24)
            }
        }

        var statusBarStyle: UIStatusBarStyle {
            switch self {
            case .light: return .default
            case .dark: return .lightContent
            }
        }

        var blurEffect: UIBlurEffect {
            switch self {
            case .light: return UIBlurEffect(style: .extraLight)
            case .dark: return UIBlurEffect(style: .dark)
            }
        }

        var pageControlCurrentPageTintColor: UIColor {
            switch self {
            case .light: return .black
            case .dark: return .white
            }
        }

        var pageControlTintColor: UIColor {
            switch self {
            case .light: return .lightGray
            case .dark: return .darkGray//UIColor(hex: 0xcccccc)
            }
        }

        var keyboardAppearance: UIKeyboardAppearance {
            switch self {
            case .light: return .light
            case .dark: return .dark
            }
        }

        var navigationBarStyle: UIBarStyle {
            switch self {
            case .light: return .default
            case .dark: return .black
            }
        }

        var other: ThemeManager.Theme {
            switch self {
            case .light: return .dark
            case .dark: return .light
            }
        }
    }
}

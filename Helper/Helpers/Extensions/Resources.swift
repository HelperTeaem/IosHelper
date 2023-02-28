//
//  Resources.swift
//  Helper
//
//  Created by Владислав Куликов on 25.02.2023.
//

import UIKit

enum Resources {
    
    enum Colors {
        static var active = UIColor(hexString: "#ffffff")
        static var inactive = UIColor(hexString: "#2A8086")
        static var mainGreen = UIColor(hexString: "#2A8086")
        static var tabBarTintColor = UIColor(hexString: "#ffffff")
        static var black = UIColor(hexString: "#000000")
        static var titleColor = UIColor(hexString: "#ffffff")
        static var mainBackgroundColor = UIColor(hexString: "#E6ECED")
        static var textColor = UIColor(hexString: "#113739")
        static var tintElementsColor = UIColor(hexString: "#9D888699")
        static var buttonColor = UIColor(hexString: "#F4F4F4")
        static var white = UIColor(hexString: "#ffffff")
        static var red = UIColor(hexString: "#ff0000")
    }
    
    enum Strings {
        enum TabBar {
            static var main = "Main"
            static var articles = "Articles"
            static var personal = "Personal"
        }
    }
    
    enum Images {
        enum TabBar {
            static var main = UIImage(named: "main")
            static var articles = UIImage(named: "articles")
            static var personal = UIImage(named: "personal")
        }
    }
    
    enum Fonts {
        static func titleFont(with size: CGFloat) -> UIFont {
            UIFont(name: "Alegreya-Regular", size: size)  ?? UIFont()
        }
        static func mainFont(with size: CGFloat) -> UIFont {
            UIFont(name: "Roboto-Regular", size: size) ?? UIFont()
        }
    }
    
}


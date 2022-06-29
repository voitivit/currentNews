//
//  AppLayout.swift
//  currentNews
//
//  Created by Margarita Novokhatskaia on 29/06/2022.
//

import UIKit

enum AppLayout {
    
    enum Fonts {
        static let bigBold = UIFont(name: "MuktaMahee Bold", size: 32)
        static let regularBold = UIFont(name: "MuktaMahee Bold", size: 16)
        static let smallBold = UIFont(name: "MuktaMahee Bold", size: 14)
        
        static let regular = UIFont(name: "MuktaMahee Light", size: 14)
    }
    
    enum Colors {
        static let mainPink = UIColor(red: 1.00, green: 0.42, blue: 0.39, alpha: 1.00)
        static let lightPink = UIColor(red: 1.00, green: 0.50, blue: 0.48, alpha: 1.00)
        static let lightGray = UIColor(red: 0.92, green: 0.93, blue: 0.95, alpha: 1.00)
        static let gray = UIColor.lightGray
    }
    
    enum Images {
        static let bigLogo = "logo-big"
    }
}

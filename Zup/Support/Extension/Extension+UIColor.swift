//
//  UIColor+Extension.swift
//  Zup
//
//  Created by Victor de Paula on 04/11/17.
//  Copyright © 2017 Victor de Paula. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    func getPurpleGuidecolor() -> UIColor {
        return  UIColor(red: 112/255.0, green: 13/255.0, blue: 48/255.0, alpha: 1.0)
    }
    
    func getColorBlueDefaultGuide() -> UIColor {
        return UIColor(hexString: "164374") ?? .white
    }
    
    func getColorGoldGuide() -> UIColor {
        return UIColor(red:0.77, green:0.72, blue:0.57, alpha:1.0)
    }
    
    func getColorYellowApp() -> UIColor {
        return UIColor(hexString :"FEBC10") ?? .white
    }
    
    func getColorIconBackDefault() -> UIColor {
        return UIColor(hexString: "174073") ?? .white
    }
    
    func getColorIconWhiteDefault() -> UIColor {
        return UIColor(hexString: "F6F6F6") ?? .white
    }
    
    func getColorAddButtonActive() -> UIColor {
        return UIColor(hexString: "6F0D30") ?? .white
    }
    
    func getColorGrayDefault() -> UIColor {
        return UIColor(hexString: "666666") ?? .white
    }
    
    func getColorLightGrayDefault() -> UIColor {
        return UIColor(hexString: "B3B3B3") ?? .white
    }
    
    func getChartBackgroundStartColor() -> UIColor {
        return UIColor(hexString: "0F2D4F") ?? .white
    }
    
    func getChartBackgroundMiddleColor() -> UIColor {
        return UIColor(red:0.26, green:0.71, blue:0.96, alpha:1.0)
    }
    
    func getChartBackgroundEndColor() -> UIColor {
        return UIColor(hexString: "5C9DC7") ?? .white
    }
    
    func getColorChartGridColor() -> UIColor {
        return UIColor(hex: 0xd3d3d3, alpha: 0.8) ?? .white
    }
    
    func getPieChartBlueColor() -> UIColor {
        return UIColor(red: 20/255, green: 96/255, blue: 122/255, alpha: 1.0)
    }
    
    func getPieChartOrangeColor() -> UIColor {
        return UIColor(red: 239/255, green: 140/255, blue: 32/255, alpha: 1.0)
    }
    
    func getPieChartGoldColor() -> UIColor {
        return UIColor(red: 239/255, green: 219/255, blue: 175/255, alpha: 1.0)
    }
    
    func getOrderSellColor() -> UIColor {
        return UIColor(red:0.36, green:0.69, blue:0.00, alpha:1.0)
    }
    
    func getOrderBuyColor() -> UIColor {
        return UIColor(red:1.00, green:0.74, blue:0.07, alpha:1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 0.8)
    }
    
    convenience init(netHex: Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

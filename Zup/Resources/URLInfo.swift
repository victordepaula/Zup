//
//  URLInfo.swift
//  WebFeeder
//
//  Created by cedro_nds on 16/05/17.
//  Copyright © 2017 cedro_nds. All rights reserved.
//

import UIKit

public class URLInfo: NSObject {
    
    static func url(fromKey key: String) -> String {
        guard
            let path = Bundle.main.path(forResource: "URLs", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String : String]
        else {
            return "" 
        }
        
        if let url = dict[key] {
            return (url)
        } else {
            return ""
        }
        
    }
    
}

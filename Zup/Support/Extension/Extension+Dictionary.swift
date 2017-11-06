//
//  Extension+Dictionary.swift
//  Guide
//
//  Created by cedro_nds on 29/09/17.
//  Copyright © 2017 cedro_nds. All rights reserved.
//

import Foundation

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
   
}

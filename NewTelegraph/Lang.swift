//
//  Language.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import Foundation


class Lang : NSObject {
    
    
    internal static func get(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    
}
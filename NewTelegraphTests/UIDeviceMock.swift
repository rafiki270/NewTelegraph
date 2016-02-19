//
//  UIDeviceMock.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 18/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit

class UIDeviceMock: UIDevice {
    
    private var fakeUserInterfaceIdiom: UIUserInterfaceIdiom = .Pad
    
    override internal var userInterfaceIdiom: UIUserInterfaceIdiom {
        get {
            return fakeUserInterfaceIdiom
        }
        set (uii) {
            fakeUserInterfaceIdiom = uii
        }
    }
    

}

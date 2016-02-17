//
//  BasicCollectionViewLayout.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 16/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class BasicCollectionViewFlowLayout : UICollectionViewFlowLayout {
    
    
    // MARK: Initialization
    
    override init() {
        super.init()
        
        self.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
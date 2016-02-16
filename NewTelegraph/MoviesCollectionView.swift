//
//  MoviesCollectionView.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 16/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class MoviesCollectionView : UICollectionView {
    
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
    }
    
    // MARK: Creating elements
    
    func addSubviews() {
        
    }
    
    // MARK: Initialization
    
    convenience init() {
        self.init(frame:CGRect.zero)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.addSubviews()
        self.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
}



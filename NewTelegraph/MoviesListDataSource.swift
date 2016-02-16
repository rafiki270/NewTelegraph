//
//  MoviesListDataSource.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class MoviesListDataSource : NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    static let movieCellIdentifier: String = "MovieCollectionViewCellIdentifier"
    
    
    internal func loadData() {
        
    }
    
    // MARK: Collection view datasource methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(MoviesListDataSource.movieCellIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.orangeColor()
        return cell
    }
    
    
}
//
//  MoviesListDataSource.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit
import Alamofire


class MoviesListDataSource : NSObject, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    static let movieCellIdentifier: String = "MovieCollectionViewCellIdentifier"
    
    private var data: TelegraphData? = nil
    
    
    // MARK: Data handling
    
    
    internal func loadData(completion: ((error: NSError?) -> Void)!) {
        // TODO: Move following to a separate "networking" file
        Alamofire.request(.GET, Config.apiUrl)
            .responseJSON { response in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    
                    self.data = TelegraphData.init(object: JSON)
                    completion(error: nil)
                }
                else {
                    // TODO: Improve error reporting
                    // TODO: Report server errors to the server admin (with request details)
                    let err: NSError = NSError.init(domain: "com.orafaj.newtelegraph", code: 666, userInfo: [NSLocalizedDescriptionKey: "Evil loading error"])
                    completion(error: err)
                }
        }
    }
    
    internal func collectionForIndexPath(indexPath: NSIndexPath) -> Collection {
        return (self.data?.collection?[indexPath.row])! as Collection;
    }
    
    // MARK: Collection view datasource methods
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: This could be better protected by checking teh variables are valid
        return (self.data?.collection?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(MoviesListDataSource.movieCellIdentifier, forIndexPath: indexPath) as! MovieCollectionViewCell
        
        let collection: Collection = self.collectionForIndexPath(indexPath)
        cell.collection = collection
        
        return cell
    }
    
    
}
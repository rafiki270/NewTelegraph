//
//  ViewController.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit
import SnapKit


struct MyCollectionViewConstants {
    static let CELL_ANY_ANY_SIZE = 100;
    static let CELL_COMPACT_REGULAR_SIZE = 70;
}


class MoviesListViewController: BasicViewController, UICollectionViewDelegate {

    private var collectionView : UICollectionView!
    private var layout: BasicCollectionViewFlowLayout = BasicCollectionViewFlowLayout()
    
    let dataSource: MoviesListDataSource = MoviesListDataSource()
    

    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.collectionView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
    }
    
//    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        
//        if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Compact && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Regular) {
//                cellSize = MyCollectionViewConstants.CELL_COMPACT_REGULAR_SIZE
//        } else {
//            cellSize = MyCollectionViewConstants.CELL_ANY_ANY_SIZE
//        }
//        
//        self.collectionView.reloadItemsAtIndexPaths(
//            self.collectionView.indexPathsForVisibleItems())
//    }
    
    // MARK: Creating elements
    
    private func createCollectionView() {
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.registerClass(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MoviesListDataSource.movieCellIdentifier)
        collectionView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView)
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.createCollectionView()
    }
    
    // MARK: Collection view delegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }

    
}


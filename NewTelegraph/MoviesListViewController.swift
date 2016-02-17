//
//  ViewController.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit
import SnapKit
import SwiftSpinner


class MoviesListViewController: BasicViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    private var collectionView : MoviesCollectionView!
    private var layout: BasicCollectionViewFlowLayout = BasicCollectionViewFlowLayout()
    
    let dataSource: MoviesListDataSource = MoviesListDataSource()
    
    private var firstLoad: Bool = true
    

    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.collectionView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
    }
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // I was originally planning on adding layout for all platforms but have been unable to do so in the time given
        
        self.collectionView.reloadItemsAtIndexPaths(self.collectionView.indexPathsForVisibleItems())
    }
    
    // MARK: Configuration
    
    override func configure() {
        super.configure()
        
        self.title = Lang.get("FILM")
    }
    
    // MARK: Data management
    
    private func reloadData() {
        SwiftSpinner.show(Lang.get("Connecting to our spy satellite ..."))
        
        dataSource.loadData { (error: NSError?) -> Void in
            if error == nil {
                if self.collectionView.dataSource == nil {
                    self.collectionView.dataSource = self.dataSource
                }
                else {
                    self.collectionView.reloadData()
                }
            }
            else {
                // TODO: Add error handling on user level
            }
            
            SwiftSpinner.hide()
        }
    }
    
    // MARK: Creating elements
    
    private func createCollectionView() {
        collectionView = MoviesCollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.delegate = self
        self.view.addSubview(collectionView)
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.createCollectionView()
    }
    
    // MARK: View lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if (firstLoad) {
            self.reloadData()
            firstLoad = false
        }
    }
    
    // MARK: Collection view delegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        let detail: MovieDetailViewController = MovieDetailViewController()
        detail.collection = dataSource.collectionForIndexPath(indexPath)
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            let nc: UINavigationController = UINavigationController(rootViewController: detail)
            self.presentViewController(nc, animated: true, completion: nil)
        }
        else {
            self.navigationController?.pushViewController(detail, animated: true)
        }
    }
    
    // MARK: Collection view flow layout delegate methods
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var w: CGFloat = self.view.frame.size.width;
        if w < 40 {
            w = 40;
        }
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            if indexPath.row == 0 {
                return CGSizeMake(w, 420);
            }
            else {
                return CGSizeMake(((w / 2) - 1), 320);
            }
        }
        else {
            if indexPath.row == 0 {
                return CGSizeMake(w, 280);
            }
            else {
                return CGSizeMake(((w / 2) - 1), 170);
            }
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2
    }
    
}


//
//  MovieDetailViewController.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 15/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit


class MovieDetailViewController: BasicViewController {
    
    private var data: Collection?
    
    internal var collection: Collection? {
        get {
            return data
        }
        set (newCollection) {
            data = newCollection
            self.loadDataIntoInterface()
        }
    }
    
    
    private let imageView: UIImageView = UIImageView()
    
    
    // MARK: Data handling
    
    // TODO: This method should be refactored to not copy networking of the cell
    private func loadDataIntoInterface() {
        self.title = data?.headline?.uppercaseString
        
        let urlString: String? = data?.pictureUrl
        if urlString != nil {
            Alamofire.request(.GET, urlString!.stringByAddingPercentEncodingWithAllowedCharacters(.URLQueryAllowedCharacterSet())!)
                .response { request, response, data, error in
                    if error == nil {
                        let image: UIImage? = UIImage.init(data: data!)
                        if image != nil {
                            self.imageView.image = image!
                        }
                        else {
                            // TODO: Handle corrupted image
                        }
                    }
                    else {
                        // TODO: Use default image
                    }
            }
        }
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Image layout
        self.imageView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
    }
    
    // MARK: Actions
    
    internal func close(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Creating elements
    
    private func createImageView() {
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        
        self.view.addSubview(imageView)
    }
    
    private func createCloseButton() {
        let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "close:")
        self.navigationItem.rightBarButtonItem = button
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self .createImageView()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.createCloseButton()
        }
    }
    
    
}


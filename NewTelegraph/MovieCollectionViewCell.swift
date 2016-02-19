//
//  MovieCollectionViewCell.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 16/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit


class MovieCollectionViewCell : BasicCollectionViewCell {
    
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
    
    private var imageView: UIImageView = UIImageView()
    private var titleLabel: UILabel = UILabel()
    private var titleLabelBackground: UIView = UIView()
    
    // MARK: Loading data into cell interface
    
    private func setupAccesibility() {
        self.isAccessibilityElement = true
        
        self.accessibilityLabel = data?.headline
        self.accessibilityHint = Lang.get((data?.descriptionValue)! + ", doubletap to open")
        
        titleLabel.accessibilityElementsHidden = true
    }
    
    private func loadDataIntoInterface() {
        titleLabel.text = data?.headline?.uppercaseString
        
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
        
        self.setupAccesibility()
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        // Image layout
        self.imageView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
        }
        
        // Title layout
        self.titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.bottom.equalTo(self.snp_bottom)
            make.height.equalTo(50)
        }
        self.titleLabelBackground.snp_makeConstraints { (make) -> Void in
            make.top.bottom.equalTo(self.titleLabel)
            make.left.right.equalTo(self)
        }
    }
    
    // MARK: Creating elements
    
    private func createImageView() {
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        
        self.addSubview(imageView)
    }
    
    private func createTitleLabel() {
        titleLabelBackground.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        self.addSubview(titleLabelBackground)
        
        let fontSize: CGFloat = 18.0;
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: fontSize)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.textAlignment = .Left
        self.addSubview(titleLabel)
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.createImageView()
        self.createTitleLabel()
    }
    
    
}

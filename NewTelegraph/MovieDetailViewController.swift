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
    private let titleLabel: UILabel = UILabel()
    private let durationLabel: UILabel = UILabel()
    private let synopsisLabel: UILabel = UILabel()
    private let directorLabel: UILabel = UILabel()
    private let actorsLabel: UILabel = UILabel()
    private let genreLabel: UILabel = UILabel()
    private let ratingLabel: UILabel = UILabel()
    
    
    // MARK: Data handling
    
    // TODO: This method should be refactored to not copy networking of the cell
    private func loadDataIntoInterface() {
        self.title = data?.headline?.uppercaseString
        
        self.titleLabel.text = data?.headline
        self.durationLabel.text = data?.duration
        self.synopsisLabel.text = data?.synopsis
        self.directorLabel.text = data?.director
        self.actorsLabel.text = Lang.get("Starring: ") + (data?.actors?.joinWithSeparator(", "))!
        self.genreLabel.text = data?.genre?.joinWithSeparator(", ")
        
        var rating: String = ""
        var ratingValue: Int = (data?.ratings)!
        while ratingValue > 0 {
            rating += "*"
            ratingValue--
        }
        self.ratingLabel.text = rating
        
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
        
        self.setupAccessibility()
    }
    
    // MARK: Layout
    
    private func rectForLabel(label: UILabel) -> CGSize {
        let attrString = NSAttributedString.init(string: label.text!, attributes: [NSFontAttributeName:label.font])
        let rect = attrString.boundingRectWithSize(CGSizeMake(label.frame.size.width, 999), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil)
        let size = CGSizeMake(rect.size.width, rect.size.height)
        return size
    }
    
    private func privateLayoutSubviews() {
        super.layoutSubviews()
        
        // Image layout
        self.imageView.snp_makeConstraints { (make) -> Void in
            make.left.top.equalTo(20)
            
            if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
                make.height.equalTo(150)
                make.width.equalTo(270)
            }
            else {
                make.height.equalTo(90)
                make.width.equalTo(120)
            }
        }
        
        // Rating
        self.ratingLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.imageView.snp_bottom).offset(10)
            make.width.left.equalTo(self.imageView)
            make.height.equalTo(30)
        }
        
        // Title label
        self.titleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.imageView.snp_top)
            make.left.equalTo(self.imageView.snp_right).offset(20)
            make.right.equalTo(-20)
            make.height.equalTo(self.rectForLabel(self.titleLabel).height)
        }
        
        // Movie duration
        self.durationLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.titleLabel.snp_bottom).offset(4)
            make.left.right.equalTo(self.titleLabel)
            make.height.equalTo(14)
        }
        
        // Director
        self.directorLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.durationLabel.snp_bottom).offset(10)
            make.left.right.equalTo(self.titleLabel)
            make.height.equalTo(16)
        }
        
        // Actors
        self.actorsLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.ratingLabel.snp_bottom).offset(8)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(self.rectForLabel(self.actorsLabel).height)
        }
        
        // Synopsis
        self.synopsisLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.actorsLabel.snp_bottom).offset(10)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.height.equalTo(50)
        }
    }
    
    // MARK: Actions
    
    internal func close(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Creating elements
    
    private func setupAccessibility() {
        self.navigationItem.accessibilityLabel = "Film, the movies application by The Telegraph";
        
        self.durationLabel.accessibilityLabel = Lang.get("Duration:") + " " + (data?.duration)!
        self.directorLabel.accessibilityLabel = Lang.get("Directed by:") + " " + (data?.director)!
        self.ratingLabel.accessibilityLabel = Lang.get("Rating: ") + String((data?.ratings)!) + Lang.get(" stars out of 5")
    }
    
    private func createImageView() {
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        
        self.view.addSubview(imageView)
    }
    
    private func configureLabelForSize(label: UILabel, fontSize: CGFloat) -> UILabel {
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.blackColor()
        label.font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        self.view.addSubview(label)
        return label
    }
    
    private func createLabels() {
        self.configureLabelForSize(titleLabel, fontSize: 17)
        self.configureLabelForSize(durationLabel, fontSize: 12)
        self.configureLabelForSize(directorLabel, fontSize: 14)
        self.configureLabelForSize(actorsLabel, fontSize: 14)
        self.configureLabelForSize(genreLabel, fontSize: 14)
        self.configureLabelForSize(directorLabel, fontSize: 14)
        self.configureLabelForSize(synopsisLabel, fontSize: 14)
        
        self.configureLabelForSize(ratingLabel, fontSize: 40)
        ratingLabel.textAlignment = .Center
    }
    
    private func createCloseButton() {
        let button: UIBarButtonItem = UIBarButtonItem(title: Lang.get("Close"), style: .Done, target: self, action: "close:")
        self.navigationItem.rightBarButtonItem = button
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self .createImageView()
        self.createLabels()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.createCloseButton()
        }
    }
    
    // MARK: View lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.privateLayoutSubviews()
    }
    
    
}


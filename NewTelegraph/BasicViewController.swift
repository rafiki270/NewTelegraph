//
//  ViewController.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 16/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import UIKit


class BasicViewController : UIViewController {
    
    
    // MARK: Layout
    
    func layoutSubviews() {
        
    }
    
    // MARK: Configuration
    
    func configure() {
        self.view.backgroundColor = UIColor.redColor()
    }
    
    // MARK: Creating elements
    
    func addSubviews() {
        
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        self.addSubviews()
        self.layoutSubviews()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: Memory management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
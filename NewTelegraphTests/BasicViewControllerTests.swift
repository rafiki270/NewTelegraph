//
//  BasicViewControllerTests.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 18/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import XCTest


class BasicViewControllerTests: XCTestCase {
    
    var controller: BasicViewController?
    var navigationController: UINavigationController?

    override func setUp() {
        super.setUp()
        
        self.controller = BasicViewController()
        self.navigationController = UINavigationController(rootViewController: self.controller!)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCurrentDeviceExistsAndIsInitialized() {
        XCTAssert(controller?.respondsToSelector("currentDevice") == true, "currentDevice variable needs to be present")
        XCTAssertNotNil(controller?.currentDevice, "currentDevice can not be nil")
        XCTAssert(controller?.currentDevice.isKindOfClass(UIDevice) == true, "currentDevice needs to hold an instance of UIDevice")
    }

    func testBasicMethodsArePresent() {
        XCTAssertTrue(controller!.respondsToSelector("layoutSubviews"), "Controller needs to have layoutSubviews method")
        XCTAssertTrue(controller!.respondsToSelector("configure"), "Controller needs to have layoutSubviews method")
        XCTAssertTrue(controller!.respondsToSelector("addSubviews"), "Controller needs to have layoutSubviews method")
    }
    
    func testBasicMethodsAreCalledInTheRightOrder() {
        self.controller = BasicViewControllerSubclassMock()
        self.navigationController = UINavigationController(rootViewController: self.controller!)
        
        // Touch view
        controller?.view
        
        let arr: [String] = ["configure", "addSubviews", "layoutSubviews"]
        
        XCTAssertEqual((controller as! BasicViewControllerSubclassMock).feedbackArray, arr)
    }
    
    func testConfigurationWorks() {
        // Touch view
        controller?.view
        
        XCTAssertEqual(self.navigationController!.navigationBar.barTintColor, UIColor.blackColor(), "Navigation bar needs to be black")
        XCTAssertEqual(self.controller!.view.backgroundColor, UIColor.whiteColor(), "View background needs to be white")
    }
    
    func testStatusBarStyleIsCorrectForDevices() {
        let device: UIDeviceMock = UIDeviceMock()
        controller?.currentDevice = device
        
        device.userInterfaceIdiom = .Pad
        XCTAssertTrue(controller!.preferredStatusBarStyle() == .Default)
        
        device.userInterfaceIdiom = .Phone
        XCTAssertTrue(controller!.preferredStatusBarStyle() == .LightContent)
    }

}

//
//  MoviesListViewControllerTests.swift
//  NewTelegraph
//
//  Created by Ondrej Rafaj on 18/02/2016.
//  Copyright © 2016 Ridiculous Innovations. All rights reserved.
//

import XCTest


@testable import NewTelegraph


class MoviesListViewControllerTests: XCTestCase {
    
    var navigationController: UINavigationController?
    var controller: MoviesListViewController?
    
    
    override func setUp() {
        super.setUp()
        
        self.controller = MoviesListViewController()
        self.navigationController = UINavigationController(rootViewController: self.controller!)
    }
    
    override func tearDown() {
        self.controller = nil
        
        super.tearDown()
    }
    
    func testCollectionViewVariableExists() {
        XCTAssert(controller?.respondsToSelector("collectionView") == true, "MoviesListViewController needs to have a collection view")
    }
    
    func testControllerHasAnInitializedLayout() {
        XCTAssertNotNil(controller?.layout, "layout can not be nil")
        XCTAssert(controller?.layout.isKindOfClass(BasicCollectionViewFlowLayout) == true, "layout needs to be of class BasicCollectionViewFlowLayout")
    }
    
    func testControllerHasAnInitializedDataSource() {
        XCTAssertNotNil(controller?.dataSource, "dataSource can not be nil")
        XCTAssert(controller?.dataSource.isKindOfClass(MoviesListDataSource) == true, "dataSource needs to be of class MoviesListDataSource")
    }
    
    func testFirstLoadNeedsToBeTrueOnFirstLaunch() {
        XCTAssert(controller?.firstLoad == true, "firstLoad needs to be true when initialzed")
    }
    
    func testCollectionViewIsLayedOut() {
        XCTAssert(controller?.view.constraints.count == 4, "Controller needs to hold constraints for collection view") // It would be better
    }
    
    func testTitleIsSet() {
        // Touch the view to trigger viewDidLoad
        controller?.view
        
        XCTAssertEqual(controller?.title, "FILM", "Title should say FILM")
    }
    
    func testReloadDataIsCalledOnFirstLoad() {
        class MoviesListViewControllerMock : MoviesListViewController {
            
            var didCallReloadData: Int = 0
            
            override func reloadData() {
                didCallReloadData++
            }
            
        }
        
        let c: MoviesListViewControllerMock = MoviesListViewControllerMock()
        self.navigationController = UINavigationController(rootViewController: c)
        
        c.viewWillAppear(true)
        c.viewWillAppear(true)
        c.viewWillAppear(true)
        
        XCTAssert(c.didCallReloadData == 1, "viewWillAppear needs to trigger reloadData method once")
    }

}

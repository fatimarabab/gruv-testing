//
//  GruvUIDashboardTests.swift
//  GruvUITests
//
//  Created by Rabab Fatima on 12/1/18.
//  Copyright © 2018 Group 8. All rights reserved.
//
import XCTest

//var app:XCUIApplication!
class GruvUIDashboardTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        let emailTextField = app.textFields["email"]
        emailTextField.tap()
        
        let element = app.toolbars["Toolbar"].children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.swipeUp()
        emailTextField.tap()
        emailTextField.typeText("fr.rabab@gmail.com")
        
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element2.tap()
        let passwordTextField = app.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("testing")
        element2.tap()
        app.buttons["LOGIN"].tap()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDashboardIsDisplayed() {
        //given
        let todayLabel = app.navigationBars["Today"].otherElements["Today"]
        let scoreLabel = app.collectionViews.staticTexts["OVERALL SCORE"]
        //then
        XCTAssertTrue(todayLabel.exists)
        XCTAssertTrue(scoreLabel.exists)
    }
    
    
    func testDashboardShowsSettings() {
        //given
        let statisticsButton = app.tabBars.buttons["Statistics"]
        let settingsButton = app.navigationBars["Statistics"].buttons["Settings"]
        let settingsView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        
        //then
        XCTAssertTrue(statisticsButton.exists)
        statisticsButton.tap()
        XCTAssertTrue(settingsButton.exists)
        settingsButton.tap()
        XCTAssertTrue(settingsView.exists)
        
    }
    
    func testDashboardGoesToAddHabitScreen() {
        //given
        let addButton = app.navigationBars["Today"].buttons["Add"]
        let AddHabitLabel = app.navigationBars["Add Habit"].staticTexts["Add Habit"]
        //then
        XCTAssertTrue(addButton.exists)
        addButton.tap()
        XCTAssertTrue(AddHabitLabel.exists)
        
    }
    
    
    func testSignOutSucceeds() {
        //given
        let statisticsButton = app.tabBars.buttons["Statistics"]
        let settingsButton = app.navigationBars["Statistics"].buttons["Settings"]
        let signoutButton = app.buttons["SIGN OUT"]
        let loginButton = app.buttons["LOGIN"]
        //then
        statisticsButton.tap()
        settingsButton.tap()
        XCTAssertTrue(signoutButton.exists)
        signoutButton.tap()
        XCTAssertTrue(loginButton.exists)
    }
}

//
//  GruvUIAddHabitTests.swift
//  GruvUITests
//
//  Created by Rabab Fatima on 12/1/18.
//  Copyright © 2018 Group 8. All rights reserved.
//



import XCTest

class GruvUIAddHabitTests: XCTestCase {
    
    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        
        app = XCUIApplication()
        
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        let emailTextField = app.textFields["email"]
        if emailTextField.exists{
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
            let addButton = app.navigationBars["Today"].buttons["Add"]
            let AddHabitLabel = app.navigationBars["Add Habit"].staticTexts["Add Habit"]
            //then
            addButton.tap()
        }
    }
    
    
    
    override func tearDown() {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
//        let emailTextField = app.textFields["email"]
//        let passwordTextField = app.secureTextFields["password"]
//        let loginBtn = app.buttons["LOGIN"]
//        let addHabitButton = app.buttons["ADD HABIT"]
//        
//        if loginBtn.exists {
//            emailTextField.typeText("fr.rabab@gmail.com")
//            passwordTextField.typeText("testing")
//            loginBtn.tap()
//        }
//        if addHabitButton.exists {
//            addHabitButton.tap()
//        }
        
    }
    
    
    func testLabels() {
        
        //given
        app.navigationBars["Today"].buttons["Add"].tap()
        let addHabitLabel = app.navigationBars["Add Habit"].staticTexts["Add Habit"]
        
        let categoriesLabel = app.staticTexts["Categories"]
        
        //then
        
        addHabitLabel.tap()
        
        categoriesLabel.tap()
        
        XCTAssertTrue(addHabitLabel.exists) 
        
        XCTAssertTrue(categoriesLabel.exists)
      
    }
    
    
    
    
    
    func testCareerCell() {
        
        //given
        app.navigationBars["Today"].buttons["Add"].tap()
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        let collectionViewsQuery = app.collectionViews
        
        collectionView.swipeLeft()
        
        collectionView.swipeRight()
        
        let careerStaticText = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["CAREER"]/*[[".cells.staticTexts[\"CAREER\"]",".staticTexts[\"CAREER\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        XCTAssertTrue(careerStaticText.exists)
        
    }
    
    
    
    
    
    func testFitnessCell() {
        
        //given
        
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        let collectionViewsQuery = app.collectionViews
        
        collectionView.swipeLeft()
        
        let fitnessCell = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["FITNESS"]/*[[".cells.staticTexts[\"FITNESS\"]",".staticTexts[\"FITNESS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //then
        
        XCTAssertTrue(fitnessCell.exists)
        
    }
    
    
    
    
    
    func testHabitsToBreakCell() {
        
        //given
        
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        let collectionViewsQuery = app.collectionViews
        
        collectionView.swipeLeft()
        
        let habitsToBreakCell = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["HABITS TO BREAK"]/*[[".cells.staticTexts[\"HABITS TO BREAK\"]",".staticTexts[\"HABITS TO BREAK\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //then
        
        XCTAssertTrue(habitsToBreakCell.exists)
        
    }
    
    
    
    func testLearnCell() {
        
        //given
        
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        let collectionViewsQuery = app.collectionViews
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        let learnCell = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["LEARN"]/*[[".cells.staticTexts[\"LEARN\"]",".staticTexts[\"LEARN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //then
        
        XCTAssertTrue(learnCell.exists)
        
    }
    
    
    
    func testNutritionCell() {
        
        //given
        
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        let collectionViewsQuery = app.collectionViews
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        let nutritionCell = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["NUTRITION"]/*[[".cells.staticTexts[\"NUTRITION\"]",".staticTexts[\"NUTRITION\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //then
        
        XCTAssertTrue(nutritionCell.exists)
        
    }
    
    
    
    func testProductivityCell() {
        
        //given
        
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        let collectionViewsQuery = app.collectionViews
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        let productivityCell = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["PRODUCTIVITY"]/*[[".cells.staticTexts[\"PRODUCTIVITY\"]",".staticTexts[\"PRODUCTIVITY\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //then
        
        XCTAssertTrue(productivityCell.exists)
        
    }
    
    
    
    func testSelfCareCell() {
        
        //given
        
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        let collectionViewsQuery = app.collectionViews
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        let selfCareCell = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["SELF CARE"]/*[[".cells.staticTexts[\"SELF CARE\"]",".staticTexts[\"SELF CARE\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //then
        
        XCTAssertTrue(selfCareCell.exists)
        
    }
    
    
    
    func testSpiritualCell() {
        
        //given
        
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        let collectionViewsQuery = app.collectionViews
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        let spiritualCell = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["SPIRITUAL"]/*[[".cells.staticTexts[\"SPIRITUAL\"]",".staticTexts[\"SPIRITUAL\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //then
        
        XCTAssertTrue(spiritualCell.exists)
        
    }
    
    
    
    func testTidinessCell() {
        
        //given
        
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        
        let collectionViewsQuery = app.collectionViews
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        collectionView.swipeLeft()
        
        let tidinessCell = collectionViewsQuery.staticTexts["TIDINESS"]
        
        //then
        
        XCTAssertTrue(tidinessCell.exists)
        
    }
    
    
    
}

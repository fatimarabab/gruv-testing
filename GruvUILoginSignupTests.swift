//
//  GruvUITests.swift
//  GruvUITests
//
//  Created by Dhaiwat Patel on 10/12/18.
//  Copyright © 2018 Group 8. All rights reserved.
//
import XCTest

var app: XCUIApplication!

class GruvUILoginSignupTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let scrollViewsQuery = app.scrollViews
        let settingsButton = scrollViewsQuery.otherElements.buttons["Settings"]
        if settingsButton.exists {
            settingsButton.tap()
            let signoutButton = app.buttons["SIGN OUT"]
            signoutButton.tap()
            
        }
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        let scrollViewsQuery = app.scrollViews
        let settingsButton = scrollViewsQuery.otherElements.buttons["Settings"]
        if settingsButton.exists {
            settingsButton.tap()
            let signoutButton = app.buttons["SIGN OUT"]
            signoutButton.tap()
            
        }
    }
    
    func testLoginButtonExists() {
        //given
        let app = XCUIApplication()
        //then
        let loginButton = app.buttons["LOGIN"]
        XCTAssertTrue(loginButton.exists)
        
    }
    
    func testSignupButtonExists() {
        //given
        let signupBtn = app.buttons["SIGN UP"]
        //then
        XCTAssertTrue(signupBtn.exists)
    }
    
    func testTextFieldsLoginPage() {
        //given
        let emailTextField = app.textFields["email"]
        let passwordTextField = app.secureTextFields["password"]
        
        //then
        XCTAssertTrue(emailTextField.exists)
        XCTAssertTrue(passwordTextField.exists)
    }
    
    func testForgotPassword() {
        //given
        let forgotPasswordBtn = app.buttons["Forgot your password?"]
        
        //then
        XCTAssertTrue(forgotPasswordBtn.exists)
    }
    
    func testSignupSucceeds() {
        //given
        let signUpButton = app.buttons["SIGN UP"]
        
        let firstNameTextField = app.textFields["first name"]
        let lastNameTextField = app.textFields["last name"]
        let birthdayTextField = app.textFields["birthday"]
        let nextButton = app.buttons["NEXT"]
        let usernameTextField = app.textFields["username"]
        let emailTextField = app.textFields["email"]
        let passwordSecureTextField = app.secureTextFields["password"]
        let confirmPasswordSecureTextField = app.secureTextFields["confirm password"]
        
        //then
        XCTAssertTrue(signUpButton.exists)
        if signUpButton.isSelected {
            
            //SignUpOne
            
            XCTAssertTrue(firstNameTextField.exists)
            firstNameTextField.tap()
            firstNameTextField.typeText("Rabab")
            
            XCTAssertTrue(lastNameTextField.exists)
            lastNameTextField.tap()
            lastNameTextField.typeText("Fatima")
            
            XCTAssertTrue(birthdayTextField.exists)
            birthdayTextField.tap()
            birthdayTextField.typeText("11/06/1996")
            
            XCTAssertTrue(nextButton.exists)
            nextButton.tap()
            
            //SignUpTwo
            XCTAssertTrue(usernameTextField.exists)
            usernameTextField.tap()
            usernameTextField.typeText("fr.rabab")
            
            XCTAssertTrue(emailTextField.exists)
            emailTextField.tap()
            emailTextField.typeText("fr.rabab@gmail.com")
            
            XCTAssertTrue(passwordSecureTextField.exists)
            passwordSecureTextField.tap()
            passwordSecureTextField.typeText("testing")
            
            XCTAssertTrue(confirmPasswordSecureTextField.exists)
            confirmPasswordSecureTextField.tap()
            confirmPasswordSecureTextField.typeText("testing")
            signUpButton.tap()
            
            
        }
    }
    
    func testLoginSucceeds() {
        //given
        
        let emailTextField = app.textFields["email"]
        let passwordTextField = app.secureTextFields["password"]
        let loginBtn = app.buttons["LOGIN"]
        let dashboardView = app.navigationBars["Gruv.DashboardView"]
        
        //then
        XCTAssertTrue(emailTextField.exists)
        if emailTextField.isSelected {
            emailTextField.typeText("fr.rabab@gmail.com")
            
            XCTAssertTrue(passwordTextField.exists)
            passwordTextField.typeText("testing")
            
            XCTAssertTrue(loginBtn.exists)
            loginBtn.tap()
            
            XCTAssertTrue(dashboardView.exists)
        }
    }
    
    func testErrorForLoginWithoutCredentials() {
        //given
        let loginBtn = app.buttons["LOGIN"]
        let errorLoggingInAlert = app.alerts["Error logging in"]
        let errorText = errorLoggingInAlert.staticTexts["The password is invalid or the user does not have a password."]
        let okayBtn = errorLoggingInAlert.buttons["Okay"]
        
        //then
        XCTAssertTrue(loginBtn.exists)
        if loginBtn.isSelected {
            XCTAssertTrue(errorLoggingInAlert.exists)
            XCTAssertTrue(errorText.exists)
            XCTAssertTrue(okayBtn.exists)
        }
    }
    
}

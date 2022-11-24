//
//  Modul_11UITests.swift
//  Modul_11UITests
//
//  Created by Valentin Chetyrbotskiy on 20.11.2022.
//

import XCTest

class Modul_11UITests: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        //Симуляция
        
        let app = XCUIApplication()
        app.launch()
        
        //Элементы
        
        let loginTextField = app.textFields["Введите логин"]
        let passwordTextField = app.textFields["Введите пароль"]
        let loginButton = app.buttons["Войти"]
        
        let notCorrect1 = app.staticTexts["Введен неверный логин"]
        let notCorrect2 = app.staticTexts["Введен неверный пароль"]
        let notCorrect3 = app.staticTexts["Введен неверный логин и пароль"]
        
        let successScreen = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        
        //Проверка
        loginTextField.tap()
        loginTextField.typeText("jk")
        passwordTextField.tap()
        passwordTextField.typeText("ираощад")
        loginButton.tap()
        XCTAssertTrue(notCorrect3.exists)
        XCTAssertFalse(notCorrect1.exists)
        XCTAssertFalse(notCorrect2.exists)
        
        loginTextField.tap()
        loginTextField.typeText("jk@")
        passwordTextField.tap()
        passwordTextField.typeText("ираощад")
        loginButton.tap()
        XCTAssertFalse(notCorrect3.exists)
        XCTAssertTrue(notCorrect2.exists)
        XCTAssertFalse(notCorrect1.exists)
        
        loginTextField.tap()
        loginTextField.typeText("jk")
        passwordTextField.tap()
        passwordTextField.typeText("ираощадN1")
        loginButton.tap()
        XCTAssertFalse(notCorrect3.exists)
        XCTAssertTrue(notCorrect1.exists)
        XCTAssertFalse(notCorrect2.exists)
        
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

import XCTest
@testable import Modul_11

class Modul_11Tests: XCTestCase {
    
    var VC: MyModel!

    override func setUpWithError() throws {
        VC = MyModel()
    }

    override func tearDownWithError() throws {
        VC = nil
    }

    func testExample() throws {
        VC.password = "тФ4876"
        VC.login = "дж@"
        
        VC.ckeck()
        
        XCTAssertEqual(VC.passwordNumberQuantity, true, "введен пароль нужной длины")
        XCTAssertEqual(VC.passwordLowerLetter, true, "введен пароль с нижним регистром")
        XCTAssertEqual(VC.passwordUpperLetter, true, "введен пароль с верхним регистром")
        XCTAssertEqual(VC.passwordDigit, true, "введен пароль с цифрой")
        XCTAssertEqual(VC.loginCorrect, true, "введен верный")
        XCTAssertEqual(VC.buttonEnable, true, "кнопка входа активна")
        XCTAssertEqual(VC.successLogin, true, "вход выполнен успешно")
        XCTAssertGreaterThan(VC.password.count, 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

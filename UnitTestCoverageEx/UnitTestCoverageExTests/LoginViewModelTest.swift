//
//  LoginViewModelTest.swift
//  UnitTestCoverageExTests
//
//  Created by Anand Yadav on 28-05-2024.
//

import XCTest
@testable import UnitTestCoverageEx
//XCAssertTrue
//XCTAssertFalse
//XCTAssertNil
//XCTAssertNotNil
//XCTAssertEqual
//XCTAssert

final class LoginViewModelTest: XCTestCase {

    var viewModel: LoginViewModel?
    
    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testInvalidEmail() {
        guard let viewModel else {
            XCTFail("ViewModel can't be nil")
            return
        }
        let result = viewModel.validateLoginCredentials("", password: "1234")
        XCTAssertEqual(result, .emptyEmail, "Email should not be empty")
    }
    
    func testInvalidPassword() {
        guard let viewModel else {
            XCTFail("ViewModel can't be nil")
            return
        }
        let result = viewModel.validateLoginCredentials("a@a.com", password: "")
        XCTAssertEqual(result, .emptyPassword, "Password should not be empty")
        
        let lengthValidation = viewModel.validateLoginCredentials("a@a.com", password: "1234")
        XCTAssertEqual(lengthValidation, .passwordLength, "Password should be greater then 8 char")
    }

    func testValidCredentials() {
        guard let viewModel else {
            XCTFail("ViewModel can't be nil")
            return
        }
        let result = viewModel.validateLoginCredentials("a@a.com", password: "123456789")
        XCTAssertEqual(result, .success, "Email & Password are valid")
    }
}

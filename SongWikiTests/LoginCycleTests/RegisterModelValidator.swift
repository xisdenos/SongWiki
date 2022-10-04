//
//  RegisterModelValidator.swift
//  SongWikiTests
//
//  Created by Lucas Pinto on 03/10/22.
//

import XCTest
@testable import SongWiki

final class RegisterModelValidator: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRegisterModelValidator_WhenEmailValidation_ShouldReturnTrue() {
        // Arrange
        var sut = RegistrationViewModel()
        
        //Act
        sut.email = "lucas@gmail.com"
        
        //Assert
        XCTAssertTrue(sut.validateEmail(), "The validateEmail() should have returned True when the Email TextField is not empty and contains @ and . ")
    }
    
    func testRegisterModelValidator_WhenUserValidation_ShouldReturnTrue() {
        // Arrange
        var sut = RegistrationViewModel()
        
        //Act
        sut.user = "dfggh"
        
        //Assert
        XCTAssertTrue(sut.validateUser(), "The validateUser() should have returned True when user TextField is not empty and is bigger than 3 and smaller than 13 ")
    }
    
    func testRegisterModelValidator_WhenPasswordValidation_ShouldReturnTrue() {
        // Arrange
        var sut = RegistrationViewModel()
        
        //Act
        sut.password = "asdasda"
        
        //Assert
        XCTAssertTrue(sut.validatePassword(), "The validatePassword() should have returned True when password TextField is not empty and is bigger than 3 and smaller than 13 ")
    }
    
    func testRegisterModelValidator_WhenPasswordConfirmationValidation_ShouldReturnTrue() {
        // Arrange
        var sut = RegistrationViewModel()
        
        //Act
        sut.passwordConfirmation = "asdasda"
        
        //Assert
        XCTAssertTrue(sut.validatePasswordConfirmation(), "The validatePasswordConfirmation() should have returned True when password TextField is not empty and is bigger than 3 and smaller than 13 ")
    }
    
    func testRegisterModelValidator_WhenPasswordAndPasswordConfirmationEquivalence_ShouldReturnTrue() {
        // Arrange
        var sut = RegistrationViewModel()
        
        //Act
        sut.password = "sdsdfdf"
        sut.passwordConfirmation = "sdsdfdf"
        
        //Assert
        XCTAssertTrue(sut.passwordEqualPasswordConfirmation, "The passwordEqualPasswordConfirmation should have returned True when password TextField and password confirmation TextField are equals ")
    }
}



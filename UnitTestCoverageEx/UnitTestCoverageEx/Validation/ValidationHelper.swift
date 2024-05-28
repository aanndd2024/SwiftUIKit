//
//  ValidationHelper.swift
//  UnitTestCoverageEx
//
//  Created by Anand Yadav on 28-05-2024.
//

import Foundation

enum ValidationResult: String {
    case emptyEmail = "Email is empty."
    case emptyPassword = "Password is Empty."
    case success = "Success"
    case passwordLength = "Password must be 8 char length"
}

final class ValidationHelper {
    func validateEmail(_ email: String?) -> ValidationResult {
        guard let email, !email.isEmpty else {
            return .emptyEmail
        }
        return .success
    }
    
    func validatePassword(_ password:String?) -> ValidationResult {
        guard let password, !password.isEmpty else {
            return .emptyPassword
        }
        guard password.count > 8 else {
            return .passwordLength
        }
        return .success
    }
    
    func validateLoginCredentials(_ email:String?, password:String?) -> ValidationResult {
        let emailResult = validateEmail(email)
        let passwordResult = validatePassword(password)
        
        if emailResult != .success {
            return emailResult
        } else if passwordResult != .success {
            return passwordResult
        } else {
            return .success
        }
    }
}

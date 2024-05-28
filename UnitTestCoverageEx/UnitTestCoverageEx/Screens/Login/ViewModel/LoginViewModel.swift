//
//  LoginViewModel.swift
//  UnitTestCoverageEx
//
//  Created by Anand Yadav on 28-05-2024.
//

import Foundation

final class LoginViewModel {
    private let helper = ValidationHelper()
    func validateLoginCredentials(_ email:String?, password:String?) -> ValidationResult {
        helper.validateLoginCredentials(email, password: password)
    }
}

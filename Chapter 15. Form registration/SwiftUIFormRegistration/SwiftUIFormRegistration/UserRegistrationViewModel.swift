//
//  UserRegistrationViewModel.swift
//  SwiftUIFormRegistration
//
//  Created by Maxim Brishten on 17.05.23.
//

import Foundation
import Combine

class UserRegistrationViewModel: ObservableObject {
    
    // Input
    @Published var username = ""
    @Published var password = ""
    @Published var passwordConfirm = ""

    // Output
    @Published var isUsernameLengthValid = false
    @Published var isPasswordLengthValid = false
    @Published var isPasswordCapitalLetter = false
    @Published var isPasswordConfirmValid = false
    
    private let pattern = "[A-Z]"
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        sinkUserName()
        sinkPassword()
    }
    
    private func sinkUserName() {
        $username
            .receive(on: RunLoop.main)
            .map { userName in
                return userName.count >= 4
            }
            .assign(to: \.isUsernameLengthValid, on: self)
            .store(in: &cancellableSet)
    }
    
    private func sinkPassword() {
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLengthValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                if let _ = password.range(of: self.pattern, options: .regularExpression) {
                    return true
                } else {
                    return false
                }
            }
            .assign(to: \.isPasswordCapitalLetter, on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($password, $passwordConfirm)
            .receive(on: RunLoop.main)
            .map { password, confirmPassword in
                password == confirmPassword
            }
            .assign(to: \.isPasswordConfirmValid, on: self)
            .store(in: &cancellableSet)
    }
}

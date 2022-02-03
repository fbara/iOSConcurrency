//
//  User.swift
//  iOSConcurrency
//
//  Created by Frank Bara on 1/21/22.
//

import Foundation
// Source: https://jsonplaceholder.typicode.com/users

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let test: String
}



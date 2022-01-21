//
//  Post.swift
//  iOSConcurrency
//
//  Created by Frank Bara on 1/21/22.
//

import Foundation

// Source: https://jsonplaceholder.typicode.com/posts
// Single user's posts: https://jsonplaceholder.typicode.com/posts/1/posts

struct Post: Codable, Identifiable {
    let userID: Int
    let id: Int
    let title: String
    let body: String
}

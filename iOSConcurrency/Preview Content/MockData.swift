//
//  MockData.swift
//  iOSConcurrency
//
//  Created by Frank Bara on 1/21/22.
//

import Foundation

extension User {
    static var mockUsers: [User] {
        Bundle.main.decode([User].self, from: "Users.json")
    }
    
    static var mockSingleUser: User {
        Self.mockUsers[0]
    }
}

extension Post {
    static var mockPosts: [Post] {
        Bundle.main.decode([Post].self, from: "Posts.json")
    }
    
    static var mockSinglePost: Post {
        Self.mockPosts[0]
    }
    
    static var mockSingleUsersPostsArray: [Post] {
        Self.mockPosts.filter { $0.userID == 1 }
    }
}



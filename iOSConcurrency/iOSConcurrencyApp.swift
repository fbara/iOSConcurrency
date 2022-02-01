//
//  iOSConcurrencyApp.swift
//  iOSConcurrency
//
//  Created by Frank Bara on 1/17/22.
//

import SwiftUI

@main
struct iOSConcurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            UsersListView()
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}

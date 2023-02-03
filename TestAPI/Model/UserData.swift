//
//  UserData.swift
//  TestAPI
//
//  Created by unicred on 03/02/23.
//

import Foundation

struct UserData: Codable {
    var login: String
    var avatarUrl: String
    var reposUrl: String
    var name: String
    var publicRepos: Int
}

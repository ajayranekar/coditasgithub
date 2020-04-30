//
//  UserDataModel.swift
//  CoditasGitHub
//
//  Created by Apple on 30/04/20.
//  Copyright © 2020 Ajay Ranekar. All rights reserved.
//

import Foundation

struct Response: Codable {

    var total_count: Int
    var incomplete_results: Bool
    var userData:[UserData]
    
    enum CodingKeys: String, CodingKey {
        case total_count
        case incomplete_results
        case userData = "items"
    }
    
}

struct UserData: Codable {
    var login: String
    var id: Int
    var node_id: String
    var avatar_url: String
    var gravatar_id: String
    var url: String
    var html_url: String
    var followers_url: String
    var following_url: String
    var gists_url: String
    var starred_url: String
    var subscriptions_url: String
    var organizations_url: String
    var repos_url: String
    var events_url: String
    var received_events_url: String
    var type: String
    var site_admin: Bool
    var score: Double
}


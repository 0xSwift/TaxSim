//
//  User.swift
//  iOS
//
//  Created by Zach Eriksen on 7/30/20.
//

import Foundation

struct User: Codable, Hashable {
    let name: String
    
    var donations: [Donation] = []
}

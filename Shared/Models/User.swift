//
//  User.swift
//  iOS
//
//  Created by Zach Eriksen on 7/30/20.
//

import Foundation

struct User: Codable, Hashable {
    let name: String
    var salary: Double = {
        Double.random(in: 100 ... 10_000)
    }()
    
    var money: Double = 0
    var donations: [Donation] = []
    var progressToPayDay: Float = 0
}

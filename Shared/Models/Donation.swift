//
//  Donation.swift
//  iOS
//
//  Created by Zach Eriksen on 7/30/20.
//

import Foundation

struct Donation: Codable, Hashable {
    let message: String
    let amount: Double
    let user: User
}

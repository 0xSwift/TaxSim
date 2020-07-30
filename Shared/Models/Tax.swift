//
//  Tax.swift
//  iOS
//
//  Created by Zach Eriksen on 7/30/20.
//

import Foundation

enum TaxCategory: String, Codable, Hashable {
    case welfare
    case military
    case education
    case healthcare
}

struct Tax: Codable, Hashable {
    let category: TaxCategory
    let title: String
    
    var donations: [Donation] = []
}

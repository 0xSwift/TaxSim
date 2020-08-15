//
//  Tax.swift
//  iOS
//
//  Created by Zach Eriksen on 7/30/20.
//

import Foundation

enum TaxCategory: String, Codable, Hashable, CaseIterable {
    case welfare
    case military
    case education
    case healthcare
}

extension TaxCategory {
    var title: String {
        rawValue
            .prefix(3)
            .uppercased()
    }
}

struct Tax: Codable, Hashable {
    let category: TaxCategory
    
    var donations: [Donation] = []
}

extension Tax {
    var title: String {
        category.title
    }
    
    var total: Double {
        donations
            .map { $0.amount }
            .reduce(0, +)
    }
}

//
//  TaxInfoView.swift
//  iOS
//
//  Created by Zach Eriksen on 7/30/20.
//

import SwiftUI

struct TaxInfoView: View {
    var taxes: [Tax] = []
    
    private var taxTotal: String {
        String(format: "$%.2f", taxes
                .map { $0.total }
                .reduce(0, +))
    }
    
    var body: some View {
        Section(header: Text(taxTotal)) {
            ForEach(taxes, id: \.self) { tax in
                Section(header: header(forTax: tax)) {
                    ForEach(tax.donations, id: \.self) { donation in
                        DonationItemView(donation: donation)
                    }
                }
            }
        }
    }
    
    private func header(forTax tax: Tax) -> some View {
        HStack {
            Text(tax.title)
            Spacer()
            Text(String(format: "$%.2f", tax.total))
        }
    }
}

struct TaxInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        TaxInfoView(taxes: [
            Tax(category: .education,
                donations: [
                    Donation(message: "For EDU",
                             amount: 1234.5,
                             user: User(name: "user")),
                    Donation(message: "For Books",
                             amount: 500,
                             user: User(name: "person"))
                ])
        ])
    }
}

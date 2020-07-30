//
//  TaxInfoView.swift
//  iOS
//
//  Created by Zach Eriksen on 7/30/20.
//

import SwiftUI

struct TaxInfoView: View {
    var tax: Tax
    
    var body: some View {
        VStack {
            Text(tax.title)
            ForEach(tax.donations, id: \.self) { donation in
                DonationItemView(donation: donation)
            }
        }
    }
}

struct TaxInfoView_Previews: PreviewProvider {
    
    static var previews: some View {
        TaxInfoView(tax: Tax(category: .education,
                             title: "Education Tax",
                             donations: [
                                Donation(message: "For EDU",
                                         amount: 1234.5,
                                         user: User(name: "user")),
                                Donation(message: "For Books",
                                         amount: 500,
                                         user: User(name: "person"))
                             ]))
    }
}

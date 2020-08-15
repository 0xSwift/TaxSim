//
//  DonationItemView.swift
//  iOS
//
//  Created by Zach Eriksen on 7/30/20.
//

import SwiftUI

struct DonationItemView: View {
    let donation: Donation
    
    private var formattedDonationAmount: String {
        String(format: "+%.2f", donation.amount)
    }
    
    var body: some View {
        VStack {
            Text(donation.message)
            HStack {
                Text(formattedDonationAmount)
                Spacer()
                Text(donation.user.name)
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
        .cornerRadius(3)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct DonationItemView_Previews: PreviewProvider {
    static var previews: some View {
        DonationItemView(donation: Donation(message: "For EDU",
                                            amount: 1234.5,
                                            user: User(name: "user",
                                                       money: 100)))
    }
}

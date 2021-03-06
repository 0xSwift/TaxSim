//
//  SubmitDonationView.swift
//  TaxSim
//
//  Created by Zach Eriksen on 8/15/20.
//

import SwiftUI

struct SubmitDonationView: View {
    @State var selectedTaxCategory: TaxCategory = .education
    @State var donationAmount: Double = 0
    
    @Binding var user: User
    @Binding var taxes: [Tax]
    @Binding var isPresenting: Bool
    
    var body: some View {
        VStack {
            UserInfoView(user: $user)
                .frame(height: 32, alignment: .center)
            
            Picker(selection: $selectedTaxCategory, label: Text("Picker")) {
                ForEach(TaxCategory.allCases, id: \.self) { category in
                    Text(category.title)
                }
            }
            
            HStack {
                Text("$0")
                Slider(value: $donationAmount, in: 0 ... user.money) {
                    Text(String(format: "$%.2f", donationAmount))
                }
                Text(String(format: "$%.2f", user.money))
            }
            
            
            
            Spacer()
            
            Button(action: donate) {
                Text("Donate: \(String(format: "$%.2f", donationAmount))")
            }
        }
    }
    
    func donate() {
        guard donationAmount > 0 else {
            print("Not enough money...")
            return
        }
        
        guard let taxIndex = taxes.firstIndex(where: { $0.category == selectedTaxCategory }) else {
            print("Couldn't find Tax...")
            return
        }
        let donation = Donation(message: "To \(selectedTaxCategory.title)",
                                amount: donationAmount,
                                user: user)
        user.money -= donationAmount
        user.donations.append(donation)
        taxes[taxIndex].donations.append(donation)
        
        isPresenting = false
    }
}

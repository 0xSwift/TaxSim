//
//  ContentView.swift
//  Shared
//
//  Created by Zach Eriksen on 7/30/20.
//

import SwiftUI
import Later

struct ContentView: View {
    @State var isPresentingDonationView = false
    
    @State var user = User(name: "Leif", money: 0)
    @State var taxes = TaxCategory.allCases.map { Tax(category: $0) }
    
    var body: some View {
        NavigationView {
            List {
                UserInfoView(user: $user)
                    .padding()
                TaxInfoView(taxes: taxes)
                    .frame(maxHeight: .infinity, alignment: .center)
            }
            .navigationBarItems(trailing: Button(action: {
                isPresentingDonationView.toggle()
            }, label: {
                Text("Donate")
            }))
            .sheet(isPresented: $isPresentingDonationView) {
                SubmitDonationView(user: $user,
                                   taxes: $taxes,
                                   isPresenting: $isPresentingDonationView).padding()
            }
            .onAppear {
                print("Paying User Init Salary")
                user.money += user.salary
                
                Later.scheduleRepeatedTask(delay: .hours(1)) { (task) in
                    user.progressToPayDay = 0
                    user.money += user.salary
                }
                
                Later.scheduleRepeatedTask(delay: .seconds(1)) { (task) in
                    user.progressToPayDay += 1 / 60 / 60
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  UserInfoView.swift
//  TaxSim
//
//  Created by Zach Eriksen on 8/15/20.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var user: User
    
    var body: some View {
        HStack {
            Text(user.name).font(.title)
            Text(String(format: "$%.2f", user.money)).font(.callout)
            PayDayView(user: $user)
        }
    }
}

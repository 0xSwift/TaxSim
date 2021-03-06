//
//  PayDayView.swift
//  TaxSim
//
//  Created by Zach Eriksen on 8/15/20.
//

import SwiftUI
import Later

struct PayDayView: View {
    @Binding var user: User
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 4.0)
                .opacity(0.3)
                .foregroundColor(Color.black)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.user.progressToPayDay, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.green)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            Text(String(format: "%.0f%%", min(self.user.progressToPayDay, 1.0)*100.0))
                            .font(.caption)
                            .bold()
        }
    }
}

//
//  StartButtonView.swift
//  Africa
//
//  Created by Ferox on 2/6/22.
//

import SwiftUI

struct StartButtonView: View {
    //MARK: - Properties
    
    @State var size: Int
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    let hapticFeedack = UINotificationFeedbackGenerator()
    
    //MARK: - Body
    var body: some View {
        Button {
            isOnboarding = false
            hapticFeedack
                .notificationOccurred(.success)
        } label: {
            HStack(spacing: 8) {
                Text("Start")
                    .font(.system(size: CGFloat(size)))
                    .foregroundColor(.black)
                
                Image(systemName: "arrow.right.circle")
                    .font(.system(size: CGFloat(size - 5)))
                    .imageScale(.large)
                    .foregroundColor(.black)
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
            )
        }

    }//: Button
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView(size: 20)
            .preferredColorScheme(.dark)
    }
}

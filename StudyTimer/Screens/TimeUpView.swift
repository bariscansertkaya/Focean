//
//  TimeUpView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 21.11.2023.
//

import SwiftUI

struct TimeUpView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text("Focean")
                    .foregroundColor(.white)
                    .font(.system(size: 60, weight: .bold, design: .serif))
                
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    
                    Image("ocean")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                }
                .padding()
                .frame(height: 400)
                
                Text("You made it!")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .thin, design: .default))
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Focus Again")
                        .foregroundColor(.white)
                        .font(.system(size: 25,weight: .semibold,design: .default))
                        .frame(width: 180,height: 50)
                })
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    TimeUpView()
}

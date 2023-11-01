//
//  TimeUpScreen.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 3.10.2023.
//

import SwiftUI

struct TimeUpScreen: View {
    
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        
        ZStack {
            BackgroundView()
            
            VStack(spacing: 20) {
                
                Spacer()
                
                ZStack {
                    
                    Circle()
                        .foregroundColor(.white)
                        .padding(20)
                    
                    Image("ocean")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 310, height: 310, alignment: .center)
                        .foregroundColor(.blue)
                }
                Text("Congratulations!")
                    .foregroundColor(.white)
                    .font(.system(size: 40,weight: .semibold,design: .default))
                
                Text("You made it!")
                    .foregroundColor(.white)
                    .font(.system(size: 30,weight: .thin,design: .default))
                
                Button {
                    dismiss()
                } label: {
                    Text("Focus Again")
                        .foregroundColor(.white)
                        .font(.system(size: 25,weight: .semibold,design: .default))
                        .frame(width: 180,height: 50)
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()

            }
        }
    }
    
    
    
    struct TimeUpScreen_Previews: PreviewProvider {
        static var previews: some View {
            TimeUpScreen()
        }
    }
}

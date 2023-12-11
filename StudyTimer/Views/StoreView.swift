//
//  StoreView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 11.12.2023.
//

import SwiftUI

struct StoreView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Store")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                
                
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(BackgroundView())
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                    })
                }
            }
        }
    }
}

#Preview {
    StoreView()
}

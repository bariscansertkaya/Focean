//
//  BackgroundView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 3.08.2023.
//

import SwiftUI



struct BackgroundView: View {
    
    @ObservedObject var userSettings = UserSettings.shared
    
    var body: some View {
        LinearGradient(colors: [.cyan, .blue],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

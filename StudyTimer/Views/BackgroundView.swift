//
//  BackgroundView.swift
//  StudyTimer
//
//  Created by Barış Can Sertkaya on 3.08.2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [.blue,.cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}

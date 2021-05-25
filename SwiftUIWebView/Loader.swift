//
//  Loader.swift
//  SwiftUIWebView
//
//  Created by Md. Yamin on 4/25/20.
//  Copyright © 2020 Md. Yamin. All rights reserved.
//

import SwiftUI

struct Loader: View {
    @State var spinCircle = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Rectangle().frame(width:160, height: 135).background(Color.white).cornerRadius(8).opacity(0.8).shadow(color: .black, radius: 16)
            VStack {
                Circle()
                    .trim(from: 0.3, to: 1)
                    .stroke(Color.accentColor, lineWidth:3)
                    .frame(width:40, height: 40)
                    .padding(.all, 8)
                    .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
                    .animation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false))
                    .onAppear {
                        self.spinCircle = true
                    }
                Text("Loading...").foregroundColor(.accentColor)
            }
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}

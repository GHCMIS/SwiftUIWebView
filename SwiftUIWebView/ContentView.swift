//
//  ContentView.swift
//  SwiftUIWebView
//
//  Created by Md. Yamin on 4/24/20.
//  Copyright © 2020 Md. Yamin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var showLoader = false
    @State var message = ""
    @State var webTitle = ""
    
    // For WebView's forward and backward navigation
    var webViewNavigationBar: some View {
        VStack(spacing: 0) {
            Divider()
            HStack {
                Spacer()
                Button(action: {
                    self.viewModel.webViewNavigationPublisher.send(.backward)
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .regular))
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button(action: {
                    self.viewModel.webViewNavigationPublisher.send(.forward)
                }) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20, weight: .regular))
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button(action: {
                    self.viewModel.webViewNavigationPublisher.send(.reload)
                }) {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 20, weight: .regular))
                        .imageScale(.large)
                        .foregroundColor(.gray).padding(.bottom, 4)
                }
                Spacer()
            }.frame(height: 45)
            Divider()
        }
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 4) {
                /* This is our WebView. Here if you pass .localUrl it will load LocalWebsite.html file
                 into the WebView and if you pass .publicUrl it will load the public website depending on
                 your url provided. See WebView implementation for more info. */
                WebView(url: .publicUrl, viewModel: viewModel)
                
                webViewNavigationBar
            }.onReceive(self.viewModel.showLoader.receive(on: RunLoop.main)) { value in
                self.showLoader = value
            }
            
            // A simple loader that is shown when WebView is loading any page and hides when loading is finished.
            if showLoader {
                Loader()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

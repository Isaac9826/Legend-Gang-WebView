//
//  ContentView.swift
//  Legend Gang App
//
//  Created by Isaac on 27/09/24.
//

import SwiftUI


struct ContentView: View {
    @State private var isSplashScreenActive = true
    @State private var webViewNavigation = WebViewWithNavigation(urlString: "")
    
    
    var body: some View {
        ZStack {
            if isSplashScreenActive {
                LottieView(animationName: "SplashSwift")
                    .frame(width: 800, height: 800)
                    .aspectRatio(contentMode: .fit)
                    .transition(AnyTransition.opacity.combined(with: .opacity))
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                            withAnimation(.easeInOut(duration: 2.0)) {
                                isSplashScreenActive = false
                            }
                        }
                    }
            } else {
                WebViewWithNavigation(urlString: "https://legendgang.com")
                    .transition(AnyTransition.opacity.combined(with: .opacity))
            }
        }
    }
}

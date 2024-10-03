//
//  WebView.swift
//  Legend Gang App
//
//  Created by Isaac on 1/10/24.
//

import SwiftUI
import WebKit

struct WebViewWithNavigation: UIViewRepresentable {
    let urlString: String
    let webView = WKWebView()
    
    
    func makeUIView(context: Context) -> WKWebView {
        webView.allowsBackForwardNavigationGestures = true
        if let url = URL(string: urlString){
            let request = URLRequest(url: url)
            webView.load(request)
        }        
        return webView
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
   
    
    func goBack(){
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    func goForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}




struct StatusBarStyleModifier: UIViewControllerRepresentable {
    var style: UIStatusBarStyle
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .clear
        return viewController
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        uiViewController.overrideUserInterfaceStyle = (style == .lightContent) ? .dark : .light
        uiViewController.setNeedsStatusBarAppearanceUpdate()
    }
}


extension View {
    func statusBarStyle(_ style: UIStatusBarStyle) -> some View {
        self.background(StatusBarStyleModifier(style: style))
    }
}

//
//  LottieView.swift
//  Legend Gang App
//
//  Created by Isaac on 1/10/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable{
    var animationName: String
    var loopMode: LottieLoopMode = .playOnce
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        let animationView = LottieAnimationView(name: animationName)
        animationView.loopMode = loopMode
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        animationView.play()
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

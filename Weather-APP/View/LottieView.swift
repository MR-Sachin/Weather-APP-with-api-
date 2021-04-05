//
//  LottieView.swift
//  Weather-APP
//
//  Created by sachiin verma on 05/04/21.
//

// basically lottie not written in swiftUI so we have to write swiftUI version  which we can do using UIView representable


import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {

    var name: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let view = UIView()
        return view
    }
    
    // whenever state changes at that time your view reciece update then this method is colled
    // basically this method set up or send properties for our lottie  animation
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.subviews.forEach({$0.removeFromSuperview()})  // we resetting all the state
        
        
        let animationView = AnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                                        animationView.widthAnchor.constraint(equalTo: animationView.widthAnchor),
                                        animationView.heightAnchor.constraint(equalTo: animationView.heightAnchor)
        ])
        
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
    }
    
}




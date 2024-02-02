//
//  ContentView.swift
//  AnimationsYAY
//
//  Created by Hunter Jensen on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var opacity1 = false
    @State var scale1 = false
    @State var opacity2 = false
    @State var scale2 = false
    @State var opacity3 = false
    @State var scale3 = false
    @State var animateGO = false
    @State var startGame = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Text("Go!")
                .foregroundColor(.white)
                .font(.system(size: 100))
                .opacity(animateGO ? 1 : 0)
                .scaleEffect(animateGO ? 0.2 : 1)
            
            if startGame {
                Text("3")
                    .foregroundColor(.white)
                    .font(.system(size: 100))
                    .opacity(opacity3 ? 1 : 0)
                    .scaleEffect(scale3 ? 0.2 : 1)
                Text("2")
                    .foregroundColor(.white)
                    .font(.system(size: 100))
                    .opacity(opacity2 ? 1 : 0)
                    .scaleEffect(scale2 ? 0.2 : 1)
                Text("1")
                    .foregroundColor(.white)
                    .font(.system(size: 100))
                    .opacity(opacity1 ? 1 : 0)
                    .scaleEffect(scale1 ? 0.2 : 1)
            }
            
            Spacer()
            VStack {
                Spacer()
                Button(action: {
                    startedGame()
                }) {
                    Text("Start Game")
                        .padding()
                }
            }
        }
    }
    func startedGame() {
        opacity1 = false
        scale1 = false
        opacity2 = false
        scale2 = false
        opacity3 = false
        scale3 = false
        animateGO = false
        
        startGame = true
        
        withAnimation(Animation.easeInOut(duration: 1.0)) {
            opacity3 = true
            scale3 = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            withAnimation(Animation.easeInOut(duration: 1.0)) {
                opacity3 = false
                opacity2 = true
                scale2 = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.75) {
            withAnimation(Animation.easeInOut(duration: 1.0)) {
                opacity2 = false
                opacity1 = true
                scale1 = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.75) {
            withAnimation(Animation.easeInOut(duration: 1.0)) {
                opacity1 = false
                animateGO = true
            }
        }
    }
}
    
    
    
    #Preview {
        ContentView()
    }


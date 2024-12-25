//
//  SplashScreen.swift
//  Foodgo
//
//  Created by Manish Singh on 20/10/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false

    
    var body: some View {
        if isActive {
            MainView()
        }else{
            GeometryReader { geometry in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [
                        Color(hex: "#EF2A39").opacity(0.3),
                        Color(hex: "#EF2A39").opacity(0.7),
                        Color(hex: "#EF2A39")
                    ]),
                    startPoint: .topLeading,
                    endPoint: .center)
                    .ignoresSafeArea()
                   
                    foodgoText(geometry: geometry)
                    burger(geometry: geometry)
                }
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isActive.toggle()
                        }
                    }
                })
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        }
    }
}

//MARK: SplashScreen Extension
extension SplashScreen {
   
    private func foodgoText(geometry: GeometryProxy) -> some View {
        Text("Foodgo")
            .font(.custom("Lobster-Regular", size: geometry.size.width * 0.15))
            .foregroundColor(.white)
            .position(x: geometry.size.width / 2, y: geometry.size.height * 0.45)
    }
    
    private func burger(geometry: GeometryProxy) -> some View {
        VStack {
            Spacer()
            ZStack {
                Image("burger2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.4)
                
                Image("burger1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.4)
                    .offset(x: 90, y: 10)
            }
            .position(x: geometry.size.width * 0.2, y: geometry.size.height * 0.9)
        }
    }
}

#Preview {
    SplashScreen()
}

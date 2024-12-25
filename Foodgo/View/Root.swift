//
//  MainView.swift
//  CurveTabBar
//
//  Created by Satyadev Chauhan on 19/02/23.
//

import SwiftUI

// MARK: - Tab

enum Tab: String {
    case home = "house"
    case search = "magnifyingglass"
    case message = "message"
    case person = "person"
    
    var title: String {
        return rawValue.capitalized
    }
}

struct MainView: View {
    
    @State private var currentTab: Tab = .home
    
    // MARK: - Hide Tab Bar
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            HomeScreen()
                .tag(Tab.home)
            HomeScreen()
                .tag(Tab.search)
            HomeScreen()
                .tag(Tab.message)
            HomeScreen()
                .tag(Tab.person)
        }
        .overlay(
            
            // MARK: - Curve Tab Bar
            
            HStack(spacing: 0) {
                
                // MARK: - Tab Button
                
                TabButton(.home)
                TabButton(.search)
                    .offset(x: -10)
                
                // MARK: - Center Button
                
                Button {
                    // TODO: - Center Button Action
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26, height: 26)
                        .offset(x: -1)
                        .padding(18)
                        .foregroundColor(Color.white)
                        .background(.red)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                }
                .offset(y: -30)
                
                TabButton(.message)
                    .offset(x: 10)
                TabButton(.person)
            }
                .background(
                    Color.red
                        .clipShape(CustomCurveShape())
                        .shadow(color: Color.black.opacity(0.04), radius: 5, x: -5, y: -5)
                        .ignoresSafeArea(.container, edges: .bottom)
                )
            // MARK: - Hide Tab Bar on Detail View
            //.offset(y: showDetail ? 200 : 0)
            
            , alignment: .bottom
        )
    }
    
    @ViewBuilder
    func TabButton(_ tab: Tab)-> some View {
        Button {
            withAnimation {
                currentTab = tab
            }
        } label: {
            if currentTab == tab {
                VStack{
                    Image(systemName: tab.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(currentTab == tab ? .white : .black)
                        .frame(maxWidth: .infinity)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                }
            }else{
                Image(systemName: tab.rawValue)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            }
           
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  MainView.swift
//  LoveCrane
//
//  Created by 235 on 2023/07/13.
//

import SwiftUI
import SpriteKit




struct MainView: View {
    
    var scean: SKScene {
        let scene = SpriteScene()
        scene.size = CGSize(width: CGSize.deviceWidth * 0.7, height: CGSize.deviceHeight * 0.7)
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Text("hjijiejfiejifjeif").padding(.top)
                GeometryReader { proxy in
                    SpriteView(scene: scean)
                }
                .frame(width: CGSize.deviceWidth * 0.7, height: CGSize.deviceHeight * 0.6)
                .cornerRadius(20)
                .padding()
                Text("hefjㅈㄷ러ㅑㅐjiejf")
            }
                .navigationTitle("")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("hi") { }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("hi") { }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("hi") { }
                    }
            }
        }
    }
}



struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

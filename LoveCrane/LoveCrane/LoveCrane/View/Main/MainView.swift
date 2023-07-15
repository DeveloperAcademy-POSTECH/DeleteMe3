//
//  MainView.swift
//  LoveCrane
//
//  Created by 235 on 2023/07/13.
//

import SwiftUI
import SpriteKit
import CoreMotion




struct MainView: View {
    let coreMotionManager = MotionManager.shared
    
    var body: some View {
        NavigationView {
            VStack{
                Text("hjijiejfiejifjeif").padding()
                Text("Number")
                GeometryReader { proxy in
                    SpriteView(scene: makeScean())
                }
                .frame(width: CGSize.deviceWidth * 0.8, height: CGSize.deviceHeight * 0.54)
                .cornerRadius(20)
                .padding()
                Spacer()
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: CGSize.deviceWidth * 0.8)
                    .offset(y: CGSize.deviceHeight * 0.1)
                    .padding(.top)
                    .ignoresSafeArea()
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
    
    func makeScean() -> SKScene {
        let scene = SpriteScene()
        scene.motionManager = coreMotionManager
        scene.size = CGSize(width: CGSize.deviceWidth * 0.7, height: CGSize.deviceHeight * 0.7)
        scene.scaleMode = .resizeFill
        return scene
    }
    
}



struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

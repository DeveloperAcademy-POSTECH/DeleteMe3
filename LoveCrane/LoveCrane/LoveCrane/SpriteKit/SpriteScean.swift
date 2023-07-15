//
//  SKScean.swift
//  LoveCrane
//
//  Created by 최진용 on 2023/07/15.
//

import SpriteKit
import SceneKit
import SwiftUI

final class SpriteScene: SKScene {

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        backgroundColor = .red
        createCrane()
    }
    
    private func createCrane() {
        let crane = SKSpriteNode(imageNamed: "favorite")
        crane.physicsBody = SKPhysicsBody(texture: crane.texture!, size: crane.texture!.size())
        crane.position = CGPoint(x: CGFloat.random(in: 0...size.width), y: CGFloat.random(in: 0...200))
        addChild(crane)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        createCrane()
    }
    
}

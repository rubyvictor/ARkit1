//
//  Sunglass.swift
//  ARKit1
//
//  Created by Victor Lee on 10/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import ARKit

class Sunglass: SCNNode {
    
    func loadModel() {
        
        guard let virtualObjectScene = SCNScene(named: "glasses1.dae") else { return }
        
        let wrapperNode = SCNNode()
        
        for child in virtualObjectScene.rootNode.childNodes {
            wrapperNode.addChildNode(child)
        }
        self.addChildNode(wrapperNode)
    }
}

//
//  ViewController.swift
//  ARKit1
//
//  Created by Victor Lee on 11/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.


import UIKit
import ARKit

class ViewController: UIViewController {
    
    let sceneView: ARSCNView = {
        let sv = ARSCNView()
        //        sv.backgroundColor = .purple
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        view.addSubview(sceneView)
        
        setupViews()
        
        addObject()
        
    }
    
    func setupViews() {
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        sceneView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        sceneView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        sceneView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        sceneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -250).isActive = true
    }
    
    func addObject() {
        let glasses = Sunglass()
        glasses.loadModel()
        
        let xPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let yPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        
        // z position in metres by default?
        glasses.position = SCNVector3(xPos, yPos, -1)
        
        sceneView.scene.rootNode.addChildNode(glasses)
    }
    
    func randomPosition(lowerBound lower: Float, upperBound upper: Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingSessionConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: sceneView)
            
            let hitlist = sceneView.hitTest(location, options: nil)
            if let hitObject = hitlist.first {
                let node = hitObject.node
                
                if node.name == "glasses1.dae" {
                    node.removeFromParentNode()
                    addObject()
                }
                
            }
        }
    }
    
    
}

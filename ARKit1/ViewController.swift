//
//  ViewController.swift
//  ARKit1
//
//  Created by Victor Lee on 10/7/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController, UINavigationControllerDelegate {
    
    let sceneView: ARSCNView = {
      let sv = ARSCNView()
        sv.backgroundColor = .purple
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        view.addSubview(sceneView)
        
        setupViews()
        
    }
    
    func setupViews() {
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        sceneView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        sceneView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        sceneView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        sceneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -250).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingSessionConfiguration()
        sceneView.session.run(configuration)
        
        
    }
    
}


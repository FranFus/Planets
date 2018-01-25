//
//  ViewController.swift
//  World Tracking
//
//  Created by Francesco Fuscaldo on 25/01/2018.
//  Copyright © 2018 Würstchen fest. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    
    //Outlets declaration
    @IBOutlet weak var sceneView: ARSCNView!
    
    //Declaring configuration of AR
    let configuration = ARWorldTrackingConfiguration()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configuration
        self.sceneView.session.run(configuration)
        
        //Debug options
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
    }

}


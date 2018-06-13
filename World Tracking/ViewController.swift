//  Created by Francesco Fuscaldo on 25/01/2018.
//  Copyright © 2018 Francesco Fuscaldo All rights reserved.

import UIKit
import ARKit

class ViewController: UIViewController {
    
    // Outlets declaration
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    //Counter to disable the buttons
    var counter: Bool = false
    
    // Declaring configuration of AR
    let configuration = ARWorldTrackingConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Pinch recognizer
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(scalePiece))
        sceneView.addGestureRecognizer(pinchGestureRecognizer)

        // Customizing buttons
        addButton.layer.cornerRadius = 10
        addButton.backgroundColor = UIColor.black
        addButton.setTitleColor(UIColor.white, for: .normal)
        
        resetButton.layer.cornerRadius = 10
        resetButton.backgroundColor = UIColor.black
        resetButton.setTitleColor(UIColor.white, for: .normal)
        
        // Scene configuration
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        
        // Debug options
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
    }

    // Declaring functions
    
    //To add the solar system
    @IBAction func add(_ sender: Any) {
        
        let blaBla: String = "Cacca"
        print("\(blaBla)")

        //To change counter value
        counter = true
        
        //Declaring all the nodes
        //Declaring planets
        let earth = addPlanet(geometry: SCNSphere(radius: 0.2), diffuse: #imageLiteral(resourceName: "earth day"), specular: #imageLiteral(resourceName: "Land"), emission: nil, position: SCNVector3(2, 0, 0))
        earth.geometry?.firstMaterial?.normal.contents = #imageLiteral(resourceName: "earth details")
        let cloudNode = addPlanet(geometry: SCNSphere(radius: 0.203), diffuse: #imageLiteral(resourceName: "clouds"), specular: nil, emission: nil, position: SCNVector3(2, 0, 0))
        let sunN = addPlanet(geometry: SCNSphere(radius: 0.5), diffuse: #imageLiteral(resourceName: "sun"), specular: nil, emission: nil, position: SCNVector3(0, 0, -1))
        let mercuryN = addPlanet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "mercury"), specular: nil, emission: nil, position: SCNVector3(0.9, 0, 0))
        let venusN = addPlanet(geometry: SCNSphere(radius: 0.15), diffuse: #imageLiteral(resourceName: "venus_surface"), specular: nil, emission: #imageLiteral(resourceName: "venus_atmosphere"), position: SCNVector3(1.4, 0, 0))
        let marsN = addPlanet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "mars"), specular: nil, emission: nil, position: SCNVector3(2.7, 0, 0))
        let jupiterN = addPlanet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "jupiter"), specular: nil, emission: nil, position: SCNVector3(3.6, 0, 0))
        let saturnN = addPlanet(geometry: SCNSphere(radius: 0.25), diffuse: #imageLiteral(resourceName: "saturn"), specular: nil, emission: nil, position: SCNVector3(5.1, 0, 0))
        let uranusN = addPlanet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "uranus"), specular: nil, emission: nil, position: SCNVector3(5.9, 0, 0))
        let neptuneN = addPlanet(geometry: SCNSphere(radius: 0.07), diffuse: #imageLiteral(resourceName: "neptune"), specular: nil, emission: nil, position: SCNVector3(6.4, 0, 0))
        let rotation: CGFloat = (CGFloat(360.degreesToRad))
        
        //Moons and stuff
        let moonP = addPlanet(geometry: SCNSphere(radius: 0.03), diffuse: #imageLiteral(resourceName: "moon"), specular: nil, emission: nil, position: SCNVector3(0.35, 0, 0))
        let saturnRings = addPlanet(geometry: SCNTube(innerRadius: 0.3, outerRadius: 0.5, height: 0.01), diffuse: #imageLiteral(resourceName: "saturn_ring+alpha"), specular: nil, emission: nil, position: SCNVector3(0, 0, 0))
        let ioMoon = addPlanet(geometry: SCNSphere(radius: 0.04), diffuse: #imageLiteral(resourceName: "io"), specular: nil, emission: nil, position: SCNVector3(0.37, 0, -0.1))
        let calistoMoon = addPlanet(geometry: SCNSphere(radius: 0.035), diffuse: #imageLiteral(resourceName: "calisto"), specular: nil, emission: nil, position: SCNVector3(0.35, 0.1, 0))
        calistoMoon.geometry?.firstMaterial?.normal.contents = #imageLiteral(resourceName: "calisto-normal")
        let europaMoon = addPlanet(geometry: SCNSphere(radius: 0.02), diffuse: #imageLiteral(resourceName: "europa"), specular: nil, emission: nil, position: SCNVector3(0.40, 0, -0.18))
        let ganymedeMoon = addPlanet(geometry: SCNSphere(radius: 0.05), diffuse: #imageLiteral(resourceName: "ganymede"), specular: nil, emission: nil, position: SCNVector3(0.435, 0, 0.1))
        
        //Nodes to make possible the orbits
        let EN = addPlanet(geometry: SCNSphere(radius: 0.2), diffuse:nil, specular: nil, emission: nil, position: SCNVector3(0, 0, -1))
        let MeN = addPlanet(geometry: SCNSphere(radius: 0.2), diffuse:nil, specular: nil, emission: nil, position: SCNVector3(0, 0, -1))
        let VN = addPlanet(geometry: SCNSphere(radius: 0.2), diffuse:nil, specular: nil, emission: nil, position: SCNVector3(0, 0, -1))
        let MaN = addPlanet(geometry: SCNSphere(radius: 0.2), diffuse:nil, specular: nil, emission: nil, position: SCNVector3(0, 0, -1))
        let JN = addPlanet(geometry: SCNSphere(radius: 0.2), diffuse:nil, specular: nil, emission: nil, position: SCNVector3(0, 0, -1))
        let SN = addPlanet(geometry: SCNSphere(radius: 0.2), diffuse:nil, specular: nil, emission: nil, position: SCNVector3(0, 0, -1))
        let UN = addPlanet(geometry: SCNSphere(radius: 0.2), diffuse:nil, specular: nil, emission: nil, position: SCNVector3(0, 0, -1))
        let NN = addPlanet(geometry: SCNSphere(radius: 0.2), diffuse:nil, specular: nil, emission: nil, position: SCNVector3(0, 0, -1))
        

        //To create actions for the nodes
        let ani = rotate(x: 0, y: rotation, z: 0, duration: 180)
        
        let aniCloud = rotate(x: 0, y: rotation, z: 0, duration: 12)
        let aniMoon = rotateAround(by: rotation, around: earth, duration: 8)
        let aniEarth = rotate(x: 0, y: rotation, z: 0, duration: 8)
        let ENA = rotate(x: 0, y: rotation, z: 0, duration: 150)
        
        let aniMercury = rotate(x: 0, y: rotation, z: 0, duration: 170)
        let MNA = rotate(x: 0, y: rotation, z: 0, duration: 55)
       
        let aniVenus = rotate(x: 0, y: rotation, z: 0, duration: 920)
        let VNA = rotate(x: 0, y: rotation, z: 0, duration: 118)
        
        let aniMars = rotate(x: 0, y: rotation, z: 0, duration: 8)
        let MaNA = rotate(x: 0, y: rotation, z: 0, duration: 300)
        
        let aniJupiter = rotate(x: 0, y: rotation, z: 0, duration: 8)
        let JNA = rotate(x: 0, y: rotation, z: 0, duration: 750)
        
        let aniSaturn = rotate(x: 0, y: rotation, z: 0, duration: 8)
        let SNA = rotate(x: 0, y: rotation, z: 0, duration: 1250)
        
        let aniUranus = rotate(x: 0, y: rotation, z: 0, duration: 12)
        let UNA = rotate(x: 0, y: rotation, z: 0, duration: 2250)
        
        let aniNeptune = rotate(x: 0, y: rotation, z: 0, duration: 104)
        let NNA = rotate(x: 0, y: rotation, z: 0, duration: 4250)
        

        //Apply actions to nodes
        //Earth
        runActionPer(planetToAnimate: earth, animations: [aniEarth])
        EN.runAction(ENA)
        cloudNode.runAction(aniCloud)
        earth.addChildNode(moonP)
        EN.addChildNode(earth)
        EN.addChildNode(cloudNode)
        
        //Moons
        runActionPer(planetToAnimate: moonP, animations: [ani, aniMoon])
        ioMoon.runAction(aniMoon)
        ganymedeMoon.runAction(aniMoon)
        europaMoon.runAction(aniMoon)
        calistoMoon.runAction(aniMoon)
        
        //Sun
        sunN.runAction(ani)
        addChild(node: self.sceneView.scene.rootNode, children: [EN, sunN, MeN, VN, JN, MaN, SN, UN, NN])
        
        
        //Mercury
        MeN.addChildNode(mercuryN)
        MeN.runAction(MNA)
        runActionPer(planetToAnimate: mercuryN, animations: [aniMercury])
        
        //Venus
        VN.addChildNode(venusN)
        VN.runAction(VNA)
        runActionPer(planetToAnimate: venusN, animations: [aniVenus])
        
        //Mars
        MaN.addChildNode(marsN)
        MaN.runAction(MaNA)
        runActionPer(planetToAnimate: marsN, animations: [aniMars])
        
        //Jupiter
        JN.addChildNode(jupiterN)
        JN.runAction(JNA)
        runActionPer(planetToAnimate: jupiterN, animations: [aniJupiter])
        addChild(node: jupiterN, children: [ioMoon, europaMoon, calistoMoon, ganymedeMoon])
        
        //Saturn
        SN.addChildNode(saturnN)
        SN.runAction(SNA)
        runActionPer(planetToAnimate: saturnN, animations: [aniSaturn])
        saturnN.addChildNode(saturnRings)
        
        //Uran
        UN.addChildNode(uranusN)
        UN.runAction(UNA)
        runActionPer(planetToAnimate: uranusN, animations: [aniUranus])
        
        //Neptune
        NN.addChildNode(neptuneN)
        NN.runAction(NNA)
        runActionPer(planetToAnimate: neptuneN, animations: [aniNeptune])
        
        controlCounter()
    }
    
    //To reset the position of the nodes
    @IBAction func reset(_ sender: Any) {
        //To change counter value
        counter = false
        restartSession()
        controlCounter()
    }
    
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    
    //func to make create the planets
    func addPlanet(geometry: SCNGeometry, diffuse: UIImage?, specular: UIImage?, emission: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.position = position
        return planet
    }
    
    //func to add child nodes
    func addChild(node: SCNNode, children: [SCNNode]) {
        for child in children {
            node.addChildNode(child)
        }
    }
    
    //func to rotate on axis
    func rotate(x: CGFloat, y: CGFloat, z: CGFloat, duration: TimeInterval) -> SCNAction {
        let action = SCNAction.rotateBy(x: x, y: y, z: z, duration: duration)
        let actionD = SCNAction.repeatForever(action)
        return actionD
    }
    
    //func to rotate around a position
    func rotateAround(by: CGFloat, around: SCNNode, duration: TimeInterval) -> SCNAction {
        let action = SCNAction.rotate(by: by, around: around.position, duration: duration)
        let actionD = SCNAction.repeatForever(action)
        return actionD
    }
    
    //func to apply the actions
    func runActionPer(planetToAnimate: SCNNode, animations: [SCNAction]) {
        for animation in animations {
            planetToAnimate.runAction(animation)
        }
    }
    
    //Func to disable di buttons
    func controlCounter() {
       if counter == true {
            addButton.isEnabled = false
        } else {
            addButton.isEnabled = true
        }
    }
    
    @objc func scalePiece(sender : UIPinchGestureRecognizer) {
            let node = self.sceneView.scene.rootNode
            let pinchAction = SCNAction.scale(by: sender.scale, duration: 0)
            node.runAction(pinchAction)
            sender.scale = 1.0
            print(sender.scale)
        }
}


//to convert degrees in radiant
extension Int {
    var degreesToRad: Double { return Double(self) * .pi/180}
}

//
//    func randomNumber(firstNumber: CGFloat, secondNumber: CGFloat) -> CGFloat {
//
//        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNumber - secondNumber) + min(firstNumber, secondNumber)
//
//    }

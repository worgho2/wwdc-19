/*:
 # HELLO! It`s about 60 seconds of visual effects
 */
//:
//#-hidden-code
import PlaygroundSupport
import SpriteKit

public class GameScene: SKScene {
    
    private var labelNode: SKNode!
    
    private var label: SKLabelNode!
    private var label2: SKLabelNode!
    private var label3: SKLabelNode!
    private var label_1: SKLabelNode!
    private var label_2: SKLabelNode!
    private var label_3: SKLabelNode!
    private var label_4: SKLabelNode!
    private var label_5: SKLabelNode!
    
    private var added: Bool = false
    private var stopped: Bool = false
    private var color: Bool = false
    private var finished: Bool = false
    
    
    private var vertVel = 0.0
    private var vert = 0
    private var horiVel = 0.0
    private var hori = 0
    
    private func setText (text: String) { self.label.text = text }
    private func setTextColor (fontColor: UIColor) { self.label.fontColor = fontColor }
    private func setTextFont (fontName: String) { self.label.fontName = fontName }
    private func setTextSize (fontSize: CGFloat) { self.label.fontSize = fontSize }
    private func setBackgroundColor (color: UIColor) { scene?.backgroundColor = color }
    
    override public func didMove(to view: SKView) {
        
        labelNode = childNode(withName: "//labelNode")
        
        label = labelNode.childNode(withName: "//label") as? SKLabelNode
        label2 = childNode(withName: "//label2") as? SKLabelNode
        label3 = childNode(withName: "//label3") as? SKLabelNode
        label_1 = childNode(withName: "//label_1") as? SKLabelNode
        label_2 = childNode(withName: "//label_2") as? SKLabelNode
        label_3 = childNode(withName: "//label_3") as? SKLabelNode
        label_4 = childNode(withName: "//label_4") as? SKLabelNode
        label_5 = childNode(withName: "//label_5") as? SKLabelNode
        
        label2.alpha = 0
        label3.alpha = 0
        label_1.alpha = 0
        label_2.alpha = 0
        label_3.alpha = 0
        label_4.alpha = 0
        label_5.alpha = 0
        
        setTextFont(fontName: "Optima Bold")
        setTextSize(fontSize: 96)
        setBackgroundColor(color: UIColor.black)
        setTextColor(fontColor: UIColor.white)
//#-end-hidden-code
/*:
 
 * Callout(Type your nickname plus one emoji):
 For better visual effects, use no more than 6 letters!
*/
//setText(text: "nickname⭐️")
setText(text: /*#-editable-code type your nickname here*/"sss"/*#-end-editable-code*/)

//#-hidden-code
        label2.text = "🇱🇷  🇧🇷"
        label2.fontSize = 100
        
        label3.text = "🕛"
        label3.fontSize = 65
    }
    
    func touchDown(atPoint pos : CGPoint) {
        self.color = !self.color
        self.label.run(SKAction.scale(to: 1.5, duration: 0.2))
        
        hori = Int.random(in: -179...179)
        vert = Int.random(in: -128...128)

        vertVel = Double.random(in: 0.5...2)
        horiVel = Double.random(in: 0.5...2)
        
        self.label.run(SKAction.moveTo(x: CGFloat(hori), duration: horiVel))
        self.label.run(SKAction.moveTo(y: CGFloat(vert), duration: vertVel))
        
//        switch hori {
//        case 0:
//            self.label.horizontalAlignmentMode = .center
//        case 1:
//            self.label.horizontalAlignmentMode = .left
//        default:
//            self.label.horizontalAlignmentMode = .right
//        }
//
//        switch vert {
//        case 0:
//            self.label.verticalAlignmentMode = .baseline
//        case 1:
//            self.label.verticalAlignmentMode = .bottom
//        case 2:
//            self.label.verticalAlignmentMode = .center
//        default:
//            self.label.verticalAlignmentMode = .top
//        }
        
        
        self.scene?.run(SKAction.playSoundFileNamed("bop3.mp3", waitForCompletion: true))
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        self.label.run(SKAction.scale(to: 1.0, duration: 0.1))
        self.label.run(SKAction.colorize(with: UIColor.white, colorBlendFactor: 1, duration: 5))
        self.color = !self.color
    }
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    
    func stopRotation () {
        Timer.scheduledTimer(withTimeInterval: 16, repeats: false, block: {(timer) in
            self.label_1.text = "Enjoy"
            self.label_1.run(SKAction.fadeIn(withDuration: 2))
        })
        Timer.scheduledTimer(withTimeInterval: 17, repeats: false, block: {(timer) in
            self.label_1.run(SKAction.fadeOut(withDuration: 2))
        })
        Timer.scheduledTimer(withTimeInterval: 59, repeats: false, block: {(timer) in
            self.label.run(SKAction.fadeAlpha(to: 0.4, duration: 2))
            self.label.run(SKAction.scale(to: 0.5, duration: 2))
        })
        Timer.scheduledTimer(withTimeInterval: 60, repeats: false, block: {(timer) in
            self.label_1.text = "Did you like it?"
            self.label_1.run(SKAction.fadeIn(withDuration: 1))
            self.label_2.run(SKAction.fadeIn(withDuration: 1))
            self.label_3.run(SKAction.fadeIn(withDuration: 2))
            self.label_4.run(SKAction.fadeIn(withDuration: 2))
            self.label_5.run(SKAction.fadeIn(withDuration: 3))
            self.endChapter()
        })
    }
    
    func endChapter () {
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false, block: {(timer) in
            self.label_1.run(SKAction.fadeOut(withDuration: 1))
            self.label_2.run(SKAction.fadeOut(withDuration: 2))
            self.label_3.run(SKAction.fadeOut(withDuration: 3))
            self.label_4.run(SKAction.fadeOut(withDuration: 4))
            self.label_5.run(SKAction.fadeOut(withDuration: 5))
            
            self.label.run(SKAction.fadeAlpha(to: 1, duration: 3))
            self.label.run(SKAction.scale(to: 1.5, duration: 3))
            self.addOthers()
        })
    }
    
    func addOthers () {
        self.added = !self.added
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {(timer) in
            self.label.run(SKAction.fadeAlpha(to: 0.8, duration: 1))
            self.label2.run(SKAction.fadeAlpha(to: 0.3, duration: 2))
            self.label3.run(SKAction.fadeAlpha(to: 0.35, duration: 4))
            self.finish()
        })
    }
    
    func finish () {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {(timer) in
            self.label.run(SKAction.scale(to: 10, duration: 15))
        })
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: {(timer) in
            self.label_2.text = "Now it`s your turn!"
            self.label_3.text = "★"
            self.label_3.run(SKAction.scale(to: 1.5, duration: 3))
            self.label_2.run(SKAction.fadeIn(withDuration: 5))
            self.label_3.run(SKAction.fadeIn(withDuration: 7))
            self.finished = !self.finished
        })
        self.label.run(SKAction.fadeOut(withDuration: 5))
        self.label2.run(SKAction.fadeOut(withDuration: 6))
        self.label3.run(SKAction.fadeOut(withDuration: 7))
    }
    
    override public func update(_ currentTime: TimeInterval) {
        if !self.finished {
            if !self.stopped {
                self.stopRotation()
                self.stopped = !self.stopped
                self.scene?.run(SKAction.playSoundFileNamed("bensound-house.mp3", waitForCompletion: true))
            }
            if self.added {
                self.label2.run(SKAction.rotate(byAngle: 5, duration: 60))
                self.label3.run(SKAction.rotate(byAngle: 0.09, duration: 2))
            }
            if self.color {
                self.label.run(SKAction.colorize(with: UIColor(red: .random(in: 0...1),
                                                               green: .random(in: 0...1),
                                                               blue: .random(in: 0...1),
                                                               alpha: 1.0), colorBlendFactor: 0.5, duration: 0.02))
            }
        } else {
            self.label_3.run(SKAction.colorize(with: UIColor(red: .random(in: 0...1),
                                                             green: .random(in: 0...1),
                                                             blue: .random(in: 0...1),
                                                             alpha: 1.0), colorBlendFactor: 1, duration: 0.1))
        }
        self.label.run(SKAction.rotate(byAngle: 2.3, duration: 60))
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 512, height: 768))
if let scene = GameScene(fileNamed: "GameScene") {
    scene.scaleMode = .aspectFill
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//#-end-hidden-code
/*:
 **It`s time to create your own!** [LABORATORY](@next)
*/


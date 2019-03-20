/*:
 # HELLO! It`s about 60 seconds of visual effects
*/
//:
//#-hidden-code
import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
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

    private func setText (text: String) { self.label.text = text }
    private func setTextColor (fontColor: UIColor) { self.label.fontColor = fontColor }
    private func setTextFont (fontName: String) { self.label.fontName = fontName }
    private func setTextSize (fontSize: CGFloat) { self.label.fontSize = fontSize }
    private func setBackgroundColor (color: UIColor) { scene?.backgroundColor = color }

    override func didMove(to view: SKView) {
        
        label = childNode(withName: "//label") as? SKLabelNode
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
        
        setTextFont(fontName: "Optima")
        setTextSize(fontSize: 96)
        setBackgroundColor(color: UIColor.black)
        setTextColor(fontColor: UIColor.white)
//#-end-hidden-code
/*:

* Callout(Type your nickname plus one emoji):
For better visual effects, use no more than 6 letters!
*/
        //setText(text: "nickname⭐️")
        setText(text: /*#-editable-code type your nickname here*/"🀀❖✰"/*#-end-editable-code*/)
    
//#-hidden-code
        label2.text = "🇱🇷  🇧🇷"
        label2.color = UIColor.green
        label2.fontSize = 100
        
        label3.text = "🕛"
        label2.color = UIColor.red
        label3.fontSize = 65
    }
 
    func stopRotation () {
        Timer.scheduledTimer(withTimeInterval: 6, repeats: false, block: {(timer) in
            self.label_1.text = "Enjoy"
            self.label_1.run(SKAction.fadeIn(withDuration: 2))
        })
        Timer.scheduledTimer(withTimeInterval: 7, repeats: false, block: {(timer) in
            self.color = !self.color
            self.label_1.run(SKAction.fadeOut(withDuration: 2))
        })
        Timer.scheduledTimer(withTimeInterval: 29, repeats: false, block: {(timer) in
            self.label.run(SKAction.fadeAlpha(to: 0.4, duration: 2))
            self.label.run(SKAction.scale(to: 0.5, duration: 2))
        })
        Timer.scheduledTimer(withTimeInterval: 30, repeats: false, block: {(timer) in
            self.label_1.text = "Did you liked?"
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
            self.label_2.text = "Now is your time!"
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
    
    override func update(_ currentTime: TimeInterval) {
        if !self.finished {
            if !self.stopped {
                self.stopRotation()
                self.stopped = !self.stopped
            }
            if self.added {
                self.label2.run(SKAction.rotate(byAngle: 5, duration: 60))
                self.label3.run(SKAction.rotate(byAngle: 0.09, duration: 2))
            }
            if self.color {
                self.label.run(SKAction.colorize(with: UIColor(red: .random(in: 0...1),
                                                               green: .random(in: 0...1),
                                                               blue: .random(in: 0...1),
                                                               alpha: 1.0), colorBlendFactor: 0.3, duration: 0.02))
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

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1024, height: 768))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//#-end-hidden-code
/*:
**It`s time to create your own!** [LABORATORY](@next)
*/

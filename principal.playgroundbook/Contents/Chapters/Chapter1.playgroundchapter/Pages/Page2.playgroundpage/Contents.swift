/*:
 # THE LABORATORY
 Here you can customize your experience as you like
 */
//#-hidden-code
import PlaygroundSupport
import SpriteKit

public class Spitro : SKNode {

    private var label = SKLabelNode()
    
    private var horizontalPos: Double = 0.0
    private var verticalPos: Double = 0.0
    
    private var rotationSpeed: CGFloat = 0.0
    private var orbitalSpeed: CGFloat = 0.0
    
    private var allowColorChange: Bool = true
    private var blendFactor: CGFloat = 0.0
    
    convenience init(fontColor: UIColor, text: String, textFont: String, transparency: CGFloat, textFontSize: CGFloat, rotationSpeed: CGFloat, orbitalSpeed: CGFloat, allowColorChange: Bool, blendFactor: CGFloat) {
        self.init()
        addChild(label)
        
        label.text = text
        label.fontName = textFont
        label.alpha = transparency
        label.fontSize = textFontSize
        label.fontColor = fontColor
        label.alpha = 1.0
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        
        self.blendFactor = blendFactor
        self.allowColorChange = allowColorChange
        self.orbitalSpeed = orbitalSpeed
        self.rotationSpeed = rotationSpeed
    }
    
    //rotate the spitro
    public func rotate() {
        self.label.run(SKAction.rotate(byAngle: self.speed, duration: 80))
        run(SKAction.rotate(byAngle: self.orbitalSpeed, duration: 80))
    }
    
    //generate random points
    public func getHorizontalPos() -> CGFloat { return CGFloat.random(in: -216...216) }
    public func getVerticalPos() -> CGFloat { return CGFloat.random(in: -344...344) }
    
    public func touchDown() {
        //scale up -> scale down -> return to white
        self.label.run(SKAction.sequence([.scale(to: 1.5, duration: 0.2), .scale(to: 1.0, duration: 0.1), .wait(forDuration: 3), .colorize(with: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), colorBlendFactor: 1.0, duration: .random(in: 1...5))]))
        
        //labelNode and labe random movement
        run(SKAction.moveTo(x: (self.getHorizontalPos()), duration: .random(in: 0.5...1)))
        run(SKAction.moveTo(y: (self.getVerticalPos()), duration: .random(in: 0.5...1)))
        self.label.run(SKAction.moveTo(x: self.getHorizontalPos()/6, duration: .random(in: 0.5...1)))
        self.label.run(SKAction.moveTo(y: self.getVerticalPos()/6, duration: .random(in: 0.5...1)))
    }

    public func touchMoved() {
        self.label.run(SKAction.colorize(with: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), colorBlendFactor: 1.0, duration: .random(in: 1...5)))
        self.label.run(SKAction.moveTo(x: 0, duration: 1.5))
        self.label.run(SKAction.moveTo(y: 0, duration: 1.5))
    }
    
    public func touchUp() {
        self.label.run(SKAction.colorize(with: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), colorBlendFactor: 1.0, duration: .random(in: 1...5)))
    }
    
    public func changeColor() {
        if self.allowColorChange {
            self.label.run(SKAction.colorize(with: UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0), colorBlendFactor: self.blendFactor, duration: 0.02))
        }
    }
    
    public func fadeOutIn() {
        self.label.run(SKAction.sequence([.fadeOut(withDuration: 0.1), .fadeIn(withDuration: 3)]))
    }
}



public class GameScene: SKScene {
    
    private var spitros = [Spitro]()
    
    private var canChangeColor: Bool = false
    private var canPlaySong: Bool = true
    
    private var numberOfSpitros: Int = 0

    override public func didMove(to view: SKView) {
//#-end-hidden-code
/*:
* Callout(You can try some examples too):
But creating is more exciting!
         
*/

//Number of spitros
numberOfSpitros = /*#-editable-code Number Of Spitros*/5/*#-end-editable-code*/
//#-hidden-code
    }
    
    func touchDown(atPoint pos : CGPoint) {
        self.scene?.run(SKAction.playSoundFileNamed("bop3.mp3", waitForCompletion: true))
        if spitros.count <= self.numberOfSpitros {
//#-end-hidden-code
//Preferences
let newSpitro =
Spitro(fontColor: /*#-editable-code Text Color*/#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)/*#-end-editable-code*/,
text: /*#-editable-code type Text Seed*/"🎒🕸🌎℞"/*#-end-editable-code*/,
textFont: /*#-editable-code Text Font*/"Optima"/*#-end-editable-code*/,
transparency: /*#-editable-code Font Transparency*/1.0/*#-end-editable-code*/,
textFontSize: /*#-editable-code Font Size*/60/*#-end-editable-code*/,
rotationSpeed: /*#-editable-code Spitro Rotation Speed*/5/*#-end-editable-code*/,
orbitalSpeed: /*#-editable-code Spitros's orbital*/8/*#-end-editable-code*/,
allowColorChange: /*#-editable-code type your nickname here*/true/*#-end-editable-code*/,
blendFactor: /*#-editable-code type your nickname here*/0.9/*#-end-editable-code*/)
//#-hidden-code
            newSpitro.position = pos
            addChild(newSpitro)
            spitros.append(newSpitro)
        }
        
        self.canChangeColor = true
        for i in spitros { i.touchDown() }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        for i in spitros { i.touchMoved() }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        self.canChangeColor = !self.canChangeColor
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
    
    override public func update(_ currentTime: TimeInterval) {
        if self.canPlaySong {
            self.scene?.run(SKAction.playSoundFileNamed("bensound-house.mp3", waitForCompletion: true)) //Royalty Free Music from Bensound
            self.canPlaySong = !self.canPlaySong
        }
        
        if self.canChangeColor { for i in spitros { i.changeColor() } }
        
        for i in spitros { i.rotate() }
    
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 512, height: 768))
if let scene = GameScene(fileNamed: "GameScene") {
    scene.scaleMode = .aspectFill
    sceneView.presentScene(scene)
}
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//#-end-hidden-code
//: **It`s All**


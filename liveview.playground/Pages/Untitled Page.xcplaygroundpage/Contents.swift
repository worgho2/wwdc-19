import PlaygroundSupport
import SpriteKit

class GameScene: SKScene {
    
    private var label1 = SKLabelNode()
    private var label2 = SKLabelNode()
    
    /*public override init() {
        super.init()
    }
    
    public override required init(coder: NSCoder) {
        super.init(coder: NSCoder)
    }*/
    
    override func didMove(to view: SKView) {
        //linking var and labels
        
        
        label1.verticalAlignmentMode = .center
        //starting elements
        label1.position = CGPoint(x: 229, y: 384)
        label1.text = "Spitr"
        label1.fontSize = 100
        label1.fontColor = UIColor.white
        label1.fontName = "Optima Regular"
        label1.color = UIColor.black
        self.addChild(label1)
        
        label2.position = CGPoint(x:352, y:384)
        label2.text = "o"
        label2.fontSize = 100
        label2.fontColor = UIColor.white
        label2.fontName = "Optima Regular"
        label2.color = UIColor.black
        label2.verticalAlignmentMode = .center
        self.addChild(label2)
        
        self.backgroundColor = UIColor.black
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.label2.run(SKAction.rotate(byAngle: 5, duration: 60))
        self.label2.run(SKAction.colorize(with: UIColor(red: .random(in: 0...1),
                                                       green: .random(in: 0...1),
                                                       blue: .random(in: 0...1),
                                                       alpha: 1.0), colorBlendFactor: 0.4, duration: 0.02))
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 512, height: 768))
let scene = GameScene(size: CGSize(width: 512, height: 768))
sceneView.presentScene(scene)
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

/*:
 # Seu código bonito
 
 Adiciona texto bonito
 
 Seu código vai abaixo
 
 */

//#-hidden-code
import PlaygroundSupport
import UIKit

//Seu código da página aqui

//Exemplo para aparecer uma view vermelha na tela
class MinhaController: UIViewController {
    
    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 512, height: 768))
        view.backgroundColor = .red
        
        //Codigo de interface vai aqui
        
        let label = UILabel()
        label.frame = CGRect(x: 512/2, y: 200, width: 200, height: 20)
        label.center = view.center
        label.text = "Hello World!"
        label.textAlignment = .center
        label.textColor = .black
        
        view.addSubview(label) //Adiciona a label na view principal: IMPORTANTE!
        
        self.view = view
    }
}

let controller : UIViewController = MinhaController()
controller.preferredContentSize = CGSize(width: 512, height: 768) //Tamanho da tela, coloquei metade do iPad em largura
PlaygroundPage.current.liveView = controller
PlaygroundPage.current.needsIndefiniteExecution = true

//#-end-hidden-code



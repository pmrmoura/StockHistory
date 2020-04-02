/*:
 # Introdução
 
 Bem vindo! O Stock History é um playground
 que tem como objetivo demonstrar como as
 crises mundiais influenciam na subida ou
 queda da bolsa de valores.
 
 
 # Funcionamento
 
 
 Cada botão representa uma crise mundial da história recente. Quando clicados, um gráfico aparecerá, mostrando como a bolsa de valores estava antes daquele período, durante e depois, apresentando também fato histórico sobre a crise.
 
 
 # Vamos começar!
 
 
 Clique em um dos botões ao lado e comece a experiência do Stock History :)
 
 */

import UIKit
import PlaygroundSupport

public class IntroViewController : UIViewController {
    public override func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.18, green:0.18, blue:0.28, alpha:1.00)
        
        self.view = view
        
        renderCuriosityLabel()
        
        let crises = ["crise de 29", "2008", "2ss", "w2w2w", "dede", "dedede", "dedfvgr", "dwefg"]
        
        for (index, crise) in crises.enumerated(){
            renderButtons(name: crise, index: index)
        }
        
    }
    
    @objc func buttonAction (sender: UIButton!) {
        sender.setTitle("Clicou na crise", for: .normal)
    }
    
    func renderButtons(name: String, index: Int) {
        let button = UIButton()
        var y = 650
        var x = 120 * index + 10 + index * 10
        if (x == 660) {
            x = 10
            y = 800
        }
        
        if (index > 4) {
            y = 800
            x = (120 * (index % 5)) + 10 + ((index % 5) * 10)
        }
        
        button.frame = CGRect(x: x, y: y, width: 120, height: 120)
        button.setTitle(name, for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.backgroundColor = UIColor(red:0.83, green:0.82, blue:0.89, alpha:1.00)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.borderWidth = 1.0
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func renderCuriosityLabel() {
        let label = UILabel()
        label.frame = CGRect(x: 250, y: 100, width: 200, height: 20)
        label.text = "Curiosidade sobre a crise"
        label.textColor = .white
        view.addSubview(label)
    }
}

let mvc = IntroViewController()
PlaygroundPage.current.liveView = mvc






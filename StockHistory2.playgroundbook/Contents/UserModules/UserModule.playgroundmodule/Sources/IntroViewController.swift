


import UIKit
import PlaygroundSupport
import WebKit


public class IntroViewController : UIViewController {
    var crysesNameLabel: UILabel = UILabel()
    var curiosityLabel: UILabel = UILabel()
    
    var selectedButton: UIButton? = nil

    let webview = WKWebView()
    
    public override func viewDidLoad() {
        let view = UIView()
        view.backgroundColor = .black
        
        self.view = view
        
        self.view.addSubview(crysesNameLabel)
        self.view.addSubview(curiosityLabel)
        
        self.addCryses()
        
        for (index, crise) in crises.enumerated(){
            self.renderButtons(name: crise.key, index: index)
        }
    }
    
    @objc func buttonAction (sender: UIButton!) {
        self.loadChart(cryse: sender.titleLabel?.text ?? "")
        renderChart()
        let lightGreen = UIColor(red:0.14, green:1.00, blue:0.52, alpha:1.00)
        
        if (selectedButton != nil) {
            selectedButton?.backgroundColor = UIColor(red:0.83, green:0.82, blue:0.89, alpha:1.00)
        }
        
        sender.backgroundColor = lightGreen
        
        selectedButton = sender
        
        let curiosity = crises[sender.titleLabel?.text ?? ""]
        
        renderCrysesLabels(crysesName: sender?.titleLabel?.text ?? "", crysesCuriosity: curiosity?.curiosity ?? "")
        
        var chart = UIImage(named: "chart")
        
        var chartView: UIImageView = UIImageView()
        
        chartView.frame = CGRect(x:300, y: 300, width: 600, height: 300)
        
        chartView.image = chart
        
        view.addSubview(chartView)
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
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.font = UIFont(name: "Raleway", size: 17)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.allowsDefaultTighteningForTruncation = true
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        button.showsTouchWhenHighlighted = true
        button.frame = CGRect(x: x, y: y, width: 120, height: 120)
        button.setTitle(name, for: UIControl.State.normal)
        button.setTitleColor(.black, for: UIControl.State.normal)
        button.backgroundColor = UIColor(red:0.83, green:0.82, blue:0.89, alpha:1.00)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.layer.borderWidth = 4.0
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func renderCrysesLabels(crysesName: String, crysesCuriosity: String) {
        self.crysesNameLabel.frame = CGRect(x:10, y:50, width: 400, height: 40)
        self.crysesNameLabel.text = crysesName
        self.crysesNameLabel.font = UIFont(name: "Raleway", size: 30)
        self.crysesNameLabel.textColor = .white
        
        self.curiosityLabel.numberOfLines = 0
        self.curiosityLabel.lineBreakMode = .byWordWrapping
        self.curiosityLabel.adjustsFontSizeToFitWidth = true
        self.curiosityLabel.frame = CGRect(x: 10, y: 120, width: 600, height: 60)
        self.curiosityLabel.text = crysesCuriosity
        self.curiosityLabel.textColor = .white
        self.curiosityLabel.font = UIFont(name: "Raleway", size: 20)
    }
    
    func addCryses() {
        createCryseAddToArray(name: "Crise de 29", stockData: [0.0], curiosity: "A industria cafeeira foi muito afetada já que um dos maiores importadores eram os Estados Unidos")
        createCryseAddToArray(name: "Crise da Argentina", stockData: [0.0], curiosity: "O presidente na época anunciou em rede nacional a suspensão dos direitos constitucionais dos cidadãos")
        createCryseAddToArray(name: "Crise da XX", stockData: [0.0], curiosity: "A crise da lk foi inesperada em todo o mundo e causou danos que demorarão anos para voltar")
        createCryseAddToArray(name: "Crise da YY", stockData: [0.0], curiosity: "A crise da lk foi inesperada em todo o mundo e causou danos que demorarão anos para voltar")
        createCryseAddToArray(name: "Coronavirus", stockData: [0.0], curiosity: "O mundo foi surpreendido com um novo virus que deixou a maioria dos paises do mundo em quarentena")
        createCryseAddToArray(name: "EUA x Irã", stockData: [0.0], curiosity: "No inicio de 2020 o mundo ficou tenso com uma possível guerra do Irã vs Estados Unidos, investidores ficaram com medo")
        createCryseAddToArray(name: "Crise da KL", stockData: [0.0], curiosity: "A crise da lk foi inesperada em todo o mundo e causou danos que demorarão anos para voltar")
        createCryseAddToArray(name: "Crise da LK", stockData: [0.0], curiosity: "A crise da lk foi inesperada em todo o mundo e causou danos que demorarão anos para voltar")
        createCryseAddToArray(name: "Crise da IL", stockData: [0.0], curiosity: "A crise da IL foi inesperada em todo o mundo e causou danos que demorarão anos para voltar")
    }
    
    func loadChart(cryse: String) {
        let cryseChart = "chart" + cryse
        var url = Bundle.main.url(forResource: "chart", withExtension: "html")
        if (cryse == "Crise de 2008") {
            url = Bundle.main.url(forResource:"chart2008", withExtension: "html")
        }
        webview.isOpaque = false
        let request = URLRequest(url:url!)
        
        webview.load(request)
        
        webview.frame = CGRect(x:20, y: 250, width: 800, height: 300)
    }
    
    func renderChart() {
        self.view.addSubview(webview)
    }
}







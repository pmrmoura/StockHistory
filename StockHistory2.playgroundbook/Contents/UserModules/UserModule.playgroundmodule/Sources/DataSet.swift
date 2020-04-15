import Foundation

var crises: [String:Cryse] = ["Crise de 2008": Cryse(name: "Crise de 2008", stockData:[2.0], curiosity: "A crise de 2008 começou quando")]

class Cryse {
    var name: String
    var stockData: [Float]
    var curiosity: String
    
    init(name: String, stockData: [Float], curiosity: String) {
        self.name = name
        self.stockData = stockData
        self.curiosity = curiosity
    }
}

public func createCryseAddToArray(name:String, stockData:[Float], curiosity: String) {
    let cryse = Cryse(name: name, stockData:stockData, curiosity: curiosity)
    crises[cryse.name] = cryse
}

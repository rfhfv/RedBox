struct ProductDTO {
    let title: String
    let imageName: String
    let formattedPrice: String
    let price: Int
    let description: String
    
    init(from model: HeadphoneModel) {
        self.title = model.title
        self.imageName = model.image
        self.formattedPrice = "$\(model.price)"
        self.price = model.price
        self.description = model.description
    }
}

enum HeadphoneModel: String, CaseIterable {
    case airpods
    case beats
    case backbeat
    case vidnie
    case seven
    
    var image: String {
        switch self {
        case .airpods: return "Airpods"
        case .beats:  return "Beats Solo"
        case .backbeat: return "Plantronics"
        case .vidnie: return "Vidvie"
        case .seven:  return "X-Seven Wireless"
        }
    }
    
    var title: String {
        switch self {
        case .airpods: return "AirPods Max"
        case .beats:  return "Beats Solo 4"
        case .backbeat: return "Plantronics"
        case .vidnie: return "Vidvie"
        case .seven:  return "X-Seven Wireless"
        }
    }
    
    var price: Int {
        switch self {
        case .airpods: return 549
        case .beats:  return 322
        case .backbeat: return 469
        case .vidnie: return 380
        case .seven:  return 512
        }
    }
    
    var description: String {
        switch self {
        case .airpods: return "Премиальные полноразмерные наушники Apple с пространственным аудио и активным шумоподавлением в элегантном дизайне."
        case .beats:  return "Легкие беспроводные накладные наушники с фирменным звуком Beats и удобной складной конструкцией."
        case .backbeat: return "Классические полноразмерные наушники с отличным шумоподавлением и длительным временем автономной работы."
        case .vidnie: return "Бюджетные беспроводные наушники, предлагающие базовый функционал для повседневного использования."
        case .seven:  return "Стильные Bluetooth-наушники, ориентированные на комфорт и качественное звучание."
        }
    }
}

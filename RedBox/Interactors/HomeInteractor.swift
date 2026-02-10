final class HomeInteractor: HomeInteractorProtocol {
    func getProducts() -> [Product] {
        return [
            Product(image: "Airpods", title: "AirPods Max", price: "$549"),
            Product(image: "Airpods", title: "AirPods Max", price: "$549"),
            Product(image: "Airpods", title: "AirPods Max", price: "$549"),
            Product(image: "Airpods", title: "AirPods Max", price: "$549"),
            Product(image: "Airpods", title: "AirPods Max", price: "$549"),
        ]
    }
}

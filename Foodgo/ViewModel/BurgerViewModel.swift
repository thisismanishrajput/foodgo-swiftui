import Foundation

class BurgerViewModel: ObservableObject {
    @Published var burgers: [Burger] = []
    @Published var filteredBurgers: [Burger] = []
    @Published var selectedCategory: String = "All" {
        didSet {
            filterBurgers()
        }
    }

    init() {
        loadDummyData()
        filterBurgers()
    }

    private func loadDummyData() {
        burgers = [
            Burger(name: "Classic Beef Burger", type: "Wendy's Burger", imageName: "b1", rating: 4.9),
            Burger(name: "Cheese Delight", type: "Wendy's Burger", imageName: "b2", rating: 4.8),
            Burger(name: "Veggie Supreme", type: "Hamburger", imageName: "b3", rating: 4.7),
            Burger(name: "Spicy Chicken", type: "Hamburger", imageName: "b4", rating: 4.6),
            Burger(name: "Double Trouble", type: "Wendy's Burger", imageName: "burger1", rating: 4.9),
            Burger(name: "Ultimate Stack", type: "Hamburger", imageName: "burger2", rating: 4.8)
        ]
    }

    private func filterBurgers() {
        if selectedCategory == "All" {
            filteredBurgers = burgers
        } else {
            filteredBurgers = burgers.filter { $0.type.contains(selectedCategory) }
        }
    }
}

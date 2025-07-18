
import XCTest

// Modelo del producto
struct Product: Codable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let currency: String
    let in_stock: Bool
}

// Clase de utilidad para la lógica de presentación
class ProductListManager {
    static func canDisplay(products: [Product]) -> Bool {
        return !products.isEmpty
    }
}

// Clase de test unitario
class ProductListTests: XCTestCase {

    func testDisplayProductsWhenListIsNotEmpty() {
        let products = [
            Product(id: 1, name: "iPhone 13", description: "The latest iPhone from Apple", price: 999.99, currency: "USD", in_stock: true),
            Product(id: 2, name: "Samsung Galaxy S21", description: "The latest Samsung phone", price: 899.99, currency: "USD", in_stock: true)
        ]

        let canDisplay = ProductListManager.canDisplay(products: products)
        XCTAssertTrue(canDisplay, "El listado de productos debería poder mostrarse si contiene elementos.")
    }

    func testDoNotDisplayProductsWhenListIsEmpty() {
        let products: [Product] = []
        let canDisplay = ProductListManager.canDisplay(products: products)
        XCTAssertFalse(canDisplay, "El listado de productos no debería mostrarse si está vacío.")
    }
}

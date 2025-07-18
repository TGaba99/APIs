
import Foundation

// Definimos el modelo de producto
struct Product: Codable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let currency: String
    let in_stock: Bool
}

struct ProductsResponse: Codable {
    let products: [Product]
}

// Función para consultar la API y mostrar productos
func fetchProducts() {
    guard let url = URL(string: "https://jsonkeeper.com/b/MX0A") else {
        print("URL inválida")
        return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error al obtener datos: \(error.localizedDescription)")
            return
        }

        guard let data = data else {
            print("Datos vacíos")
            return
        }

        do {
            let decodedResponse = try JSONDecoder().decode(ProductsResponse.self, from: data)
            print("Listado de productos:")
            for product in decodedResponse.products {
                print("- \(product.name): \(product.price) \(product.currency)")
            }
        } catch {
            print("Error al parsear el JSON: \(error.localizedDescription)")
        }
    }

    task.resume()
}

// Llamamos la función
fetchProducts()

// Para mantener activa la consola (en entornos de script)
RunLoop.main.run()

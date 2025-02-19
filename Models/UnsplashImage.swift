import Foundation

struct UnsplashImage: Codable, Identifiable {
    let id: String
    let urls: ImageURLs
    let user: User
    let description: String?

    struct ImageURLs: Codable {
        let small: String
        let regular: String
    }

    struct User: Codable {
        let name: String
    }
}


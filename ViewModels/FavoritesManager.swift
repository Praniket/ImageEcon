import Foundation

class FavoritesManager: ObservableObject {
    @Published var favorites: [UnsplashImage] = []

    func toggleFavorite(image: UnsplashImage) {
        if favorites.contains(where: { $0.id == image.id }) {
            favorites.removeAll { $0.id == image.id }
        } else {
            favorites.append(image)
        }
    }

    func isFavorite(image: UnsplashImage) -> Bool {
        favorites.contains(where: { $0.id == image.id })
    }
}

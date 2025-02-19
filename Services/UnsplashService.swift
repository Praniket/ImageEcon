import Foundation

class UnsplashService: ObservableObject {
    @Published var images: [UnsplashImage] = []
    private let accessKey = "pXuz0JpJxntMyM4ECmGkPGit55Gtfq--rpEIKIqndms"

    func fetchImages(query: String = "nature") {
        let urlString = "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(accessKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }

            do {
                let result = try JSONDecoder().decode(SearchResult.self, from: data)
                DispatchQueue.main.async {
                    self.images = result.results
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }

    struct SearchResult: Codable {
        let results: [UnsplashImage]
    }
}

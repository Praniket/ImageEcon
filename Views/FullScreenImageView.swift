import SwiftUI

struct FullScreenImageView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    let image: UnsplashImage

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image.urls.regular)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            Text("Photo by \(image.user.name)")
                .font(.headline)
                .padding()

            Button(action: {
                favoritesManager.toggleFavorite(image: image)
            }) {
                Image(systemName: favoritesManager.isFavorite(image: image) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

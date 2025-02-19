import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        NavigationView {
            List {
                ForEach(favoritesManager.favorites) { image in
                    NavigationLink(destination: FullScreenImageView(image: image)) {
                        Text(image.user.name)
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

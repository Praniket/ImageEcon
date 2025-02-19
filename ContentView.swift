import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ImageGridView()
                .tabItem {
                    Label("Images", systemImage: "photo.on.rectangle.angled")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
        }
    }
}

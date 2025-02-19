import SwiftUI

struct ImageGridView: View {
    @StateObject private var unsplashService = UnsplashService()
    @State private var searchQuery = "nature"

    let columns = [GridItem(.adaptive(minimum: 150))]

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Images", text: $searchQuery, onCommit: {
                    unsplashService.fetchImages(query: searchQuery)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(unsplashService.images) { image in
                            NavigationLink(destination: FullScreenImageView(image: image)) {
                                AsyncImage(url: URL(string: image.urls.small)) { image in
                                    image.resizable().scaledToFill()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 150, height: 150)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Unsplash Images")
            .onAppear {
                unsplashService.fetchImages()
            }
        }
    }
}

import SwiftUI

struct FullScreenImageView: View {
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
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

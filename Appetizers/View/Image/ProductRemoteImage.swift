//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Max Soiferman on 9/10/23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func loadFromURLString(url: String) {
        NetworkManager.shared.downloadImage(url: url) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
            
        }
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct ProductRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let imageURL: String
 
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.loadFromURLString(url: imageURL )
            }
    }
    
}

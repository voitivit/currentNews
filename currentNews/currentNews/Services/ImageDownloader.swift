//
//  ImageDownloader.swift
//  currentNews
//
//  Created by Lewis on 21.06.2022.
//

import UIKit

struct ImageDownloader {
    
    private let imageDownloadQueue = DispatchQueue(label: "image.download.queue", qos: .userInitiated)
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(url: String, completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: url) else { return }
        imageDownloadQueue.async {
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return completion(nil) }
                DispatchQueue.main.async() {
                    guard let image = UIImage(data: data) else { return completion(nil) }
                    completion(image)
                }
            }
        }
    }
}

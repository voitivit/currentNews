//
//  ImageCache.swift
//  currentNews
//
//  Created by Lewis on 21.06.2022.
//

import UIKit

final class ImageCache {

    private init() {}

    static let shared = NSCache<NSString, UIImage>()
}

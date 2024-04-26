//
//  PostViewModel.swift
//  iOSTest
//
//  Created by Madhuri Yerudkar on 26/04/24.
//

import Foundation

class PostViewModel {
    private let apiService = APIService()
    private var currentPage = 1
    
    var posts: [Post] = []
    
    func fetchData(completion: @escaping (Error?) -> Void) {
        apiService.fetchData(page: currentPage) { [weak self] posts, error in
            if let posts = posts {
                self?.posts.append(contentsOf: posts)
                self?.currentPage += 1
                completion(nil)
            } else if let error = error {
                completion(error)
            }
        }
    }
}

//
//  APIService.swift
//  iOSTest
//
//  Created by Madhuri Yerudkar on 26/04/24.
//

import Foundation

class APIService {
    func fetchData(page: Int, completion: @escaping ([Post]?, Error?) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_page=\(page)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(posts, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}

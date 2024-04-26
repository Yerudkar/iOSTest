//
//  ViewController.swift
//  iOSTest
//
//  Created by Madhuri Yerudkar on 26/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = PostViewModel()
    var isFetching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()
    }
    
    func fetchData() {
        isFetching = true
        viewModel.fetchData { [weak self] error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.isFetching = false
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height && !isFetching {
            fetchData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let post = viewModel.posts[indexPath.row]
        cell.textLabel?.text = "\(post.id ?? 0) - \(post.title ?? "")"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = viewModel.posts[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: post)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let detailViewController = segue.destination as? DetailViewController, let post = sender as? Post {
            detailViewController.post = post
        }
    }
}

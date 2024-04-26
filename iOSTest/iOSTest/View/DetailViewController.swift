//
//  DetailViewController.swift
//  iOSTest
//
//  Created by Madhuri Yerudkar on 26/04/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let post = post {
            self.title = "ID: \(post.id ?? 0)"
            postIdLabel.text = "ID:  \(post.id ?? 0)"
            titleLabel.text = "Title:  \(post.title ?? "")"
            bodyLabel.text = "Body:  \(post.body ?? "")"
        }
    }
}


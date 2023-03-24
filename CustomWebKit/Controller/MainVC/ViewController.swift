//
//  ViewController.swift
//  CustomWebKit
//
//  Created by Md Murad Hossain on 24/3/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var clickwebPageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickwebPageButton.layer.cornerRadius = 20
    }
    
    @IBAction func clickActionWebPageButton(_ sender: UIButton) {
        guard let url = URL(string: "https://www.google.com") else {
            return
        }
        let vc = WebViewController(url: url, title: "Google")
        let st = UINavigationController(rootViewController: vc)
        present(st, animated: true)
    }
}


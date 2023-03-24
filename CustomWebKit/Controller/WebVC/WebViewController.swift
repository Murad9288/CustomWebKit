//
//  WebViewController.swift
//  CustomWebKit
//
//  Created by Md Murad Hossain on 24/3/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webBGView: UIView!
    
    let webView: WKWebView = {
        let prep = WKWebpagePreferences()
        prep.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prep
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    private let url: URL?
    
    init(url: URL, title: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()

    }
    
    private func setupWebView() {
        webView.backgroundColor = .black
        view.addSubview(webView)
        DispatchQueue.main.async { [self] in
            webView.load(URLRequest(url: url!))
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}

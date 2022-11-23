//
//  WebViewController.swift
//  Plugin
//
//  Created by Jeff Martin on 11/5/22.
//  Copyright © 2022 Max Lynch. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    var activityIndicator: UIActivityIndicatorView!
    var url: String?
    
    init() {
        self.url = nil
        super.init(nibName: nil, bundle: nil)
    }
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var webView: WKWebView!
    
    func initActivityIndicator() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.isHidden = true
        view.addSubview(activityIndicator)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        initActivityIndicator()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlToLoad = self.url {
            let url = URL(string: urlToLoad)
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }

}

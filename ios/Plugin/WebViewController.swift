//
//  WebViewController.swift
//  Plugin
//
//  Created by Jeff Martin on 11/5/22.
//  Copyright © 2022 Max Lynch. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
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
        self.view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    
    }
    
    func initWebView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)
        webView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        initWebView()
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

//
//  ViewController.swift
//  PWAIosWrapper
//
//  Created by liho on 25/02/2020.
//  Copyright © 2020 liho. All rights reserved.
//

import UIKit
import WebKit
import AVFoundation

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let cred = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, cred)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let url = URL(string: "https://192.168.0.188:8080/qrscan")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    

}


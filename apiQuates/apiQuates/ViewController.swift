//
//  ViewController.swift
//  apiQuates
//
//  Created by Ömer Oğuz Çelikel on 4.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //getDataSunrise()
    }

    @IBAction func randomQuoteButton(_ sender: Any) {
        //createQuote()
        print("button1 tappped")
        //makePostRequest()
        //createHelloWorld()
        makePostRequestLogin()
        //requestAllUsersRequest()
        
        
    }
    
    @IBAction func button2(_ sender: Any) {
        print("button2 tapped")
        //getUserInfo() 
    }
    func createQuote() {
        let url = URL(string: "https://api.kanye.rest")!
        //let url = URL(string: "https://7f9f-88-227-249-129.eu.ngrok.io/api/HelloWorld?action=hello")!
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("error:", error)
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: String]
            print(json)
            print("api bağlandı")
            DispatchQueue.main.async {
                //self.quoteLabel.text = json["quote"]
                self.quoteLabel.text = json["quote"]
            }
        }
        task.resume()
    }
    func createHelloWorld() {
        let url = URL(string: "https://5f6e-88-253-133-95.eu.ngrok.io/api/HelloWorld?action=hello")!
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("error:", error)
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: String]
            print(json)
            print("api bağlandı")
            DispatchQueue.main.async {
                self.quoteLabel.text = json["respond"]
            }
        }
        task.resume()
    }
    
    func requestAllUsersRequest() {
        let url = URL(string: "https://5f6e-88-253-133-95.eu.ngrok.io/api/UserInfo/users")!
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("error:", error)
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data!)
            print(json)
            print("api bağlandı")
            DispatchQueue.main.async {
                self.quoteLabel.text = (json as! String)
            }
        }
        task.resume()
    }
    
}


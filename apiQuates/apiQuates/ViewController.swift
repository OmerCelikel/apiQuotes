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
    }

    @IBAction func randomQuoteButton(_ sender: Any) {
        createQuote()
    }
    
    func createQuote() {
        let url = URL(string: "https://api.kanye.rest")!
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("error:", error)
                return
            }
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: String]
            print(json)
            DispatchQueue.main.async {
                self.quoteLabel.text = json["quote"]
            }
        }
        task.resume()
    }
    
}


//
//  ViewController.swift
//  Web Service Example
//
//  Created by Shaun Chua on 11/6/15.
//  Copyright (c) 2015 Shaun Chua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myNameLabel: LTMorphingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myNameLabel.morphingEffect = .Pixelate
        
        var activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET( "https://graph.facebook.com/bobdylan?access_token=CAAAAKvQdWksBAEkj6WAljnUD8alnggny7ZCmQyi3Sdt0W05ZA1J1ZBdnGRexTiZAerP5yg8c6gPSZC5dgF63RQ2Tjr9G9FoxWO3s2ZAUt7Dla7JdOy1Y3yoaZAbPvaV5xZBBg19PRil1Oki0rZCVJdaa6nXZA4wPqoX3uO3K9Dr0mzrmDs6acTK0pRFDzazKRZCPiJjeLU4JZApHAGufWyjnYkzM",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                println("Response: " + responseObject.description)
                
                if let myName = responseObject["name"] as? String {
                    self.myNameLabel.text = myName
                }
                
                activityIndicatorView.removeFromSuperview()

            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


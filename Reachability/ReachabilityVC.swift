//
//  ReachabilityVC.swift
//  Reachability
//
//  Created by Cyberk on 3/21/17.
//  Copyright © 2017 Cyberk. All rights reserved.
//

import UIKit

class ReachabilityVC: UIViewController {
    
    var reachability: Reachability? = Reachability.networkReachabilityForInternetConnection()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityDidChange(_:)), name: NSNotification.Name(rawValue: ReachabilityDidChangeNotificationName), object: nil)
        
        _ = reachability?.startNotifier()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reachabilityDidChange(_ notification: Notification) {
        checkReachability()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkReachability()
    }
    
    func checkReachability() {
        guard let r = reachability else { return }
        if r.isReachable  {
            view.backgroundColor = UIColor.green
        } else {
            view.backgroundColor = UIColor.red
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        reachability?.stopNotifier()
    }


}

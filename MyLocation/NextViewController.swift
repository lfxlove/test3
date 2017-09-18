//
//  NextViewController.swift
//  MyLocation
//
//  Created by 我爱你 on 16/9/7.
//  Copyright © 2016年 我爱你. All rights reserved.
//

import UIKit
import CoreLocation

typealias Hander = (Int , Double) -> Void

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loveyou({
            (x, y) in
            
        })
        
        NotificationCenter.default.addObserver(self, selector: #selector(NextViewController.locationChanged(_:)), name: NSNotification.Name(rawValue: "didUpdateLocations"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    func locationChanged(_ noti: Notification)  {
        let location = noti.object as! CLLocation
        print(location)
        
        
        
    }
    
    func loveyou(_ hander: Hander) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

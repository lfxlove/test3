//
//  ViewController.swift
//  MyLocation
//
//  Created by 我爱你 on 16/9/7.
//  Copyright © 2016年 我爱你. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    var locationManger: CLLocationManager!
    var location: CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManger = CLLocationManager()
        self.locationManger.delegate = self
        
        self.locationManger.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManger.distanceFilter = 1000.0
        
        
        self.locationManger.requestWhenInUseAuthorization()
        self.locationManger.requestAlwaysAuthorization()
        
        self.locationManger.startUpdatingLocation()
        print("定位开始")
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        self.location = location
        print("latt 经度 = \(location.coordinate.latitude)")
        print("lalo 纬度 = \(location.coordinate.longitude)")
        print("height 高度 = \(location.altitude)")
//        NSNotificationCenter.defaultCenter().postNotificationName("didUpdateLocations", object: location)
//        let vc = NextViewController()
//        self.presentViewController(vc, animated: true) { 
//            print("我爱你")
//        }
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .AuthorizedAlways:
            print("已经授权")
        case .AuthorizedWhenInUse:
            print("使用中打开")
        case .Restricted:
            print("使用受限")
        case .Denied:
            print("已经拒绝")
        case .NotDetermined:
            print("不能确定")
       }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let geo = CLGeocoder()
        if let loc = self.location {
            geo.reverseGeocodeLocation(loc) { (placeMark:[CLPlacemark]?, error:NSError?) in
                if error == nil {
                    let mm = placeMark?.first
                    let m2 = mm! as CLPlacemark
                    if placeMark != nil && placeMark?.count>0
                    {
                        let mark = placeMark?.first
                        print(mark?.name)
                    }
                }
            }
        }else{
            print("没有location")
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
//        self.locationManger.stopUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


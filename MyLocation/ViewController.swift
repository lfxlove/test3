//
//  ViewController.swift
//  MyLocation
//
//  Created by 我爱你 on 16/9/7.
//  Copyright © 2016年 我爱你. All rights reserved.
//

import UIKit
import CoreLocation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
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
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("已经授权")
        case .authorizedWhenInUse:
            print("使用中打开")
        case .restricted:
            print("使用受限")
        case .denied:
            print("已经拒绝")
        case .notDetermined:
            print("不能确定")
       }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
            } as! CLGeocodeCompletionHandler as! CLGeocodeCompletionHandler as! CLGeocodeCompletionHandler as! CLGeocodeCompletionHandler as! CLGeocodeCompletionHandler as! CLGeocodeCompletionHandler as! CLGeocodeCompletionHandler
        }else{
            print("没有location")
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        self.locationManger.stopUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


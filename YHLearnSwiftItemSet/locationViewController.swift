//
//  locationViewController.swift
//  YHLearnSwiftItemSet
//
//  Created by 我叫MT on 17/4/20.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

import UIKit
import CoreLocation

var bgImageView:UIImageView?
var effectView:UIVisualEffectView?
var locationLabel:UILabel?
var findLocationButton:UIButton?


    var locationM:CLLocationManager?//位置管理
class locationViewController: UIViewController, CLLocationManagerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.setUI()
        locationM = CLLocationManager()
        locationM?.delegate = self
        locationM?.desiredAccuracy = kCLLocationAccuracyBest
        locationM?.requestWhenInUseAuthorization()

        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        bgImageView = UIImageView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        self.view.addSubview(bgImageView!)
        bgImageView?.image = UIImage(named: "desk_005.jpg")
        let effectStyle:UIBlurEffect = UIBlurEffect(style: .dark)
        effectView = UIVisualEffectView(effect: effectStyle)
        effectView?.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.view.addSubview(effectView!)
        locationLabel = UILabel(frame: CGRect(x: 40, y: 50, width: UIScreen.main.bounds.size.width - 80, height: 100))
        effectView?.addSubview(locationLabel!)
        locationLabel?.text = "My Location"
        locationLabel?.textAlignment = .center
        locationLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        locationLabel?.textColor = UIColor.white
        locationLabel?.backgroundColor = UIColor.black
        
        findLocationButton = UIButton(type:UIButtonType.system)
        findLocationButton?.frame = CGRect(x: 40, y: UIScreen.main.bounds.size.height - 164, width: UIScreen.main.bounds.size.width - 80, height: 50)
        findLocationButton?.backgroundColor = UIColor.brown
        effectView?.addSubview(findLocationButton!)
        findLocationButton?.setTitle("Find", for: .normal)
        findLocationButton?.setTitleColor(UIColor.cyan, for: .normal)
        findLocationButton?.addTarget(self, action: #selector(findLocation), for: .touchDown)
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}


extension locationViewController {

    func findLocation() {
        
        print("寻找位置")
         locationM?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        locationLabel?.text = "Error while updating location " + error.localizedDescription
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                locationLabel?.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocation(pm)
            } else {
            locationLabel?.text = "Problem with the data received from geocoder"
            }
        })
    }
    
    func displayLocation(_ placeMark:CLPlacemark?)  {
        if let containsMark = placeMark {
            locationM?.stopUpdatingLocation()
            let locality = (containsMark.locality != nil) ? containsMark.locality:""
            let postalCode = (containsMark.postalCode != nil) ? containsMark.postalCode : ""
            let administrativeArea = (containsMark.administrativeArea != nil) ? containsMark.administrativeArea : ""
            let country = (containsMark.country != nil) ? containsMark.country : ""
            
            locationLabel?.text = postalCode! + " "+locality!
            locationLabel?.text?.append("\n"+administrativeArea!+","+country!)
            
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        locationM?.stopUpdatingLocation()
        locationM = nil
    }
    
    
    
    
}

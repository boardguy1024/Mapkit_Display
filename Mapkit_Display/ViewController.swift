//
//  ViewController.swift
//  Mapkit_Display
//
//  Created by park kyung suk on 2017/10/08.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    var myMapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mapView작성
        myMapView = MKMapView()
        myMapView.frame = self.view.bounds
        myMapView.delegate = self
        self.view.addSubview(myMapView)
        
        //locationManager작성
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //거리의 필터
        locationManager.distanceFilter = 100.0
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        //세큐리티 인증의 스테이터스를 취득
        let status = CLLocationManager.authorizationStatus()
        
        // 사용자의 인증되었는지 확인
        if status != CLAuthorizationStatus.authorizedWhenInUse {
            
            //아직 인증되지 않은 상태면 인증다이어로그를 표시
            locationManager.requestWhenInUseAuthorization()
        }
        
        //위치정보의 갱신을 시작!!
        locationManager.startUpdatingLocation()
        
    }
    

}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("redionChanged!!!")
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    //GPS로부터 값을 취득했을때에 호출되는 메소드
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        
        //배열에서 현재좌표를 취득
        let locations: NSArray = locations as NSArray
        let lastLocation: CLLocation = locations.lastObject as! CLLocation
        let locationCenter: CLLocationCoordinate2D = lastLocation.coordinate
        
        // 縮尺 : Scale
        let latDist: CLLocationDistance = 100
        let lotDist: CLLocationDistance = 100
        
        // 지역을 작성
        let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(locationCenter, latDist, lotDist)
        
        // mapView 에 반영
        myMapView.setRegion(region, animated: true)
        
    }
    
    
    // 인증이 변경되었을 때 호출되는 메소드
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        case .authorizedAlways:
            print("authorizedAlways")
        case .denied:
            print("denied")
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        }
        
    }
    
}





















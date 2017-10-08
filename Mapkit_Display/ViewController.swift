//
//  ViewController.swift
//  Mapkit_Display
//
//  Created by park kyung suk on 2017/10/08.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMapView = MKMapView()
        myMapView.frame = self.view.bounds
        myMapView.delegate = self
        
        self.view.addSubview(myMapView)
        
        //위도 경도를 사용해서 중심부를 지정
        
        let lat: CLLocationDegrees = 35.648984
        let Lon: CLLocationDegrees = 139.551272
        //WGS84(세계측지계)를 이용해서 경도,위도를 이용해 지리적좌표의 스트럭쳐를 구함
        let centerCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, Lon)
//        
//        //중심부로부터 범위를 설정
//        let latDistanceMeter: CLLocationDistance = 500
//        let lonDistanceMeter: CLLocationDistance = 500
//        
//        // reqion(지역)을 작성
//        let region: MKCoordinateRegion =
//            MKCoordinateRegionMakeWithDistance(centerCoordinate, latDistanceMeter, lonDistanceMeter)
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: centerCoordinate, span: span)
        
        // reqion을 설정
        myMapView.setRegion(region, animated: true)
    }
    

}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("redionChanged!!!")
    }
    
}

//
//  MapaViewController.swift
//  Pizzaria
//
//  Created by André Marafigo on 24/03/19.
//  Copyright © 2019 ALUNO. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {

    var endereco : String = ""
    var nomeCliente : String = ""

    let lm = CLLocationManager()
    
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        if endereco != "" {
            
            //Precisão da localização
            lm.desiredAccuracy = kCLLocationAccuracyHundredMeters
            //Solicita Permissão
            lm.requestWhenInUseAuthorization()
            //Starta o GPS
            //lm.startUpdatingLocation()
            
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            let activityIndicator = UIActivityIndicatorView(style: .gray)
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            
            self.view.addSubview(activityIndicator)
            
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = endereco
            
            let activeSearch = MKLocalSearch(request: searchRequest)
            
            activeSearch.start { (response, error) in
                
                                    activityIndicator.stopAnimating()
                                    UIApplication.shared.endIgnoringInteractionEvents()
                
                                    if response == nil {
                                        print("ERRO")
                                    }else {
                                        //Busca dados
                                        let latitude = response?.boundingRegion.center.latitude
                                        let longitude = response?.boundingRegion.center.longitude
                                        
                                        //Cria anotação
                                        let anotacao = MKPointAnnotation()
                                        anotacao.title = self.nomeCliente // self.endereco?.cliente?.nome
                                        anotacao.subtitle = self.endereco
                                        anotacao.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                                        self.mapa.addAnnotation(anotacao)
                                        
                                        //Zoom
                                        let coordenada: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                                        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                                        let regiao = MKCoordinateRegion(center: coordenada, span: span)
                                        self.mapa.setRegion(regiao, animated: true)
                                    }
            }
        }
    }
}

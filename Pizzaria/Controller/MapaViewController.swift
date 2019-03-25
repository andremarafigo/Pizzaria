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

    var endereco : Endereco?

    let lm = CLLocationManager()
    
    @IBOutlet weak var mapa: MKMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        if endereco != nil {
            
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
            let rua : String = String("\(endereco!.nome_rua!)")
            let numero : String = String("\(endereco!.numero)")
            let cep : String = String("\(endereco!.cep!)")
            let local : String = String("\(rua), \(numero) - CEP:\(cep)")
            searchRequest.naturalLanguageQuery = local
            
            let activeSearch = MKLocalSearch(request: searchRequest)
            activeSearch.start { (response, error) in
                
                activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                if response == nil {
                    print("ERRO")
                }else {
                    //Remover anotação
                    //let anotacoes = self.mapa.annotations
                    //self.mapa.removeAnnotation(anotacoes as! MKAnnotation)
                    
                    //Busca dados
                    let latitude = response?.boundingRegion.center.latitude
                    let longitude = response?.boundingRegion.center.longitude
                    
                    //Cria anotação
                    let anotacao = MKPointAnnotation()
                    anotacao.title = self.endereco?.cliente?.nome
                    anotacao.subtitle = local
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

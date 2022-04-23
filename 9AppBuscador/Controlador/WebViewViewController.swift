//
//  WebViewViewController.swift
//  9AppBuscador
//
//  Created by djdenielb on 22/04/22.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webViewBuscador: WKWebView!
    
//    Variable que recibe los datos de la segunda pantalla
    var recibirDatosWB: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Ok, vamos a crear el web view, primero importamos el webkit
//        despues creamos una url con guard let y lo mismo que la anterior, sustituimos la
//        palabra por la que recibimos del txt de la pantalla anterior
//        despues el else y depues hacemos un break con el return
//        Mandamos a llamar al elemento grafico y le decimos load y le pasamos una url que sera
//        la que acabamos de crear y con eso ya se abre en un web view
        guard let urlBuscar = URL(string: "https://www.google.com.mx/search?q=\(recibirDatosWB ?? "")&hl=es-419" ) else {return}
        
        webViewBuscador.load(URLRequest(url: urlBuscar))
        }
    }


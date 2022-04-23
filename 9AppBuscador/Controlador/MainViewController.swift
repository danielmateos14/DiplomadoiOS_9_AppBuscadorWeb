//
//  ViewController.swift
//  9AppBuscador
//
//  Created by djdenielb on 22/04/22.
//

import UIKit
import SafariServices

class MainViewController: UIViewController, UITextFieldDelegate {

//    Variables graficas
    @IBOutlet weak var txtBuscar: UITextField!
    @IBOutlet weak var botonBuscarWS: UIButton!
    @IBOutlet weak var botonBuscarSS: UIButton!
    
//    Variables, se creo una variable buscar string para el web view y otra para el safari services
    var buscarStringWV: String?
    var buscarStringSS: String?
    
//    Funcion al arrancar
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Este delegado, dice que este VC puede usar las funciones de la clase text field
        txtBuscar.delegate = self
    }


//    Conexion action para los botones, se hara un if y dependiendo del titulo del boton hara una accion
    @IBAction func botones(_ sender: UIButton) {
        
//        Si el titulo del boton es este, entonces entra otro if
        if sender.titleLabel?.text == "Buscar en webView"{
            
//            Este otro if pregunta si el texto del txt esta vacio entonces, no hagas nada
//            de lo contrario entonces, la variable a la buscaString le vas a asignar lo que
//            tenga el txt y despues abriras la siguiente pantall
            if txtBuscar.text == ""{
                
            }else{
                buscarStringWV = txtBuscar.text
                performSegue(withIdentifier: "segueBuscar", sender: self)
            }
            
//            En caso de que el titulo del boton sea este
        }else if sender.titleLabel?.text == "Buscar en Safari Services"{
            
//            Haras un if para comprobar si esta vacio, si esta vacio no haras nada
            if txtBuscar.text == ""{
                
//            Si no esta vacio, a la variable buscar WV le asignas lo que tenga el txt
//                Importamos los safari services hasta arriba
//                Despues vas a crear una url con que la vas a crear? con un string que sera
//                una busqueda en google pero esa busqueda dentro del string en lugar de poner
//                la palabra a buscar la vamos a sustituir con la palabra que este en txt
//                despues se pone else y luego return que es un break para el guard let
//                con eso ya queda creada la url, ahora vamos a crear una variable de nombre vcss
//                esa variable va a servir para indicarle al sistema que contendra una funcion
//                del safari services que a su ves contendra la url que creamos arriba
//                despues se utiliza la funcion present dentro de los parametros se pone la
//                misma funcion vcss una animacion y en completion le ponemos nil por que no
//                queremos hacer nada mas, con esto ya la palabra se abrira en un safari web services
            }else{
            buscarStringWV = txtBuscar.text
            guard let urlBuscar = URL(string: "https://www.google.com.mx/search?q=\(buscarStringWV ?? "")&hl=es-419") else {return}
            let vcSS = SFSafariViewController(url: urlBuscar)
            present(vcSS, animated: true, completion: nil)
            }
        }
        
    }
    
//    Funcion para enviar datos a la segunda pantalla, solo enviamos el string de la url
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueBuscar"{
            let enviarDatos = segue.destination as! WebViewViewController
            enviarDatos.recibirDatosWB = buscarStringWV
        }
    }
}



//
//  NetworkController.swift
//  wallet
//
//  Created by Leonardo Casamayor on 10/04/2022.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case CorruptedData
    case BadRequest
}

protocol QRRequester {
    func requestQRCode(content: String, completion: @escaping (Swift.Result<Image, NetworkError>) -> Void)
}

class NetworkController: QRRequester {
    
    func requestQRCode(content: String, completion:  @escaping (Swift.Result<Image, NetworkError>) -> Void) {
        let url = URL(string: "https://neutrinoapi-qr-code.p.rapidapi.com/qr-code")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        request.setValue("neutrinoapi-qr-code.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        request.setValue("9517836f52mshbd7219420a87752p153422jsn8140ab4010dd", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "content-type")
        
        let parameters = ["content": "\(content)"]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }
        catch let error {
            print(error.localizedDescription)
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error in qr code request: \(error)")
                completion(.failure(.BadRequest))
            }
            
            if let data = data {
                completion(.success(Image(uiImage: UIImage(data: data)!)))
            }
            else {
                completion(.failure(.CorruptedData))
            }
            
        }
        task.resume()
    }
}

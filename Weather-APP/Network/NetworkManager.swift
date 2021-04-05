//
//  NetworkManager.swift
//  Weather-APP
//
//  Created by sachiin verma on 04/04/21.
//

import Foundation

// this where we network live that is responciable for making all api call you dont need to know what type it is that way NetworkMangeder class type is generic also you can use this all any kind of network api call

// now you see (do block for json decoding session code ) it(T) actually comforming to some type so you dont need to know what type it is we can litterly use <T: > T this for any any king of network api call as long as your object that youre calling on conform to codable protocal

final class NetworkManager<T: Codable>{
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        //initate network call
        //now we create UrlSession and datatask for urlSession were gonna make the api call and we're gonna to return that result in our result object
        URLSession.shared.dataTask(with: url) { (data, response, error) in    //url which is passed by user and what we get data, response, error
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            // so when we get responce is not type of http url responce so to convert that conversion also can fail so
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            // above grurd statement tell us we have some sort of data so now we decode that data to ours convinence
            do {
                let json = try JSONDecoder().decode(T.self, from: data)  // why we use generic type T.self bez that conform to codable protocal that is intend to why we restricted our network manager to be call in only by the type that conforms to codable
                completion(.success(json))
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
                
                
            }
        }.resume()
        
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err:String)   // that case have with assoicited string value
    case decodingError(err:String)
}



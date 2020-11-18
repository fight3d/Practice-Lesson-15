//
//  UserService.swift
//  Lesson15
//
//  Created by 3droot on 12.11.2020.
//

import Foundation

class UserService {
    
    private let session = URLSession.shared
    
    func getUsers(completion: @escaping (([Users]) -> Void)){
        guard  let url = URL(string: "https://randomuser.me/api/?results=20") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = session.dataTask(with: request){ (data, response, error) in
            if let error = error {
                print (error.localizedDescription)
            }
            guard let response = response as? HTTPURLResponse else {return}
            switch response.statusCode {
            case 200, 201:
                guard let data = data, let userResponse = try? JSONDecoder().decode(UserResponse.self, from: data) else { return }
                completion(userResponse.results)
            default : print ("ERROR UNEXPECTED CODE \(response.statusCode)")
            }
    }
        dataTask.resume()
}
}

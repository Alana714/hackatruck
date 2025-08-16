//
//  usuarioViewModel.swift
//  Projeto
//
//  Created by Turma01-10 on 13/05/25.
//

import Foundation

class UsuarioViewModel: ObservableObject {
    
    @Published var usuario: Usuario? = nil
    @Published var usuarios: [Usuario] = []
    
    func fetch_by_id(id: String) {
        
        guard let url = URL(string: "http://192.168.128.100:1880/get-user-byid?id=\(id)") else {
            return
        }
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(Usuario.self, from: data)
                
                DispatchQueue.main.async {
                    self?.usuario = parsed
                }
                
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func fetch() {
        guard let url = URL(string: "http://192.168.128.100:1880/get-user") else {
            return
        }
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in 
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Usuario].self, from: data)
                
                DispatchQueue.main.async {
                    self?.usuarios = parsed
                    
                }
                
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    func fetch_user2() {
        guard let url = URL(string: "http://192.168.128.100:1880/get-user2") else {
            return
        }
        
        print(url)
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Usuario].self, from: data)
                
                DispatchQueue.main.async {
                    self?.usuarios = parsed
                    
                }
                
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    
    func fetch_put_user(usuarioSabrina: Usuario) {
        
        var request = URLRequest(url: URL(string: "http://192.168.128.100:1880/post-user")!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let encoded = try JSONEncoder().encode(usuarioSabrina)
            request.httpBody = encoded
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                //This converts the optionals in to non optionals that could be used further on
                //Be aware this will just return when something goes wrong
                guard let data = data, let response = response, error == nil else{
                    
                    print("Something went wrong: error: \(error?.localizedDescription ?? "unkown error")")
                    return
                }
                
                print(response)
                
                var  decodedAnswer = String(decoding: data, as: UTF8.self)
            }
            
            task.resume()
        }
        catch{
            print(error)
        }
    }
    func fetch_put_user2(usuarioPet: [Pet]) {
        
        var request = URLRequest(url: URL(string: "http://192.168.128.100:1880/post-user")!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let encoded = try JSONEncoder().encode(usuarioPet)
            request.httpBody = encoded
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                //This converts the optionals in to non optionals that could be used further on
                //Be aware this will just return when something goes wrong
                guard let data = data, let response = response, error == nil else{
                    
                    print("Something went wrong: error: \(error?.localizedDescription ?? "unkown error")")
                    return
                }
                
                print(response)
                
                var  decodedAnswer = String(decoding: data, as: UTF8.self)
            }
            
            task.resume()
        }
        catch{
            print(error)
        }
    }


        //        let task = URLSession.shared.dataTask(with: url){ data, _, error in
        //            print(usuario)
        //
        //            do {
        //                url.httpMethod = "POST"
        //
        //                let encoded = try JSONEncoder().encode(usuario)
        //
        //                url.httpBody = encoded
        //                url.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        //
        //              print(" ENCODED \(encoded) ")
        //
        //            } catch {
        //                print(error)
        //            }
        //        }
        //
        //        task.resume()
        //    }
  
}

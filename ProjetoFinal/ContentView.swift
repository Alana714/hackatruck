//
//  ContentView.swift
//  MyPet
//
//  Created by Turma01-15 on 13/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = "anaclara@gmail.com"
    @State private var senha = "12345"
    @State private var isLoggedIn = false
    @State private var goToCadastro = false
    @State private var loginStatus = ""
    
    var body: some View {
        
        if isLoggedIn {
            InicioView()
        } else if goToCadastro {
            CadastroView()
        } else {
            NavigationStack{
                VStack(spacing: 20){
                    Text("Login").font(.largeTitle).bold()
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    SecureField("Senha",text: $senha)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    NavigationLink(destination:  InicioView()){
                        Text("Entrar")
                    }
                    
                    Button("Cadastre-se") {
                        goToCadastro = true
                    }
                    
                }
            }
            .tint(.roxo)
        }
    }
    
    func login() {
        guard let url = URL(string: "http://SEU-IP:1880/login") else { return }
        
        let dados = ["email": email, "senha": senha]
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: dados) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { data, _, _ in
                guard let data = data,
                      let response = try? JSONSerialization.jsonObject(with: data) as? [String: String] else {
                    return
                }
                
                DispatchQueue.main.async {
                    if response["status"] == "sucesso" {
                        isLoggedIn = true
                    } else {
                        loginStatus = response["status"] ?? "Erro"
                    }
                }
            }.resume()
            
        }
        
        
    }//Função
    
}


#Preview {
    ContentView()
}

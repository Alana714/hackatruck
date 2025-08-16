//
//  CadastroView.swift
//  MyPet
//
//  Created by Turma01-15 on 13/05/25.
//

import SwiftUI
struct CadastroView: View {
    @State private var nome = ""
    @State private var email = ""
    @State private var senha = ""
    @State private var idade = ""
    @State private var cpf = ""
    @State private var dataNascimento = ""
    @State private var cadastroStatus = ""
    @State private var isCadastroConcluido = false

    var body: some View {
        if isCadastroConcluido {
            // Volta para a tela de login automaticamente
            ContentView()
        } else {
            VStack(spacing: 15) {
                Text("Cadastro").font(.largeTitle).bold()

                TextField("Nome", text: $nome)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Senha", text: $senha)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Idade", text: $idade)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("CPF", text: $cpf)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Data de Nascimento", text: $dataNascimento)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Cadastrar") {
                    cadastrar()
                }
                .buttonStyle(.borderedProminent)

                Text(cadastroStatus).foregroundColor(.red)
            }
            .padding()
        }
    }

    func cadastrar() {
        guard let url = URL(string: "http://SEU-IP:1880/cadastro") else { return }

        let dados: [String: String] = [
            "nome": nome,
            "email": email,
            "senha": senha,
            "idade": idade,
            "cpf": cpf,
            "dataNascimento": dataNascimento
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: dados) else { return }

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
                    cadastroStatus = "Cadastro realizado com sucesso!"
                    isCadastroConcluido = true
                } else {
                    cadastroStatus = response["status"] ?? "Erro ao cadastrar"
                }
            }
        }.resume()
    }
}

    
        
 
#Preview {
    CadastroView()
}

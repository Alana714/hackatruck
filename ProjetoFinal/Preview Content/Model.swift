//
//  ModelPet.swift
//  Projeto
//
//  Created by Turma01-10 on 13/05/25.
//


//"apikey": "8WAyFM3QXOLu-Qn1Hq9WgKWlXImNYX9wvTU3r8mdDR0W",
//"url": "https://f1c0dcf9-5075-4061-a1f8-2f4ca596058a-bluemix.cloudantnosqldb.appdomain.cloud",


import Foundation

struct Usuario: Codable, Hashable {
    var _id: String
    var _rev: String
    var user: String
    var email: String
    var senha: String
    var cpf: String
    var telefone: String
    var foto: String
    var pets: [Pet]
}

struct Pet: Codable, Hashable {
    var nome: String?
    var foto_pet: String?
    var idade: String?
    var especie: String?
    var raca: String?
    var porte: String?
    var detalhes_pelo: String?
    var necessidades: Bool?
    var vacinacao: String?
    var info_adicionais: String?
}

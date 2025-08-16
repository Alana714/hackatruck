//
//  AdocaoView.swift
//  Projeto
//
//  Created by Turma01-10 on 14/05/25.
//

import SwiftUI

struct AdocaoView: View {
    @State var tutor: Usuario
    @State var pet: Pet
    @State private var isFavorite = false
    
    var body: some View {
        VStack() {
            ZStack {
                //Cor de fundo depois
                Color(.areia)
                    //.frame(width: 400)
                    .ignoresSafeArea()
                    
                
                VStack {
                    ZStack(alignment: .leading) {
                        HStack {
                            Text("Informações do pet")
                                .foregroundStyle(.roxo)
                                .fontWeight(.heavy)
                            
                            Spacer()
                            
                            Button(action: {
                                isFavorite.toggle()
                                //Acao de favoritar na api vai aqui depois
                            }) {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(isFavorite ? .red : .gray)
                                }
                        }
                        .padding(8)
                    }
                    
                    ScrollView(showsIndicators: false) {
                        HStack {
                            AsyncImage(url: URL(string: pet.foto_pet!))
                            { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            } placeholder: {
                                Color.black
                            }
                            .frame(width: 200, height:200)
                        }
                        
                        VStack {
                            
                            VStack(alignment: .leading) {
                                Text("Nome do pet:")
                                    .padding(.bottom, 0)
                                    .foregroundStyle(.roxo)
                                    .fontWeight(.heavy)
                                
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 350, height: 22)
                                        .foregroundStyle(Color.roxo)
                                        .opacity(0.3)
                                    Text(pet.nome!)
                                        .foregroundStyle(Color.preto)
                                        .padding(.leading, 15)
                                        .fontWeight(.medium)
                                }
                                .padding(.top, 0)
                                
                            }
                            
                            HStack {
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text("Idade:")
                                            .padding(.top, 5)
                                            .padding(.bottom, 0)
                                            .foregroundStyle(.roxo)
                                            .fontWeight(.heavy)
                                        
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 170, height: 25)
                                                .foregroundStyle(Color.roxo)
                                                .opacity(0.3)
                                            Text(pet.idade!)
                                                .foregroundStyle(Color.preto)
                                                .padding(.leading, 15)
                                                .fontWeight(.medium)
                                        }
                                        .padding(.top, 0)
                                        
                                    }
                                }
                                
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text("Espécie:")
                                            .padding(.bottom, 0)
                                            .foregroundStyle(.roxo)
                                            .fontWeight(.heavy)
                                        
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 170, height: 25)
                                                .foregroundStyle(Color.roxo)
                                                .opacity(0.3)
                                            Text(pet.especie!)
                                                .foregroundStyle(Color.preto)
                                                .padding(.leading, 15)
                                                .fontWeight(.medium)
                                        }
                                        .padding(.top, 0)
                                        
                                    }
                                }
                            }
                            
                            HStack {
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text("Raça:")
                                            .padding(.top, 5)
                                            .padding(.bottom, 0)
                                            .foregroundStyle(.roxo)
                                            .fontWeight(.heavy)
                                        
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 170, height: 25)
                                                .foregroundStyle(Color.roxo)
                                                .opacity(0.3)
                                            Text(pet.raca!)
                                                .foregroundStyle(Color.preto)
                                                .padding(.leading, 15)
                                                .fontWeight(.medium)
                                        }
                                        .padding(.top, 0)
                                        
                                    }
                                }
                                
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text("Porte:")
                                            .padding(.bottom, 0)
                                            .foregroundStyle(.roxo)
                                            .fontWeight(.heavy)
                                        
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 170, height: 25)
                                                .foregroundStyle(Color.roxo)
                                                .opacity(0.3)
                                            Text(pet.porte!)
                                                .foregroundStyle(Color.preto)
                                                .padding(.leading, 15)
                                                .fontWeight(.medium)
                                        }
                                        .padding(.top, 0)
                                        
                                    }
                                }
                            }
                            
                            HStack {
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text("Cor e detalhes do pelo:")
                                            .padding(.bottom, 0)
                                            .padding(.top, 5)
                                            .foregroundStyle(.roxo)
                                            .fontWeight(.heavy)
                                        
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 350, height: 70)
                                                .foregroundStyle(Color.roxo)
                                                .opacity(0.3)
                                            Text(pet.detalhes_pelo!)
                                                .foregroundStyle(Color.preto)
                                                .padding(.leading, 15)
                                                .fontWeight(.medium)
                                            
                                        }
                                        .padding(.top, 0)
                                        
                                    }
                                }
                            }
                            
                            HStack {
                                Text("Possui necessidades especiais?")
                                    .padding(.bottom, 0)
                                    .foregroundStyle(.roxo)
                                    .fontWeight(.heavy)
                                HStack {
                                    ZStack {
                                        Text("\(pet.necessidades!)")
                                            .foregroundStyle(Color.preto)
                                            .fontWeight(.medium)
                                            .padding(20)
                                            .background(Color.roxo.frame(width: 60, height: 30).cornerRadius(8).opacity(0.3))
                                            //.opacity(0.5)
                                    }
                                }
                                
                                Spacer()

                            }
                            
                            HStack {
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text("Vacinacão:")
                                            .padding(.bottom, 0)
                                            .foregroundStyle(.roxo)
                                            .fontWeight(.heavy)
                                                                
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 350, height: 80)
                                                .foregroundStyle(Color.roxo)
                                                .opacity(0.3)
                                            Text(pet.vacinacao!)
                                                .foregroundStyle(Color.preto)
                                                .padding(.leading, 15)
                                                .fontWeight(.medium)
                                            
                                        }
                                        .padding(.top, 0)
                                        
                                    }
                                }
                            }
                            
                            HStack {
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text("Informações adicionais:")
                                            .padding(.bottom, 0)
                                            .foregroundStyle(.roxo)
                                            .fontWeight(.heavy)
                                                                                
                                        ZStack(alignment: .leading) {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 350, height: 80)
                                                .foregroundStyle(Color.roxo)
                                                .opacity(0.3)
                                            Text(pet.info_adicionais!)
                                                .foregroundStyle(Color.preto)
                                                .padding(.leading, 15)
                                                .fontWeight(.medium)
                                            
                                        }
                                        .padding(.top, 0)
                                    }
                                }
                            }
                            
                            HStack {
                                Button(action: {
                                    //Acao de entrar em contato
                                }) {
                                    Text("Entrar em contato")
                                        .foregroundStyle(Color.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 6)
                                        .background(Color.roxo)
                                        .cornerRadius(10)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    //Acao de entrar em contato
                                }) {
                                    Text("Solicitar adoção")
                                        .foregroundStyle(Color.white)
                                        .padding(.horizontal, 22)
                                        .padding(.vertical, 6)
                                        .background(Color.preto)
                                        .cornerRadius(10)
                                }
                            }
                            .padding(.top, 15)
                            
                            VStack {
                                Rectangle()
                                    .frame(width: nil, height: 1)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                    .padding(.top, 2)
                                                                
                                HStack {
                                    AsyncImage(url: URL(string: tutor.foto))
                                    { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    } placeholder: {
                                        Color.black
                                    }
                                    .frame(width: 80, height: 80)
                                    
                                    HStack {
                                        VStack {
                                            Text(tutor.user)
                                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            Text(tutor.email) //Aqui vai ser localizacao
                                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        }
                                                                                
                                        VStack {
                                            HStack {
                                                Image(systemName: "star.fill")
                                                Text("4,85")
                                            }
                                            
                                            Text("Avaliação")
                                        }
                                        .font(.system(size: 13))
                                    }
                                    
                                    Spacer()
                                }
                                
                            }
                        }
                    }
                }
            }
        }//Conteudo
        .padding(.horizontal, 10)
        }
    }


#Preview {
    AdocaoView(tutor: Usuario(_id: "", _rev: "", user: "Olivia Rodrigo da Silva", email: "olivia.rodrigo@gmail.com", senha: "senhadificil123", cpf: "000.000.000-00", telefone: "69 99999-9999", foto: "https://f.i.uol.com.br/fotografia/2021/05/27/162215828660b02bce02e3c_1622158286_3x2_md.jpg", pets: []),
               pet: Pet(nome:"Belinha", foto_pet: "https://a-static.mlcdn.com.br/800x560/lacinhos-pet-com-elastico-ajustavel-para-pelo-curto-b-s-shop/rpprodutoseacessoriosemgeral/b2/f34aac11c5a32ba3308fb9201740085e.jpeg", idade: "2 anos", especie: "Cachorro", raca: "Pitbull", porte: "Médio", detalhes_pelo: "Preto e branco", necessidades: false, vacinacao: "Vacinas V10, Antirrábica e contra Gripe Canina", info_adicionais: "Muito dócil e amigável, adora brincar e não gosta de tomar banho."))
}

//
//  PerfilView.swift
//  mypet
//
//  Created by Turma01-26 on 14/05/25.
//

import SwiftUI

struct PerfilView: View {
    
    @StateObject var usuarioviewModel = UsuarioViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if let usuario = usuarioviewModel.usuario {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        // FOTO + AVALIAÇÃO
                        HStack(spacing: 16) {
                            AsyncImage(url: URL(string: usuario.foto)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(5)
                            
                            VStack(alignment: .leading) {
                                Text("★ 4.8")
                                    .font(.headline)
                                    .foregroundStyle(Color.roxo)
                                Text("120 avaliações")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)

                        // NOME + BIO
                        VStack(alignment: .leading) {
                            Text(usuario.user)
                                .font(.title2)
                                .bold()
                                .padding(.bottom, 3)
                            Text("Amante dos animais, buscando lares responsáveis!")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        

                        // BOTÕES
                        HStack {
                            Button("Editar perfil") {
                                // ação editar
                            }
                            .buttonStyle(.bordered)
                            .foregroundStyle(Color.roxo)

                            Button("Compartilhar perfil") {
                                // ação compartilhar
                            }
                            .buttonStyle(.bordered)
                            .foregroundStyle(Color.roxo)
                        }
                        .padding(.horizontal)
                        
                        
                        Divider()

                        // SEÇÃO: PETS PARA ADOÇÃO
                        Text("Animais para adoção")
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                        

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(usuario.pets, id: \.nome) { pet in
                                    VStack {
                        
                                        AsyncImage(url: URL(string: pet.foto_pet ?? "")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                        } placeholder: {
                                            Color.gray
                                        }
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        
                                        Text(pet.nome ?? "")
                                            .font(.subheadline)
                                    }
                                }
                                .padding(3)
                            }
                            .padding(.horizontal)
                        }
                        Divider()

                        // FEED
                        
                        VStack (alignment: .center) {
                            
                            HStack {
                                
                                Image(systemName: "squareshape.split.2x2")
                                    .padding(.bottom, 5)
                                    .foregroundStyle(Color.roxo)

                            }
                            
                        
                        
                        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                            ForEach(usuario.pets, id: \.nome) { pet in
                                AsyncImage(url: URL(string: pet.foto_pet ?? "")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 110, height: 110)
                                .clipped()                           }
                        }
                        .padding(.horizontal)
                        }
                        
                        
                    }
                    
                } else {
                    VStack {
                        ProgressView("Carregando perfil...")
                            .padding()
                    }
                }
            }
            .navigationTitle("")
            .onAppear {
                usuarioviewModel.fetch_by_id(id: "b2fcaaa78ae132a22ce379d001bdd830")
            }
            .background(Color.areia)
        }
    }
}


#Preview {
    PerfilView()
}



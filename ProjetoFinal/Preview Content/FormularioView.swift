//
//  FormularioView.swift
//  MyPet
//
//  Created by Turma01-15 on 14/05/25.
//

import SwiftUI
import PhotosUI

struct FormularioView: View {
    @StateObject var usuarioviewModel = UsuarioViewModel()
    @State var usuario : Usuario
//
//    @State var usuarioAUX : [Usuario] = [Usuario(
//        _id: "",
//        _rev: "",
//        user: "",
//        email: "",
//        senha: "",
//        cpf: "",
//        telefone: "",
//        foto: "",
//        pets: [Pet(
//            nome: "",
//            foto_pet: "",
//            idade: "",
//            especie: "",
//            raca: "",
//            porte: "",
//            detalhes_pelo: "",
//            necessidades: false,
//            vacinacao: "",
//            info_adicionais: ""
//        )]
//    )]
    @State var petAUX : [Pet] = []
    
    @State private var showingAlert = false
    
    @State private var selectedUIImage: UIImage? = nil
    @State private var selectedImageItem: PhotosPickerItem? = nil
    @State private var showMenu = false
    @State private var isSelectedSim = false
    @State private var isSelectedNao = false

    
    @State private var nome = ""
    @State private var foto_pet = "https://blog.vetzco.com.br/wp-content/uploads/2024/05/racas-cachorro-pequeno-3.jpg"
    @State private var idade = ""
    @State private var sexo = ""
    @State private var especie = ""
    @State private var raca = ""
    @State private var porte = ""
    @State private var detalhes_pelo = ""
    @State private var vacinacao = ""
    @State private var info_adicionais = ""
    @State private var necessidadesEspeciais: Bool? = nil
    
    @State var idAux: String = ""
    @State var revAux: String = ""
    @State var userAux: String = ""
    @State var emailAux: String = ""
    @State var telefoneAux: String = ""
    @State var fotoAux: String = ""
    @State var cpfAux: String = ""
    @State var senhaAux: String = ""
    @State var newPet: Pet = Pet()
    
    //   @State var newPet : Pet?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.areia)
                    .ignoresSafeArea()
                VStack(spacing: 10) {
                    // Cabeçalho com título e botão de menu
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Informações do Animal")
                            .fontWeight(.heavy)
                            .foregroundStyle(.roxo)
                        Spacer()
                        Button(action: {
                            withAnimation { showMenu.toggle() }
                            
                        }) {
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 30, height: 25)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            // Nome e Espécie
                            HStack {
                                VStack {
                                    TextField("Nome", text: $nome)
                                    TextField("Espécie", text: $especie)
                                }
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.vertical)
                                
                                // Botão de imagem
                                PhotosPicker(
                                    selection: $selectedImageItem,
                                    matching: .images,
                                    photoLibrary: .shared()
                                ) {
                                    Image(systemName: "photo")
                                        .padding()
                                        .background(Color.roxo)
                                        .foregroundColor(.areia)
                                        .cornerRadius(10)
                                        .font(.system(size: 50))
                                } .padding()
                                    .onChange(of: selectedImageItem) { newItem in
                                        Task {
                                            if let item = newItem,
                                               let data = try? await item.loadTransferable(type: Data.self),
                                               let uiImage = UIImage(data: data) {
                                                selectedUIImage = uiImage
                                            }
                                        }
                                    }
                            }
                            .padding(.horizontal)
                            // Raça
                            TextField("Raça", text: $raca)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            
                            // Idade, Sexo, Porte
                            HStack {
                                TextField("Idade", text: $idade)
                                TextField("Sexo", text: $sexo)
                                TextField("Porte", text: $porte)
                            }
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            
                            // Detalhes do pelo
                            TextField("Detalhes do animal", text: $detalhes_pelo)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            Spacer()
                            // Necessidades especiais
                            HStack {
                                Text("Necessidades especiais?")
                                    .foregroundStyle(.roxo)
                                    .fontWeight(.medium)
                                Spacer()
                                Button("Sim") {
                                    necessidadesEspeciais = true
                                    isSelectedSim.toggle()
                                    isSelectedNao = false
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(isSelectedSim ? .roxo : .preto)

                                Button("Não") {
                                    necessidadesEspeciais = false
                                    isSelectedNao.toggle()
                                    isSelectedSim = false
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(isSelectedNao ? .roxo : .preto)
                                .buttonStyle(.borderedProminent)
                                .tint(.black)
                            }
                            .padding(.horizontal)
                            Spacer()
                            // Vacinação
                            TextField("Vacinação", text: $vacinacao)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            
                            // Informações adicionais
                            TextField("Informações adicionais", text: $info_adicionais)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            Spacer()
                            // Botões de ação
                            HStack {
                                NavigationLink(destination: InicioView().navigationBarBackButtonHidden(true)) {
                                    Text("Cancelar")
                                        .padding()
                                        .background(Color.preto)
                                        .foregroundColor(.areia)
                                        .cornerRadius(8)
                                }
                                
                                Spacer()
                                
                                Button(action: {
//                                    for i in usuarioviewModel.usuarios {
//                                        idAux = i._id
//                                        revAux = i._rev
//                                        userAux = i.user
//                                        emailAux = i.email
//                                        telefoneAux = i.telefone
//                                        fotoAux = i.foto
//                                        cpfAux = i.cpf
//                                        senhaAux = i.senha
//                                        for p in i.pets {
//                                            petAUX.append(p)
//                                            newPet = Pet(nome: nome, foto_pet: foto_pet, idade: idade, especie: especie, raca: raca, porte: porte, detalhes_pelo: detalhes_pelo, necessidades: necessidadesEspeciais, vacinacao: vacinacao, info_adicionais: info_adicionais)
//                                            
//                                            petAUX.append(newPet)
//                                            print(petAUX)
//                                        }
//                                    }
//
//                                    usuarioviewModel.fetch_put_user(usuarioSabrina: Usuario(_id: idAux, _rev: revAux, user: userAux, email: emailAux, senha: senhaAux, cpf: cpfAux, telefone: telefoneAux, foto: fotoAux, pets: petAUX))
                                 
                                    petAUX = [] // Limpa a lista para evitar acumular pets de chamadas anteriores

                                    for i in usuarioviewModel.usuarios {
                                        idAux = i._id
                                        revAux = i._rev
                                        userAux = i.user
                                        emailAux = i.email
                                        telefoneAux = i.telefone
                                        fotoAux = i.foto
                                        cpfAux = i.cpf
                                        senhaAux = i.senha
                                        
                                        // Copia pets existentes
                                        petAUX.append(contentsOf: i.pets)
                                    }

                                    // Cria novo pet fora do loop e adiciona apenas uma vez
                                    newPet = Pet(nome: nome, foto_pet: foto_pet, idade: idade, especie: especie, raca: raca, porte: porte, detalhes_pelo: detalhes_pelo, necessidades: necessidadesEspeciais, vacinacao: vacinacao, info_adicionais: info_adicionais)
                                    petAUX.append(newPet)

                                    print(petAUX)

                                    usuarioviewModel.fetch_put_user(usuarioSabrina: Usuario(_id: idAux, _rev: revAux, user: userAux, email: emailAux, senha: senhaAux, cpf: cpfAux, telefone: telefoneAux, foto: fotoAux, pets: petAUX))

                                    
                                    
                                    showingAlert.toggle()
                         
                                }) {
                                    // if let image = selectedUIImage {
                                    //  NavigationLink(destination: ConfirmacaoPetView(recebeImagem: image)) {
                                    Text("Colocar para adoção")
                                        .padding()
                                        .background(Color.roxo)
                                        .foregroundColor(.areia)
                                        .cornerRadius(8)
                                    // }
                                    //}
                                    
                                }
                                .alert("Confirmação da Adoção!", isPresented: $showingAlert) {
                                    Button("OK", role: .cancel) { }
                                }
                                
                            }
                            .padding(.horizontal)
                        }
                        .padding(.bottom)
                    }
                }
                
                // MENU LATERAL
                if showMenu {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showMenu = false
                            }
                        }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            NavigationLink(destination: PerfilView()) {
                                Image("sasa")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                            }
                            .padding(.top)
                            
                            Divider()
                            
                            Text("Perfil")
                            Text("Configurações")
                            Text("Sair")
                            
                            Spacer()
                        }
                        .padding()
                        .frame(width: 250, height: 700)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        
                        Spacer()
                    }
                    .transition(.move(edge: .leading))
                }
            }
            .onAppear {
                // usuarioViewModel.fetch_by_id(id: "04e2168775ad484a510d644b6af56ab8")
                usuarioviewModel.fetch()
            }
        }
    }
}

//#Preview {
//  FormularioView(usuarioViewModel: UsuarioViewModel())
//}

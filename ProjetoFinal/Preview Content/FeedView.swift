import SwiftUI

struct FeedView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var showMenu = false
    @StateObject var uvm = UsuarioViewModel()
    @StateObject var usuarioViewModel = UsuarioViewModel()
    
    @State var valor = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color(.areia)
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Color.purple.opacity(0.2)
                            .ignoresSafeArea()
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        
                        HStack {
                            Button(action: {
                                withAnimation(.easeInOut) {
                                    showMenu.toggle()
                                }
                            }) {
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .frame(width: 25, height: 20)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.purple.opacity(0.5))
                                    .clipShape(Circle())
                            }
                            
                            Spacer()
                            
                            Image(systemName: "bell.fill")
                                .foregroundColor(.white)
                                .padding(30)
                            
                            if let usuario = uvm.usuario {
                                VStack(alignment: .leading) {
                                    Text(usuario.user)
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(.white)
                                }
                                
                                NavigationLink(destination: PerfilView(usuarioviewModel: uvm)) {
                                    AsyncImage(url: URL(string: usuario.foto)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                    .shadow(radius: 5)
                                    .padding(5)
                                }
                            } else {
                                ProgressView()
                                    .padding()
                            }
                        }
                        .padding()
                        .onAppear {
                            uvm.fetch_by_id(id: "b2fcaaa78ae132a22ce379d001bdd830")
                        }
                    }
                    .frame(height: 120)
                    
                    ScrollView {
                        Spacer()
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(uvm.usuarios, id: \.self) { u in
                                ForEach(u.pets, id: \.self) { p in
                                    NavigationLink(destination: AdocaoView(tutor: u, pet: p)) {
                                        VStack {
                                            AsyncImage(url: URL(string: p.foto_pet ?? "")) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white.opacity(0.5), lineWidth: 1))
                                            .shadow(color: .purple.opacity(0.3), radius: 5, x: 0, y: 3)
                                            
                                            Text(p.nome ?? "")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                        }
                                        .padding(5)
                                        .background(Color.purple.opacity(0.2))
                                        .cornerRadius(15)
                                        .shadow(color: .purple.opacity(0.3), radius: 5, x: 0, y: 3)
                                        .onAppear {
                                            valor += 1
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
                
                // MENU LATERAL
                if showMenu {
                    menuOverlay
                        .transition(.move(edge: .leading))
                        .zIndex(1)
                }
            }
            .onAppear {
                uvm.fetch_user2()
            }
        }
    }
    
    private var menuOverlay: some View {
        ZStack(alignment: .leading) {
            // Fundo semi-transparente
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
            
            // Conteúdo do menu
            VStack(alignment: .leading, spacing: 20) {
                
                if let usuario = uvm.usuario {
                    NavigationLink(destination: PerfilView(usuarioviewModel: uvm)) {
                        AsyncImage(url: URL(string: usuario.foto)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.purple.opacity(0.5), lineWidth: 2))
                        .shadow(radius: 5)
                        .padding(.bottom, 10)
                    }
                    
                    Text("Olá,")
                        .font(.caption)
                        .foregroundColor(.black)
                    Text(usuario.user)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                } else {
                    ProgressView("Carregando perfil...")
                        .padding()
                }
                
                Divider()
                
                NavigationLink("Tela Inicial", destination: FeedView())
                    .foregroundColor(.black)
                NavigationLink("Configurações", destination: Text("Configurações"))
                    .foregroundColor(.black)
                NavigationLink("Suporte", destination: Text("Suporte"))
                    .foregroundColor(.black)
                NavigationLink("Dicas para adoção", destination: Text("Dicas para adoção"))
                    .foregroundColor(.black)
                NavigationLink("Minhas Solicitações", destination: Text("Minhas Solicitações"))
                    .foregroundColor(.black)
                NavigationLink("Meus Pets", destination: Text("Meus Pets"))
                    .foregroundColor(.black)
                NavigationLink("ONG's Disponíveis", destination: Text("ONG's Disponíveis"))
                    .foregroundColor(.black)
                NavigationLink("PetShop", destination: Text("PetShop"))
                    .foregroundColor(.black)
                
                Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("Sair")
                        .foregroundColor(.red)
                }
            }
            .padding()
            .frame(width: 280)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top, 50)
        }
    }
}

//#Preview {
//    FeedView(usuarioViewModel: UsuarioViewModel(id: "09e93e06c5a415ebe8ef9a2d562ccb89"))
//}

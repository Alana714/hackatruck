//

//  TelaInicial.swift

//  MyPet

//

//  Created by Turma01-15 on 13/05/25.

//

import SwiftUI

 
struct InicioView: View {
    @State private var showMenu = false
    @StateObject var usuarioViewModel = UsuarioViewModel()
    var body: some View {
        if let usuario = usuarioViewModel.usuario {
            NavigationStack{
                ZStack {
                    Color(.areia)
                    VStack {
                        headerView
                        ScrollView {
                            adocaoSection
                            Divider()
                            colocarParaAdocaoSection(usuario: usuario)
                            Divider()
                            compartilharSection
                            final
                        }
                    }
                    if showMenu {
                        menuOverlay
                    }
                }
                .navigationBarHidden(true) 
                .tint(.roxo)
            }
            .tint(.roxo)
        } else {
            VStack {
                ProgressView("Carregando Tela inicial...")
                    .padding()
            }
            .onAppear {
                usuarioViewModel.fetch_by_id(id: "b2fcaaa78ae132a22ce379d001bdd830")
            }
        }
    }
    private var headerView: some View {
        ZStack{
            Color(.roxo)
                .ignoresSafeArea()
                .frame(height:120)
            HStack {
                NavigationLink(destination: PerfilView()) {
                    HStack {
                        if let usuario = usuarioViewModel.usuario {
                            AsyncImage(url: URL(string: usuario.foto)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(5)
                            VStack(alignment: .leading) {
                                Text("Olá,")
                                    //.font(.caption)
                                    .foregroundColor(.areia)
                                Text(usuario.user)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.areia)
                            }
                        } else {
                            VStack {
                                ProgressView("Carregando perfil...")
                                    .padding()
                            }
                        }
                        
                    }
                }
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(.areia)
                    .padding()
                Button(action: {
                    withAnimation {
                        showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 30, height: 25)
                        .foregroundColor(.areia)
                }
            } //Hstack Cabecalho Sabrina Capenter
            
            .padding()
        }
    }
 
    private var adocaoSection: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Pets para adoção:")
                    .foregroundStyle(Color(.roxo))
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .padding()
                Spacer()
                NavigationLink(destination: FeedView()) {
                    Image(systemName: "arrowshape.right.circle.fill")
                        .font(.system(size: 30))
                        .padding(15)
                        .foregroundColor(.roxo) 
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    //ForEach(0..<4) { _ in
                    ForEach(usuarioViewModel.usuarios, id:\.self){
                            u in
                            ForEach(u.pets, id:\.self){
                                p in
                                VStack{
                                    NavigationLink(destination:AdocaoView(tutor:u, pet:p)){
                                        AsyncImage(url: URL(string: p.foto_pet!)){
                                            image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 100, height:100)
                                                .clipShape(Circle())
                                                .padding(.horizontal, 20.0)
                                        }placeholder: {
                                            ProgressView()
                                        }
                                    }
                                    Text(p.nome!)
                                        .foregroundStyle(.preto)
                                }
                            //}
                        }
                    }
                }
            }
        }
        .onAppear{
            usuarioViewModel.fetch_user2()
        }
    }

    private func colocarParaAdocaoSection(usuario: Usuario) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Quero colocar para adotar:")
                    .foregroundStyle(Color(.roxo))
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .padding()
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    NavigationLink(destination: FormularioView(usuario: usuario)) {
                        VStack{
                            ZStack{
                                Image(systemName: "pawprint.circle.fill")
                                    .font(.system(size: 100))
                                    .foregroundColor(.roxo)
                                Image(systemName: "plus")
                                    .font(.system(size: 20))
                                    .padding(.top, 20)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.roxo)
                            }
                            Text("Adicionar Pet")
                                .font(.subheadline)
                                .foregroundColor(.preto)
                                .fontWeight(.medium)
                        }
                        .padding(.leading, 20)
                    }
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
                                .foregroundColor(.preto)
                                .fontWeight(.medium)
                        }
                        .padding(15)
                    }
                }
            }
        }
    }
 
    private var compartilharSection: some View {

        VStack(alignment: .leading) {
            HStack {
                Text("Compartilhe seu pet:")
                    .foregroundStyle(Color(.roxo))
                    .font(.system(size: 22))
                    .fontWeight(.medium)
                    .padding()
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    //ForEach(0..<3) { _ in
                        AsyncImage(url: URL(string:"https://s2.glbimg.com/WfDQZSThzdZ087vj8NY31PMFJ_o=/e.glbimg.com/og/ed/f/original/2020/10/06/00000024_p.jpg")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray 
                        }
                        .frame(width: 100, height: 100)
                        .padding()
                    
                    AsyncImage(url: URL(string:"https://www.opovo.com.br/_midias/jpg/2023/07/14/comedy_pet_photos_award_fotos_finalistas7-22640431.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 100, height: 100)
                    .padding()
                    
                    AsyncImage(url: URL(string:"https://www.petlove.com.br/images/breeds/227696/profile/original/perfil-coelho.jpg?1597789099")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 100, height: 100)
                    .padding()
                    
                    AsyncImage(url: URL(string:"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:wnpenvfgi77zmd25rcw5vrjy/bafkreihl6pnikomg4t7vg4lrfsn5wpxiko4yird35cfcibtfxp47m7cka4@jpeg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 100, height: 100)
                    .padding()
                    //}
                }
            }
        }
    }
    private var final: some View {
        ZStack{
            Color(.roxo)
            VStack(alignment: .leading) {
                VStack {
                    Text("Criado pelo grupo Largados e Adotados.")
                        .foregroundStyle(Color(.areia))
                        .font(.caption)
                        //.font(.system(size: 22))
                        .fontWeight(.medium)
                        .padding(.top, 5)
                    Text("Todos os direitos reservados. ©2025")
                        .foregroundStyle(Color(.areia))
                        .font(.caption)
                        //.font(.system(size: 22))
                        .fontWeight(.medium)
                        .padding(.bottom, 5)
                    //Spacer()
                    
                }
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
                
                if let usuario = usuarioViewModel.usuario {
                    NavigationLink(destination: PerfilView(usuarioviewModel: usuarioViewModel)) {
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
                NavigationLink("Dicas para adoção", destination: AdocaoDicas())
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
 

#Preview {

    InicioView()

}

 

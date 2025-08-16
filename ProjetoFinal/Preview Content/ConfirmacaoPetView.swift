//
//  ConfirmacaoPetView.swift
//  MyPet
//
//  Created by Turma01-15 on 14/05/25.
//
import PhotosUI
import SwiftUI

struct ConfirmacaoPetView: View {

    var body: some View {
        ZStack{
            Color(.areia)
                .ignoresSafeArea()
            VStack {
                Text("Confirmação da Adoção!")
                    .foregroundStyle(.roxo)
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                
            }
        }
    }
}

//#Preview {
  //  ConfirmacaoPetView(recebeImagem: UIImage(systemName: "photo")!)
//}

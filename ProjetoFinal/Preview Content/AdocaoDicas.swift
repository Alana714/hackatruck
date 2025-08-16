//
//  AdocaoDicas.swift
//  ProjetoFinal
//
//  Created by Turma01-15 on 22/05/25.
//

import SwiftUI

struct AdocaoDicas: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Dicas para cuidar do seu Pet adotado!")
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding()
                ScrollView{
                    HStack{
                        Image(systemName: "pawprint.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.purple)
                            .padding()
                        Text("Prepare um cantinho para seu pet, certifique-se que ele tem água, comida e uma caminha confortável para dormir")
                            .padding()
                            .multilineTextAlignment(.leading)
                    }//Hstack das imagens 1
                    HStack{
                        Image(systemName: "pawprint.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.purple)
                            .padding()
                        Text("Leve seu pet ao veterinário e cuide da saúde dele. Manter a saúde so seu pet é importante para que ele tenha uma vida longa e feliz!")
                            .padding()
                            .multilineTextAlignment(.leading)
                        
                    } //Hstack das imagens 2
                    HStack{
                        Image(systemName: "pawprint.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.purple)
                            .padding()
                        Text("Dê muito amor e carinho ao novo integrante da família. Tome cuidado para não puxar o pelo e o robo do seu bichinho!")
                            .padding()
                            .multilineTextAlignment(.leading)
                    }//Hstack das imagens 3
                    
                    HStack{
                        Image(systemName: "pawprint.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.purple)
                            .padding()
                        Text("Cuide da segurança do seu pet. Coloque grades de proteção e tome cuidado com psicinas, animais maiores, ambientes externos e carros!")
                            .padding()
                            .multilineTextAlignment(.leading)
                    }//Hstack das imagens 4
                } //ScrollView
                
                }//Vstack principal
                
        }
        }
    }


#Preview {
    AdocaoDicas()
}

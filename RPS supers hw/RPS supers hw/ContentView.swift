//
//  ContentView.swift
//  hw
//
//  Created by Fatemah Almutairi on 19/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var cpupoints : Int = 0
    @State var playerpoints : Int = 0
    
    @State var cpupic = ("rock 1")
    @State var playerpic = ("rock 1")
                         
    @State var play1 = ""
    @State var play2 = ""

    var body: some View {
        ZStack{
            Color("bg")
                .ignoresSafeArea()
        VStack {
            TextField("Player 1", text: $play1)
                .padding()
                .frame(width: 250, height: 50)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(23)
            Text("points: \(cpupoints)")
                .padding()
            Image(cpupic)
                .resizable()
                .frame(width: 200, height: 200)
            Image(playerpic)
                .resizable()
                .frame(width: 200, height: 200)
                .onTapGesture {
                    //cpu
                    let cpuTap = Int.random(in: 1...3)
                    cpupic = imgen(cpuTap)
                    //my
                    let myTap = Int.random(in: 1...3)
                    playerpic = imgen(myTap)
                    
                    calculatepoints(myTap, cpuTap)
                }
            Text("points: \(playerpoints)")
                .padding()
            TextField("Player 2", text: $play2)
                .padding()
                .frame(width: 250, height: 50)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(23)
            }
        }
}
    func imgen(_ num: Int) -> String {
        if num == 1
        {
            return "rock 1"
        }
        else if num == 2
        {
            return "paper 1"
        }
        else if num == 3
        {
            return "scissors 1"
        }
        return "rock 1"
    }
    
    func calculatepoints(_  my: Int, _ cpu: Int) {
        if my == 1 && cpu == 2{
            cpupoints = cpupoints + 1
        }
        if my == 1 && cpu == 3{
            playerpoints = playerpoints + 1
        }
        if my == 2 && cpu == 1{
            playerpoints = playerpoints + 1
        }
        if my == 2 && cpu == 3{
            cpupoints = cpupoints + 1
        }
        if my == 3 && cpu == 1{
            cpupoints = cpupoints + 1
        }
        if my == 3 && cpu == 2{
            playerpoints = playerpoints + 1
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13")
    }
}

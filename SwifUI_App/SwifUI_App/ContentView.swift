//
//  ContentView.swift
//  SwifUI_App
//
//  Created by Nompilo Moyo on 2024/03/04.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var counterVM: CounterViewModel
    
    init() {
        counterVM = CounterViewModel()
    }
    
    var body: some View {
        VStack {
            Text(counterVM.premium ? "Premium" : "")
                .foregroundColor(Color.green)
                .frame(width: 200, height: 100)
                .font(.largeTitle)
            Text("\(counterVM.value)")
                .font(.title)
            Button("Increment"){
                self.counterVM.increment()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

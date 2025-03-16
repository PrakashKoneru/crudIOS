//
//  ContentView.swift
//  TodoApp
//
//  Created by Siva prakash Koneru on 3/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("To Do List!")
                .font(.largeTitle)
                .bold()
                .padding(.top, 40)
        }
        .padding()
        VStack {
            Text("Nothng here yet")
                .foregroundColor(Color.gray)
                .padding()
        }
        Button(action: {
            print("No action Yet")
        }){
            Text("Add Task")
                .padding()
                .font(.headline)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    ContentView()
}

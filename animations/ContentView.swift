//
//  ContentView.swift
//  animations
//
//  Created by Godwin IE on 08/10/2023.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello, SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var helloDragAmount = CGSize.zero

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .foregroundColor(.white)
                        .font(.title3)
                        .background(enabled ? .blue : .red)
                        .offset(helloDragAmount)
                        .animation(.default.delay(Double(num)/2), value: helloDragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged{helloDragAmount = $0.translation}
                    .onEnded{_ in
                        withAnimation {
                            helloDragAmount = .zero
                            enabled.toggle()
                        }
                    }
            )
            ZStack{
//                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                Color.gray.opacity(0.2)
                Text("Drag me 🚀")
                    .foregroundStyle(.white)
                    .font(.body)
            }
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{dragAmount = $0.translation}
                    .onEnded{_ in
                        withAnimation {
                            dragAmount = .zero
                            
                        }
                    }
            )
            //        .animation(.spring(), value: dragAmount)
        } //vstack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

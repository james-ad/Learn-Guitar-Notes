//
//  ContentView.swift
//  Learn Guitar Notes
//
//  Created by James Dunn on 7/16/23.
//

import SwiftUI

struct ContentView: View {
    let notes = ["A", "B", "C", "D", "E", "F", "G"]
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                // MARK: String notes
                // MARK: Fretboard
                VStack(alignment: .leading) {
                    Text("E")
                    Text("B")
                    Text("G")
                    Text("D")
                    Text("A")
                    Text("E")
                }
                .background(
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 50, height: 210)
                        .border(.black)
                        .position(x: 10, y: 61.5)
                )
                .padding()
                
                VStack {
                    ForEach(0..<6) { _ in
                        Spacer()
                        Rectangle()
                            .foregroundColor(.secondary)
                            .frame(height: 5)
                    }
                    Spacer()
                }
                .background(Color.brown)
                .frame(width: .infinity, height: 210)
                .border(.black)
            }
            .border(.black)
            
            HStack {
                // MARK: Settings
                // MARK: Readout
                Rectangle()
                    .foregroundColor(.blue)
                    .border(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: 45)
            ZStack {
                // In here is where you'll place the keyboard
                // It's a ZStack so you can show the sharps and flats over the whole notes (Check Android app for reference)
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        ForEach(notes.indices, id: \.self) { noteIndex in
                            Text(notes[noteIndex])
                                .font(.title)
                                .frame(width: geometry.size.width / CGFloat(notes.count), height: 100)
                                .background(Color.white)
                                .border(Color.black)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
                        .frame(width: 50, height: 200)
                        .border(.black)
                )
                .padding()
                Rectangle()
                    .foregroundColor(.brown)
                    .frame(width: .infinity, height: 200)
            }
            HStack {
                // MARK: Settings
                // MARK: Readout
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: .infinity, height: 20)
            }
            ZStack {
                // In here is where you'll place the keyboard
                // It's a ZStack so you can show the sharps and flats over the whole notes (Check Android app for reference)
                HStack(spacing: 0) {
                    ForEach(notes.indices) { noteIndex in
                        if noteIndex > notes.startIndex {
                            Spacer()
                        }
                        Text(notes[noteIndex])
                            .font(.title)
                            .background(
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: .infinity, height: 40)
                            )
                            .padding()
                            .border(.black)
                    }
                }
                .frame(width: .infinity)
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

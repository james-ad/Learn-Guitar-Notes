//
//  ContentView.swift
//  Learn Guitar Notes
//
//  Created by James Dunn on 7/16/23.
//

import SwiftUI

struct ContentView: View {
    let notes = ["A", "B", "C", "D", "E", "F", "G"]
    let openNotes = ["E", "B", "G", "D", "A" , "E"]
    
    var body: some View {
        // MARK: Container
        VStack(spacing: 0) {
            
            // GeoReader to fill up the notes and fretboard fractionally within the same container
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    // MARK: Fretboard Notes
                    VStack(alignment: .leading) {
                        ForEach(0..<6) { note in
                            Text(openNotes[note])
                                .font(.title3)
                                .padding(0.4)
                        }
                    }
                    .frame(width: geometry.size.width * 0.08, height: geometry.size.height)
                    .background(.red)
                    
                    // MARK: Strings
                    VStack {
                        Spacer()
                        ForEach(0..<6) { _ in
                            Rectangle()
                                .foregroundColor(.secondary)
                                .frame(height: 5)
                                .padding(.vertical, 9.7)
                        }
                        Spacer()
                    }
                    .background(Color.brown)
                    .frame(width: geometry.size.width * 0.92, height: geometry.size.height)
                    .border(.black)
                }
                .clipped()
                .border(.black)
            }
            .frame(height: 210)
            
            HStack {
                
                // MARK: Settings
                // MARK: Readout
                Rectangle()
                    .foregroundColor(.blue)
                    .border(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: 45)
            
            // MARK: Piano notes
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

//
//  NotesSaveData.swift
//  Password Keeper
//
//  Created by yusuf on 7.08.2024.
//

import Foundation

class NotesSaveData {
    private let notesKey = "savedNotes"

    func saveNote(title: String, noteText: String) {
        var notes = fetchNotes()
        notes[title] = noteText
        UserDefaults.standard.set(notes, forKey: notesKey)
    }

    func fetchNotes() -> [String: String] {
        return UserDefaults.standard.dictionary(forKey: notesKey) as? [String: String] ?? [:]
    }

    func getNoteContent(title: String) -> String? {
        let notes = fetchNotes()
        return notes[title]
    }

    func deleteNote(title: String) {
        var notes = fetchNotes()
        notes.removeValue(forKey: title)
        UserDefaults.standard.set(notes, forKey: notesKey)
    }
}



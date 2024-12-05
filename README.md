# Şifre Saklama Uygulaması (iOS)

SwiftUI ile geliştirilmiş, modern ve etkileşimli bir dil öğrenme deneyimi.



</div>

## ✨ Özellikler

- 🎯 SwiftUI ile modern ve akıcı kullanıcı arayüzü
- 💾 UserDefaults ile veri kaydı
- 📊 Gerçek zamanlı veri kaydı
- 🎨 iOS 16+ için optimize edilmiş tasarım


## 📱 Ekran Görüntüleri

<div align="center">
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/c2e6cb73-45a6-4197-acb7-0dbf0125cbc3"  /></td>
    <td><img src="https://github.com/user-attachments/assets/2b7a6866-7074-4776-a16c-c12ba9b47bdc" alt="Ana Sayfa" title="Soru Ekranı"/></td>
    <td><img src="https://github.com/user-attachments/assets/0ea16783-cbf3-4e5a-bcef-a4f127bb785e" /></td>
  </tr>
</table>
</div>

## 🛠 Gereksinimler

- iOS 16.0+
- Xcode 15.0+
- Swift 5.0+



## 🚀 Kurulum

```

### Manuel Kurulum

1. Projeyi klonlayın:
```bash
git clone https://github.com/yourusername/language-learning-app-ios.git
```

2. Xcode'da .xcodeproj dosyasını açın
3. Gerekli bağımlılıkların yüklendiğinden emin olun
4. Projeyi derleyin ve çalıştırın

## 💻 Kod Örnekleri


### Notları Kaydetme
```swift

    // Notları yükle ve kaydedilen notları geri getir
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

```


<div align="center">
⭐️ Bu projeyi beğendiyseniz yıldız vermeyi unutmayın!
</div>

//
//  FileUploaderView.swift
//  MISforEdu
//
//  Created by ChanningTong on 2/24/24.
//
import SwiftUI
import MobileCoreServices

struct FileUploaderButton: View {
    @Binding  var selectedURL: URL?
    @State private var isPickerPresented = false
    
    var body: some View {
        VStack {
            Button("选择文件") {
                isPickerPresented = true
                //exec selectedURL.path
                print(selectedURL?.path(percentEncoded: true))
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .sheet(isPresented: $isPickerPresented) {
                DocumentPickerViewController(allowedContentTypes: [kUTTypeItem as String]) { url in
                    selectedURL = url
                }
            }
        }
        .padding()
    }
}

struct DocumentPickerViewController: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
        //没必要,但是为了遵循protocol
    }
    
    typealias UIViewControllerType = UIDocumentPickerViewController
    
    let allowedContentTypes: [String]
    let onPicked: (URL) -> Void
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let documentPicker = UIDocumentPickerViewController(documentTypes: allowedContentTypes, in: .import)
        documentPicker.delegate = context.coordinator
        return documentPicker
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(onPicked: onPicked)
    }
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        let onPicked: (URL) -> Void
        
        init(onPicked: @escaping (URL) -> Void) {
            self.onPicked = onPicked
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            if let selectedURL = urls.first {
                onPicked(selectedURL)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FileUploaderButton(selectedURL: .constant(nil))
    }
}

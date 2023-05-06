//
//  SBQuickViewController+Delegates.swift
//  SBQuickLook
//
//  Created by Sebastian Baar on 23.02.23.
//

import QuickLook

extension SBQuickViewController: QLPreviewControllerDataSource {
    public func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return previewItems.count
    }

    public func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return previewItems[index]
    }
}

extension SBQuickViewController: QLPreviewControllerDelegate {
    @available(iOS 13.0, *)
    public func previewController(_ controller: QLPreviewController,
                                  editingModeFor previewItem: QLPreviewItem) -> QLPreviewItemEditingMode {
        .updateContents
    }

    public func previewControllerDidDismiss(_ controller: QLPreviewController) {
        dismiss(animated: false)
    }

    public func previewController(_ controller: QLPreviewController, didUpdateContentsOf previewItem: QLPreviewItem) {
        if self.configuration?.onFileUpdate != nil {
            self.configuration?.onFileUpdate!()
        }
    }
}

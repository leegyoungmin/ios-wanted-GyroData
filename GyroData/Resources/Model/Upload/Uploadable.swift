//
//  Uploadable.swift
//  GyroData
//
//  Copyright (c) 2023 Minii All rights reserved.

import Foundation

enum UploadError: Error {
    case urlCreationFailed
    case jsonUploadFailed
    case coreDataUploadFailed
}

protocol Uploadable {
    func upload(completion: @escaping (Result<Void, Error>) -> Void)
    
    func uploadJson(
        dispatchGroup: DispatchGroup,
        path: URL,
        transition: Transition,
        completion: @escaping (Result<Bool, UploadError>) -> Void
    )
    
    func uploadCoreDataObject(
        dispatchGroup: DispatchGroup,
        metaData: TransitionMetaData,
        completion: @escaping (Result<Bool, UploadError>) -> Void
    )
}

extension Uploadable {
    func uploadJson(
        dispatchGroup: DispatchGroup,
        path: URL,
        transition: Transition,
        completion: @escaping (Result<Bool, UploadError>) -> Void
    ) {
        dispatchGroup.enter()
        let result = SystemFileManager().saveData(path: path, value: transition)
        completion(.success(result))
        dispatchGroup.leave()
    }
    
    func uploadCoreDataObject(
        dispatchGroup: DispatchGroup,
        metaData: TransitionMetaData,
        completion: @escaping (Result<Bool, UploadError>) -> Void
    ) {
        dispatchGroup.enter()
        let result = PersistentContainerManager.shared.createNewGyroObject(metaData: metaData)
        completion(.success(result))
        dispatchGroup.leave()
    }
}

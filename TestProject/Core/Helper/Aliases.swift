//
//  Aliases.swift
//  Guess-surprise
//
//  Created by Alexey Tatarchenko on 16.06.2020.
//  Copyright © 2020 Aleksey Tatarchenko. All rights reserved.
//

import UIKit

typealias ModelCompletion<T> = (T) -> ()
typealias ModelsCompletion<T, U> = (T, U) -> ()
typealias HTTPCallback = (Swift.Result<Data, Error>) -> ()

typealias AlertableResultCallback<T> = ModelCallback<TestProjectResult<T>>

typealias BaseViewControllerView = BaseView & Setupable
typealias ReusableViewType = UITableViewCell.Type


typealias VoidCallback = () -> Void
typealias ModelCallback<T> = (T) -> Void
typealias SuccessCallback = ModelCallback<Bool>
typealias ErrorCallback = ModelCallback<AlertableError?>


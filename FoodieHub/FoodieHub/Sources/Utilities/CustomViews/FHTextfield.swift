import UIKit
import SnapKit

class FHTextfield: UIView, UITextFieldDelegate {
    
    var onValueChange: ((FHTextfield) -> ())?
    
    var text: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 14)
        textField.textColor = .black
        textField.tintColor = .black
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    var applyPhoneNumberFormatting: Bool = false
    
    init(title: String?) {
        super.init(frame: .zero)
        titleLabel.text = title
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UITextField
extension FHTextfield {
    private func configureUI() {
        addSubview(titleLabel)
        addSubview(textField)
        
        textField.delegate = self
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}

// MARK: - Actions

extension FHTextfield {
    @objc func textFieldDidChange(_ textField: UITextField) {
        onValueChange?(self)
    }
}

// MARK: - Methods
extension FHTextfield {
    func showError() {
        
        textField.layer.borderColor = UIColor.red.cgColor
        
        let placeholderText = NSAttributedString(string: "Заполните поле", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        textField.attributedPlaceholder = placeholderText
    }
    
    func hideError() {
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func formatPhoneNumber(_ phoneNumber: String) -> String {
        let mask = "+X (XXX) XXX-XXXX"
        let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = number.startIndex
        
        for character in mask {
            if index >= number.endIndex {
                break
            }
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }
}

// MARK: - UITextFieldDelegate

extension FHTextfield {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard applyPhoneNumberFormatting else {
            return true
        }
        
        guard let currentText = textField.text else {
            return true
        }
        
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let formattedText = formatPhoneNumber(updatedText)
        
        textField.text = formattedText
        
        return false
    }
}

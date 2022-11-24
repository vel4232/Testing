/*
 1-2: Изучено
 3. Напишите о четырёх ценностях, которые есть в манифесте Agile (своими словами).:
 Ценности состоят из выражения слева и справа, причем обе этих ценностей важны, но ценность слева важнее и имеет больших приоритет ценности справа.
 1.Люди и взаимодействие важнее процессов и инструментов. - Вне зависимости от того какие существуют инструменты программирования и процессы, с помощью которых, например, будет писаться тот или иной код и какую бы сложность они и/или их совокупность не имели, самое главное это создатели - люди и их взаимодейсвия, которые придумали машину и язык, с помощью которого с этой машиной можно взаимодействовать. Лишь сила человеческого ума и взаимодействие нескольких умов способны создать миллионы процессов и инструментов, в то время как сами по себе процессы и инструменты ничто без программиста, который взаимодействуя с другими программистами, способен сотворить нечто большее.
 2.Работающий продукт важнее исчерпывающей документации. - Самое главное это сформировать конечный работающий продукт, а не набор документации, свод определений и правил, которые не к чему будет применять, если продукта по существу и нет.
 3.Сотрудничество с заказчиком важнее согласования условий контракта. - Частичная отсылка к первому правилу. Гораздо проще на словах коммуницировать друг с другом и потом положить это на бумагу, нежели работать только языком контракта. Необходимо максимально сблизиться с заказчиком, чтобы понять что он хочет, во избежание недопониманий и бесконечного переделывания выполненной работы. Действительно, если бы мы общались языком контрактов, договоров и тз, то не пришли бы никогда к взаимному пониманию, а ввели бы чистую бюрократию, которая не привела бы ни к чем хорошему, и к тем более, к чему-либо новому.
 4.Готовность к изменениям важнее следования первоначальному плану. - Необходимо всегда быть гибким и подстраиваться к изменениям внешней среды и условий для того, чтобы соблюдать все вышеперечисленные пункты.
 4. Укажите минимум три отличия фреймворка Scrum от Kanban:
 1. Наличие Владельца продукта и Scrum-мастера
 2. Подходы к бизнес-процессу: универсальные спринты (kanban), стадии выполнения задач (scrum)
 3. Работа всей командой над одной задачей (canbam), работа каждого члена над разными разбитыми задачами (scrum).
 5.Опишите процесс работы по Scrum: Разработка проекта разделяется на спринты, по окончании которых клиент получает улучшенное ПО. Спринты строго фиксируются по времени, и могут длиться от 2 до 4 недель. Рабочий процесс в одном спринте включает в себя несколько стадий:
 -Определяются объемы работы
 -Каждый день проводятся 15-минутные встречи, чтобы члены команды могли скорректировать свою работу и подвести промежуточные итоги
 -Демонстрируются полученные результаты
 -Спринты обсуждаются для поиска удачных и неудачных решений и действий
 Над каждым проектом работает универсальная команда специалистов, к которой присоединяется еще два человека: владелец продукта и scrum-мастер. Первый соединяет команду с заказчиком и следит за развитием проекта; это не формальный руководитель команды, а скорее куратор. Второй помогает первому организовать бизнес-процесс: проводит общие собрания, решает бытовые проблемы, мотивирует команду и следит за соблюдением scrum-подхода.
 Scrum-подход делит рабочий процесс на равные спринты – обычно это периоды от недели до месяца, в зависимости от проекта и команды. Перед спринтом формулируются задачи на данный спринт, в конце – обсуждаются  результаты, а команда начинает новый спринт. Спринты очень удобно сравнивать между собой, что позволяет управлять эффективностью работы.
 6: Изучено
 */


import UIKit

//Приложение

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTargetIsNotEmptyTextFields()
        errorLabel.isHidden = true
    }
    
    func setupAddTargetIsNotEmptyTextFields() {
        loginButton.isEnabled = false
        loginTextField.addTarget(self, action: #selector(textFieldsIsNotEmpty), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldsIsNotEmpty), for: .editingChanged)
       }
    
    @objc func textFieldsIsNotEmpty(sender: UITextField) {

        sender.text = sender.text?.trimmingCharacters(in: .whitespaces)

        guard
          let login = loginTextField.text, !login.isEmpty,
          let password = passwordTextField.text, !password.isEmpty
          else {
          self.loginButton.isEnabled = false
          return
        }
        loginButton.isEnabled = true
        loginButton.addTarget(self, action: #selector(myButton), for: .touchUpInside)
       }
    
    @objc func myButton() {
        var rightNumber = 0
        var lowerLetter = 0
        var upperLetter = 0
        for i in loginTextField.text! {
            if i == "@" {
                rightNumber += 1
            }
        }
        for i in passwordTextField.text!.unicodeScalars {
            if CharacterSet.lowercaseLetters.contains(i) {
                lowerLetter += 1
            }
            if CharacterSet.uppercaseLetters.contains(i) {
                upperLetter += 1
            }
        }
        if rightNumber == 1 && (passwordTextField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil || passwordTextField.text!.count < 6 || upperLetter == 0 || lowerLetter == 0) {
            errorLabel.isHidden = false
            errorLabel.text = "Введен неверный пароль"
        }
        if rightNumber != 1 && (passwordTextField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil && passwordTextField.text!.count >= 6 && upperLetter != 0 && lowerLetter != 1) {
            errorLabel.isHidden = false
            errorLabel.text = "Введен неверный логин"
        }
        if rightNumber != 1 && (passwordTextField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil || passwordTextField.text!.count < 6 || upperLetter == 0 || lowerLetter == 0) {
            errorLabel.isHidden = false
            errorLabel.text = "Введен неверный логин и пароль"
        }
        if passwordTextField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil && passwordTextField.text!.count >= 6 && upperLetter != 0 && lowerLetter != 0 && rightNumber == 1 {
            errorLabel.isHidden = true
            performSegue(withIdentifier: "congratulations", sender: nil)
        }
       }
}

//Тесты

class MyModel {
    //Ввод логина и пароля
    var login = ""
    var password = ""
    //Переменные для теста
    var passwordNumberQuantity = false
    var passwordUpperLetter = false
    var passwordLowerLetter = false
    var passwordDigit = false
    var loginCorrect = false
    var buttonEnable = false
    var successLogin = false
    
    //
    func ckeck() {
        if password.count >= 6 {
            passwordNumberQuantity = true
        }
        for i in password.unicodeScalars {
            if CharacterSet.lowercaseLetters.contains(i) {
                passwordLowerLetter = true
            }
            if CharacterSet.uppercaseLetters.contains(i) {
                passwordUpperLetter = true
            }
        }
        if password.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
            passwordDigit = true
        }
        for i in login {
            if i == "@" {
                loginCorrect = true
            }
        }
        if password.count != 0 && login.count != 0 {
            buttonEnable = true
        }
        if passwordDigit == true && passwordNumberQuantity == true && passwordUpperLetter == true && passwordLowerLetter == true && loginCorrect == true {
            successLogin = true
        }
    }
}


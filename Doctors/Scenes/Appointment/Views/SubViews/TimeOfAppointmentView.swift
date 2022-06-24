//
//  TimeOfAppointmentView.swift
//  Doctors
//
//  Created by Sergey on 20.06.2022.
//

import UIKit

final class TimeOfAppointmentView: BaseView {
    private enum Constants {
        static let calendarIconName = "Calendar"
        static let clockImageName = "Clock"
        static let dateLabelNumberOfLines = 3
    }
    
    private enum Constraints {
        static let calendarIconImageViewCommonInset = 16
        static let calendarIconImageViewSize = 16
        
        static let dateLabelLeadingOffset = 8
        
        static let clockIconImageViewSize = 16
        static let clockIconImageViewLeadingOffset = 30
        
        static let timeLabelLeadingOffset = 8
        static let timeLabelTrailingInset = 16
    }
    
    private enum Texts {
        static let defaultTime = "12:00-13:00"
    }
    
    private let calendarIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.calendarIconName)
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.dateLabelNumberOfLines
        label.textAlignment = .left
        label.font = AppFonts.semiBold12.font
        return label
    }()
    
    private let clockIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.clockImageName)
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = Texts.defaultTime
        label.font = AppFonts.semiBold12.font
        return label
    }()
    
    override init() {
        super.init()
        self.setupLayout()
        self.configureView()
    }
    
    func setTime(with time: String) {
        self.dateLabel.text = time
    }
    
}

private extension TimeOfAppointmentView {
    func configureView() {
        self.backgroundColor = AppColors.lightBlue.value
        self.layer.cornerRadius = CommonConstants.cornerRadius
    }
    func setupLayout() {
        self.setupCalendarIconImageViewLayout()
        self.setupDatelabelLayout()
        self.setupClockIconImageViewLayout()
        self.setupTimeLabelLayout()
    }
    
    func setupCalendarIconImageViewLayout() {
        self.addSubview(self.calendarIconImageView)
        self.calendarIconImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(Constraints.calendarIconImageViewCommonInset)
            make.height.width.equalTo(Constraints.calendarIconImageViewSize)
        }
    }
    
    func setupDatelabelLayout() {
        self.addSubview(self.dateLabel)
        self.dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.calendarIconImageView.snp.trailing).offset(Constraints.dateLabelLeadingOffset)
            make.centerY.equalTo(self.calendarIconImageView)
        }
    }
    
    func setupClockIconImageViewLayout() {
        self.addSubview(self.clockIconImageView)
        self.clockIconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.calendarIconImageView)
            make.height.width.equalTo(Constraints.clockIconImageViewSize)
            make.leading.greaterThanOrEqualTo(self.dateLabel.snp.trailing).offset(Constraints.dateLabelLeadingOffset)
        }
    }
    
    func setupTimeLabelLayout() {
        self.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.clockIconImageView.snp.trailing).offset(Constraints.timeLabelLeadingOffset)
            make.trailing.equalToSuperview().inset(Constraints.timeLabelTrailingInset)
            make.centerY.equalTo(self.calendarIconImageView)
        }
    }
}

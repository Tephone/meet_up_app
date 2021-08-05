class NoticeMailer < ApplicationMailer
  def lesson_resavation_notice_mail_to_student(lesson_resavation)
    @lesson_resavation = lesson_resavation
    mail to: ENV['DEFAULT_EMAIL'], subject: '予約確定通知メール'
  end

  def lesson_resavation_notice_mail_to_teacher(lesson_resavation)
    @lesson_resavation = lesson_resavation
    mail to: ENV['DEFAULT_EMAIL'], subject: '予約受付通知メール'
  end
end

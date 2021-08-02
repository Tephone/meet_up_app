# Preview all emails at http://localhost:3000/rails/mailers/notice_mailer
class NoticeMailerPreview < ActionMailer::Preview
  def lesson_resavation_notice_mail_to_student
    @lesson_resavation = LessonResavation.last
    NoticeMailer.lesson_resavation_notice_mail_to_student(@lesson_resavation)
  end

  def lesson_resavation_notice_mail_to_teacher
    @lesson_resavation = LessonResavation.last
    NoticeMailer.lesson_resavation_notice_mail_to_teacher(@lesson_resavation)
  end
end

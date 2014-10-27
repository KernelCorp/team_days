class PostsMailer < ActionMailer::Base
  def new_post(category)
    @category = category
    bcc = category.subscriptions.map {|sub| sub.email}
    mail  to: 'formaildelivery@gamil.com', subject: "Новые побликации в категории #{category.name}", bcc: bcc, from: 'formaildelivery@gamil.com'
  end
end
require "mandrill"

class MandrillUserMailer < BaseMandrillDeviseMailer

  def recent_rates(user,user_locale, opts={})

    subject = ""

    if user_locale && user_locale == "de"
      subject = "Du hast Feedback erhalten!"
      template_name = "email_comm_newrates_recently_DE"

    else
      subject = "You've got feedback!"
      template_name = "email_comm_newrates_recently"
    end


    merge_vars = {
    }





    body = mandrill_template(template_name, merge_vars)
    if (user.email)
      send_mail(user.email, subject, body)
    end


  end

  def new_flex_review(expert, work, opts={})

    flex_url = ENV['EFW_BASE_FLEX_URL']


    subject = "You've got a request!"
    template_name = "email_comm_new_flex_review_brand_1"


    merge_vars = {
      "WORK_LINK" => "#{flex_url}/work/#{work.id}",
      "DISPLAY_NAME" => "",
    }





    body = mandrill_template(template_name, merge_vars)
    if (expert.expertemail)
      send_mail(expert.expertemail, subject, body)
    end


  end

  def new_rates_mvp(record, user, opts={})

    api_url = ENV['EFW_BASE_API_URL']
    app_url = ENV['EFW_BASE_APP_URL']
    review_payment = Reviewpayment.where(:work_id => record.id).first
    expert = User.find(review_payment.user_id)

    out_string = ""
    subject = ""

    subject = "You've got feedback!"
    out_string += ""
    template_name = "email_comm_newrates_mvp"



    merge_vars = {
      "WORK_LINK" => "#{app_url}/statdetail/#{record.id}",
      "EXPERT_PIC" => expert.picture.url(:preview),
      "NUM_PEOPLE" => out_string
    }





    body = mandrill_template(template_name, merge_vars)
    if (record.user.email)
      send_mail(record.user.email, subject, body)
    end


  end

  def new_rates(record,people_count,user_locale, opts={})

    api_url = ENV['EFW_BASE_API_URL']
    app_url = ENV['EFW_BASE_APP_URL']

    out_string = ""
    subject = ""


    if user_locale && user_locale == "de"
      subject = "Du hast Feedback erhalten!"
      if people_count == 1
        out_string += people_count.to_s+" Person"
      else
        out_string += people_count.to_s+" Leuten"
      end

      template_name = "email_comm_newrates_v2_DE"

    else
      subject = "You've got feedback!"
      if people_count == 1
        out_string += people_count.to_s+" person"
      else
        out_string += people_count.to_s+" people"
      end
      template_name = "email_comm_newrates_v2"
    end


    merge_vars = {
      "WORK_LINK" => "#{app_url}/community/statdetail?project_id=#{record.id}",
      "DISPLAY_NAME" => record.title || "Untitled",
      "NUM_PEOPLE" => out_string
    }





    body = mandrill_template(template_name, merge_vars)
    if (record.user.email)
      send_mail(record.user.email, subject, body)
    end


  end

  def confirmation_instructions(record, token, opts={})

    api_url = ENV['EFW_BASE_API_URL']
    app_url = ENV['EFW_BASE_APP_URL']


    merge_vars = {
      "CONFIRM_LINK" => "#{api_url}/auth/confirmation?config=default&confirmation_token=#{record.confirmation_token}&redirect_url=#{app_url}/registrationconfirm",
      "DISPLAY_NAME" => record.name || record.email
    }


    template_name = "email_comm_signup_confirm_march_2018"
    subject = "Verify your email address"


    body = mandrill_template(template_name, merge_vars)
    send_mail(record.email, subject, body)

  end


  def reset_password_instructions(record, token, opts={})

    api_url = ENV['EFW_BASE_API_URL']
    app_url = ENV['EFW_BASE_APP_URL']

    if I18n.locale == "de"
      template_name = "email_comm_password_reset-de"
    else
      template_name = "email_comm_password_reset"
    end

    subject = "Password reset"
    merge_vars = {
      "PASSWORD_RESET_LINK" => "#{api_url}/auth/password/edit.json?config=default&reset_password_token=#{token}&redirect_url=#{app_url}/community/confirmreset",
      "DISPLAY_NAME" => record.name || record.email
    }

    body = mandrill_template("email_comm_password_reset", merge_vars)
    send_mail(record.email, subject, body)
  end



end

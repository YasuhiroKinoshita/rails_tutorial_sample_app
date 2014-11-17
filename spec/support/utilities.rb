def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
        base_title
    else
        "#{base_title} | #{page_title}"
    end
end

def sign_in(user, options={})
    if options[:no_capybara]
        # Capybaraを使用していない場合にもサインインする
        remember_token = User.new_rememner_token
        cookies[:remember_token] = remember_token
        user.update_attribute :remember_token, User.crypt(remember_token)
    else
        visit signin_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
    end
end

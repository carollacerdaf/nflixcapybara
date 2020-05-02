When("I log in with {string} and {string}") do |email , password|
    @login_page.go
    @login_page.with(email,password)
    sleep 2
end

Then("I must be authenticated") do    
    expect(get_token.length).to be 147
end

And("should see {string} in profile page") do |expect_name|
    expect(@sidebar.logged_user).to eql expect_name
    
end

Then("I should not be authenticated") do
    expect(get_token).to be nil
end

And("should see alert message {string}") do |expect_message|
    expect(@login_page.alert).to eql expect_message
    
end
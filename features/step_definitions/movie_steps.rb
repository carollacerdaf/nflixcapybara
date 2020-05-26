Given("that {string} is a new movie") do |movie_code|
    file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/movies.yaml'))
    @movie = file[movie_code]
    Database.new.delete_movie(@movie["title"])
  end

  But("it already exists in the catalog") do
    Database.new.insert_movie(@movie)
  end
  
  When("I do the movie register") do
    @movie_page.add
    @movie_page.form.create(@movie)
    sleep 3
    
  end
  
  Then("I should see the new movie in the list") do
    result = @movie_page.movie_tr(@movie["title"])
    expect(result).to have_text @movie["title"]
    expect(result).to have_text @movie["status"]
  end

  Then("I should see the warning {string}") do |expect_alert|
    expect(@movie_page.form.alert).to eql expect_alert
    sleep 3
  end

  Given("that {string} is in the catalog") do |movie_code|
    steps %{
      Given that "#{movie_code}" is a new movie
      And it already exists in the catalog
    }
  end
  
  When("I request deletion") do
   @movie_page.remove(@movie["title"])
  end
  
  When("I confirm it") do
    @movie_page.sweet_alert.confirm
  end
  
  Then("it has to be removed from the catalog") do 
    expect(@movie_page.has_no_movie(@movie["title"])).to be true
  end

  When("cancel the request") do
    @movie_page.sweet_alert.cancel
  end
  
  Then("this item must remain in the catalog") do
    expect(@movie_page.has_movie(@movie["title"])).to be true
  end
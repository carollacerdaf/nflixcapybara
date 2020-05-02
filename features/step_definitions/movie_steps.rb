Given("that {string} is a new movie") do |movie_code|
    file = YAML.load_file(File.join(Dir.pwd, 'features/support/fixtures/movies.yaml'))
    @movie = file[movie_code]
    puts @movie

  end
  
  When("I do the movie register") do
    @movie_page.add
    @movie_page.create(@movie)
    sleep 3
    
  end
  
  Then("I should see the new movie in the list") do
    pending # Write code here that turns the phrase above into concrete actions
  end
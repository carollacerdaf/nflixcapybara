class MovieAdd
    include Capybara::DSL

    def create(movie)
        find('input[name=title]').set movie["title"]
    
        # combobox customizado com lis
        find('input[placeholder=Status]').click
        find('.el-select-dropdown__item', text: movie["status"]).click
    
        find('input[name=year]').set movie["year"]
        find('input[name=release_date]').set movie["release_date"]
    
        add_actors(movie["actors"])
        
        find('textarea[name=overview]').set movie["storyline"]
    
        upload(movie["cover"])
        
    end
    
    def upload(file)
        cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + file)
        Capybara.ignore_hidden_elements = false
        attach_file('upcover', cover_file)
        Capybara.ignore_hidden_elements = true
    end
    
    def add_actors(cast)
    actor = find('.input-new-tag')
        cast.each do |a| 
            actor.set a
            actor.send_keys :tab
        end
    end
    
    def alert
        find(".alert").text
    end
    
    def select_status(status)
        find('input[placeholder=Status]').click()
        find('.el-select-dropdown__item', text: status).click
    end
end
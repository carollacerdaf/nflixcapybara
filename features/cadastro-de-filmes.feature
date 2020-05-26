@login
Feature: Cadastro de Filmes

    Filmes
    @new_movie
    Scenario Outline: Novo Filme

        The catalog manager regiter a new movie through a form,
        and the new register is inserted in the Ninjaflix catalog.

        Given that <code> is a new movie
        When I do the movie register
        Then I should see the new movie in the list

        Examples:
            | code       |
            | "ultimato" |
            | "spyder"   |
            | "joker"    |

    @dup_movie
    Scenario: Duplicated

        The administrador of the catalog tries to register a movie, but the title has already been
        registered, and the system notifies the user that the title informed already exists.

        Given that "deadpool2" is a new movie
        But it already exists in the catalog
        When I do the movie register
        Then I should see the warning "Oops - Este titulo já existe no Ninjaflix."
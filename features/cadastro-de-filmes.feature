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

Feature: Login

    In order to access packages and be able to create other ones
    Been a already regitered user
    I/ must be able to access the system with my email and password

    @login_happy
    Scenario: Access
        When I log in with "carol@mail.com" and "pwd123"
        Then I must be authenticated
        And should see "Caroline Lacerda" in profile page

    @login_hapless
    Scenario Outline: Failed Login
        When I log in with <email> and <password>
        Then I should not be authenticated
        And should see alert message <text>

        Examples:
            | email            | password | text                           |
            | "carol@mail.com" | "abc123" | "Usuário e/ou senha inválidos" |
            | "tony"           | "abc"    | "Usuário e/ou senha inválidos" |
            | ""               | "abs"    | "Opps. Cadê o email?"          |
            | "tony"           | ""       | "Opps. Cadê a senha?"          |



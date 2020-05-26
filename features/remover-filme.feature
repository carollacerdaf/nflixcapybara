Feature: Remove movie

   In order to keep the catalog updated
   Been a catalog manager who found a canceled/not wanted title or a title that doesn't have a good evaluation
   I can remove it

   
   Scenario: Confirm deletion

      Given that "dbz" is in the catalog
      When I request deletion
      And I confirm it
      Then it has to be removed from the catalog

@rm_movie
   Scenario: Cancel deletion

      Given that "10_coisas" is in the catalog
      When I request deletion
      But cancel the request
      Then this item must remain in the catalog
require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
   
   def setup
      @barman = Barman.create(barmanname: "Anze", email: "anze@fajfargroup.com")
      @recipe = @barman.recipes.build(name: "mojito", summary: "best cocktail there is", 
      description: "Lime, add ice and sugar more alcohol,have fun, put in the freezer")
      
   end
   
   test "recipe should be valid" do
      assert @recipe.valid? 
   end
   
   test "barman_id should be present" do
      @recipe.barman_id = nil
      assert_not @recipe.valid?
   end
   
   
   
    
   test "name should be present" do
      @recipe.name = " "
      assert_not @recipe.valid?
   end
   
   test "name length should not be too long" do
      @recipe.name = "a" * 101
      assert_not @recipe.valid?
   end
   
   test "name length should not be too short" do
      @recipe.name = "aaaa"
      assert_not @recipe.valid?
   end
   
   test "summary must be present" do
      @recipe.summary = " "
      assert_not @recipe.valid?
   end
   
   test "summary length should not be too long" do
      @recipe.summary = "a" * 151
      assert_not @recipe.valid?
   end
   
   test "summary length should not be too short" do
      @recipe.summary = "a" * 9
      assert_not @recipe.valid?
   end
   
   test "description must be present" do
      @recipe.description = " "
      assert_not @recipe.valid?
   end
   
   test "description should not be too long" do
      @recipe.description = "a" * 501
      assert_not @recipe.valid?
   end
   
   test "description should not be too short" do
      @recipe.description = "a" * 19
      assert_not @recipe.valid?
   end
   
end
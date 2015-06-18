require 'test_helper'

class BarmanTest < ActiveSupport::TestCase
   
   def setup
   
   @barman = Barman.new(barmanname: "Anze", email: "example@example.com")
   
   end
   
   test "barman should be valid" do
       assert @barman.valid?
   end
    
    test "barmanname should be present" do
        @barman.barmanname = " "
        assert_not @barman.valid?
    end
    
    test "barmanname should not be too long" do
        @barman.barmanname = "a" * 41
        assert_not @barman.valid?
    end
    
    test "barmanname should not be too short" do
        @barman.barmanname = "aa"
        assert_not @barman.valid?
    end
    
    test "email should be present" do
        @barman.email = " "
        assert_not @barman.valid?
    end
    
    test "email length should be within bounds" do
        @barman.email = "a" * 101 + "@example.com"
        assert_not @barman.valid?
    end
    
    test "email address should be unique" do
       dup_chef = @barman.dup
       dup_chef.email = @barman.email.upcase
       @barman.save
       assert_not dup_chef.valid?
    end
    
    test "email validation should accept valid addresses" do
        valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.com laura+joe@wonk.com ]
        valid_addresses.each do |va|
            @barman.email = va
            assert @barman.valid?, '#{va.inspect} should be valid'
        end
    end
    
    test "email validation should reject invalid" do
        invalid_addresses = %w[user@example,com user_at_eee.org user.name@example eee@i_am.com foo@ee+aar.com]
        invalid_addresses.each do |va2|
           @barman.email = va2
           assert_not @barman.valid?,'#{va2.inspect} should be invalid'
        end
    end
    
end
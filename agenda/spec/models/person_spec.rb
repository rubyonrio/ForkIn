require 'spec_helper'

describe Person do

  before(:each) do
    @person = Person.new(:name => 'Name', :last_name => 'Last Name')
  end

  it 'should not create person without name' do    
    @person.name = nil
    @person.should_not be_valid
  end

  it 'should not create person without last name' do    
    @person.last_name = nil
    @person.should_not be_valid
  end
  
  it 'should not create with last name less 2 chars' do
    @person.last_name='a'
    @person.should_not be_valid	
  end

  it 'should not create with last name more 10 chars' do
    @person.last_name='00000018340918491748167'
    @person.should_not be_valid	
  end
  
  it 'should create perso with name and last name' do
    @person.name = 'Higor'
    @person.last_name = 'Silva'
  end
  
end

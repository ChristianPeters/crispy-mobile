require 'spec_helper'

describe Crispy::ClientProfile do
  UA_STRING = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.47 Safari/536.11'

  describe 'property assignment' do
    it 'makes the user agent string accessible' do
      profile = Crispy::ClientProfile.new UA_STRING
      profile.user_agent.should == UA_STRING
    end

    it 'makes a given hash property accessible' do
      profile = Crispy::ClientProfile.new UA_STRING, width: 320
      profile.width.should == 320
    end

    it 'makes a given cookie string property accessible' do
      profile = Crispy::ClientProfile.new UA_STRING, 'width:320'
      profile.width.should == 320
    end

    it 'provides a default_width' do
      WURFL.stub(:new).and_return({}) # avoid long running call
      profile = Crispy::ClientProfile.new UA_STRING
      profile.width.should > 0
    end
  end

  describe '#to_cookie_string' do
    it 'converts one profile property correctly' do
      stub_const('Crispy::ClientProfile::PROFILE_PROPERTIES', [:prop1])
      Crispy::ClientProfile.property :prop1
      profile = Crispy::ClientProfile.new UA_STRING, prop1: 'val1'
      profile.to_cookie_string.should == 'prop1:val1'
    end

    it 'converts multiple profile properties correctly' do
      stub_const('Crispy::ClientProfile::PROFILE_PROPERTIES', [:prop1, :prop2])
      Crispy::ClientProfile.property :prop1
      Crispy::ClientProfile.property :prop2
      profile = Crispy::ClientProfile.new UA_STRING, prop1: 'val1', prop2: 2
      profile.to_cookie_string.should == 'prop1:val1,prop2:2'
    end
  end

  describe '#cookie_string_to_hash' do
    it 'converts one string property correctly' do
      Crispy::ClientProfile.cookie_string_to_hash('prop1:val1').should == {'prop1' => 'val1'}
    end

    it 'converts two string properties correctly' do
      Crispy::ClientProfile.cookie_string_to_hash('prop1:val1,prop2:val2').should == {'prop1' => 'val1', 'prop2' => 'val2'}
    end

    it 'converts integerish string properties to integers' do
      Crispy::ClientProfile.cookie_string_to_hash('prop1:1,prop2:22,prop3:3rdval').should == {'prop1' => 1, 'prop2' => 22, 'prop3' => '3rdval'}
    end
  end
end

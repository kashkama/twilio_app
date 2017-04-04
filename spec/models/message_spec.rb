require 'rails_helper'

  describe  Message,  :vcr  => true do
    it "doesn't save the message if twilio gives an error"  do
      message = Message.new(:Body => 'hi', :to  => '1111111', :from => '5039463641')
      message.save
      message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number"]
    end
  end

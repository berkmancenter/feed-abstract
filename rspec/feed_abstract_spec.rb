describe Feed::Abstract do

  it "should be able to parse" do
    Feed::Abstract.respond_to?(:parse).should == true


  end

end

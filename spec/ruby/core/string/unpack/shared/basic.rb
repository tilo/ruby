describe :string_unpack_basic, shared: true do
  it "ignores whitespace in the format string" do
    "abc".unpack("a \t\n\v\f\r"+unpack_format).should be_an_instance_of(Array)
  end

  it "calls #to_str to coerce the directives string" do
    d = mock("unpack directive")
    d.should_receive(:to_str).and_return("a"+unpack_format)
    "abc".unpack(d).should be_an_instance_of(Array)
  end

  ruby_version_is "3.3" do
    # https://bugs.ruby-lang.org/issues/19150
    it 'raise ArgumentError when a directive is unknown' do
      -> { "abcdefgh".unpack("a R" + unpack_format) }.should raise_error(ArgumentError, /unknown unpack directive 'R'/)
      -> { "abcdefgh".unpack("a 0" + unpack_format) }.should raise_error(ArgumentError, /unknown unpack directive '0'/)
      -> { "abcdefgh".unpack("a :" + unpack_format) }.should raise_error(ArgumentError, /unknown unpack directive ':'/)
    end
  end
end

describe :string_unpack_no_platform, shared: true do
  it "raises an ArgumentError when the format modifier is '_'" do
    -> { "abcdefgh".unpack(unpack_format("_")) }.should raise_error(ArgumentError)
  end

  it "raises an ArgumentError when the format modifier is '!'" do
    -> { "abcdefgh".unpack(unpack_format("!")) }.should raise_error(ArgumentError)
  end
end

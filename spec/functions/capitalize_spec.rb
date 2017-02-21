require 'spec_helper'

# Editor to capitalize srings including UTF8: http://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_touppercase

describe 'capitalize' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params().and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params(100).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params("one").and_return("One") }
  it { is_expected.to run.with_params("one two").and_return("One two") }
  it { is_expected.to run.with_params("ONE TWO").and_return("One two") }

  it { is_expected.to run.with_params(AlsoString.new("one")).and_return("One") }
  it { is_expected.to run.with_params([]).and_return([]) }
  it { is_expected.to run.with_params(["one", "two"]).and_return(["One", "Two"]) }
  it { is_expected.to run.with_params(["one", 1, "two"]).and_return(["One", 1, "Two"]) }
  
  # Extended ASCII characters
  it { is_expected.to run.with_params("å").and_return("Å") }
  it { is_expected.to run.with_params("æ").and_return("Æ") }
  it { is_expected.to run.with_params("ç").and_return("Ç") }

  # Vowels with diaresis
  it { is_expected.to run.with_params("á").and_return("Á") }
  it { is_expected.to run.with_params("ë").and_return("Ë") }
  it { is_expected.to run.with_params("ï").and_return("Ï") }
  it { is_expected.to run.with_params("ố").and_return("Ố") }
  it { is_expected.to run.with_params("ü").and_return("Ü") }
  it { is_expected.to run.with_params("ü").and_return("Ü") }
  it { is_expected.to run.with_params("theüthing").and_return("Theüthing") }

  # UTF8 String - https://www.tienhuis.nl/utf8-generator
  it { is_expected.to run.with_params("čǻρίţāŀіşè₣ụאָčţìŏאּ").and_return("Čǻρίţāŀіşè₣ụאָčţìŏאּ") }
end
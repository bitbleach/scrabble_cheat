class PagesController < ApplicationController

  def search
    @term = params[:search][:query]
    seed_fake_definition if @term.first.blank?
    @definitions = cookies[@term].blank? ? map_definitions(@term) : JSON.parse(cookies[@term]) 
  end
  
  private
  
  def seed_fake_definition
    @term.strip!
    if cookies[@term].blank?
      cookies[@term] = { expires: (2.hours.from_now), value: fake_definitions } 
    else
      cookies[@term] = { expires: (2.hours.from_now), value: cookies[@term] }
    end
  end
  
  def map_definitions(word)
     Wordnik.word.get_definitions(word, limit: 6).map{ |t| t['text'] }
  end
    
  def fake_definitions
    JSON.generate((1..rand(1..4)).flat_map{ LiterateRandomizer.sentence })
  end
end

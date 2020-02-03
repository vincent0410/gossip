require 'csv'

class Gossip

  attr_accessor :mon_super_auteur, :ma_super_description

  def initialize (auteur, description)
    @mon_super_auteur = auteur
    @ma_super_description = description
  end

 
  def save
    CSV.open("./db/gossip.csv","ab") do |csv|
      csv << [@mon_super_auteur,@ma_super_description]
    end
  end

  def self.all
  all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips<<Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end


  

end

class OrderStrategy
  attr_accessor :header, :middle, :badges, :signature

  def initialize(order)
    @order = order
  end

  def describe_order
    @header = get_header
    @middle = get_middle
    @badges = get_badges
    @signature = get_signature
  end

  def get_header
    "Związek Harcerstwa Rzeczypospolitej <br>
          #{@order.troop.region} <br>
        #{@order.troop.full_name}"
  end

  def get_middle
    "ROZKAZ L/#{@order.number}/15/16<br>
    Druhny!<br>#{@order.quote}"
  end

  def get_signature
    "Czuwaj!<br>
    Drużynowa<br>
    #{@order.troop.team_leader.full_name}"
  end

  def get_badges
    answer = []
    @order.opened_badges.each do |badge|
      answer.push("Otwieram próbę na sprawność #{badge.name} #{badge.stars} druhnie #{badge.scout.full_name}")
    end
    @order.closed_badges.each do |badge|
      answer.push("Zamykam próbę i przyznaję sprawność #{badge.name} #{badge.stars} druhnie #{badge.scout.full_name}")
    end
    answer
  end
end

class CampOrderStrategy < OrderStrategy
  def get_header
    "Związek Harcerstwa Rzeczypospolitej <br>
      Zgrupowanie Szczepu #{@order.troop.district} <br>
        Podobóz #{@order.troop.full_name}"
  end

  def get_middle
    "ROZKAZ L/#{@order.number}/16/AL<br>
    Druhny!<br>#{@order.quote}"
  end

  def get_signature
    "Czuwaj!<br>
    Komendantka<br>
    #{@order.troop.team_leader.full_name}"
  end

end

class WinterOrderStrategy < OrderStrategy
  def get_header
    "Związek Harcerstwa Rzeczypospolitej <br>
      Zimowisko Szczepu #{@order.troop.district} <br>
          #{@order.troop.full_name}"
  end

  def get_middle
    "ROZKAZ L/#{@order.number}/16/AZ<br>
    Druhny!<br>#{@order.quote}"
  end

  def get_signature
    "Czuwaj!<br>
    Komendantka<br>
    #{@order.troop.team_leader.full_name}"
  end

end
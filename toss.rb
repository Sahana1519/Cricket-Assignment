class Toss
    def toss_coin(coinside,team_name)
        if(coinside == 1)
             puts team_name + " Won The Toss"
             return team_name
        elsif(coinside == 2)
             puts team_name +" Loss The Toss" 
             if(team_name == "Team A")
                 return "Team B"
             else
                 return "Team A"
             end
         else
            puts "Select Only Above Choices Only"
        end
       
    end

    def game_selection(type,team)
       if(type == 1)
            puts team + " Select To Bat"
            return "Bat"
        elsif(type == 2)
            puts team + " Select To Ball"
            return "Ball"
        else
            puts "Select Only Above Choices Only"
        end
    end
  end
  
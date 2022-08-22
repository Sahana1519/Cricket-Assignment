$LOAD_PATH << '.'
require 'setting'
require 'teams'
require 'toss'
require 'match'

class PlayGame 
    def select_match_type
        puts "Select Match Type : 1=> Test 2=> ODI 3=> T20"
        @match_choice = gets.chomp.to_i
        case @match_choice
        when 1
          puts "Test Match Selected"
          @match_type ="Test Match"
          @total_over = $TEST_OVERS
        when 2
          puts "ODI Match Selected"
          @match_type ="ODI Match"
          @total_over = $ODI_OVERS
        when 3
          puts "T20 Match Selected"
          @match_type ="T20 Match"
          @total_over = $T20_OVERS
        else
          puts "Please Select Above Selection Only"
        end
       

    end
    def team_selection
        @team_name = Teams.new.select_team == 1 ? "Team A" : "Team B"
        
    end

    def toss_game
        puts "Select Coin Side : 1=> Head 2=> Tails"
        @coin_choice = gets.chomp.to_i 
        @selected_side = @coin_choice == 1 ? "Heads" : "Tails"
        puts @team_name + " Selected " + @selected_side
        @toss_result = rand 1..2
        team = Toss.new
        @toss_team=team.toss_coin(@toss_result,@team_name)
        
      
    end
    
    def select_game
        puts "Select Game : 1=> Bat 2=> Ball"
        @game_choice = gets.chomp.to_i
        game = Toss.new
        selected_game = game.game_selection(@game_choice,@toss_team)

        if(@toss_team == "Team A" && selected_game == "Bat")
           @bat_team = "Team A"
           @ball_team = "Team B"
        else
            @bat_team = "Team B"
            @ball_team = "Team A"
       end
        
    end

    def start_game
        
        puts @match_type + " Have Started"
        new_game =  Match.new
        first_innings = new_game.play_game(@bat_team,@ball_team,@total_over,"1st")
        second_innings = new_game.play_game(@ball_team,@bat_team,@total_over,"2nd")
        required_run = first_innings + 1
        puts @bat_team + " Total Runs In 1st Innings " + first_innings.to_s
        puts @ball_team + " Total Runs Required To Win " + (first_innings + 1).to_s
        puts @ball_team + " Total Runs In 2nd Innings " + second_innings.to_s
        if(first_innings > second_innings)
            puts @bat_team + " Won The Match"
        elsif(second_innings >= required_run)
            puts @ball_team + " Won The Match"
        else
            puts "Match Draw"
        end

        
    end

    
end

game = PlayGame.new
game.select_match_type
game.team_selection
game.toss_game
game.select_game
game.start_game
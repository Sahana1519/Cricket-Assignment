$LOAD_PATH << '.'
require 'setting'
class Match
    def play_game(batting_team,balling_team,total_overs,innings)

        puts innings + " Innings Started"
        puts batting_team + " is Batting"
        puts "Team Members of " + batting_team
        @bat_team = batting_team == "Team A" ? $Team_A : $Team_B
        p @bat_team
        puts balling_team + " is Bolwing"
        puts "Team Members of " + balling_team
        @ball_team = balling_team == "Team B" ? $Team_B : $Team_A
        p @ball_team
        puts "Total Over = " + total_overs.to_s
        puts "Bolwers Are"
        @bowlers = @ball_team.sample(2)
        p @bowlers
        puts @bowlers[0] + " is bolwing"
        @batter = @bat_team.sample(1)
        puts @batter[0] + " Is Batting"
        @bat_team.delete(@batter[0])
        p @bat_team
        @total_balls = total_overs*6
        i = 1
        j = 1
        @total_run = []
        while j<= total_overs
            puts j.to_s + " Over Started"
            
            @total_run_over = 0
            @total_over = []
            while i<= $Balls_Over
                @runs = rand 0..10
                if ($Runs.include?(@runs) == true)
                    @total_over << @runs
                    @total_run_over = @total_run_over + @runs
                end
                if ($Dot_ball.include?(@runs) == true)
                    @total_over << 0
                    @total_run_over = @total_run_over + 0
                end
                if ($Out.include?(@runs) == true)
                    @total_over << 'wt'
                    @total_run_over = @total_run_over + 0
                end
                i += 1
                
            end
            @total_run << @total_run_over  
            i = 1
            p @total_over
            j += 1
        end
        @total = 0
        @total_run.each { |a| @total+=a }
        return @total
    end
end
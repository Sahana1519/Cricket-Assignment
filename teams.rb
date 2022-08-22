class Teams
  def select_team
    puts "Select Team : 1=> Team A 2=> TEAM B"
    @team_choice = gets.chomp.to_i
    if(@team_choice == 1)
      puts "Team A Is Selected"
    elsif(@team_choice == 2)
      puts "Team B Is Selected"
    else
      puts "Select Only Above Choices Only"
    end
    return @team_choice
  end
end

class Match < ActiveRecord::Base
	attr_accessible :id, :identifier, :player1_id, :player2_id, :round, :scores_csv, :state, :tournament_id, :winner_id, :player1_name, :player2_name, :last_update
	
	# This is the initial import from Challonge. Specify tournament name	
	def self.get_matches(tournamentname)
		Challonge::Tournament.find(tournamentname).matches.each do |match|
			unless exists?(id: match.id)
				create!(
					id: match.id,
					identifier: match.identifier,
					player1_id: match.player1_id,
					player2_id: match.player2_id,
					round: match.round,
					scores_csv: match.scores_csv,
					state: match.state,
					tournament_id: match.tournament_id,
					winner_id: match.winner_id,
					player1_name: match.player1.name,
					player2_name: match.player2.name
				)
			end
		end
	end

	# There's probably a better way to do this
	# But this took hours to figure out so I'll fix it later.
	def self.update_matches
		matchlist = Challonge::Tournament.find('cvg_test').matches

		matchlist.each do |match|
		updatematch = Match.find_by_id(match.id)

			if Time.parse(match.updated_at).in_time_zone > updatematch.updated_at
				updatematch.update_attributes(
					:identifier => match.identifier,
					:player1_id => match.player1_id,
					:player2_id => match.player2_id,
					:round => match.round,
					:scores_csv => match.scores_csv,
					:state => match.state,
					:tournament_id => match.tournament_id,
					:winner_id => match.winner_id,
					:player1_name => match.player1.name,
					:player2_name => match.player2.name
				)
			else
			end
		end
	end
end

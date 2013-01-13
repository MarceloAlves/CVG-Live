class HomeController < ApplicationController
  def index
	@tournamentlist = Match.where(:state => 'open').sort_by! {|a| [a.identifier.length, a.identifier]}

	if @tournamentlist.empty?
		Match.get_matches('cvg_test')
		@tournamentlist = Match.all.sort_by! {|a| [a.identifier.length, a.identifier]}
	else
	end

	#@tournamentlist.reject! {|a| a.state != "open"}
	@previousmatch = Match.where(:state => 'complete').sort_by! {|a| [a.identifier.length,a.identifier]}.last
  end
end

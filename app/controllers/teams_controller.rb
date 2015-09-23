class TeamsController < ApplicationController
  def new
    @team = Team.new
    2.times { @team.team_locations.build }
  end

  def create
    team = Team.new(team_params)

    unless team.save
      @team = team
      render :new and return
    end

    redirect_to root_path
  end

  private

  def team_params
    params.require(:team)
          .permit(:name, :mailing_list, team_locations_attributes: [:name, :time_zone, :eod_time])
  end
end
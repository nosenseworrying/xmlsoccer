module HashedResponses
  
  GetAllLeagues = {id: "1", name: "English Premier League", 
                            country: "England", historical_data: "Yes", fixtures: "Yes", livescore: "Yes", number_of_matches: "2557", 
                            latest_match: DateTime.parse("2013-03-02T16:00:00+01:00")}
  GetAllTeams = { team_id: "4", name: "Fulham", country: "England", stadium: "Craven Cottage",home_page_url: "http://www.fulhamfc.com/", wiki_link: "http://en.wikipedia.org/wiki/Fulham_F.C."}
  
  GetFixturesByDateInterval = { id: "287180", date: DateTime.parse("2013-02-22T21:30:00+01:00"), league: "La Liga", round: "25", home_team: "Ath Bilbao", 
                                home_team_id: "143", home_goals: "1", away_team: "Sociedad", away_team_id: "140",
                                away_goals: "3", time: "Finished", location: "San Mam?s", bet_at_home: "2,20", bet_at_draw: "3,35", bet_at_away: "3,15",
                                bet_at_home_link: "http://affiliates.bet-at-home.com/processing/clickthrgh.asp?btag=a_62598b_303",
                                interwetten_home: "2,10", interwetten_draw: "3,30", interwetten_away: "3,30", 
                                interwetten_link: "https://www.interwetten.com/en/sportsbook/e/9752883/", 
                                home_team_yellow_card_details: "84': Iker Muniain;45': Ander Iturraspe;38': Aymeric Laporte;", 
                                away_team_yellow_card_details: "49': Asier Illarramendi;", 
                                home_team_red_card_details: nil, away_team_red_card_details: nil }

  GetFixturesByDateIntervalAndLeague = { id: "324725", date: DateTime.parse("2014-01-04T07:00:00-08:00"), league: "Scottish Premier League", round: "21", 
                                          home_team: "Ross County", home_team_id: "360", home_goals: "1", away_team: "St Johnstone", away_team_id: "46",
                                          away_goals: "0", time: "Finished", location: "Victoria Park", home_team_yellow_card_details: "89': Scott Boyd;", 
                                          away_team_yellow_card_details: "61': David Mackay;", home_team_red_card_details: nil, 
                                          away_team_red_card_details: nil }

end

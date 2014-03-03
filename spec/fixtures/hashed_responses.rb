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

  GetFixturesByDateIntervalAndTeam = { id: "324725", date: DateTime.parse("2014-01-04T07:00:00-08:00"), league: "Scottish Premier League", round: "21", 
                                          home_team: "Ross County", home_team_id: "360", home_goals: "1", away_team: "St Johnstone", away_team_id: "46",
                                          away_goals: "0", time: "Finished", location: "Victoria Park", home_team_yellow_card_details: "89': Scott Boyd;", 
                                          away_team_yellow_card_details: "61': David Mackay;", home_team_red_card_details: nil, 
                                          away_team_red_card_details: nil }

 GetFixturesByLeagueAndSeason = { id: "65805", fixture_match_id: "324725", date: DateTime.parse("2014-01-04T07:00:00-08:00"), round: "21", 
                                          spectators: "3212", league: "Scottish Premier League", home_team: "Ross County", home_team_id: "360", 
                                          home_corners: "5", home_goals: "1", half_time_home_goals: "0", home_shots: "10", home_shots_on_target: "2",
                                          home_fouls: "13", home_goal_details: "88': Graham Carey;", home_lineup_goalkeeper: " Michael Fraser", 
                                          home_lineup_defense: " Scott Boyd; Brian McLean; Ben Gordon; Evangelos Ikonomou;",
                                          home_lineup_midfield: " Stuart Kettlewell; Alex Cooper; Richard Brittain; Graham Carey;", 
                                          home_lineup_forward: " Jordan Slew; Gary Glen;", home_yellow_cards: "1", home_red_cards: "0",
                                          home_team_formation: "4-4-2", away_team: "St Johnstone", away_team_id: "46", 
                                          away_corners: "0", away_goals: "0", half_time_away_goals: "0", away_shots: "9", away_shots_on_target: "3",
                                          away_fouls: "14", away_goal_details: nil, away_lineup_goalkeeper: " Alan Mannus", 
                                          away_lineup_defense: " Frazer Wright; Steven Anderson; Thomas Scobbie; David Mackay;",
                                          away_lineup_midfield: " David Wotherspoon; Murray Davidson; Chris Millar; Gary McDonald;", 
                                          away_lineup_forward: " Nigel Hasselbaink; Steve May;", away_yellow_cards: "1", away_red_cards: "0",
                                          away_team_formation: "4-4-2", home_team_yellow_card_details: "89': Scott Boyd;", 
                                          away_team_yellow_card_details: "61': David Mackay;",
                                          home_team_red_card_details: nil, away_team_red_card_details: nil, 
                                          home_sub_details: "84': in Michael Tidser;84': out Jordan Slew;66': out Gary Glen;66': in Melvin de Leeuw;",
                                          away_sub_details: "90': in Rory Fallon;90': in Lee Croft;90': out Chris Millar;90': out David Wotherspoon;69': out Nigel Hasselbaink;69': in Michael O'Halloran;" }                                           

  GetHistoricMatchesByFixtureMatchId = { id: "65805", fixture_match_id: "324725", date: DateTime.parse("2014-01-04T07:00:00-08:00"), round: "21", 
                                          spectators: "3212", league: "Scottish Premier League", home_team: "Ross County", home_team_id: "360", 
                                          home_corners: "5", home_goals: "1", half_time_home_goals: "0", home_shots: "10", home_shots_on_target: "2",
                                          home_fouls: "13", home_goal_details: "88': Graham Carey;", home_lineup_goalkeeper: " Michael Fraser", 
                                          home_lineup_defense: " Scott Boyd; Brian McLean; Ben Gordon; Evangelos Ikonomou;",
                                          home_lineup_midfield: " Stuart Kettlewell; Alex Cooper; Richard Brittain; Graham Carey;", 
                                          home_lineup_forward: " Jordan Slew; Gary Glen;", home_yellow_cards: "1", home_red_cards: "0",
                                          home_team_formation: "4-4-2", away_team: "St Johnstone", away_team_id: "46", 
                                          away_corners: "0", away_goals: "0", half_time_away_goals: "0", away_shots: "9", away_shots_on_target: "3",
                                          away_fouls: "14", away_goal_details: nil, away_lineup_goalkeeper: " Alan Mannus", 
                                          away_lineup_defense: " Frazer Wright; Steven Anderson; Thomas Scobbie; David Mackay;",
                                          away_lineup_midfield: " David Wotherspoon; Murray Davidson; Chris Millar; Gary McDonald;", 
                                          away_lineup_forward: " Nigel Hasselbaink; Steve May;", away_yellow_cards: "1", away_red_cards: "0",
                                          away_team_formation: "4-4-2", home_team_yellow_card_details: "89': Scott Boyd;", 
                                          away_team_yellow_card_details: "61': David Mackay;",
                                          home_team_red_card_details: nil, away_team_red_card_details: nil, 
                                          home_sub_details: "84': in Michael Tidser;84': out Jordan Slew;66': out Gary Glen;66': in Melvin de Leeuw;",
                                          away_sub_details: "90': in Rory Fallon;90': in Lee Croft;90': out Chris Millar;90': out David Wotherspoon;69': out Nigel Hasselbaink;69': in Michael O'Halloran;" }                                                                          

 GetHistoricMatchesById = { id: "65805", fixture_match_id: "324725", date: DateTime.parse("2014-01-04T07:00:00-08:00"), round: "21", 
                            spectators: "3212", league: "Scottish Premier League", home_team: "Ross County", home_team_id: "360", 
                            home_corners: "5", home_goals: "1", half_time_home_goals: "0", home_shots: "10", home_shots_on_target: "2",
                            home_fouls: "13", home_goal_details: "88': Graham Carey;", home_lineup_goalkeeper: " Michael Fraser", 
                            home_lineup_defense: " Scott Boyd; Brian McLean; Ben Gordon; Evangelos Ikonomou;",
                            home_lineup_midfield: " Stuart Kettlewell; Alex Cooper; Richard Brittain; Graham Carey;", 
                            home_lineup_forward: " Jordan Slew; Gary Glen;", home_yellow_cards: "1", home_red_cards: "0",
                            home_team_formation: "4-4-2", away_team: "St Johnstone", away_team_id: "46", 
                            away_corners: "0", away_goals: "0", half_time_away_goals: "0", away_shots: "9", away_shots_on_target: "3",
                            away_fouls: "14", away_goal_details: nil, away_lineup_goalkeeper: " Alan Mannus", 
                            away_lineup_defense: " Frazer Wright; Steven Anderson; Thomas Scobbie; David Mackay;",
                            away_lineup_midfield: " David Wotherspoon; Murray Davidson; Chris Millar; Gary McDonald;", 
                            away_lineup_forward: " Nigel Hasselbaink; Steve May;", away_yellow_cards: "1", away_red_cards: "0",
                            away_team_formation: "4-4-2", home_team_yellow_card_details: "89': Scott Boyd;", 
                            away_team_yellow_card_details: "61': David Mackay;",
                            home_team_red_card_details: nil, away_team_red_card_details: nil, 
                            home_sub_details: "84': in Michael Tidser;84': out Jordan Slew;66': out Gary Glen;66': in Melvin de Leeuw;",
                            away_sub_details: "90': in Rory Fallon;90': in Lee Croft;90': out Chris Millar;90': out David Wotherspoon;69': out Nigel Hasselbaink;69': in Michael O'Halloran;" }

 GetHistoricMatchesByLeagueAndDateInterval = { id: "65805", fixture_match_id: "324725", date: DateTime.parse("2014-01-04T07:00:00-08:00"), round: "21", 
                                              spectators: "3212", league: "Scottish Premier League", home_team: "Ross County", home_team_id: "360", 
                                              home_corners: "5", home_goals: "1", half_time_home_goals: "0", home_shots: "10", home_shots_on_target: "2",
                                              home_fouls: "13", home_goal_details: "88': Graham Carey;", home_lineup_goalkeeper: " Michael Fraser", 
                                              home_lineup_defense: " Scott Boyd; Brian McLean; Ben Gordon; Evangelos Ikonomou;",
                                              home_lineup_midfield: " Stuart Kettlewell; Alex Cooper; Richard Brittain; Graham Carey;", 
                                              home_lineup_forward: " Jordan Slew; Gary Glen;", home_yellow_cards: "1", home_red_cards: "0",
                                              home_team_formation: "4-4-2", away_team: "St Johnstone", away_team_id: "46", 
                                              away_corners: "0", away_goals: "0", half_time_away_goals: "0", away_shots: "9", away_shots_on_target: "3",
                                              away_fouls: "14", away_goal_details: nil, away_lineup_goalkeeper: " Alan Mannus", 
                                              away_lineup_defense: " Frazer Wright; Steven Anderson; Thomas Scobbie; David Mackay;",
                                              away_lineup_midfield: " David Wotherspoon; Murray Davidson; Chris Millar; Gary McDonald;", 
                                              away_lineup_forward: " Nigel Hasselbaink; Steve May;", away_yellow_cards: "1", away_red_cards: "0",
                                              away_team_formation: "4-4-2", home_team_yellow_card_details: "89': Scott Boyd;", 
                                              away_team_yellow_card_details: "61': David Mackay;",
                                              home_team_red_card_details: nil, away_team_red_card_details: nil, 
                                              home_sub_details: "84': in Michael Tidser;84': out Jordan Slew;66': out Gary Glen;66': in Melvin de Leeuw;",
                                              away_sub_details: "90': in Rory Fallon;90': in Lee Croft;90': out Chris Millar;90': out David Wotherspoon;69': out Nigel Hasselbaink;69': in Michael O'Halloran;" }                            

 GetHistoricMatchesByLeagueAndSeason = { id: "65805", fixture_match_id: "324725", date: DateTime.parse("2014-01-04T07:00:00-08:00"), round: "21", 
                                          spectators: "3212", league: "Scottish Premier League", home_team: "Ross County", home_team_id: "360", 
                                          home_corners: "5", home_goals: "1", half_time_home_goals: "0", home_shots: "10", home_shots_on_target: "2",
                                          home_fouls: "13", home_goal_details: "88': Graham Carey;", home_lineup_goalkeeper: " Michael Fraser", 
                                          home_lineup_defense: " Scott Boyd; Brian McLean; Ben Gordon; Evangelos Ikonomou;",
                                          home_lineup_midfield: " Stuart Kettlewell; Alex Cooper; Richard Brittain; Graham Carey;", 
                                          home_lineup_forward: " Jordan Slew; Gary Glen;", home_yellow_cards: "1", home_red_cards: "0",
                                          home_team_formation: "4-4-2", away_team: "St Johnstone", away_team_id: "46", 
                                          away_corners: "0", away_goals: "0", half_time_away_goals: "0", away_shots: "9", away_shots_on_target: "3",
                                          away_fouls: "14", away_goal_details: nil, away_lineup_goalkeeper: " Alan Mannus", 
                                          away_lineup_defense: " Frazer Wright; Steven Anderson; Thomas Scobbie; David Mackay;",
                                          away_lineup_midfield: " David Wotherspoon; Murray Davidson; Chris Millar; Gary McDonald;", 
                                          away_lineup_forward: " Nigel Hasselbaink; Steve May;", away_yellow_cards: "1", away_red_cards: "0",
                                          away_team_formation: "4-4-2", home_team_yellow_card_details: "89': Scott Boyd;", 
                                          away_team_yellow_card_details: "61': David Mackay;",
                                          home_team_red_card_details: nil, away_team_red_card_details: nil, 
                                          home_sub_details: "84': in Michael Tidser;84': out Jordan Slew;66': out Gary Glen;66': in Melvin de Leeuw;",
                                          away_sub_details: "90': in Rory Fallon;90': in Lee Croft;90': out Chris Millar;90': out David Wotherspoon;69': out Nigel Hasselbaink;69': in Michael O'Halloran;" }                                                

 GetHistoricMatchesByTeamAndDateInterval = { id: "65805", fixture_match_id: "324725", date: DateTime.parse("2014-01-04T07:00:00-08:00"), round: "21", 
                                              spectators: "3212", league: "Scottish Premier League", home_team: "Ross County", home_team_id: "360", 
                                              home_corners: "5", home_goals: "1", half_time_home_goals: "0", home_shots: "10", home_shots_on_target: "2",
                                              home_fouls: "13", home_goal_details: "88': Graham Carey;", home_lineup_goalkeeper: " Michael Fraser", 
                                              home_lineup_defense: " Scott Boyd; Brian McLean; Ben Gordon; Evangelos Ikonomou;",
                                              home_lineup_midfield: " Stuart Kettlewell; Alex Cooper; Richard Brittain; Graham Carey;", 
                                              home_lineup_forward: " Jordan Slew; Gary Glen;", home_yellow_cards: "1", home_red_cards: "0",
                                              home_team_formation: "4-4-2", away_team: "St Johnstone", away_team_id: "46", 
                                              away_corners: "0", away_goals: "0", half_time_away_goals: "0", away_shots: "9", away_shots_on_target: "3",
                                              away_fouls: "14", away_goal_details: nil, away_lineup_goalkeeper: " Alan Mannus", 
                                              away_lineup_defense: " Frazer Wright; Steven Anderson; Thomas Scobbie; David Mackay;",
                                              away_lineup_midfield: " David Wotherspoon; Murray Davidson; Chris Millar; Gary McDonald;", 
                                              away_lineup_forward: " Nigel Hasselbaink; Steve May;", away_yellow_cards: "1", away_red_cards: "0",
                                              away_team_formation: "4-4-2", home_team_yellow_card_details: "89': Scott Boyd;", 
                                              away_team_yellow_card_details: "61': David Mackay;",
                                              home_team_red_card_details: nil, away_team_red_card_details: nil, 
                                              home_sub_details: "84': in Michael Tidser;84': out Jordan Slew;66': out Gary Glen;66': in Melvin de Leeuw;",
                                              away_sub_details: "90': in Rory Fallon;90': in Lee Croft;90': out Chris Millar;90': out David Wotherspoon;69': out Nigel Hasselbaink;69': in Michael O'Halloran;" }                                              

 GetHistoricMatchesByTeamsAndDateInterval = { id: "65805", fixture_match_id: "324725", date: DateTime.parse("2014-01-04T07:00:00-08:00"), round: "21", 
                                              spectators: "3212", league: "Scottish Premier League", home_team: "Ross County", home_team_id: "360", 
                                              home_corners: "5", home_goals: "1", half_time_home_goals: "0", home_shots: "10", home_shots_on_target: "2",
                                              home_fouls: "13", home_goal_details: "88': Graham Carey;", home_lineup_goalkeeper: " Michael Fraser", 
                                              home_lineup_defense: " Scott Boyd; Brian McLean; Ben Gordon; Evangelos Ikonomou;",
                                              home_lineup_midfield: " Stuart Kettlewell; Alex Cooper; Richard Brittain; Graham Carey;", 
                                              home_lineup_forward: " Jordan Slew; Gary Glen;", home_yellow_cards: "1", home_red_cards: "0",
                                              home_team_formation: "4-4-2", away_team: "St Johnstone", away_team_id: "46", 
                                              away_corners: "0", away_goals: "0", half_time_away_goals: "0", away_shots: "9", away_shots_on_target: "3",
                                              away_fouls: "14", away_goal_details: nil, away_lineup_goalkeeper: " Alan Mannus", 
                                              away_lineup_defense: " Frazer Wright; Steven Anderson; Thomas Scobbie; David Mackay;",
                                              away_lineup_midfield: " David Wotherspoon; Murray Davidson; Chris Millar; Gary McDonald;", 
                                              away_lineup_forward: " Nigel Hasselbaink; Steve May;", away_yellow_cards: "1", away_red_cards: "0",
                                              away_team_formation: "4-4-2", home_team_yellow_card_details: "89': Scott Boyd;", 
                                              away_team_yellow_card_details: "61': David Mackay;",
                                              home_team_red_card_details: nil, away_team_red_card_details: nil, 
                                              home_sub_details: "84': in Michael Tidser;84': out Jordan Slew;66': out Gary Glen;66': in Melvin de Leeuw;",
                                              away_sub_details: "90': in Rory Fallon;90': in Lee Croft;90': out Chris Millar;90': out David Wotherspoon;69': out Nigel Hasselbaink;69': in Michael O'Halloran;" }                                                 


  GetEarliestMatchDatePerLeague = { date: DateTime.parse("2000-07-28T15:00:00-07:00") }

  GetLeagueStandingsBySeason = { team: "Celtic", team_id: "54", played: "38", played_at_home: "19", played_away: "19", won: "24", draw: "7",
                                  lost: "7", number_of_shots: "839", yellow_cards: "45", red_cards: "1", goals_for: "92", goals_against: "35",
                                  goal_difference: "57", points: "79", :@xmlns => "http://xmlsoccer.com/LeagueStanding" } 

 GetLiveScore = { id: "286362", date: DateTime.parse("2013-03-30T15:00:00+01:00"), round: "30", 
                  spectators: "30953", league: "Serie A", hometeam: "Lazio", home_team_id: "76", awayteam: "Catania", away_team_id: "79",
                  time: "54'", home_goals: "0", away_goals: "1", home_goal_details: nil, away_goal_details: "50': Mariano Julio Izco;",
                  home_lineup_goalkeeper: " Federico Marchetti", away_lineup_goalkeeper: " Mariano Andujar",
                  home_lineup_defense: " Alvaro Gonzalez; Stefan Daniel Radu; Giuseppe Biava; Lorik Cana;",
                  away_lineup_defense: " Nicola Legrottaglie; Pablo Sebastian Alvarez; Giovanni Marchese; Giuseppe Bellusci;",
                  home_lineup_midfield: " Christian Daniel Ledesma; Senad Lulic; Anderson Hernanes; Ogenyi Onazi; Antonio Candreva;",
                  away_lineup_midfield: " Marco Biagianti; Francesco Lodi; Mariano Julio Izco;",
                  home_lineup_forward: " Louis Saha;", away_lineup_forward: " Alejandro Daro Gomez; Gonzalo Bergessio; Pablo Barrientos;",
                  home_sub_details: nil, away_sub_details: nil, home_team_formation: "4-1-4-1", away_team_formation: "4-3-3",
                  location: "Stadio Olimpico", stadium: "Stadio Olimpico", home_team_yellow_card_details: nil,
                  away_team_yellow_card_details: "17': Giovanni Marchese;", home_team_red_card_details: nil, away_team_red_card_details: nil }                                                                           

 GetLiveScoreByLeague = { id: "286362", date: DateTime.parse("2013-03-30T15:00:00+01:00"), round: "30", 
                          spectators: "30953", league: "Serie A", hometeam: "Lazio", home_team_id: "76", awayteam: "Catania", away_team_id: "79",
                          time: "54'", home_goals: "0", away_goals: "1", home_goal_details: nil, away_goal_details: "50': Mariano Julio Izco;",
                          home_lineup_goalkeeper: " Federico Marchetti", away_lineup_goalkeeper: " Mariano Andujar",
                          home_lineup_defense: " Alvaro Gonzalez; Stefan Daniel Radu; Giuseppe Biava; Lorik Cana;",
                          away_lineup_defense: " Nicola Legrottaglie; Pablo Sebastian Alvarez; Giovanni Marchese; Giuseppe Bellusci;",
                          home_lineup_midfield: " Christian Daniel Ledesma; Senad Lulic; Anderson Hernanes; Ogenyi Onazi; Antonio Candreva;",
                          away_lineup_midfield: " Marco Biagianti; Francesco Lodi; Mariano Julio Izco;",
                          home_lineup_forward: " Louis Saha;", away_lineup_forward: " Alejandro Daro Gomez; Gonzalo Bergessio; Pablo Barrientos;",
                          home_sub_details: nil, away_sub_details: nil, home_team_formation: "4-1-4-1", away_team_formation: "4-3-3",
                          location: "Stadio Olimpico", stadium: "Stadio Olimpico", home_team_yellow_card_details: nil,
                          away_team_yellow_card_details: "17': Giovanni Marchese;", home_team_red_card_details: nil, away_team_red_card_details: nil }

GetTeam = { id: "46", name: "St Johnstone", stadium: "McDiarmid Park", website: "http://www.perthstjohnstonefc.co.uk",
            wiki_page_url: "http://en.wikipedia.org/wiki/St._Johnstone_F.C.", country: "Scotland" }

GetTopScorersByLeagueAndSeason = { rank: "1", name: "Kris Commons", team_name: "Celtic", team_id: "54", nationality: "Scotland",
                                    goals: "18", first_scorer: "10", penalties: "4", missed_penalties: "0" }                      

GetOddsByFixtureMatchId = { id: "139429", fixture_match_id: "324725", date_create: DateTime.parse("2013-12-30T02:56:32.487-08:00"),
                            bwin_home: "2.85", bwin_url: "https://www.bwin.com/", bwin_away: "2.30", bwin_draw: "3.20" }

CheckApiKey = { string: {string: "Hello  , you have access to free leagues (demo-user)." } }                           

end

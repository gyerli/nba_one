CREATE TABLE coaches (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    season integer NOT NULL,
    coach_id character varying(9) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    coach_name character varying(50) NOT NULL,
    coach_code character varying(19) NOT NULL,
    is_assistant double precision NOT NULL,
    coach_type character varying(100) NOT NULL,
    school character varying(100),
    sort_sequence double precision,
    teamid integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


CREATE TABLE dk_players (
    "position" character varying(3),
    name character varying(100),
    salary integer,
    gameinfo character varying(20),
    avgpointspergame double precision,
    teamabbrev character varying(10),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


CREATE TABLE fd_players (
    id integer NOT NULL,
    "position" character varying(2) NOT NULL,
    first_name character varying(13) NOT NULL,
    last_name character varying(16) NOT NULL,
    fppg double precision NOT NULL,
    played integer NOT NULL,
    salary integer NOT NULL,
    game character varying(7) NOT NULL,
    team character varying(3) NOT NULL,
    opponent character varying(3) NOT NULL,
    injury_indicator character varying(4),
    injury_details character varying(20),
    unknown character varying(32),
    unnamed character varying(32),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


CREATE TABLE game_player_adv_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    start_position character varying(4),
    comment character varying(1024),
    min character varying(5),
    off_rating double precision,
    def_rating double precision,
    net_rating double precision,
    ast_pct double precision,
    ast_tov double precision,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision,
    dreb_pct double precision,
    reb_pct double precision,
    tm_tov_pct double precision,
    efg_pct double precision,
    ts_pct double precision,
    usg_pct double precision NOT NULL,
    pace double precision,
    pie double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);


CREATE TABLE game_player_four_factor_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(50) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    start_position character varying(4),
    comment character varying(100),
    min character varying(5),
    efg_pct double precision,
    fta_rate double precision,
    tm_tov_pct double precision,
    oreb_pct double precision,
    opp_efg_pct double precision,
    opp_fta_rate double precision,
    opp_tov_pct double precision,
    opp_oreb_pct double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
)
WITH (autovacuum_vacuum_scale_factor=0.0);

CREATE TABLE game_player_misc_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    start_position character varying(4),
    comment character varying(1024),
    min character varying(5),
    pts_off_tov double precision,
    pts_2nd_chance double precision,
    pts_fb double precision,
    pts_paint double precision,
    opp_pts_off_tov double precision,
    opp_pts_2nd_chance double precision,
    opp_pts_fb double precision,
    opp_pts_paint double precision,
    blk double precision,
    blka double precision,
    pf double precision,
    pfd double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);


CREATE TABLE game_player_scoring_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    start_position character varying(4),
    comment character varying(1024),
    min character varying(5),
    pct_fga_2pt double precision,
    pct_fga_3pt double precision,
    pct_pts_2pt double precision,
    pct_pts_2pt_mr double precision,
    pct_pts_3pt double precision,
    pct_pts_fb double precision,
    pct_pts_ft double precision,
    pct_pts_off_tov double precision,
    pct_pts_paint double precision,
    pct_ast_2pm double precision,
    pct_uast_2pm double precision,
    pct_ast_3pm double precision,
    pct_uast_3pm double precision,
    pct_ast_fgm double precision,
    pct_uast_fgm double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);


CREATE TABLE game_player_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    start_position character varying(4),
    comment character varying(1024),
    min character varying(5),
    fgm double precision,
    fga double precision,
    fg_pct double precision,
    fg3m double precision,
    fg3a double precision,
    fg3_pct double precision,
    ftm double precision,
    fta double precision,
    ft_pct double precision,
    oreb double precision,
    dreb double precision,
    reb double precision,
    ast double precision,
    stl double precision,
    blk double precision,
    tov double precision,
    pf double precision,
    pts double precision,
    plus_minus double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);


CREATE TABLE game_player_trck_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(24) NOT NULL,
    start_position character varying(4),
    comment character varying(40),
    min character varying(5) NOT NULL,
    spd double precision NOT NULL,
    dist double precision NOT NULL,
    orbc integer NOT NULL,
    drbc integer NOT NULL,
    rbc integer NOT NULL,
    tchs integer NOT NULL,
    sast integer NOT NULL,
    ftast integer NOT NULL,
    pass integer NOT NULL,
    ast double precision NOT NULL,
    cfgm integer NOT NULL,
    cfga integer NOT NULL,
    cfg_pct double precision NOT NULL,
    ufgm integer NOT NULL,
    ufga integer NOT NULL,
    ufg_pct double precision NOT NULL,
    fg_pct double precision NOT NULL,
    dfgm integer NOT NULL,
    dfga integer NOT NULL,
    dfg_pct double precision NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);

CREATE TABLE game_player_usage_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    start_position character varying(4),
    comment character varying(1024),
    min character varying(5),
    usg_pct double precision NOT NULL,
    pct_fgm double precision,
    pct_fga double precision,
    pct_fg3m double precision,
    pct_fg3a double precision,
    pct_ftm double precision,
    pct_fta double precision,
    pct_oreb double precision,
    pct_dreb double precision,
    pct_reb double precision,
    pct_ast double precision,
    pct_tov double precision,
    pct_stl double precision,
    pct_blk double precision,
    pct_blka double precision,
    pct_pf double precision,
    pct_pfd double precision,
    pct_pts double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);

CREATE TABLE game_schedule (
    _unnamed integer NOT NULL,
    away_team_abbrv character varying(3) NOT NULL,
    away_team_id integer NOT NULL,
    game_date integer NOT NULL,
    game_id character varying(10) NOT NULL,
    game_url character varying(20) NOT NULL,
    home_team_abbrv character varying(3) NOT NULL,
    home_team_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season character varying(10),
    season_type character varying(1)
);
CREATE TABLE game_starter_bench (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(50) NOT NULL,
    starters_bench character varying(50) NOT NULL,
    min character varying(6),
    fgm double precision,
    fga double precision,
    fg_pct double precision,
    fg3m double precision,
    fg3a double precision,
    fg3_pct double precision,
    ftm double precision,
    fta double precision,
    ft_pct double precision,
    oreb double precision,
    dreb double precision,
    reb double precision,
    ast double precision,
    stl double precision,
    blk double precision,
    tov double precision,
    pf double precision,
    pts double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);

CREATE TABLE game_team_adv_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    min character varying(6),
    off_rating double precision,
    def_rating double precision,
    net_rating double precision,
    ast_pct double precision,
    ast_tov double precision,
    ast_ratio double precision,
    oreb_pct double precision,
    dreb_pct double precision,
    reb_pct double precision,
    tm_tov_pct double precision,
    efg_pct double precision,
    ts_pct double precision,
    usg_pct double precision,
    pace double precision,
    pie double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);



CREATE TABLE game_team_four_factor_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(100) NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(50) NOT NULL,
    min character varying(10),
    efg_pct double precision,
    fta_rate double precision,
    tm_tov_pct double precision,
    oreb_pct double precision,
    opp_efg_pct double precision,
    opp_fta_rate double precision,
    opp_tov_pct double precision,
    opp_oreb_pct double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);

CREATE TABLE game_team_misc_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    min character varying(6),
    pts_off_tov double precision,
    pts_2nd_chance double precision,
    pts_fb double precision,
    pts_paint double precision,
    opp_pts_off_tov double precision,
    opp_pts_2nd_chance double precision,
    opp_pts_fb double precision,
    opp_pts_paint double precision,
    blk double precision,
    blka double precision,
    pf double precision,
    pfd double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);



CREATE TABLE game_team_scoring_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    min character varying(6),
    pct_fga_2pt double precision,
    pct_fga_3pt double precision,
    pct_pts_2pt double precision,
    pct_pts_2pt_mr double precision,
    pct_pts_3pt double precision,
    pct_pts_fb double precision,
    pct_pts_ft double precision,
    pct_pts_off_tov double precision,
    pct_pts_paint double precision,
    pct_ast_2pm double precision,
    pct_uast_2pm double precision,
    pct_ast_3pm double precision,
    pct_uast_3pm double precision,
    pct_ast_fgm double precision,
    pct_uast_fgm double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);


CREATE TABLE game_team_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    min character varying(6),
    fgm double precision,
    fga double precision,
    fg_pct double precision,
    fg3m double precision,
    fg3a double precision,
    fg3_pct double precision,
    ftm double precision,
    fta double precision,
    ft_pct double precision,
    oreb double precision,
    dreb double precision,
    reb double precision,
    ast double precision,
    stl double precision,
    blk double precision,
    tov double precision,
    pf double precision,
    pts double precision,
    plus_minus double precision,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);



CREATE TABLE game_team_trck_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_nickname character varying(13) NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    min character varying(6) NOT NULL,
    dist double precision NOT NULL,
    orbc integer NOT NULL,
    drbc integer NOT NULL,
    rbc integer NOT NULL,
    tchs integer NOT NULL,
    sast integer NOT NULL,
    ftast integer NOT NULL,
    pass integer NOT NULL,
    ast double precision NOT NULL,
    cfgm integer NOT NULL,
    cfga integer NOT NULL,
    cfg_pct double precision NOT NULL,
    ufgm integer NOT NULL,
    ufga integer NOT NULL,
    ufg_pct double precision NOT NULL,
    fg_pct double precision NOT NULL,
    dfgm integer NOT NULL,
    dfga integer NOT NULL,
    dfg_pct double precision NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);



CREATE TABLE game_team_usage_stat (
    _unnamed integer NOT NULL,
    game_id character varying(10) NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_city character varying(13) NOT NULL,
    min character varying(6),
    usg_pct integer NOT NULL,
    pct_fgm integer NOT NULL,
    pct_fga integer NOT NULL,
    pct_fg3m integer NOT NULL,
    pct_fg3a integer NOT NULL,
    pct_ftm integer NOT NULL,
    pct_fta integer NOT NULL,
    pct_oreb integer NOT NULL,
    pct_dreb integer NOT NULL,
    pct_reb integer NOT NULL,
    pct_ast integer NOT NULL,
    pct_tov integer NOT NULL,
    pct_stl integer NOT NULL,
    pct_blk integer NOT NULL,
    pct_blka integer NOT NULL,
    pct_pf integer NOT NULL,
    pct_pfd integer NOT NULL,
    pct_pts integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(50)
);

CREATE TABLE games (
    _unnamed integer NOT NULL,
    season_id integer NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(20) NOT NULL,
    team_name character varying(100) NOT NULL,
    game_id character varying(10) NOT NULL,
    game_date date NOT NULL,
    matchup character varying(20) NOT NULL,
    wl character varying(1),
    min integer NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision,
    fg3m double precision,
    fg3a double precision,
    fg3_pct double precision,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    tov double precision NOT NULL,
    pf double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    video_available integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(20)
);


CREATE TABLE player_days_rest_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(20) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fgm_pg double precision NOT NULL,
    fga_pg double precision NOT NULL,
    fg_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(20) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);



CREATE TABLE player_days_rest_base (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(20) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    dd2 double precision NOT NULL,
    td3 double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(20) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);



CREATE TABLE player_days_rest_misc (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(20) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(20) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


CREATE TABLE player_days_rest_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(20) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(20) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);



CREATE TABLE player_days_rest_usage (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(20) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pct_fgm double precision NOT NULL,
    pct_fga double precision NOT NULL,
    pct_fg3m double precision NOT NULL,
    pct_fg3a double precision NOT NULL,
    pct_ftm double precision NOT NULL,
    pct_fta double precision NOT NULL,
    pct_oreb double precision NOT NULL,
    pct_dreb double precision NOT NULL,
    pct_reb double precision NOT NULL,
    pct_ast double precision NOT NULL,
    pct_tov double precision NOT NULL,
    pct_stl double precision NOT NULL,
    pct_blk double precision NOT NULL,
    pct_blka double precision NOT NULL,
    pct_pf double precision NOT NULL,
    pct_pfd double precision NOT NULL,
    pct_pts double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(20) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);



CREATE TABLE player_defense (
    _unnamed integer NOT NULL,
    close_def_person_id double precision NOT NULL,
    gp integer NOT NULL,
    g integer NOT NULL,
    defense_category character varying(18) NOT NULL,
    freq double precision,
    d_fgm double precision,
    d_fga double precision,
    d_fg_pct double precision,
    normal_fg_pct double precision,
    pct_plusminus double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_defense_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_defense_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_defense_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_defense_row_id_seq OWNED BY player_defense.row_id;


--
-- Name: player_game_log; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_game_log (
    _unnamed integer NOT NULL,
    season_id integer NOT NULL,
    player_id integer NOT NULL,
    game_id character varying(10) NOT NULL,
    game_date date NOT NULL,
    matchup character varying(11) NOT NULL,
    wl character varying(1),
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    tov double precision NOT NULL,
    pf double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    video_available integer NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_game_log_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_game_log_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_game_log_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_game_log_row_id_seq OWNED BY player_game_log.row_id;


--
-- Name: player_location_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_location_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fgm_pg double precision NOT NULL,
    fga_pg double precision NOT NULL,
    fg_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_location_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_location_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_location_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_location_advanced_row_id_seq OWNED BY player_location_advanced.row_id;


--
-- Name: player_location_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_location_base (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    dd2 double precision NOT NULL,
    td3 double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_location_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_location_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_location_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_location_base_row_id_seq OWNED BY player_location_base.row_id;


--
-- Name: player_location_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_location_misc (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_location_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_location_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_location_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_location_misc_row_id_seq OWNED BY player_location_misc.row_id;


--
-- Name: player_location_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_location_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_location_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_location_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_location_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_location_scoring_row_id_seq OWNED BY player_location_scoring.row_id;


--
-- Name: player_location_usage; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_location_usage (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pct_fgm double precision NOT NULL,
    pct_fga double precision NOT NULL,
    pct_fg3m double precision NOT NULL,
    pct_fg3a double precision NOT NULL,
    pct_ftm double precision NOT NULL,
    pct_fta double precision NOT NULL,
    pct_oreb double precision NOT NULL,
    pct_dreb double precision NOT NULL,
    pct_reb double precision NOT NULL,
    pct_ast double precision NOT NULL,
    pct_tov double precision NOT NULL,
    pct_stl double precision NOT NULL,
    pct_blk double precision NOT NULL,
    pct_blka double precision NOT NULL,
    pct_pf double precision NOT NULL,
    pct_pfd double precision NOT NULL,
    pct_pts double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_location_usage_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_location_usage_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_location_usage_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_location_usage_row_id_seq OWNED BY player_location_usage.row_id;


--
-- Name: player_month_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_month_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fgm_pg double precision NOT NULL,
    fga_pg double precision NOT NULL,
    fg_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_month_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_month_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_month_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_month_advanced_row_id_seq OWNED BY player_month_advanced.row_id;


--
-- Name: player_month_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_month_base (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    dd2 double precision NOT NULL,
    td3 double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_month_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_month_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_month_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_month_base_row_id_seq OWNED BY player_month_base.row_id;


--
-- Name: player_month_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_month_misc (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_month_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_month_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_month_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_month_misc_row_id_seq OWNED BY player_month_misc.row_id;


--
-- Name: player_month_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_month_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_month_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_month_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_month_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_month_scoring_row_id_seq OWNED BY player_month_scoring.row_id;


--
-- Name: player_month_usage; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_month_usage (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pct_fgm double precision NOT NULL,
    pct_fga double precision NOT NULL,
    pct_fg3m double precision NOT NULL,
    pct_fg3a double precision NOT NULL,
    pct_ftm double precision NOT NULL,
    pct_fta double precision NOT NULL,
    pct_oreb double precision NOT NULL,
    pct_dreb double precision NOT NULL,
    pct_reb double precision NOT NULL,
    pct_ast double precision NOT NULL,
    pct_tov double precision NOT NULL,
    pct_stl double precision NOT NULL,
    pct_blk double precision NOT NULL,
    pct_blka double precision NOT NULL,
    pct_pf double precision NOT NULL,
    pct_pfd double precision NOT NULL,
    pct_pts double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_month_usage_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_month_usage_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_month_usage_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_month_usage_row_id_seq OWNED BY player_month_usage.row_id;


--
-- Name: player_overall_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_overall_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fgm_pg double precision NOT NULL,
    fga_pg double precision NOT NULL,
    fg_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_overall_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_overall_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_overall_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_overall_advanced_row_id_seq OWNED BY player_overall_advanced.row_id;


--
-- Name: player_overall_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_overall_base (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    dd2 double precision NOT NULL,
    td3 double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_overall_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_overall_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_overall_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_overall_base_row_id_seq OWNED BY player_overall_base.row_id;


--
-- Name: player_overall_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_overall_misc (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_overall_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_overall_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_overall_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_overall_misc_row_id_seq OWNED BY player_overall_misc.row_id;


--
-- Name: player_overall_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_overall_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_overall_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_overall_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_overall_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_overall_scoring_row_id_seq OWNED BY player_overall_scoring.row_id;


--
-- Name: player_overall_usage; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_overall_usage (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pct_fgm double precision NOT NULL,
    pct_fga double precision NOT NULL,
    pct_fg3m double precision NOT NULL,
    pct_fg3a double precision NOT NULL,
    pct_ftm double precision NOT NULL,
    pct_fta double precision NOT NULL,
    pct_oreb double precision NOT NULL,
    pct_dreb double precision NOT NULL,
    pct_reb double precision NOT NULL,
    pct_ast double precision NOT NULL,
    pct_tov double precision NOT NULL,
    pct_stl double precision NOT NULL,
    pct_blk double precision NOT NULL,
    pct_blka double precision NOT NULL,
    pct_pf double precision NOT NULL,
    pct_pfd double precision NOT NULL,
    pct_pts double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_overall_usage_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_overall_usage_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_overall_usage_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_overall_usage_row_id_seq OWNED BY player_overall_usage.row_id;


--
-- Name: player_passes_made; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_passes_made (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    team_name character varying(50) NOT NULL,
    team_id integer NOT NULL,
    pass_type character varying(4) NOT NULL,
    g integer NOT NULL,
    pass_to character varying(50) NOT NULL,
    pass_teammate_player_id integer NOT NULL,
    frequency double precision NOT NULL,
    pass double precision NOT NULL,
    ast double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_passes_made_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_passes_made_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_passes_made_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_passes_made_row_id_seq OWNED BY player_passes_made.row_id;


--
-- Name: player_passes_rcvd; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_passes_rcvd (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(25) NOT NULL,
    team_name character varying(22) NOT NULL,
    team_id integer NOT NULL,
    pass_type character varying(8) NOT NULL,
    g integer NOT NULL,
    pass_from character varying(25) NOT NULL,
    pass_teammate_player_id integer NOT NULL,
    frequency double precision NOT NULL,
    pass double precision NOT NULL,
    ast double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_passes_rcvd_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_passes_rcvd_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_passes_rcvd_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_passes_rcvd_row_id_seq OWNED BY player_passes_rcvd.row_id;


--
-- Name: player_pre_post_allstar_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_pre_post_allstar_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fgm_pg double precision NOT NULL,
    fga_pg double precision NOT NULL,
    fg_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_pre_post_allstar_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_pre_post_allstar_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_pre_post_allstar_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_pre_post_allstar_advanced_row_id_seq OWNED BY player_pre_post_allstar_advanced.row_id;


--
-- Name: player_pre_post_allstar_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_pre_post_allstar_base (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    dd2 double precision NOT NULL,
    td3 double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_pre_post_allstar_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_pre_post_allstar_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_pre_post_allstar_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_pre_post_allstar_base_row_id_seq OWNED BY player_pre_post_allstar_base.row_id;


--
-- Name: player_pre_post_allstar_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_pre_post_allstar_misc (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_pre_post_allstar_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_pre_post_allstar_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_pre_post_allstar_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_pre_post_allstar_misc_row_id_seq OWNED BY player_pre_post_allstar_misc.row_id;


--
-- Name: player_pre_post_allstar_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_pre_post_allstar_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_pre_post_allstar_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_pre_post_allstar_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_pre_post_allstar_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_pre_post_allstar_scoring_row_id_seq OWNED BY player_pre_post_allstar_scoring.row_id;


--
-- Name: player_pre_post_allstar_usage; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_pre_post_allstar_usage (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pct_fgm double precision NOT NULL,
    pct_fga double precision NOT NULL,
    pct_fg3m double precision NOT NULL,
    pct_fg3a double precision NOT NULL,
    pct_ftm double precision NOT NULL,
    pct_fta double precision NOT NULL,
    pct_oreb double precision NOT NULL,
    pct_dreb double precision NOT NULL,
    pct_reb double precision NOT NULL,
    pct_ast double precision NOT NULL,
    pct_tov double precision NOT NULL,
    pct_stl double precision NOT NULL,
    pct_blk double precision NOT NULL,
    pct_blka double precision NOT NULL,
    pct_pf double precision NOT NULL,
    pct_pfd double precision NOT NULL,
    pct_pts double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_pre_post_allstar_usage_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_pre_post_allstar_usage_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_pre_post_allstar_usage_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_pre_post_allstar_usage_row_id_seq OWNED BY player_pre_post_allstar_usage.row_id;


--
-- Name: player_reb_log_num_contested; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_reb_log_num_contested (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    reb_num_contesting_range character varying(24) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_reb_log_num_contested_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_reb_log_num_contested_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_reb_log_num_contested_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_reb_log_num_contested_row_id_seq OWNED BY player_reb_log_num_contested.row_id;


--
-- Name: player_reb_log_overall; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_reb_log_overall (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    g integer NOT NULL,
    overall character varying(7) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_reb_log_overall_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_reb_log_overall_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_reb_log_overall_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_reb_log_overall_row_id_seq OWNED BY player_reb_log_overall.row_id;


--
-- Name: player_reb_log_reb_dist; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_reb_log_reb_dist (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    reb_dist_range character varying(9) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_reb_log_reb_dist_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_reb_log_reb_dist_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_reb_log_reb_dist_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_reb_log_reb_dist_row_id_seq OWNED BY player_reb_log_reb_dist.row_id;


--
-- Name: player_reb_log_shot_dist; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_reb_log_shot_dist (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    shot_dist_range character varying(10) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_reb_log_shot_dist_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_reb_log_shot_dist_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_reb_log_shot_dist_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_reb_log_shot_dist_row_id_seq OWNED BY player_reb_log_shot_dist.row_id;


--
-- Name: player_reb_log_shot_type; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_reb_log_shot_type (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    shot_type_range character varying(8) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_reb_log_shot_type_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_reb_log_shot_type_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_reb_log_shot_type_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_reb_log_shot_type_row_id_seq OWNED BY player_reb_log_shot_type.row_id;


--
-- Name: player_shot_log_closest_def; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_shot_log_closest_def (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    gp integer NOT NULL,
    g integer NOT NULL,
    close_def_dist_range character varying(21) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_shot_log_closest_def_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_shot_log_closest_def_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_shot_log_closest_def_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_shot_log_closest_def_row_id_seq OWNED BY player_shot_log_closest_def.row_id;


--
-- Name: player_shot_log_dribble; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_shot_log_dribble (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    gp integer NOT NULL,
    g integer NOT NULL,
    dribble_range character varying(12) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_shot_log_dribble_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_shot_log_dribble_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_shot_log_dribble_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_shot_log_dribble_row_id_seq OWNED BY player_shot_log_dribble.row_id;


--
-- Name: player_shot_log_general; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_shot_log_general (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    gp integer NOT NULL,
    g integer NOT NULL,
    shot_type character varying(15) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_shot_log_general_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_shot_log_general_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_shot_log_general_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_shot_log_general_row_id_seq OWNED BY player_shot_log_general.row_id;


--
-- Name: player_shot_log_overall; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_shot_log_overall (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    gp integer NOT NULL,
    g integer NOT NULL,
    shot_type character varying(7) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_shot_log_overall_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_shot_log_overall_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_shot_log_overall_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_shot_log_overall_row_id_seq OWNED BY player_shot_log_overall.row_id;


--
-- Name: player_shot_log_shot_clock; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_shot_log_shot_clock (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    gp integer NOT NULL,
    g integer NOT NULL,
    shot_clock_range character varying(16) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_shot_log_shot_clock_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_shot_log_shot_clock_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_shot_log_shot_clock_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_shot_log_shot_clock_row_id_seq OWNED BY player_shot_log_shot_clock.row_id;


--
-- Name: player_shot_log_touch_time; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_shot_log_touch_time (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(100) NOT NULL,
    sort_order integer NOT NULL,
    gp integer NOT NULL,
    g integer NOT NULL,
    touch_time_range character varying(100) NOT NULL,
    fga_frequency double precision,
    fgm double precision,
    fga double precision,
    fg_pct double precision,
    efg_pct double precision,
    fg2a_frequency double precision,
    fg2m double precision,
    fg2a double precision,
    fg2_pct double precision,
    fg3a_frequency double precision,
    fg3m double precision,
    fg3a double precision,
    fg3_pct double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    season_type character varying(50) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


--
-- Name: player_shot_log_touch_time_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_shot_log_touch_time_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_shot_log_touch_time_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_shot_log_touch_time_row_id_seq OWNED BY player_shot_log_touch_time.row_id;


--
-- Name: player_shot_trck_closest_def_10ft_plus; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_shot_trck_closest_def_10ft_plus (
    _unnamed integer NOT NULL,
    player_id integer NOT NULL,
    player_name_last_first character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    gp integer NOT NULL,
    g integer NOT NULL,
    close_def_dist_range character varying(21) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_shot_trck_closest_def_10ft_plus_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_shot_trck_closest_def_10ft_plus_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_shot_trck_closest_def_10ft_plus_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_shot_trck_closest_def_10ft_plus_row_id_seq OWNED BY player_shot_trck_closest_def_10ft_plus.row_id;


--
-- Name: player_starting_pos_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_starting_pos_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    fgm integer NOT NULL,
    fga integer NOT NULL,
    fgm_pg double precision NOT NULL,
    fga_pg double precision NOT NULL,
    fg_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    season_type character varying(14) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


--
-- Name: player_starting_pos_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_starting_pos_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_starting_pos_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_starting_pos_advanced_row_id_seq OWNED BY player_starting_pos_advanced.row_id;


--
-- Name: player_starting_pos_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_starting_pos_base (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    dd2 integer NOT NULL,
    td3 integer NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    season_type character varying(14) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


--
-- Name: player_starting_pos_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_starting_pos_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_starting_pos_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_starting_pos_base_row_id_seq OWNED BY player_starting_pos_base.row_id;


--
-- Name: player_starting_pos_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_starting_pos_misc (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    season_type character varying(14) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


--
-- Name: player_starting_pos_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_starting_pos_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_starting_pos_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_starting_pos_misc_row_id_seq OWNED BY player_starting_pos_misc.row_id;


--
-- Name: player_starting_pos_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_starting_pos_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    season_type character varying(14) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


--
-- Name: player_starting_pos_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_starting_pos_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_starting_pos_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_starting_pos_scoring_row_id_seq OWNED BY player_starting_pos_scoring.row_id;


--
-- Name: player_starting_pos_usage; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_starting_pos_usage (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pct_fgm double precision NOT NULL,
    pct_fga double precision NOT NULL,
    pct_fg3m double precision NOT NULL,
    pct_fg3a double precision NOT NULL,
    pct_ftm double precision NOT NULL,
    pct_fta double precision NOT NULL,
    pct_oreb double precision NOT NULL,
    pct_dreb double precision NOT NULL,
    pct_reb double precision NOT NULL,
    pct_ast double precision NOT NULL,
    pct_tov double precision NOT NULL,
    pct_stl double precision NOT NULL,
    pct_blk double precision NOT NULL,
    pct_blka double precision NOT NULL,
    pct_pf double precision NOT NULL,
    pct_pfd double precision NOT NULL,
    pct_pts double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    season_type character varying(14) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


--
-- Name: player_starting_pos_usage_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_starting_pos_usage_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_starting_pos_usage_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_starting_pos_usage_row_id_seq OWNED BY player_starting_pos_usage.row_id;


--
-- Name: player_win_lose_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_win_lose_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fgm_pg double precision NOT NULL,
    fga_pg double precision NOT NULL,
    fg_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_win_lose_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_win_lose_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_win_lose_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_win_lose_advanced_row_id_seq OWNED BY player_win_lose_advanced.row_id;


--
-- Name: player_win_lose_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_win_lose_base (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    dd2 double precision NOT NULL,
    td3 double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_win_lose_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_win_lose_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_win_lose_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_win_lose_base_row_id_seq OWNED BY player_win_lose_base.row_id;


--
-- Name: player_win_lose_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_win_lose_misc (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_win_lose_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_win_lose_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_win_lose_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_win_lose_misc_row_id_seq OWNED BY player_win_lose_misc.row_id;


--
-- Name: player_win_lose_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_win_lose_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_win_lose_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_win_lose_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_win_lose_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_win_lose_scoring_row_id_seq OWNED BY player_win_lose_scoring.row_id;


--
-- Name: player_win_lose_usage; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE player_win_lose_usage (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pct_fgm double precision NOT NULL,
    pct_fga double precision NOT NULL,
    pct_fg3m double precision NOT NULL,
    pct_fg3a double precision NOT NULL,
    pct_ftm double precision NOT NULL,
    pct_fta double precision NOT NULL,
    pct_oreb double precision NOT NULL,
    pct_dreb double precision NOT NULL,
    pct_reb double precision NOT NULL,
    pct_ast double precision NOT NULL,
    pct_tov double precision NOT NULL,
    pct_stl double precision NOT NULL,
    pct_blk double precision NOT NULL,
    pct_blka double precision NOT NULL,
    pct_pf double precision NOT NULL,
    pct_pfd double precision NOT NULL,
    pct_pts double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    playerid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: player_win_lose_usage_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE player_win_lose_usage_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_win_lose_usage_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE player_win_lose_usage_row_id_seq OWNED BY player_win_lose_usage.row_id;


--
-- Name: players; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE players (
    _unnamed integer NOT NULL,
    teamid integer NOT NULL,
    season integer NOT NULL,
    leagueid integer NOT NULL,
    player character varying(100),
    num integer,
    "position" character varying(3) NOT NULL,
    height character varying(4) NOT NULL,
    weight integer NOT NULL,
    birth_date date,
    age double precision,
    exp character varying(2) NOT NULL,
    school character varying(50),
    player_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    l_season character varying(10)
);


--
-- Name: players_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE players_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: players_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE players_row_id_seq OWNED BY players.row_id;


--
-- Name: season_start_end; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE season_start_end (
    season character varying(10) NOT NULL,
    season_type character varying(1) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


--
-- Name: season_start_end_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE season_start_end_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: season_start_end_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE season_start_end_row_id_seq OWNED BY season_start_end.row_id;


--
-- Name: seasons; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE seasons (
    season character varying(7),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL
);


--
-- Name: seasons_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE seasons_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seasons_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE seasons_row_id_seq OWNED BY seasons.row_id;


--
-- Name: team_game_log; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_game_log (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    game_id character varying(10) NOT NULL,
    game_date date NOT NULL,
    matchup character varying(11) NOT NULL,
    wl character varying(1),
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    tov double precision NOT NULL,
    pf double precision NOT NULL,
    pts double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    min character varying(20)
);


--
-- Name: team_game_log_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_game_log_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_game_log_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_game_log_row_id_seq OWNED BY team_game_log.row_id;


--
-- Name: team_game_log_temp; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_game_log_temp (
    _unnamed integer,
    team_id integer,
    game_id character varying(10),
    game_date date,
    matchup character varying(11),
    wl character varying(1),
    min integer,
    fgm double precision,
    fga double precision,
    fg_pct double precision,
    fg3m double precision,
    fg3a double precision,
    fg3_pct double precision,
    ftm double precision,
    fta double precision,
    ft_pct double precision,
    oreb double precision,
    dreb double precision,
    reb double precision,
    ast double precision,
    stl double precision,
    blk double precision,
    tov double precision,
    pf double precision,
    pts double precision,
    teamid integer,
    season character varying(7),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    row_id integer,
    season_type character varying(50)
);


--
-- Name: team_general_days_rest_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_days_rest_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(9) NOT NULL,
    group_value character varying(12) NOT NULL,
    team_days_rest_range character varying(12) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(12) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_days_rest_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_days_rest_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_days_rest_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_days_rest_advanced_row_id_seq OWNED BY team_general_days_rest_advanced.row_id;


--
-- Name: team_general_days_rest_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_days_rest_base (
    _unnamed integer NOT NULL,
    group_set character varying(9) NOT NULL,
    group_value character varying(12) NOT NULL,
    team_days_rest_range character varying(12) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(12) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_days_rest_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_days_rest_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_days_rest_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_days_rest_base_row_id_seq OWNED BY team_general_days_rest_base.row_id;


--
-- Name: team_general_days_rest_four_factors; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_days_rest_four_factors (
    _unnamed integer NOT NULL,
    group_set character varying(9) NOT NULL,
    group_value character varying(12) NOT NULL,
    team_days_rest_range character varying(12) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fta_rate double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    opp_efg_pct double precision NOT NULL,
    opp_fta_rate double precision NOT NULL,
    opp_tov_pct double precision NOT NULL,
    opp_oreb_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(12) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_days_rest_four_factors_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_days_rest_four_factors_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_days_rest_four_factors_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_days_rest_four_factors_row_id_seq OWNED BY team_general_days_rest_four_factors.row_id;


--
-- Name: team_general_days_rest_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_days_rest_misc (
    _unnamed integer NOT NULL,
    group_set character varying(9) NOT NULL,
    group_value character varying(12) NOT NULL,
    team_days_rest_range character varying(12) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(12) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_days_rest_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_days_rest_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_days_rest_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_days_rest_misc_row_id_seq OWNED BY team_general_days_rest_misc.row_id;


--
-- Name: team_general_days_rest_opponent; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_days_rest_opponent (
    _unnamed integer NOT NULL,
    group_set character varying(9) NOT NULL,
    group_value character varying(12) NOT NULL,
    team_days_rest_range character varying(12) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    opp_fgm double precision NOT NULL,
    opp_fga double precision NOT NULL,
    opp_fg_pct double precision NOT NULL,
    opp_fg3m double precision NOT NULL,
    opp_fg3a double precision NOT NULL,
    opp_fg3_pct double precision NOT NULL,
    opp_ftm double precision NOT NULL,
    opp_fta double precision NOT NULL,
    opp_ft_pct double precision NOT NULL,
    opp_oreb double precision NOT NULL,
    opp_dreb double precision NOT NULL,
    opp_reb double precision NOT NULL,
    opp_ast double precision NOT NULL,
    opp_tov double precision NOT NULL,
    opp_stl double precision NOT NULL,
    opp_blk double precision NOT NULL,
    opp_blka double precision NOT NULL,
    opp_pf double precision NOT NULL,
    opp_pfd double precision NOT NULL,
    opp_pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(12) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_days_rest_opponent_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_days_rest_opponent_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_days_rest_opponent_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_days_rest_opponent_row_id_seq OWNED BY team_general_days_rest_opponent.row_id;


--
-- Name: team_general_days_rest_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_days_rest_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(9) NOT NULL,
    group_value character varying(12) NOT NULL,
    team_days_rest_range character varying(12) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(12) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_days_rest_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_days_rest_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_days_rest_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_days_rest_scoring_row_id_seq OWNED BY team_general_days_rest_scoring.row_id;


--
-- Name: team_general_location_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_location_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    team_game_location character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_location_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_location_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_location_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_location_advanced_row_id_seq OWNED BY team_general_location_advanced.row_id;


--
-- Name: team_general_location_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_location_base (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    team_game_location character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_location_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_location_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_location_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_location_base_row_id_seq OWNED BY team_general_location_base.row_id;


--
-- Name: team_general_location_four_factors; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_location_four_factors (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    team_game_location character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fta_rate double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    opp_efg_pct double precision NOT NULL,
    opp_fta_rate double precision NOT NULL,
    opp_tov_pct double precision NOT NULL,
    opp_oreb_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_location_four_factors_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_location_four_factors_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_location_four_factors_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_location_four_factors_row_id_seq OWNED BY team_general_location_four_factors.row_id;


--
-- Name: team_general_location_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_location_misc (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    team_game_location character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_location_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_location_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_location_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_location_misc_row_id_seq OWNED BY team_general_location_misc.row_id;


--
-- Name: team_general_location_opponent; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_location_opponent (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    team_game_location character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    opp_fgm double precision NOT NULL,
    opp_fga double precision NOT NULL,
    opp_fg_pct double precision NOT NULL,
    opp_fg3m double precision NOT NULL,
    opp_fg3a double precision NOT NULL,
    opp_fg3_pct double precision NOT NULL,
    opp_ftm double precision NOT NULL,
    opp_fta double precision NOT NULL,
    opp_ft_pct double precision NOT NULL,
    opp_oreb double precision NOT NULL,
    opp_dreb double precision NOT NULL,
    opp_reb double precision NOT NULL,
    opp_ast double precision NOT NULL,
    opp_tov double precision NOT NULL,
    opp_stl double precision NOT NULL,
    opp_blk double precision NOT NULL,
    opp_blka double precision NOT NULL,
    opp_pf double precision NOT NULL,
    opp_pfd double precision NOT NULL,
    opp_pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_location_opponent_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_location_opponent_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_location_opponent_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_location_opponent_row_id_seq OWNED BY team_general_location_opponent.row_id;


--
-- Name: team_general_location_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_location_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    team_game_location character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_location_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_location_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_location_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_location_scoring_row_id_seq OWNED BY team_general_location_scoring.row_id;


--
-- Name: team_general_month_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_month_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    season_month_name character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_month_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_month_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_month_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_month_advanced_row_id_seq OWNED BY team_general_month_advanced.row_id;


--
-- Name: team_general_month_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_month_base (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    season_month_name character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_month_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_month_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_month_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_month_base_row_id_seq OWNED BY team_general_month_base.row_id;


--
-- Name: team_general_month_four_factors; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_month_four_factors (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    season_month_name character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fta_rate double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    opp_efg_pct double precision NOT NULL,
    opp_fta_rate double precision NOT NULL,
    opp_tov_pct double precision NOT NULL,
    opp_oreb_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_month_four_factors_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_month_four_factors_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_month_four_factors_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_month_four_factors_row_id_seq OWNED BY team_general_month_four_factors.row_id;


--
-- Name: team_general_month_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_month_misc (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    season_month_name character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_month_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_month_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_month_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_month_misc_row_id_seq OWNED BY team_general_month_misc.row_id;


--
-- Name: team_general_month_opponent; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_month_opponent (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    season_month_name character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    opp_fgm double precision NOT NULL,
    opp_fga double precision NOT NULL,
    opp_fg_pct double precision NOT NULL,
    opp_fg3m double precision NOT NULL,
    opp_fg3a double precision NOT NULL,
    opp_fg3_pct double precision NOT NULL,
    opp_ftm double precision NOT NULL,
    opp_fta double precision NOT NULL,
    opp_ft_pct double precision NOT NULL,
    opp_oreb double precision NOT NULL,
    opp_dreb double precision NOT NULL,
    opp_reb double precision NOT NULL,
    opp_ast double precision NOT NULL,
    opp_tov double precision NOT NULL,
    opp_stl double precision NOT NULL,
    opp_blk double precision NOT NULL,
    opp_blka double precision NOT NULL,
    opp_pf double precision NOT NULL,
    opp_pfd double precision NOT NULL,
    opp_pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_month_opponent_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_month_opponent_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_month_opponent_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_month_opponent_row_id_seq OWNED BY team_general_month_opponent.row_id;


--
-- Name: team_general_month_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_month_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    season_month_name character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_month_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_month_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_month_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_month_scoring_row_id_seq OWNED BY team_general_month_scoring.row_id;


--
-- Name: team_general_overall_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_overall_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    season_year character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_overall_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_overall_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_overall_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_overall_advanced_row_id_seq OWNED BY team_general_overall_advanced.row_id;


--
-- Name: team_general_overall_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_overall_base (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    season_year character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_overall_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_overall_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_overall_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_overall_base_row_id_seq OWNED BY team_general_overall_base.row_id;


--
-- Name: team_general_overall_four_factors; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_overall_four_factors (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    season_year character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fta_rate double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    opp_efg_pct double precision NOT NULL,
    opp_fta_rate double precision NOT NULL,
    opp_tov_pct double precision NOT NULL,
    opp_oreb_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_overall_four_factors_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_overall_four_factors_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_overall_four_factors_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_overall_four_factors_row_id_seq OWNED BY team_general_overall_four_factors.row_id;


--
-- Name: team_general_overall_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_overall_misc (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    season_year character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_overall_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_overall_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_overall_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_overall_misc_row_id_seq OWNED BY team_general_overall_misc.row_id;


--
-- Name: team_general_overall_opponent; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_overall_opponent (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    season_year character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    opp_fgm double precision NOT NULL,
    opp_fga double precision NOT NULL,
    opp_fg_pct double precision NOT NULL,
    opp_fg3m double precision NOT NULL,
    opp_fg3a double precision NOT NULL,
    opp_fg3_pct double precision NOT NULL,
    opp_ftm double precision NOT NULL,
    opp_fta double precision NOT NULL,
    opp_ft_pct double precision NOT NULL,
    opp_oreb double precision NOT NULL,
    opp_dreb double precision NOT NULL,
    opp_reb double precision NOT NULL,
    opp_ast double precision NOT NULL,
    opp_tov double precision NOT NULL,
    opp_stl double precision NOT NULL,
    opp_blk double precision NOT NULL,
    opp_blka double precision NOT NULL,
    opp_pf double precision NOT NULL,
    opp_pfd double precision NOT NULL,
    opp_pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_overall_opponent_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_overall_opponent_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_overall_opponent_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_overall_opponent_row_id_seq OWNED BY team_general_overall_opponent.row_id;


--
-- Name: team_general_overall_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_overall_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    season_year character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_overall_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_overall_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_overall_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_overall_scoring_row_id_seq OWNED BY team_general_overall_scoring.row_id;


--
-- Name: team_general_prepost_allstar_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_prepost_allstar_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    season_segment character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_prepost_allstar_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_prepost_allstar_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_prepost_allstar_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_prepost_allstar_advanced_row_id_seq OWNED BY team_general_prepost_allstar_advanced.row_id;


--
-- Name: team_general_prepost_allstar_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_prepost_allstar_base (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    season_segment character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_prepost_allstar_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_prepost_allstar_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_prepost_allstar_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_prepost_allstar_base_row_id_seq OWNED BY team_general_prepost_allstar_base.row_id;


--
-- Name: team_general_prepost_allstar_four_factors; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_prepost_allstar_four_factors (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    season_segment character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fta_rate double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    opp_efg_pct double precision NOT NULL,
    opp_fta_rate double precision NOT NULL,
    opp_tov_pct double precision NOT NULL,
    opp_oreb_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_prepost_allstar_four_factors_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_prepost_allstar_four_factors_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_prepost_allstar_four_factors_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_prepost_allstar_four_factors_row_id_seq OWNED BY team_general_prepost_allstar_four_factors.row_id;


--
-- Name: team_general_prepost_allstar_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_prepost_allstar_misc (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    season_segment character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_prepost_allstar_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_prepost_allstar_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_prepost_allstar_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_prepost_allstar_misc_row_id_seq OWNED BY team_general_prepost_allstar_misc.row_id;


--
-- Name: team_general_prepost_allstar_opponent; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_prepost_allstar_opponent (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    season_segment character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    opp_fgm double precision NOT NULL,
    opp_fga double precision NOT NULL,
    opp_fg_pct double precision NOT NULL,
    opp_fg3m double precision NOT NULL,
    opp_fg3a double precision NOT NULL,
    opp_fg3_pct double precision NOT NULL,
    opp_ftm double precision NOT NULL,
    opp_fta double precision NOT NULL,
    opp_ft_pct double precision NOT NULL,
    opp_oreb double precision NOT NULL,
    opp_dreb double precision NOT NULL,
    opp_reb double precision NOT NULL,
    opp_ast double precision NOT NULL,
    opp_tov double precision NOT NULL,
    opp_stl double precision NOT NULL,
    opp_blk double precision NOT NULL,
    opp_blka double precision NOT NULL,
    opp_pf double precision NOT NULL,
    opp_pfd double precision NOT NULL,
    opp_pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_prepost_allstar_opponent_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_prepost_allstar_opponent_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_prepost_allstar_opponent_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_prepost_allstar_opponent_row_id_seq OWNED BY team_general_prepost_allstar_opponent.row_id;


--
-- Name: team_general_prepost_allstar_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_prepost_allstar_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    season_segment character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_prepost_allstar_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_prepost_allstar_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_prepost_allstar_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_prepost_allstar_scoring_row_id_seq OWNED BY team_general_prepost_allstar_scoring.row_id;


--
-- Name: team_general_win_lose_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_win_lose_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    game_result character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_win_lose_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_win_lose_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_win_lose_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_win_lose_advanced_row_id_seq OWNED BY team_general_win_lose_advanced.row_id;


--
-- Name: team_general_win_lose_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_win_lose_base (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    game_result character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_win_lose_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_win_lose_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_win_lose_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_win_lose_base_row_id_seq OWNED BY team_general_win_lose_base.row_id;


--
-- Name: team_general_win_lose_four_factors; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_win_lose_four_factors (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    game_result character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fta_rate double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    opp_efg_pct double precision NOT NULL,
    opp_fta_rate double precision NOT NULL,
    opp_tov_pct double precision NOT NULL,
    opp_oreb_pct double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_win_lose_four_factors_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_win_lose_four_factors_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_win_lose_four_factors_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_win_lose_four_factors_row_id_seq OWNED BY team_general_win_lose_four_factors.row_id;


--
-- Name: team_general_win_lose_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_win_lose_misc (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    game_result character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_win_lose_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_win_lose_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_win_lose_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_win_lose_misc_row_id_seq OWNED BY team_general_win_lose_misc.row_id;


--
-- Name: team_general_win_lose_opponent; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_win_lose_opponent (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    game_result character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    opp_fgm double precision NOT NULL,
    opp_fga double precision NOT NULL,
    opp_fg_pct double precision NOT NULL,
    opp_fg3m double precision NOT NULL,
    opp_fg3a double precision NOT NULL,
    opp_fg3_pct double precision NOT NULL,
    opp_ftm double precision NOT NULL,
    opp_fta double precision NOT NULL,
    opp_ft_pct double precision NOT NULL,
    opp_oreb double precision NOT NULL,
    opp_dreb double precision NOT NULL,
    opp_reb double precision NOT NULL,
    opp_ast double precision NOT NULL,
    opp_tov double precision NOT NULL,
    opp_stl double precision NOT NULL,
    opp_blk double precision NOT NULL,
    opp_blka double precision NOT NULL,
    opp_pf double precision NOT NULL,
    opp_pfd double precision NOT NULL,
    opp_pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_win_lose_opponent_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_win_lose_opponent_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_win_lose_opponent_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_win_lose_opponent_row_id_seq OWNED BY team_general_win_lose_opponent.row_id;


--
-- Name: team_general_win_lose_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_general_win_lose_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    game_result character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_general_win_lose_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_general_win_lose_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_general_win_lose_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_general_win_lose_scoring_row_id_seq OWNED BY team_general_win_lose_scoring.row_id;


--
-- Name: team_lineup_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_lineup_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_id character varying(255) NOT NULL,
    group_name character varying(250) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_lineup_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_lineup_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_lineup_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_lineup_advanced_row_id_seq OWNED BY team_lineup_advanced.row_id;


--
-- Name: team_lineup_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_lineup_base (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_id character varying(250) NOT NULL,
    group_name character varying(250) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_lineup_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_lineup_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_lineup_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_lineup_base_row_id_seq OWNED BY team_lineup_base.row_id;


--
-- Name: team_lineup_four_factors; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_lineup_four_factors (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_id character varying(250) NOT NULL,
    group_name character varying(255) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fta_rate double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    opp_efg_pct double precision NOT NULL,
    opp_fta_rate double precision NOT NULL,
    opp_tov_pct double precision NOT NULL,
    opp_oreb_pct double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_lineup_four_factors_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_lineup_four_factors_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_lineup_four_factors_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_lineup_four_factors_row_id_seq OWNED BY team_lineup_four_factors.row_id;


--
-- Name: team_lineup_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_lineup_misc (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_id character varying(250) NOT NULL,
    group_name character varying(250) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_lineup_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_lineup_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_lineup_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_lineup_misc_row_id_seq OWNED BY team_lineup_misc.row_id;


--
-- Name: team_lineup_opponent; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_lineup_opponent (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_id character varying(250) NOT NULL,
    group_name character varying(255) NOT NULL,
    gp numeric NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    opp_fgm double precision NOT NULL,
    opp_fga double precision NOT NULL,
    opp_fg_pct double precision NOT NULL,
    opp_fg3m double precision NOT NULL,
    opp_fg3a double precision NOT NULL,
    opp_fg3_pct double precision NOT NULL,
    opp_ftm double precision NOT NULL,
    opp_fta double precision NOT NULL,
    opp_ft_pct double precision NOT NULL,
    opp_oreb double precision NOT NULL,
    opp_dreb double precision NOT NULL,
    opp_reb double precision NOT NULL,
    opp_ast double precision NOT NULL,
    opp_tov double precision NOT NULL,
    opp_stl double precision NOT NULL,
    opp_blk double precision NOT NULL,
    opp_blka double precision NOT NULL,
    opp_pf double precision NOT NULL,
    opp_pfd double precision NOT NULL,
    opp_pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_lineup_opponent_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_lineup_opponent_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_lineup_opponent_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_lineup_opponent_row_id_seq OWNED BY team_lineup_opponent.row_id;


--
-- Name: team_lineup_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_lineup_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_id character varying(250) NOT NULL,
    group_name character varying(250) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_lineup_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_lineup_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_lineup_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_lineup_scoring_row_id_seq OWNED BY team_lineup_scoring.row_id;


--
-- Name: team_player_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(50) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fgm_pg double precision NOT NULL,
    fga_pg double precision NOT NULL,
    fg_pct double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_advanced_row_id_seq OWNED BY team_player_advanced.row_id;


--
-- Name: team_player_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_base (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    dd2 double precision NOT NULL,
    td3 double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_base_row_id_seq OWNED BY team_player_base.row_id;


--
-- Name: team_player_off_sum_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_off_sum_base (
    _unnamed integer NOT NULL,
    group_set character varying(12) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_name character varying(50) NOT NULL,
    vs_player_id integer NOT NULL,
    vs_player_name character varying(50),
    court_status character varying(3) NOT NULL,
    gp integer NOT NULL,
    min double precision NOT NULL,
    plus_minus double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_off_sum_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_off_sum_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_off_sum_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_off_sum_base_row_id_seq OWNED BY team_player_off_sum_base.row_id;


--
-- Name: team_player_on_off_advanced; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_on_off_advanced (
    _unnamed integer NOT NULL,
    group_set character varying(12) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_name character varying(50) NOT NULL,
    vs_player_id integer NOT NULL,
    vs_player_name character varying(50),
    court_status character varying(3) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_on_off_advanced_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_on_off_advanced_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_on_off_advanced_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_on_off_advanced_row_id_seq OWNED BY team_player_on_off_advanced.row_id;


--
-- Name: team_player_on_off_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_on_off_base (
    _unnamed integer NOT NULL,
    group_set character varying(12) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_name character varying(50) NOT NULL,
    vs_player_id integer NOT NULL,
    vs_player_name character varying(50),
    court_status character varying(3) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_on_off_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_on_off_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_on_off_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_on_off_base_row_id_seq OWNED BY team_player_on_off_base.row_id;


--
-- Name: team_player_on_off_four_factors; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_on_off_four_factors (
    _unnamed integer NOT NULL,
    group_set character varying(12) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_name character varying(50) NOT NULL,
    vs_player_id integer NOT NULL,
    vs_player_name character varying(50),
    court_status character varying(3) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fta_rate double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    opp_efg_pct double precision NOT NULL,
    opp_fta_rate double precision NOT NULL,
    opp_tov_pct double precision NOT NULL,
    opp_oreb_pct double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_on_off_four_factors_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_on_off_four_factors_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_on_off_four_factors_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_on_off_four_factors_row_id_seq OWNED BY team_player_on_off_four_factors.row_id;


--
-- Name: team_player_on_off_misc; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_on_off_misc (
    _unnamed integer NOT NULL,
    group_set character varying(12) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_name character varying(50) NOT NULL,
    vs_player_id integer NOT NULL,
    vs_player_name character varying(50),
    court_status character varying(3) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pts_off_tov double precision NOT NULL,
    pts_2nd_chance double precision NOT NULL,
    pts_fb double precision NOT NULL,
    pts_paint double precision NOT NULL,
    opp_pts_off_tov double precision NOT NULL,
    opp_pts_2nd_chance double precision NOT NULL,
    opp_pts_fb double precision NOT NULL,
    opp_pts_paint double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_on_off_misc_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_on_off_misc_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_on_off_misc_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_on_off_misc_row_id_seq OWNED BY team_player_on_off_misc.row_id;


--
-- Name: team_player_on_off_opponent; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_on_off_opponent (
    _unnamed integer NOT NULL,
    group_set character varying(12) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_name character varying(50) NOT NULL,
    vs_player_id integer NOT NULL,
    vs_player_name character varying(50),
    court_status character varying(3) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    opp_fgm double precision NOT NULL,
    opp_fga double precision NOT NULL,
    opp_fg_pct double precision NOT NULL,
    opp_fg3m double precision NOT NULL,
    opp_fg3a double precision NOT NULL,
    opp_fg3_pct double precision NOT NULL,
    opp_ftm double precision NOT NULL,
    opp_fta double precision NOT NULL,
    opp_ft_pct double precision NOT NULL,
    opp_oreb double precision NOT NULL,
    opp_dreb double precision NOT NULL,
    opp_reb double precision NOT NULL,
    opp_ast double precision NOT NULL,
    opp_tov double precision NOT NULL,
    opp_stl double precision NOT NULL,
    opp_blk double precision NOT NULL,
    opp_blka double precision NOT NULL,
    opp_pf double precision NOT NULL,
    opp_pfd double precision NOT NULL,
    opp_pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_on_off_opponent_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_on_off_opponent_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_on_off_opponent_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_on_off_opponent_row_id_seq OWNED BY team_player_on_off_opponent.row_id;


--
-- Name: team_player_on_off_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_on_off_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(12) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_name character varying(50) NOT NULL,
    vs_player_id integer NOT NULL,
    vs_player_name character varying(50),
    court_status character varying(3) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    pct_fga_2pt double precision NOT NULL,
    pct_fga_3pt double precision NOT NULL,
    pct_pts_2pt double precision NOT NULL,
    pct_pts_2pt_mr double precision NOT NULL,
    pct_pts_3pt double precision NOT NULL,
    pct_pts_fb double precision NOT NULL,
    pct_pts_ft double precision NOT NULL,
    pct_pts_off_tov double precision NOT NULL,
    pct_pts_paint double precision NOT NULL,
    pct_ast_2pm double precision NOT NULL,
    pct_uast_2pm double precision NOT NULL,
    pct_ast_3pm double precision NOT NULL,
    pct_uast_3pm double precision NOT NULL,
    pct_ast_fgm double precision NOT NULL,
    pct_uast_fgm double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_on_off_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_on_off_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_on_off_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_on_off_scoring_row_id_seq OWNED BY team_player_on_off_scoring.row_id;


--
-- Name: team_player_on_sum_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_on_sum_base (
    _unnamed integer NOT NULL,
    group_set character varying(12) NOT NULL,
    team_id integer NOT NULL,
    team_abbreviation character varying(3) NOT NULL,
    team_name character varying(50) NOT NULL,
    vs_player_id integer NOT NULL,
    vs_player_name character varying(50) NOT NULL,
    court_status character varying(10) NOT NULL,
    gp integer NOT NULL,
    min double precision NOT NULL,
    plus_minus double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_on_sum_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_on_sum_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_on_sum_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_on_sum_base_row_id_seq OWNED BY team_player_on_sum_base.row_id;


--
-- Name: team_player_passes_made; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_passes_made (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    pass_type character varying(4) NOT NULL,
    g integer NOT NULL,
    pass_from character varying(50) NOT NULL,
    pass_teammate_player_id integer NOT NULL,
    frequency double precision NOT NULL,
    pass double precision NOT NULL,
    ast double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_passes_made_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_passes_made_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_passes_made_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_passes_made_row_id_seq OWNED BY team_player_passes_made.row_id;


--
-- Name: team_player_passes_rcvd; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_passes_rcvd (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    pass_type character varying(8) NOT NULL,
    g integer NOT NULL,
    pass_to character varying(50) NOT NULL,
    pass_teammate_player_id integer NOT NULL,
    frequency double precision NOT NULL,
    pass double precision NOT NULL,
    ast double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_passes_rcvd_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_passes_rcvd_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_passes_rcvd_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_passes_rcvd_row_id_seq OWNED BY team_player_passes_rcvd.row_id;


--
-- Name: team_player_scoring; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_scoring (
    _unnamed integer NOT NULL,
    group_set character varying(50) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    off_rating double precision NOT NULL,
    def_rating double precision NOT NULL,
    net_rating double precision NOT NULL,
    ast_pct double precision NOT NULL,
    ast_to double precision NOT NULL,
    ast_ratio double precision NOT NULL,
    oreb_pct double precision NOT NULL,
    dreb_pct double precision NOT NULL,
    reb_pct double precision NOT NULL,
    tm_tov_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    ts_pct double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pace double precision NOT NULL,
    pie double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fgm_pg double precision NOT NULL,
    fga_pg double precision NOT NULL,
    fg_pct double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_scoring_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_scoring_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_scoring_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_scoring_row_id_seq OWNED BY team_player_scoring.row_id;


--
-- Name: team_player_usage; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_player_usage (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    player_id integer NOT NULL,
    player_name character varying(50) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    usg_pct double precision NOT NULL,
    pct_fgm double precision NOT NULL,
    pct_fga double precision NOT NULL,
    pct_fg3m double precision NOT NULL,
    pct_fg3a double precision NOT NULL,
    pct_ftm double precision NOT NULL,
    pct_fta double precision NOT NULL,
    pct_oreb double precision NOT NULL,
    pct_dreb double precision NOT NULL,
    pct_reb double precision NOT NULL,
    pct_ast double precision NOT NULL,
    pct_tov double precision NOT NULL,
    pct_stl double precision NOT NULL,
    pct_blk double precision NOT NULL,
    pct_blka double precision NOT NULL,
    pct_pf double precision NOT NULL,
    pct_pfd double precision NOT NULL,
    pct_pts double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_player_usage_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_player_usage_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_player_usage_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_player_usage_row_id_seq OWNED BY team_player_usage.row_id;


--
-- Name: team_reb_trck_num_contested; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_reb_trck_num_contested (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    reb_num_contesting_range character varying(24) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_reb_trck_num_contested_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_reb_trck_num_contested_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_reb_trck_num_contested_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_reb_trck_num_contested_row_id_seq OWNED BY team_reb_trck_num_contested.row_id;


--
-- Name: team_reb_trck_overall; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_reb_trck_overall (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    g integer NOT NULL,
    overall character varying(7) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_reb_trck_overall_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_reb_trck_overall_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_reb_trck_overall_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_reb_trck_overall_row_id_seq OWNED BY team_reb_trck_overall.row_id;


--
-- Name: team_reb_trck_reb_dist; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_reb_trck_reb_dist (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    reb_dist_range character varying(9) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_reb_trck_reb_dist_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_reb_trck_reb_dist_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_reb_trck_reb_dist_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_reb_trck_reb_dist_row_id_seq OWNED BY team_reb_trck_reb_dist.row_id;


--
-- Name: team_reb_trck_shot_dist; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_reb_trck_shot_dist (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    shot_dist_range character varying(10) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_reb_trck_shot_dist_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_reb_trck_shot_dist_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_reb_trck_shot_dist_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_reb_trck_shot_dist_row_id_seq OWNED BY team_reb_trck_shot_dist.row_id;


--
-- Name: team_reb_trck_shot_type; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_reb_trck_shot_type (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    shot_type_range character varying(8) NOT NULL,
    reb_frequency double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    c_oreb double precision NOT NULL,
    c_dreb double precision NOT NULL,
    c_reb double precision NOT NULL,
    c_reb_pct double precision NOT NULL,
    uc_oreb double precision NOT NULL,
    uc_dreb double precision NOT NULL,
    uc_reb double precision NOT NULL,
    uc_reb_pct double precision NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_reb_trck_shot_type_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_reb_trck_shot_type_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_reb_trck_shot_type_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_reb_trck_shot_type_row_id_seq OWNED BY team_reb_trck_shot_type.row_id;


--
-- Name: team_shooting_days_rest_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shooting_days_rest_base (
    _unnamed integer NOT NULL,
    group_set character varying(9) NOT NULL,
    group_value character varying(12) NOT NULL,
    team_days_rest_range character varying(12) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(12) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shooting_days_rest_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shooting_days_rest_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shooting_days_rest_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shooting_days_rest_base_row_id_seq OWNED BY team_shooting_days_rest_base.row_id;


--
-- Name: team_shooting_location_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shooting_location_base (
    _unnamed integer NOT NULL,
    group_set character varying(8) NOT NULL,
    group_value character varying(4) NOT NULL,
    team_game_location character varying(4) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(4) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shooting_location_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shooting_location_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shooting_location_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shooting_location_base_row_id_seq OWNED BY team_shooting_location_base.row_id;


--
-- Name: team_shooting_month_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shooting_month_base (
    _unnamed integer NOT NULL,
    group_set character varying(5) NOT NULL,
    group_value character varying(8) NOT NULL,
    season_month_name character varying(8) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(8) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shooting_month_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shooting_month_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shooting_month_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shooting_month_base_row_id_seq OWNED BY team_shooting_month_base.row_id;


--
-- Name: team_shooting_overall_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shooting_overall_base (
    _unnamed integer NOT NULL,
    group_set character varying(7) NOT NULL,
    group_value character varying(7) NOT NULL,
    season_year character varying(7) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(7) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shooting_overall_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shooting_overall_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shooting_overall_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shooting_overall_base_row_id_seq OWNED BY team_shooting_overall_base.row_id;


--
-- Name: team_shooting_prepost_allstar_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shooting_prepost_allstar_base (
    _unnamed integer NOT NULL,
    group_set character varying(17) NOT NULL,
    group_value character varying(13) NOT NULL,
    season_segment character varying(13) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(13) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shooting_prepost_allstar_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shooting_prepost_allstar_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shooting_prepost_allstar_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shooting_prepost_allstar_base_row_id_seq OWNED BY team_shooting_prepost_allstar_base.row_id;


--
-- Name: team_shooting_win_lose_base; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shooting_win_lose_base (
    _unnamed integer NOT NULL,
    group_set character varying(11) NOT NULL,
    group_value character varying(6) NOT NULL,
    game_result character varying(6) NOT NULL,
    gp integer NOT NULL,
    w integer NOT NULL,
    l integer NOT NULL,
    w_pct double precision NOT NULL,
    min double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision NOT NULL,
    ftm double precision NOT NULL,
    fta double precision NOT NULL,
    ft_pct double precision NOT NULL,
    oreb double precision NOT NULL,
    dreb double precision NOT NULL,
    reb double precision NOT NULL,
    ast double precision NOT NULL,
    tov double precision NOT NULL,
    stl double precision NOT NULL,
    blk double precision NOT NULL,
    blka double precision NOT NULL,
    pf double precision NOT NULL,
    pfd double precision NOT NULL,
    pts double precision NOT NULL,
    plus_minus double precision NOT NULL,
    cfid integer NOT NULL,
    cfparams character varying(6) NOT NULL,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shooting_win_lose_base_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shooting_win_lose_base_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shooting_win_lose_base_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shooting_win_lose_base_row_id_seq OWNED BY team_shooting_win_lose_base.row_id;


--
-- Name: team_shot_trck_closest_def; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shot_trck_closest_def (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    close_def_dist_range character varying(21) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision NOT NULL,
    fg3a_frequency double precision,
    fg3m double precision,
    fg3a double precision,
    fg3_pct double precision,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shot_trck_closest_def_10ft_plus; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shot_trck_closest_def_10ft_plus (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    touch_time_range character varying(21) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shot_trck_closest_def_10ft_plus_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shot_trck_closest_def_10ft_plus_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shot_trck_closest_def_10ft_plus_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shot_trck_closest_def_10ft_plus_row_id_seq OWNED BY team_shot_trck_closest_def_10ft_plus.row_id;


--
-- Name: team_shot_trck_closest_def_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shot_trck_closest_def_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shot_trck_closest_def_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shot_trck_closest_def_row_id_seq OWNED BY team_shot_trck_closest_def.row_id;


--
-- Name: team_shot_trck_dribble; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shot_trck_dribble (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    dribble_range character varying(12) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision,
    fg2a double precision,
    fg2_pct double precision,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision,
    fg3a double precision,
    fg3_pct double precision,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shot_trck_dribble_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shot_trck_dribble_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shot_trck_dribble_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shot_trck_dribble_row_id_seq OWNED BY team_shot_trck_dribble.row_id;


--
-- Name: team_shot_trck_general; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shot_trck_general (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    shot_type character varying(15) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision NOT NULL,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shot_trck_general_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shot_trck_general_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shot_trck_general_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shot_trck_general_row_id_seq OWNED BY team_shot_trck_general.row_id;


--
-- Name: team_shot_trck_shot_clock; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shot_trck_shot_clock (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    shot_clock_range character varying(16) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision,
    fg3a_frequency double precision NOT NULL,
    fg3m double precision NOT NULL,
    fg3a double precision NOT NULL,
    fg3_pct double precision,
    teamid integer NOT NULL,
    season character varying(7) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50)
);


--
-- Name: team_shot_trck_shot_clock_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shot_trck_shot_clock_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shot_trck_shot_clock_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shot_trck_shot_clock_row_id_seq OWNED BY team_shot_trck_shot_clock.row_id;


--
-- Name: team_shot_trck_touch_time; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE team_shot_trck_touch_time (
    _unnamed integer NOT NULL,
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    sort_order integer NOT NULL,
    g integer NOT NULL,
    close_def_dist_range character varying(21) NOT NULL,
    fga_frequency double precision NOT NULL,
    fgm double precision NOT NULL,
    fga double precision NOT NULL,
    fg_pct double precision NOT NULL,
    efg_pct double precision NOT NULL,
    fg2a_frequency double precision NOT NULL,
    fg2m double precision NOT NULL,
    fg2a double precision NOT NULL,
    fg2_pct double precision NOT NULL,
    fg3a_frequency double precision,
    fg3m double precision,
    fg3a double precision,
    fg3_pct double precision,
    teamid integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    season_type character varying(50),
    season character varying(10)
);


--
-- Name: team_shot_trck_touch_time_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE team_shot_trck_touch_time_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: team_shot_trck_touch_time_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE team_shot_trck_touch_time_row_id_seq OWNED BY team_shot_trck_touch_time.row_id;


--
-- Name: teams; Type: TABLE; Schema: lnd; Owner: -; Tablespace: 
--

CREATE TABLE teams (
    team_id integer NOT NULL,
    team_name character varying(50) NOT NULL,
    team_abbrv_short character varying(5) NOT NULL,
    team_key character varying(50) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    row_id integer NOT NULL,
    team_abbrv character varying(3)
);


--
-- Name: teams_row_id_seq; Type: SEQUENCE; Schema: lnd; Owner: -
--

CREATE SEQUENCE teams_row_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teams_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lnd; Owner: -
--

ALTER SEQUENCE teams_row_id_seq OWNED BY teams.row_id;


--
-- Name: vw_dk_players; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_dk_players AS
 SELECT t."position",
    t.name,
    t.salary,
    t.gameinfo,
    t.avgpointspergame,
    t.teamabbrev,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.rn
   FROM ( SELECT dk_players."position",
            dk_players.name,
            dk_players.salary,
            dk_players.gameinfo,
            dk_players.avgpointspergame,
            dk_players.teamabbrev,
            dk_players.created_at,
            dk_players.updated_at,
            dk_players.row_id,
            row_number() OVER (PARTITION BY dk_players.name, dk_players.teamabbrev ORDER BY dk_players.created_at DESC) AS rn
           FROM dk_players) t
  WHERE (t.rn = 1);


--
-- Name: vw_fd_players; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_fd_players AS
 SELECT t.id,
    t."position",
    t.first_name,
    t.last_name,
    t.fppg,
    t.played,
    t.salary,
    t.game,
    t.team,
    t.opponent,
    t.injury_indicator,
    t.injury_details,
    t.unknown,
    t.unnamed,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.rn
   FROM ( SELECT fd_players.id,
            fd_players."position",
            fd_players.first_name,
            fd_players.last_name,
            fd_players.fppg,
            fd_players.played,
            fd_players.salary,
            fd_players.game,
            fd_players.team,
            fd_players.opponent,
            fd_players.injury_indicator,
            fd_players.injury_details,
            fd_players.unknown,
            fd_players.unnamed,
            fd_players.created_at,
            fd_players.updated_at,
            fd_players.row_id,
            row_number() OVER (PARTITION BY fd_players.id ORDER BY fd_players.created_at DESC) AS rn
           FROM fd_players) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_player_adv_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_player_adv_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_abbreviation,
    t.team_city,
    t.player_id,
    t.player_name,
    t.start_position,
    t.comment,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_tov,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_player_adv_stat._unnamed,
            game_player_adv_stat.game_id,
            game_player_adv_stat.team_id,
            game_player_adv_stat.team_abbreviation,
            game_player_adv_stat.team_city,
            game_player_adv_stat.player_id,
            game_player_adv_stat.player_name,
            game_player_adv_stat.start_position,
            game_player_adv_stat.comment,
            game_player_adv_stat.min,
            game_player_adv_stat.off_rating,
            game_player_adv_stat.def_rating,
            game_player_adv_stat.net_rating,
            game_player_adv_stat.ast_pct,
            game_player_adv_stat.ast_tov,
            game_player_adv_stat.ast_ratio,
            game_player_adv_stat.oreb_pct,
            game_player_adv_stat.dreb_pct,
            game_player_adv_stat.reb_pct,
            game_player_adv_stat.tm_tov_pct,
            game_player_adv_stat.efg_pct,
            game_player_adv_stat.ts_pct,
            game_player_adv_stat.usg_pct,
            game_player_adv_stat.pace,
            game_player_adv_stat.pie,
            game_player_adv_stat.created_at,
            game_player_adv_stat.updated_at,
            game_player_adv_stat.row_id,
            game_player_adv_stat.season_type,
            game_player_adv_stat.season,
            row_number() OVER (PARTITION BY game_player_adv_stat.game_id, game_player_adv_stat.player_id ORDER BY game_player_adv_stat.created_at DESC) AS rn
           FROM game_player_adv_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_player_four_factor_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_player_four_factor_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_abbreviation,
    t.team_city,
    t.player_id,
    t.player_name,
    t.start_position,
    t.comment,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_player_four_factor_stat._unnamed,
            game_player_four_factor_stat.game_id,
            game_player_four_factor_stat.team_id,
            game_player_four_factor_stat.team_abbreviation,
            game_player_four_factor_stat.team_city,
            game_player_four_factor_stat.player_id,
            game_player_four_factor_stat.player_name,
            game_player_four_factor_stat.start_position,
            game_player_four_factor_stat.comment,
            game_player_four_factor_stat.min,
            game_player_four_factor_stat.efg_pct,
            game_player_four_factor_stat.fta_rate,
            game_player_four_factor_stat.tm_tov_pct,
            game_player_four_factor_stat.oreb_pct,
            game_player_four_factor_stat.opp_efg_pct,
            game_player_four_factor_stat.opp_fta_rate,
            game_player_four_factor_stat.opp_tov_pct,
            game_player_four_factor_stat.opp_oreb_pct,
            game_player_four_factor_stat.created_at,
            game_player_four_factor_stat.updated_at,
            game_player_four_factor_stat.row_id,
            game_player_four_factor_stat.season_type,
            game_player_four_factor_stat.season,
            row_number() OVER (PARTITION BY game_player_four_factor_stat.game_id, game_player_four_factor_stat.player_id ORDER BY game_player_four_factor_stat.created_at DESC) AS rn
           FROM game_player_four_factor_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_player_misc_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_player_misc_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_abbreviation,
    t.team_city,
    t.player_id,
    t.player_name,
    t.start_position,
    t.comment,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_player_misc_stat._unnamed,
            game_player_misc_stat.game_id,
            game_player_misc_stat.team_id,
            game_player_misc_stat.team_abbreviation,
            game_player_misc_stat.team_city,
            game_player_misc_stat.player_id,
            game_player_misc_stat.player_name,
            game_player_misc_stat.start_position,
            game_player_misc_stat.comment,
            game_player_misc_stat.min,
            game_player_misc_stat.pts_off_tov,
            game_player_misc_stat.pts_2nd_chance,
            game_player_misc_stat.pts_fb,
            game_player_misc_stat.pts_paint,
            game_player_misc_stat.opp_pts_off_tov,
            game_player_misc_stat.opp_pts_2nd_chance,
            game_player_misc_stat.opp_pts_fb,
            game_player_misc_stat.opp_pts_paint,
            game_player_misc_stat.blk,
            game_player_misc_stat.blka,
            game_player_misc_stat.pf,
            game_player_misc_stat.pfd,
            game_player_misc_stat.created_at,
            game_player_misc_stat.updated_at,
            game_player_misc_stat.row_id,
            game_player_misc_stat.season_type,
            game_player_misc_stat.season,
            row_number() OVER (PARTITION BY game_player_misc_stat.game_id, game_player_misc_stat.player_id ORDER BY game_player_misc_stat.created_at DESC) AS rn
           FROM game_player_misc_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_player_scoring_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_player_scoring_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_abbreviation,
    t.team_city,
    t.player_id,
    t.player_name,
    t.start_position,
    t.comment,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_player_scoring_stat._unnamed,
            game_player_scoring_stat.game_id,
            game_player_scoring_stat.team_id,
            game_player_scoring_stat.team_abbreviation,
            game_player_scoring_stat.team_city,
            game_player_scoring_stat.player_id,
            game_player_scoring_stat.player_name,
            game_player_scoring_stat.start_position,
            game_player_scoring_stat.comment,
            game_player_scoring_stat.min,
            game_player_scoring_stat.pct_fga_2pt,
            game_player_scoring_stat.pct_fga_3pt,
            game_player_scoring_stat.pct_pts_2pt,
            game_player_scoring_stat.pct_pts_2pt_mr,
            game_player_scoring_stat.pct_pts_3pt,
            game_player_scoring_stat.pct_pts_fb,
            game_player_scoring_stat.pct_pts_ft,
            game_player_scoring_stat.pct_pts_off_tov,
            game_player_scoring_stat.pct_pts_paint,
            game_player_scoring_stat.pct_ast_2pm,
            game_player_scoring_stat.pct_uast_2pm,
            game_player_scoring_stat.pct_ast_3pm,
            game_player_scoring_stat.pct_uast_3pm,
            game_player_scoring_stat.pct_ast_fgm,
            game_player_scoring_stat.pct_uast_fgm,
            game_player_scoring_stat.created_at,
            game_player_scoring_stat.updated_at,
            game_player_scoring_stat.row_id,
            game_player_scoring_stat.season_type,
            game_player_scoring_stat.season,
            row_number() OVER (PARTITION BY game_player_scoring_stat.game_id, game_player_scoring_stat.player_id ORDER BY game_player_scoring_stat.created_at DESC) AS rn
           FROM game_player_scoring_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_player_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_player_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_abbreviation,
    t.team_city,
    t.player_id,
    t.player_name,
    t.start_position,
    t.comment,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.stl,
    t.blk,
    t.tov,
    t.pf,
    t.pts,
    t.plus_minus,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_player_stat._unnamed,
            game_player_stat.game_id,
            game_player_stat.team_id,
            game_player_stat.team_abbreviation,
            game_player_stat.team_city,
            game_player_stat.player_id,
            game_player_stat.player_name,
            game_player_stat.start_position,
            game_player_stat.comment,
            game_player_stat.min,
            game_player_stat.fgm,
            game_player_stat.fga,
            game_player_stat.fg_pct,
            game_player_stat.fg3m,
            game_player_stat.fg3a,
            game_player_stat.fg3_pct,
            game_player_stat.ftm,
            game_player_stat.fta,
            game_player_stat.ft_pct,
            game_player_stat.oreb,
            game_player_stat.dreb,
            game_player_stat.reb,
            game_player_stat.ast,
            game_player_stat.stl,
            game_player_stat.blk,
            game_player_stat.tov,
            game_player_stat.pf,
            game_player_stat.pts,
            game_player_stat.plus_minus,
            game_player_stat.created_at,
            game_player_stat.updated_at,
            game_player_stat.row_id,
            game_player_stat.season_type,
            game_player_stat.season,
            row_number() OVER (PARTITION BY game_player_stat.game_id, game_player_stat.player_id ORDER BY game_player_stat.created_at DESC) AS rn
           FROM game_player_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_player_trck_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_player_trck_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_abbreviation,
    t.team_city,
    t.player_id,
    t.player_name,
    t.start_position,
    t.comment,
    t.min,
    t.spd,
    t.dist,
    t.orbc,
    t.drbc,
    t.rbc,
    t.tchs,
    t.sast,
    t.ftast,
    t.pass,
    t.ast,
    t.cfgm,
    t.cfga,
    t.cfg_pct,
    t.ufgm,
    t.ufga,
    t.ufg_pct,
    t.fg_pct,
    t.dfgm,
    t.dfga,
    t.dfg_pct,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_player_trck_stat._unnamed,
            game_player_trck_stat.game_id,
            game_player_trck_stat.team_id,
            game_player_trck_stat.team_abbreviation,
            game_player_trck_stat.team_city,
            game_player_trck_stat.player_id,
            game_player_trck_stat.player_name,
            game_player_trck_stat.start_position,
            game_player_trck_stat.comment,
            game_player_trck_stat.min,
            game_player_trck_stat.spd,
            game_player_trck_stat.dist,
            game_player_trck_stat.orbc,
            game_player_trck_stat.drbc,
            game_player_trck_stat.rbc,
            game_player_trck_stat.tchs,
            game_player_trck_stat.sast,
            game_player_trck_stat.ftast,
            game_player_trck_stat.pass,
            game_player_trck_stat.ast,
            game_player_trck_stat.cfgm,
            game_player_trck_stat.cfga,
            game_player_trck_stat.cfg_pct,
            game_player_trck_stat.ufgm,
            game_player_trck_stat.ufga,
            game_player_trck_stat.ufg_pct,
            game_player_trck_stat.fg_pct,
            game_player_trck_stat.dfgm,
            game_player_trck_stat.dfga,
            game_player_trck_stat.dfg_pct,
            game_player_trck_stat.created_at,
            game_player_trck_stat.updated_at,
            game_player_trck_stat.row_id,
            game_player_trck_stat.season_type,
            game_player_trck_stat.season,
            row_number() OVER (PARTITION BY game_player_trck_stat.game_id, game_player_trck_stat.player_id ORDER BY game_player_trck_stat.created_at DESC) AS rn
           FROM game_player_trck_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_player_usage_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_player_usage_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_abbreviation,
    t.team_city,
    t.player_id,
    t.player_name,
    t.start_position,
    t.comment,
    t.min,
    t.usg_pct,
    t.pct_fgm,
    t.pct_fga,
    t.pct_fg3m,
    t.pct_fg3a,
    t.pct_ftm,
    t.pct_fta,
    t.pct_oreb,
    t.pct_dreb,
    t.pct_reb,
    t.pct_ast,
    t.pct_tov,
    t.pct_stl,
    t.pct_blk,
    t.pct_blka,
    t.pct_pf,
    t.pct_pfd,
    t.pct_pts,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_player_usage_stat._unnamed,
            game_player_usage_stat.game_id,
            game_player_usage_stat.team_id,
            game_player_usage_stat.team_abbreviation,
            game_player_usage_stat.team_city,
            game_player_usage_stat.player_id,
            game_player_usage_stat.player_name,
            game_player_usage_stat.start_position,
            game_player_usage_stat.comment,
            game_player_usage_stat.min,
            game_player_usage_stat.usg_pct,
            game_player_usage_stat.pct_fgm,
            game_player_usage_stat.pct_fga,
            game_player_usage_stat.pct_fg3m,
            game_player_usage_stat.pct_fg3a,
            game_player_usage_stat.pct_ftm,
            game_player_usage_stat.pct_fta,
            game_player_usage_stat.pct_oreb,
            game_player_usage_stat.pct_dreb,
            game_player_usage_stat.pct_reb,
            game_player_usage_stat.pct_ast,
            game_player_usage_stat.pct_tov,
            game_player_usage_stat.pct_stl,
            game_player_usage_stat.pct_blk,
            game_player_usage_stat.pct_blka,
            game_player_usage_stat.pct_pf,
            game_player_usage_stat.pct_pfd,
            game_player_usage_stat.pct_pts,
            game_player_usage_stat.created_at,
            game_player_usage_stat.updated_at,
            game_player_usage_stat.row_id,
            game_player_usage_stat.season_type,
            game_player_usage_stat.season,
            row_number() OVER (PARTITION BY game_player_usage_stat.game_id, game_player_usage_stat.player_id ORDER BY game_player_usage_stat.created_at DESC) AS rn
           FROM game_player_usage_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_starter_bench; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_starter_bench AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_name,
    t.team_abbreviation,
    t.team_city,
    t.starters_bench,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.stl,
    t.blk,
    t.tov,
    t.pf,
    t.pts,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_starter_bench._unnamed,
            game_starter_bench.game_id,
            game_starter_bench.team_id,
            game_starter_bench.team_name,
            game_starter_bench.team_abbreviation,
            game_starter_bench.team_city,
            game_starter_bench.starters_bench,
            game_starter_bench.min,
            game_starter_bench.fgm,
            game_starter_bench.fga,
            game_starter_bench.fg_pct,
            game_starter_bench.fg3m,
            game_starter_bench.fg3a,
            game_starter_bench.fg3_pct,
            game_starter_bench.ftm,
            game_starter_bench.fta,
            game_starter_bench.ft_pct,
            game_starter_bench.oreb,
            game_starter_bench.dreb,
            game_starter_bench.reb,
            game_starter_bench.ast,
            game_starter_bench.stl,
            game_starter_bench.blk,
            game_starter_bench.tov,
            game_starter_bench.pf,
            game_starter_bench.pts,
            game_starter_bench.created_at,
            game_starter_bench.updated_at,
            game_starter_bench.row_id,
            game_starter_bench.season_type,
            game_starter_bench.season,
            row_number() OVER (PARTITION BY game_starter_bench.game_id, game_starter_bench.team_id, game_starter_bench.starters_bench ORDER BY game_starter_bench.created_at DESC) AS rn
           FROM game_starter_bench) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_team_adv_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_team_adv_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_name,
    t.team_abbreviation,
    t.team_city,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_tov,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_team_adv_stat._unnamed,
            game_team_adv_stat.game_id,
            game_team_adv_stat.team_id,
            game_team_adv_stat.team_name,
            game_team_adv_stat.team_abbreviation,
            game_team_adv_stat.team_city,
            game_team_adv_stat.min,
            game_team_adv_stat.off_rating,
            game_team_adv_stat.def_rating,
            game_team_adv_stat.net_rating,
            game_team_adv_stat.ast_pct,
            game_team_adv_stat.ast_tov,
            game_team_adv_stat.ast_ratio,
            game_team_adv_stat.oreb_pct,
            game_team_adv_stat.dreb_pct,
            game_team_adv_stat.reb_pct,
            game_team_adv_stat.tm_tov_pct,
            game_team_adv_stat.efg_pct,
            game_team_adv_stat.ts_pct,
            game_team_adv_stat.usg_pct,
            game_team_adv_stat.pace,
            game_team_adv_stat.pie,
            game_team_adv_stat.created_at,
            game_team_adv_stat.updated_at,
            game_team_adv_stat.row_id,
            game_team_adv_stat.season_type,
            game_team_adv_stat.season,
            row_number() OVER (PARTITION BY game_team_adv_stat.game_id, game_team_adv_stat.team_id ORDER BY game_team_adv_stat.created_at DESC) AS rn
           FROM game_team_adv_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_team_four_factor_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_team_four_factor_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_name,
    t.team_abbreviation,
    t.team_city,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_team_four_factor_stat._unnamed,
            game_team_four_factor_stat.game_id,
            game_team_four_factor_stat.team_id,
            game_team_four_factor_stat.team_name,
            game_team_four_factor_stat.team_abbreviation,
            game_team_four_factor_stat.team_city,
            game_team_four_factor_stat.min,
            game_team_four_factor_stat.efg_pct,
            game_team_four_factor_stat.fta_rate,
            game_team_four_factor_stat.tm_tov_pct,
            game_team_four_factor_stat.oreb_pct,
            game_team_four_factor_stat.opp_efg_pct,
            game_team_four_factor_stat.opp_fta_rate,
            game_team_four_factor_stat.opp_tov_pct,
            game_team_four_factor_stat.opp_oreb_pct,
            game_team_four_factor_stat.created_at,
            game_team_four_factor_stat.updated_at,
            game_team_four_factor_stat.row_id,
            game_team_four_factor_stat.season_type,
            game_team_four_factor_stat.season,
            row_number() OVER (PARTITION BY game_team_four_factor_stat.game_id, game_team_four_factor_stat.team_id ORDER BY game_team_four_factor_stat.created_at DESC) AS rn
           FROM game_team_four_factor_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_team_misc_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_team_misc_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_name,
    t.team_abbreviation,
    t.team_city,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_team_misc_stat._unnamed,
            game_team_misc_stat.game_id,
            game_team_misc_stat.team_id,
            game_team_misc_stat.team_name,
            game_team_misc_stat.team_abbreviation,
            game_team_misc_stat.team_city,
            game_team_misc_stat.min,
            game_team_misc_stat.pts_off_tov,
            game_team_misc_stat.pts_2nd_chance,
            game_team_misc_stat.pts_fb,
            game_team_misc_stat.pts_paint,
            game_team_misc_stat.opp_pts_off_tov,
            game_team_misc_stat.opp_pts_2nd_chance,
            game_team_misc_stat.opp_pts_fb,
            game_team_misc_stat.opp_pts_paint,
            game_team_misc_stat.blk,
            game_team_misc_stat.blka,
            game_team_misc_stat.pf,
            game_team_misc_stat.pfd,
            game_team_misc_stat.created_at,
            game_team_misc_stat.updated_at,
            game_team_misc_stat.row_id,
            game_team_misc_stat.season_type,
            game_team_misc_stat.season,
            row_number() OVER (PARTITION BY game_team_misc_stat.game_id, game_team_misc_stat.team_id ORDER BY game_team_misc_stat.created_at DESC) AS rn
           FROM game_team_misc_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_team_scoring_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_team_scoring_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_name,
    t.team_abbreviation,
    t.team_city,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_team_scoring_stat._unnamed,
            game_team_scoring_stat.game_id,
            game_team_scoring_stat.team_id,
            game_team_scoring_stat.team_name,
            game_team_scoring_stat.team_abbreviation,
            game_team_scoring_stat.team_city,
            game_team_scoring_stat.min,
            game_team_scoring_stat.pct_fga_2pt,
            game_team_scoring_stat.pct_fga_3pt,
            game_team_scoring_stat.pct_pts_2pt,
            game_team_scoring_stat.pct_pts_2pt_mr,
            game_team_scoring_stat.pct_pts_3pt,
            game_team_scoring_stat.pct_pts_fb,
            game_team_scoring_stat.pct_pts_ft,
            game_team_scoring_stat.pct_pts_off_tov,
            game_team_scoring_stat.pct_pts_paint,
            game_team_scoring_stat.pct_ast_2pm,
            game_team_scoring_stat.pct_uast_2pm,
            game_team_scoring_stat.pct_ast_3pm,
            game_team_scoring_stat.pct_uast_3pm,
            game_team_scoring_stat.pct_ast_fgm,
            game_team_scoring_stat.pct_uast_fgm,
            game_team_scoring_stat.created_at,
            game_team_scoring_stat.updated_at,
            game_team_scoring_stat.row_id,
            game_team_scoring_stat.season_type,
            game_team_scoring_stat.season,
            row_number() OVER (PARTITION BY game_team_scoring_stat.game_id, game_team_scoring_stat.team_id ORDER BY game_team_scoring_stat.created_at DESC) AS rn
           FROM game_team_scoring_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_team_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_team_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_name,
    t.team_abbreviation,
    t.team_city,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.stl,
    t.blk,
    t.tov,
    t.pf,
    t.pts,
    t.plus_minus,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_team_stat._unnamed,
            game_team_stat.game_id,
            game_team_stat.team_id,
            game_team_stat.team_name,
            game_team_stat.team_abbreviation,
            game_team_stat.team_city,
            game_team_stat.min,
            game_team_stat.fgm,
            game_team_stat.fga,
            game_team_stat.fg_pct,
            game_team_stat.fg3m,
            game_team_stat.fg3a,
            game_team_stat.fg3_pct,
            game_team_stat.ftm,
            game_team_stat.fta,
            game_team_stat.ft_pct,
            game_team_stat.oreb,
            game_team_stat.dreb,
            game_team_stat.reb,
            game_team_stat.ast,
            game_team_stat.stl,
            game_team_stat.blk,
            game_team_stat.tov,
            game_team_stat.pf,
            game_team_stat.pts,
            game_team_stat.plus_minus,
            game_team_stat.created_at,
            game_team_stat.updated_at,
            game_team_stat.row_id,
            game_team_stat.season_type,
            game_team_stat.season,
            row_number() OVER (PARTITION BY game_team_stat.game_id, game_team_stat.team_id ORDER BY game_team_stat.created_at DESC) AS rn
           FROM game_team_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_team_trck_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_team_trck_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_nickname,
    t.team_abbreviation,
    t.team_city,
    t.min,
    t.dist,
    t.orbc,
    t.drbc,
    t.rbc,
    t.tchs,
    t.sast,
    t.ftast,
    t.pass,
    t.ast,
    t.cfgm,
    t.cfga,
    t.cfg_pct,
    t.ufgm,
    t.ufga,
    t.ufg_pct,
    t.fg_pct,
    t.dfgm,
    t.dfga,
    t.dfg_pct,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_team_trck_stat._unnamed,
            game_team_trck_stat.game_id,
            game_team_trck_stat.team_id,
            game_team_trck_stat.team_nickname,
            game_team_trck_stat.team_abbreviation,
            game_team_trck_stat.team_city,
            game_team_trck_stat.min,
            game_team_trck_stat.dist,
            game_team_trck_stat.orbc,
            game_team_trck_stat.drbc,
            game_team_trck_stat.rbc,
            game_team_trck_stat.tchs,
            game_team_trck_stat.sast,
            game_team_trck_stat.ftast,
            game_team_trck_stat.pass,
            game_team_trck_stat.ast,
            game_team_trck_stat.cfgm,
            game_team_trck_stat.cfga,
            game_team_trck_stat.cfg_pct,
            game_team_trck_stat.ufgm,
            game_team_trck_stat.ufga,
            game_team_trck_stat.ufg_pct,
            game_team_trck_stat.fg_pct,
            game_team_trck_stat.dfgm,
            game_team_trck_stat.dfga,
            game_team_trck_stat.dfg_pct,
            game_team_trck_stat.created_at,
            game_team_trck_stat.updated_at,
            game_team_trck_stat.row_id,
            game_team_trck_stat.season_type,
            game_team_trck_stat.season,
            row_number() OVER (PARTITION BY game_team_trck_stat.game_id, game_team_trck_stat.team_id ORDER BY game_team_trck_stat.created_at DESC) AS rn
           FROM game_team_trck_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_game_team_usage_stat; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_game_team_usage_stat AS
 SELECT t._unnamed,
    t.game_id,
    t.team_id,
    t.team_name,
    t.team_abbreviation,
    t.team_city,
    t.min,
    t.usg_pct,
    t.pct_fgm,
    t.pct_fga,
    t.pct_fg3m,
    t.pct_fg3a,
    t.pct_ftm,
    t.pct_fta,
    t.pct_oreb,
    t.pct_dreb,
    t.pct_reb,
    t.pct_ast,
    t.pct_tov,
    t.pct_stl,
    t.pct_blk,
    t.pct_blka,
    t.pct_pf,
    t.pct_pfd,
    t.pct_pts,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT game_team_usage_stat._unnamed,
            game_team_usage_stat.game_id,
            game_team_usage_stat.team_id,
            game_team_usage_stat.team_name,
            game_team_usage_stat.team_abbreviation,
            game_team_usage_stat.team_city,
            game_team_usage_stat.min,
            game_team_usage_stat.usg_pct,
            game_team_usage_stat.pct_fgm,
            game_team_usage_stat.pct_fga,
            game_team_usage_stat.pct_fg3m,
            game_team_usage_stat.pct_fg3a,
            game_team_usage_stat.pct_ftm,
            game_team_usage_stat.pct_fta,
            game_team_usage_stat.pct_oreb,
            game_team_usage_stat.pct_dreb,
            game_team_usage_stat.pct_reb,
            game_team_usage_stat.pct_ast,
            game_team_usage_stat.pct_tov,
            game_team_usage_stat.pct_stl,
            game_team_usage_stat.pct_blk,
            game_team_usage_stat.pct_blka,
            game_team_usage_stat.pct_pf,
            game_team_usage_stat.pct_pfd,
            game_team_usage_stat.pct_pts,
            game_team_usage_stat.created_at,
            game_team_usage_stat.updated_at,
            game_team_usage_stat.row_id,
            game_team_usage_stat.season_type,
            game_team_usage_stat.season,
            row_number() OVER (PARTITION BY game_team_usage_stat.game_id, game_team_usage_stat.team_id ORDER BY game_team_usage_stat.created_at DESC) AS rn
           FROM game_team_usage_stat) t
  WHERE (t.rn = 1);


--
-- Name: vw_games; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_games AS
 SELECT t._unnamed,
    t.season_id,
    t.team_id,
    t.team_abbreviation,
    t.team_name,
    t.game_id,
    t.game_date,
    t.matchup,
    t.wl,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.stl,
    t.blk,
    t.tov,
    t.pf,
    t.pts,
    t.plus_minus,
    t.video_available,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT games._unnamed,
            games.season_id,
            games.team_id,
            games.team_abbreviation,
            games.team_name,
            games.game_id,
            games.game_date,
            games.matchup,
            games.wl,
            games.min,
            games.fgm,
            games.fga,
            games.fg_pct,
            games.fg3m,
            games.fg3a,
            games.fg3_pct,
            games.ftm,
            games.fta,
            games.ft_pct,
            games.oreb,
            games.dreb,
            games.reb,
            games.ast,
            games.stl,
            games.blk,
            games.tov,
            games.pf,
            games.pts,
            games.plus_minus,
            games.video_available,
            games.season,
            games.created_at,
            games.updated_at,
            games.row_id,
            games.season_type,
            row_number() OVER (PARTITION BY games.game_id, games.team_id ORDER BY games.created_at DESC) AS rn
           FROM games) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_days_rest_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_days_rest_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.fgm,
    t.fga,
    t.fgm_pg,
    t.fga_pg,
    t.fg_pct,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_days_rest_advanced._unnamed,
            player_days_rest_advanced.group_set,
            player_days_rest_advanced.group_value,
            player_days_rest_advanced.gp,
            player_days_rest_advanced.w,
            player_days_rest_advanced.l,
            player_days_rest_advanced.w_pct,
            player_days_rest_advanced.min,
            player_days_rest_advanced.off_rating,
            player_days_rest_advanced.def_rating,
            player_days_rest_advanced.net_rating,
            player_days_rest_advanced.ast_pct,
            player_days_rest_advanced.ast_to,
            player_days_rest_advanced.ast_ratio,
            player_days_rest_advanced.oreb_pct,
            player_days_rest_advanced.dreb_pct,
            player_days_rest_advanced.reb_pct,
            player_days_rest_advanced.tm_tov_pct,
            player_days_rest_advanced.efg_pct,
            player_days_rest_advanced.ts_pct,
            player_days_rest_advanced.usg_pct,
            player_days_rest_advanced.pace,
            player_days_rest_advanced.pie,
            player_days_rest_advanced.fgm,
            player_days_rest_advanced.fga,
            player_days_rest_advanced.fgm_pg,
            player_days_rest_advanced.fga_pg,
            player_days_rest_advanced.fg_pct,
            player_days_rest_advanced.cfid,
            player_days_rest_advanced.cfparams,
            player_days_rest_advanced.playerid,
            player_days_rest_advanced.season,
            player_days_rest_advanced.created_at,
            player_days_rest_advanced.updated_at,
            player_days_rest_advanced.row_id,
            player_days_rest_advanced.season_type,
            row_number() OVER (PARTITION BY player_days_rest_advanced.season, player_days_rest_advanced.season_type, player_days_rest_advanced.playerid, player_days_rest_advanced.group_value ORDER BY player_days_rest_advanced.created_at DESC) AS rn
           FROM player_days_rest_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_days_rest_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_days_rest_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.dd2,
    t.td3,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_days_rest_base._unnamed,
            player_days_rest_base.group_set,
            player_days_rest_base.group_value,
            player_days_rest_base.gp,
            player_days_rest_base.w,
            player_days_rest_base.l,
            player_days_rest_base.w_pct,
            player_days_rest_base.min,
            player_days_rest_base.fgm,
            player_days_rest_base.fga,
            player_days_rest_base.fg_pct,
            player_days_rest_base.fg3m,
            player_days_rest_base.fg3a,
            player_days_rest_base.fg3_pct,
            player_days_rest_base.ftm,
            player_days_rest_base.fta,
            player_days_rest_base.ft_pct,
            player_days_rest_base.oreb,
            player_days_rest_base.dreb,
            player_days_rest_base.reb,
            player_days_rest_base.ast,
            player_days_rest_base.tov,
            player_days_rest_base.stl,
            player_days_rest_base.blk,
            player_days_rest_base.blka,
            player_days_rest_base.pf,
            player_days_rest_base.pfd,
            player_days_rest_base.pts,
            player_days_rest_base.plus_minus,
            player_days_rest_base.dd2,
            player_days_rest_base.td3,
            player_days_rest_base.cfid,
            player_days_rest_base.cfparams,
            player_days_rest_base.playerid,
            player_days_rest_base.season,
            player_days_rest_base.created_at,
            player_days_rest_base.updated_at,
            player_days_rest_base.row_id,
            player_days_rest_base.season_type,
            row_number() OVER (PARTITION BY player_days_rest_base.season, player_days_rest_base.season_type, player_days_rest_base.playerid, player_days_rest_base.group_value ORDER BY player_days_rest_base.created_at DESC) AS rn
           FROM player_days_rest_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_days_rest_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_days_rest_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_days_rest_misc._unnamed,
            player_days_rest_misc.group_set,
            player_days_rest_misc.group_value,
            player_days_rest_misc.gp,
            player_days_rest_misc.w,
            player_days_rest_misc.l,
            player_days_rest_misc.w_pct,
            player_days_rest_misc.min,
            player_days_rest_misc.pts_off_tov,
            player_days_rest_misc.pts_2nd_chance,
            player_days_rest_misc.pts_fb,
            player_days_rest_misc.pts_paint,
            player_days_rest_misc.opp_pts_off_tov,
            player_days_rest_misc.opp_pts_2nd_chance,
            player_days_rest_misc.opp_pts_fb,
            player_days_rest_misc.opp_pts_paint,
            player_days_rest_misc.blk,
            player_days_rest_misc.blka,
            player_days_rest_misc.pf,
            player_days_rest_misc.pfd,
            player_days_rest_misc.cfid,
            player_days_rest_misc.cfparams,
            player_days_rest_misc.playerid,
            player_days_rest_misc.season,
            player_days_rest_misc.created_at,
            player_days_rest_misc.updated_at,
            player_days_rest_misc.row_id,
            player_days_rest_misc.season_type,
            row_number() OVER (PARTITION BY player_days_rest_misc.season, player_days_rest_misc.season_type, player_days_rest_misc.playerid, player_days_rest_misc.group_value ORDER BY player_days_rest_misc.created_at DESC) AS rn
           FROM player_days_rest_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_days_rest_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_days_rest_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_days_rest_scoring._unnamed,
            player_days_rest_scoring.group_set,
            player_days_rest_scoring.group_value,
            player_days_rest_scoring.gp,
            player_days_rest_scoring.w,
            player_days_rest_scoring.l,
            player_days_rest_scoring.w_pct,
            player_days_rest_scoring.min,
            player_days_rest_scoring.pct_fga_2pt,
            player_days_rest_scoring.pct_fga_3pt,
            player_days_rest_scoring.pct_pts_2pt,
            player_days_rest_scoring.pct_pts_2pt_mr,
            player_days_rest_scoring.pct_pts_3pt,
            player_days_rest_scoring.pct_pts_fb,
            player_days_rest_scoring.pct_pts_ft,
            player_days_rest_scoring.pct_pts_off_tov,
            player_days_rest_scoring.pct_pts_paint,
            player_days_rest_scoring.pct_ast_2pm,
            player_days_rest_scoring.pct_uast_2pm,
            player_days_rest_scoring.pct_ast_3pm,
            player_days_rest_scoring.pct_uast_3pm,
            player_days_rest_scoring.pct_ast_fgm,
            player_days_rest_scoring.pct_uast_fgm,
            player_days_rest_scoring.cfid,
            player_days_rest_scoring.cfparams,
            player_days_rest_scoring.playerid,
            player_days_rest_scoring.season,
            player_days_rest_scoring.created_at,
            player_days_rest_scoring.updated_at,
            player_days_rest_scoring.row_id,
            player_days_rest_scoring.season_type,
            row_number() OVER (PARTITION BY player_days_rest_scoring.season, player_days_rest_scoring.season_type, player_days_rest_scoring.playerid, player_days_rest_scoring.group_value ORDER BY player_days_rest_scoring.created_at DESC) AS rn
           FROM player_days_rest_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_days_rest_usage; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_days_rest_usage AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.usg_pct,
    t.pct_fgm,
    t.pct_fga,
    t.pct_fg3m,
    t.pct_fg3a,
    t.pct_ftm,
    t.pct_fta,
    t.pct_oreb,
    t.pct_dreb,
    t.pct_reb,
    t.pct_ast,
    t.pct_tov,
    t.pct_stl,
    t.pct_blk,
    t.pct_blka,
    t.pct_pf,
    t.pct_pfd,
    t.pct_pts,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_days_rest_usage._unnamed,
            player_days_rest_usage.group_set,
            player_days_rest_usage.group_value,
            player_days_rest_usage.gp,
            player_days_rest_usage.w,
            player_days_rest_usage.l,
            player_days_rest_usage.w_pct,
            player_days_rest_usage.min,
            player_days_rest_usage.usg_pct,
            player_days_rest_usage.pct_fgm,
            player_days_rest_usage.pct_fga,
            player_days_rest_usage.pct_fg3m,
            player_days_rest_usage.pct_fg3a,
            player_days_rest_usage.pct_ftm,
            player_days_rest_usage.pct_fta,
            player_days_rest_usage.pct_oreb,
            player_days_rest_usage.pct_dreb,
            player_days_rest_usage.pct_reb,
            player_days_rest_usage.pct_ast,
            player_days_rest_usage.pct_tov,
            player_days_rest_usage.pct_stl,
            player_days_rest_usage.pct_blk,
            player_days_rest_usage.pct_blka,
            player_days_rest_usage.pct_pf,
            player_days_rest_usage.pct_pfd,
            player_days_rest_usage.pct_pts,
            player_days_rest_usage.cfid,
            player_days_rest_usage.cfparams,
            player_days_rest_usage.playerid,
            player_days_rest_usage.season,
            player_days_rest_usage.created_at,
            player_days_rest_usage.updated_at,
            player_days_rest_usage.row_id,
            player_days_rest_usage.season_type,
            row_number() OVER (PARTITION BY player_days_rest_usage.season, player_days_rest_usage.season_type, player_days_rest_usage.playerid, player_days_rest_usage.group_value ORDER BY player_days_rest_usage.created_at DESC) AS rn
           FROM player_days_rest_usage) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_defense; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_defense AS
 SELECT t._unnamed,
    t.close_def_person_id,
    t.gp,
    t.g,
    t.defense_category,
    t.freq,
    t.d_fgm,
    t.d_fga,
    t.d_fg_pct,
    t.normal_fg_pct,
    t.pct_plusminus,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_defense._unnamed,
            player_defense.close_def_person_id,
            player_defense.gp,
            player_defense.g,
            player_defense.defense_category,
            player_defense.freq,
            player_defense.d_fgm,
            player_defense.d_fga,
            player_defense.d_fg_pct,
            player_defense.normal_fg_pct,
            player_defense.pct_plusminus,
            player_defense.playerid,
            player_defense.season,
            player_defense.created_at,
            player_defense.updated_at,
            player_defense.row_id,
            player_defense.season_type,
            row_number() OVER (PARTITION BY player_defense.season, player_defense.season_type, player_defense.close_def_person_id, player_defense.defense_category ORDER BY player_defense.created_at DESC) AS rn
           FROM player_defense) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_game_log; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_game_log AS
 SELECT t._unnamed,
    t.season_id,
    t.player_id,
    t.game_id,
    t.game_date,
    t.matchup,
    t.wl,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.stl,
    t.blk,
    t.tov,
    t.pf,
    t.pts,
    t.plus_minus,
    t.video_available,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_game_log._unnamed,
            player_game_log.season_id,
            player_game_log.player_id,
            player_game_log.game_id,
            player_game_log.game_date,
            player_game_log.matchup,
            player_game_log.wl,
            player_game_log.min,
            player_game_log.fgm,
            player_game_log.fga,
            player_game_log.fg_pct,
            player_game_log.fg3m,
            player_game_log.fg3a,
            player_game_log.fg3_pct,
            player_game_log.ftm,
            player_game_log.fta,
            player_game_log.ft_pct,
            player_game_log.oreb,
            player_game_log.dreb,
            player_game_log.reb,
            player_game_log.ast,
            player_game_log.stl,
            player_game_log.blk,
            player_game_log.tov,
            player_game_log.pf,
            player_game_log.pts,
            player_game_log.plus_minus,
            player_game_log.video_available,
            player_game_log.playerid,
            player_game_log.season,
            player_game_log.created_at,
            player_game_log.updated_at,
            player_game_log.row_id,
            player_game_log.season_type,
            row_number() OVER (PARTITION BY player_game_log.game_id, player_game_log.player_id ORDER BY player_game_log.created_at DESC) AS rn
           FROM player_game_log) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_location_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_location_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.fgm,
    t.fga,
    t.fgm_pg,
    t.fga_pg,
    t.fg_pct,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_location_advanced._unnamed,
            player_location_advanced.group_set,
            player_location_advanced.group_value,
            player_location_advanced.gp,
            player_location_advanced.w,
            player_location_advanced.l,
            player_location_advanced.w_pct,
            player_location_advanced.min,
            player_location_advanced.off_rating,
            player_location_advanced.def_rating,
            player_location_advanced.net_rating,
            player_location_advanced.ast_pct,
            player_location_advanced.ast_to,
            player_location_advanced.ast_ratio,
            player_location_advanced.oreb_pct,
            player_location_advanced.dreb_pct,
            player_location_advanced.reb_pct,
            player_location_advanced.tm_tov_pct,
            player_location_advanced.efg_pct,
            player_location_advanced.ts_pct,
            player_location_advanced.usg_pct,
            player_location_advanced.pace,
            player_location_advanced.pie,
            player_location_advanced.fgm,
            player_location_advanced.fga,
            player_location_advanced.fgm_pg,
            player_location_advanced.fga_pg,
            player_location_advanced.fg_pct,
            player_location_advanced.cfid,
            player_location_advanced.cfparams,
            player_location_advanced.playerid,
            player_location_advanced.season,
            player_location_advanced.created_at,
            player_location_advanced.updated_at,
            player_location_advanced.row_id,
            player_location_advanced.season_type,
            row_number() OVER (PARTITION BY player_location_advanced.season, player_location_advanced.season_type, player_location_advanced.playerid, player_location_advanced.group_value ORDER BY player_location_advanced.created_at DESC) AS rn
           FROM player_location_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_location_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_location_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.dd2,
    t.td3,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_location_base._unnamed,
            player_location_base.group_set,
            player_location_base.group_value,
            player_location_base.gp,
            player_location_base.w,
            player_location_base.l,
            player_location_base.w_pct,
            player_location_base.min,
            player_location_base.fgm,
            player_location_base.fga,
            player_location_base.fg_pct,
            player_location_base.fg3m,
            player_location_base.fg3a,
            player_location_base.fg3_pct,
            player_location_base.ftm,
            player_location_base.fta,
            player_location_base.ft_pct,
            player_location_base.oreb,
            player_location_base.dreb,
            player_location_base.reb,
            player_location_base.ast,
            player_location_base.tov,
            player_location_base.stl,
            player_location_base.blk,
            player_location_base.blka,
            player_location_base.pf,
            player_location_base.pfd,
            player_location_base.pts,
            player_location_base.plus_minus,
            player_location_base.dd2,
            player_location_base.td3,
            player_location_base.cfid,
            player_location_base.cfparams,
            player_location_base.playerid,
            player_location_base.season,
            player_location_base.created_at,
            player_location_base.updated_at,
            player_location_base.row_id,
            player_location_base.season_type,
            row_number() OVER (PARTITION BY player_location_base.season, player_location_base.season_type, player_location_base.playerid, player_location_base.group_value ORDER BY player_location_base.created_at DESC) AS rn
           FROM player_location_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_location_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_location_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_location_misc._unnamed,
            player_location_misc.group_set,
            player_location_misc.group_value,
            player_location_misc.gp,
            player_location_misc.w,
            player_location_misc.l,
            player_location_misc.w_pct,
            player_location_misc.min,
            player_location_misc.pts_off_tov,
            player_location_misc.pts_2nd_chance,
            player_location_misc.pts_fb,
            player_location_misc.pts_paint,
            player_location_misc.opp_pts_off_tov,
            player_location_misc.opp_pts_2nd_chance,
            player_location_misc.opp_pts_fb,
            player_location_misc.opp_pts_paint,
            player_location_misc.blk,
            player_location_misc.blka,
            player_location_misc.pf,
            player_location_misc.pfd,
            player_location_misc.cfid,
            player_location_misc.cfparams,
            player_location_misc.playerid,
            player_location_misc.season,
            player_location_misc.created_at,
            player_location_misc.updated_at,
            player_location_misc.row_id,
            player_location_misc.season_type,
            row_number() OVER (PARTITION BY player_location_misc.season, player_location_misc.season_type, player_location_misc.playerid, player_location_misc.group_value ORDER BY player_location_misc.created_at DESC) AS rn
           FROM player_location_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_location_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_location_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_location_scoring._unnamed,
            player_location_scoring.group_set,
            player_location_scoring.group_value,
            player_location_scoring.gp,
            player_location_scoring.w,
            player_location_scoring.l,
            player_location_scoring.w_pct,
            player_location_scoring.min,
            player_location_scoring.pct_fga_2pt,
            player_location_scoring.pct_fga_3pt,
            player_location_scoring.pct_pts_2pt,
            player_location_scoring.pct_pts_2pt_mr,
            player_location_scoring.pct_pts_3pt,
            player_location_scoring.pct_pts_fb,
            player_location_scoring.pct_pts_ft,
            player_location_scoring.pct_pts_off_tov,
            player_location_scoring.pct_pts_paint,
            player_location_scoring.pct_ast_2pm,
            player_location_scoring.pct_uast_2pm,
            player_location_scoring.pct_ast_3pm,
            player_location_scoring.pct_uast_3pm,
            player_location_scoring.pct_ast_fgm,
            player_location_scoring.pct_uast_fgm,
            player_location_scoring.cfid,
            player_location_scoring.cfparams,
            player_location_scoring.playerid,
            player_location_scoring.season,
            player_location_scoring.created_at,
            player_location_scoring.updated_at,
            player_location_scoring.row_id,
            player_location_scoring.season_type,
            row_number() OVER (PARTITION BY player_location_scoring.season, player_location_scoring.season_type, player_location_scoring.playerid, player_location_scoring.group_value ORDER BY player_location_scoring.created_at DESC) AS rn
           FROM player_location_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_location_usage; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_location_usage AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.usg_pct,
    t.pct_fgm,
    t.pct_fga,
    t.pct_fg3m,
    t.pct_fg3a,
    t.pct_ftm,
    t.pct_fta,
    t.pct_oreb,
    t.pct_dreb,
    t.pct_reb,
    t.pct_ast,
    t.pct_tov,
    t.pct_stl,
    t.pct_blk,
    t.pct_blka,
    t.pct_pf,
    t.pct_pfd,
    t.pct_pts,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_location_usage._unnamed,
            player_location_usage.group_set,
            player_location_usage.group_value,
            player_location_usage.gp,
            player_location_usage.w,
            player_location_usage.l,
            player_location_usage.w_pct,
            player_location_usage.min,
            player_location_usage.usg_pct,
            player_location_usage.pct_fgm,
            player_location_usage.pct_fga,
            player_location_usage.pct_fg3m,
            player_location_usage.pct_fg3a,
            player_location_usage.pct_ftm,
            player_location_usage.pct_fta,
            player_location_usage.pct_oreb,
            player_location_usage.pct_dreb,
            player_location_usage.pct_reb,
            player_location_usage.pct_ast,
            player_location_usage.pct_tov,
            player_location_usage.pct_stl,
            player_location_usage.pct_blk,
            player_location_usage.pct_blka,
            player_location_usage.pct_pf,
            player_location_usage.pct_pfd,
            player_location_usage.pct_pts,
            player_location_usage.cfid,
            player_location_usage.cfparams,
            player_location_usage.playerid,
            player_location_usage.season,
            player_location_usage.created_at,
            player_location_usage.updated_at,
            player_location_usage.row_id,
            player_location_usage.season_type,
            row_number() OVER (PARTITION BY player_location_usage.season, player_location_usage.season_type, player_location_usage.playerid, player_location_usage.group_value ORDER BY player_location_usage.created_at DESC) AS rn
           FROM player_location_usage) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_month_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_month_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.fgm,
    t.fga,
    t.fgm_pg,
    t.fga_pg,
    t.fg_pct,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_month_advanced._unnamed,
            player_month_advanced.group_set,
            player_month_advanced.group_value,
            player_month_advanced.gp,
            player_month_advanced.w,
            player_month_advanced.l,
            player_month_advanced.w_pct,
            player_month_advanced.min,
            player_month_advanced.off_rating,
            player_month_advanced.def_rating,
            player_month_advanced.net_rating,
            player_month_advanced.ast_pct,
            player_month_advanced.ast_to,
            player_month_advanced.ast_ratio,
            player_month_advanced.oreb_pct,
            player_month_advanced.dreb_pct,
            player_month_advanced.reb_pct,
            player_month_advanced.tm_tov_pct,
            player_month_advanced.efg_pct,
            player_month_advanced.ts_pct,
            player_month_advanced.usg_pct,
            player_month_advanced.pace,
            player_month_advanced.pie,
            player_month_advanced.fgm,
            player_month_advanced.fga,
            player_month_advanced.fgm_pg,
            player_month_advanced.fga_pg,
            player_month_advanced.fg_pct,
            player_month_advanced.cfid,
            player_month_advanced.cfparams,
            player_month_advanced.playerid,
            player_month_advanced.season,
            player_month_advanced.created_at,
            player_month_advanced.updated_at,
            player_month_advanced.row_id,
            player_month_advanced.season_type,
            row_number() OVER (PARTITION BY player_month_advanced.season, player_month_advanced.season_type, player_month_advanced.playerid, player_month_advanced.group_value ORDER BY player_month_advanced.created_at DESC) AS rn
           FROM player_month_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_month_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_month_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.dd2,
    t.td3,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_month_base._unnamed,
            player_month_base.group_set,
            player_month_base.group_value,
            player_month_base.gp,
            player_month_base.w,
            player_month_base.l,
            player_month_base.w_pct,
            player_month_base.min,
            player_month_base.fgm,
            player_month_base.fga,
            player_month_base.fg_pct,
            player_month_base.fg3m,
            player_month_base.fg3a,
            player_month_base.fg3_pct,
            player_month_base.ftm,
            player_month_base.fta,
            player_month_base.ft_pct,
            player_month_base.oreb,
            player_month_base.dreb,
            player_month_base.reb,
            player_month_base.ast,
            player_month_base.tov,
            player_month_base.stl,
            player_month_base.blk,
            player_month_base.blka,
            player_month_base.pf,
            player_month_base.pfd,
            player_month_base.pts,
            player_month_base.plus_minus,
            player_month_base.dd2,
            player_month_base.td3,
            player_month_base.cfid,
            player_month_base.cfparams,
            player_month_base.playerid,
            player_month_base.season,
            player_month_base.created_at,
            player_month_base.updated_at,
            player_month_base.row_id,
            player_month_base.season_type,
            row_number() OVER (PARTITION BY player_month_base.season, player_month_base.season_type, player_month_base.playerid, player_month_base.group_value ORDER BY player_month_base.created_at DESC) AS rn
           FROM player_month_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_month_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_month_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_month_misc._unnamed,
            player_month_misc.group_set,
            player_month_misc.group_value,
            player_month_misc.gp,
            player_month_misc.w,
            player_month_misc.l,
            player_month_misc.w_pct,
            player_month_misc.min,
            player_month_misc.pts_off_tov,
            player_month_misc.pts_2nd_chance,
            player_month_misc.pts_fb,
            player_month_misc.pts_paint,
            player_month_misc.opp_pts_off_tov,
            player_month_misc.opp_pts_2nd_chance,
            player_month_misc.opp_pts_fb,
            player_month_misc.opp_pts_paint,
            player_month_misc.blk,
            player_month_misc.blka,
            player_month_misc.pf,
            player_month_misc.pfd,
            player_month_misc.cfid,
            player_month_misc.cfparams,
            player_month_misc.playerid,
            player_month_misc.season,
            player_month_misc.created_at,
            player_month_misc.updated_at,
            player_month_misc.row_id,
            player_month_misc.season_type,
            row_number() OVER (PARTITION BY player_month_misc.season, player_month_misc.season_type, player_month_misc.playerid, player_month_misc.group_value ORDER BY player_month_misc.created_at DESC) AS rn
           FROM player_month_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_month_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_month_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_month_scoring._unnamed,
            player_month_scoring.group_set,
            player_month_scoring.group_value,
            player_month_scoring.gp,
            player_month_scoring.w,
            player_month_scoring.l,
            player_month_scoring.w_pct,
            player_month_scoring.min,
            player_month_scoring.pct_fga_2pt,
            player_month_scoring.pct_fga_3pt,
            player_month_scoring.pct_pts_2pt,
            player_month_scoring.pct_pts_2pt_mr,
            player_month_scoring.pct_pts_3pt,
            player_month_scoring.pct_pts_fb,
            player_month_scoring.pct_pts_ft,
            player_month_scoring.pct_pts_off_tov,
            player_month_scoring.pct_pts_paint,
            player_month_scoring.pct_ast_2pm,
            player_month_scoring.pct_uast_2pm,
            player_month_scoring.pct_ast_3pm,
            player_month_scoring.pct_uast_3pm,
            player_month_scoring.pct_ast_fgm,
            player_month_scoring.pct_uast_fgm,
            player_month_scoring.cfid,
            player_month_scoring.cfparams,
            player_month_scoring.playerid,
            player_month_scoring.season,
            player_month_scoring.created_at,
            player_month_scoring.updated_at,
            player_month_scoring.row_id,
            player_month_scoring.season_type,
            row_number() OVER (PARTITION BY player_month_scoring.season, player_month_scoring.season_type, player_month_scoring.playerid, player_month_scoring.group_value ORDER BY player_month_scoring.created_at DESC) AS rn
           FROM player_month_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_month_usage; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_month_usage AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.usg_pct,
    t.pct_fgm,
    t.pct_fga,
    t.pct_fg3m,
    t.pct_fg3a,
    t.pct_ftm,
    t.pct_fta,
    t.pct_oreb,
    t.pct_dreb,
    t.pct_reb,
    t.pct_ast,
    t.pct_tov,
    t.pct_stl,
    t.pct_blk,
    t.pct_blka,
    t.pct_pf,
    t.pct_pfd,
    t.pct_pts,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_month_usage._unnamed,
            player_month_usage.group_set,
            player_month_usage.group_value,
            player_month_usage.gp,
            player_month_usage.w,
            player_month_usage.l,
            player_month_usage.w_pct,
            player_month_usage.min,
            player_month_usage.usg_pct,
            player_month_usage.pct_fgm,
            player_month_usage.pct_fga,
            player_month_usage.pct_fg3m,
            player_month_usage.pct_fg3a,
            player_month_usage.pct_ftm,
            player_month_usage.pct_fta,
            player_month_usage.pct_oreb,
            player_month_usage.pct_dreb,
            player_month_usage.pct_reb,
            player_month_usage.pct_ast,
            player_month_usage.pct_tov,
            player_month_usage.pct_stl,
            player_month_usage.pct_blk,
            player_month_usage.pct_blka,
            player_month_usage.pct_pf,
            player_month_usage.pct_pfd,
            player_month_usage.pct_pts,
            player_month_usage.cfid,
            player_month_usage.cfparams,
            player_month_usage.playerid,
            player_month_usage.season,
            player_month_usage.created_at,
            player_month_usage.updated_at,
            player_month_usage.row_id,
            player_month_usage.season_type,
            row_number() OVER (PARTITION BY player_month_usage.season, player_month_usage.season_type, player_month_usage.playerid, player_month_usage.group_value ORDER BY player_month_usage.created_at DESC) AS rn
           FROM player_month_usage) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_overall_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_overall_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.fgm,
    t.fga,
    t.fgm_pg,
    t.fga_pg,
    t.fg_pct,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_overall_advanced._unnamed,
            player_overall_advanced.group_set,
            player_overall_advanced.group_value,
            player_overall_advanced.gp,
            player_overall_advanced.w,
            player_overall_advanced.l,
            player_overall_advanced.w_pct,
            player_overall_advanced.min,
            player_overall_advanced.off_rating,
            player_overall_advanced.def_rating,
            player_overall_advanced.net_rating,
            player_overall_advanced.ast_pct,
            player_overall_advanced.ast_to,
            player_overall_advanced.ast_ratio,
            player_overall_advanced.oreb_pct,
            player_overall_advanced.dreb_pct,
            player_overall_advanced.reb_pct,
            player_overall_advanced.tm_tov_pct,
            player_overall_advanced.efg_pct,
            player_overall_advanced.ts_pct,
            player_overall_advanced.usg_pct,
            player_overall_advanced.pace,
            player_overall_advanced.pie,
            player_overall_advanced.fgm,
            player_overall_advanced.fga,
            player_overall_advanced.fgm_pg,
            player_overall_advanced.fga_pg,
            player_overall_advanced.fg_pct,
            player_overall_advanced.cfid,
            player_overall_advanced.cfparams,
            player_overall_advanced.playerid,
            player_overall_advanced.season,
            player_overall_advanced.created_at,
            player_overall_advanced.updated_at,
            player_overall_advanced.row_id,
            player_overall_advanced.season_type,
            row_number() OVER (PARTITION BY player_overall_advanced.season, player_overall_advanced.season_type, player_overall_advanced.playerid ORDER BY player_overall_advanced.created_at DESC) AS rn
           FROM player_overall_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_overall_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_overall_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.dd2,
    t.td3,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_overall_base._unnamed,
            player_overall_base.group_set,
            player_overall_base.group_value,
            player_overall_base.gp,
            player_overall_base.w,
            player_overall_base.l,
            player_overall_base.w_pct,
            player_overall_base.min,
            player_overall_base.fgm,
            player_overall_base.fga,
            player_overall_base.fg_pct,
            player_overall_base.fg3m,
            player_overall_base.fg3a,
            player_overall_base.fg3_pct,
            player_overall_base.ftm,
            player_overall_base.fta,
            player_overall_base.ft_pct,
            player_overall_base.oreb,
            player_overall_base.dreb,
            player_overall_base.reb,
            player_overall_base.ast,
            player_overall_base.tov,
            player_overall_base.stl,
            player_overall_base.blk,
            player_overall_base.blka,
            player_overall_base.pf,
            player_overall_base.pfd,
            player_overall_base.pts,
            player_overall_base.plus_minus,
            player_overall_base.dd2,
            player_overall_base.td3,
            player_overall_base.cfid,
            player_overall_base.cfparams,
            player_overall_base.playerid,
            player_overall_base.season,
            player_overall_base.created_at,
            player_overall_base.updated_at,
            player_overall_base.row_id,
            player_overall_base.season_type,
            row_number() OVER (PARTITION BY player_overall_base.season, player_overall_base.season_type, player_overall_base.playerid ORDER BY player_overall_base.created_at DESC) AS rn
           FROM player_overall_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_overall_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_overall_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_overall_misc._unnamed,
            player_overall_misc.group_set,
            player_overall_misc.group_value,
            player_overall_misc.gp,
            player_overall_misc.w,
            player_overall_misc.l,
            player_overall_misc.w_pct,
            player_overall_misc.min,
            player_overall_misc.pts_off_tov,
            player_overall_misc.pts_2nd_chance,
            player_overall_misc.pts_fb,
            player_overall_misc.pts_paint,
            player_overall_misc.opp_pts_off_tov,
            player_overall_misc.opp_pts_2nd_chance,
            player_overall_misc.opp_pts_fb,
            player_overall_misc.opp_pts_paint,
            player_overall_misc.blk,
            player_overall_misc.blka,
            player_overall_misc.pf,
            player_overall_misc.pfd,
            player_overall_misc.cfid,
            player_overall_misc.cfparams,
            player_overall_misc.playerid,
            player_overall_misc.season,
            player_overall_misc.created_at,
            player_overall_misc.updated_at,
            player_overall_misc.row_id,
            player_overall_misc.season_type,
            row_number() OVER (PARTITION BY player_overall_misc.season, player_overall_misc.season_type, player_overall_misc.playerid ORDER BY player_overall_misc.created_at DESC) AS rn
           FROM player_overall_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_overall_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_overall_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_overall_scoring._unnamed,
            player_overall_scoring.group_set,
            player_overall_scoring.group_value,
            player_overall_scoring.gp,
            player_overall_scoring.w,
            player_overall_scoring.l,
            player_overall_scoring.w_pct,
            player_overall_scoring.min,
            player_overall_scoring.pct_fga_2pt,
            player_overall_scoring.pct_fga_3pt,
            player_overall_scoring.pct_pts_2pt,
            player_overall_scoring.pct_pts_2pt_mr,
            player_overall_scoring.pct_pts_3pt,
            player_overall_scoring.pct_pts_fb,
            player_overall_scoring.pct_pts_ft,
            player_overall_scoring.pct_pts_off_tov,
            player_overall_scoring.pct_pts_paint,
            player_overall_scoring.pct_ast_2pm,
            player_overall_scoring.pct_uast_2pm,
            player_overall_scoring.pct_ast_3pm,
            player_overall_scoring.pct_uast_3pm,
            player_overall_scoring.pct_ast_fgm,
            player_overall_scoring.pct_uast_fgm,
            player_overall_scoring.cfid,
            player_overall_scoring.cfparams,
            player_overall_scoring.playerid,
            player_overall_scoring.season,
            player_overall_scoring.created_at,
            player_overall_scoring.updated_at,
            player_overall_scoring.row_id,
            player_overall_scoring.season_type,
            row_number() OVER (PARTITION BY player_overall_scoring.season, player_overall_scoring.season_type, player_overall_scoring.playerid ORDER BY player_overall_scoring.created_at DESC) AS rn
           FROM player_overall_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_overall_usage; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_overall_usage AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.usg_pct,
    t.pct_fgm,
    t.pct_fga,
    t.pct_fg3m,
    t.pct_fg3a,
    t.pct_ftm,
    t.pct_fta,
    t.pct_oreb,
    t.pct_dreb,
    t.pct_reb,
    t.pct_ast,
    t.pct_tov,
    t.pct_stl,
    t.pct_blk,
    t.pct_blka,
    t.pct_pf,
    t.pct_pfd,
    t.pct_pts,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_overall_usage._unnamed,
            player_overall_usage.group_set,
            player_overall_usage.group_value,
            player_overall_usage.gp,
            player_overall_usage.w,
            player_overall_usage.l,
            player_overall_usage.w_pct,
            player_overall_usage.min,
            player_overall_usage.usg_pct,
            player_overall_usage.pct_fgm,
            player_overall_usage.pct_fga,
            player_overall_usage.pct_fg3m,
            player_overall_usage.pct_fg3a,
            player_overall_usage.pct_ftm,
            player_overall_usage.pct_fta,
            player_overall_usage.pct_oreb,
            player_overall_usage.pct_dreb,
            player_overall_usage.pct_reb,
            player_overall_usage.pct_ast,
            player_overall_usage.pct_tov,
            player_overall_usage.pct_stl,
            player_overall_usage.pct_blk,
            player_overall_usage.pct_blka,
            player_overall_usage.pct_pf,
            player_overall_usage.pct_pfd,
            player_overall_usage.pct_pts,
            player_overall_usage.cfid,
            player_overall_usage.cfparams,
            player_overall_usage.playerid,
            player_overall_usage.season,
            player_overall_usage.created_at,
            player_overall_usage.updated_at,
            player_overall_usage.row_id,
            player_overall_usage.season_type,
            row_number() OVER (PARTITION BY player_overall_usage.season, player_overall_usage.season_type, player_overall_usage.playerid ORDER BY player_overall_usage.created_at DESC) AS rn
           FROM player_overall_usage) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_passes_made; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_passes_made AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.team_name,
    t.team_id,
    t.pass_type,
    t.g,
    t.pass_to,
    t.pass_teammate_player_id,
    t.frequency,
    t.pass,
    t.ast,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_passes_made._unnamed,
            player_passes_made.player_id,
            player_passes_made.player_name_last_first,
            player_passes_made.team_name,
            player_passes_made.team_id,
            player_passes_made.pass_type,
            player_passes_made.g,
            player_passes_made.pass_to,
            player_passes_made.pass_teammate_player_id,
            player_passes_made.frequency,
            player_passes_made.pass,
            player_passes_made.ast,
            player_passes_made.fgm,
            player_passes_made.fga,
            player_passes_made.fg_pct,
            player_passes_made.fg2m,
            player_passes_made.fg2a,
            player_passes_made.fg2_pct,
            player_passes_made.fg3m,
            player_passes_made.fg3a,
            player_passes_made.fg3_pct,
            player_passes_made.playerid,
            player_passes_made.season,
            player_passes_made.created_at,
            player_passes_made.updated_at,
            player_passes_made.row_id,
            player_passes_made.season_type,
            row_number() OVER (PARTITION BY player_passes_made.season, player_passes_made.season_type, player_passes_made.playerid, player_passes_made.pass_teammate_player_id ORDER BY player_passes_made.created_at DESC) AS rn
           FROM player_passes_made) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_passes_rcvd; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_passes_rcvd AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.team_name,
    t.team_id,
    t.pass_type,
    t.g,
    t.pass_from,
    t.pass_teammate_player_id,
    t.frequency,
    t.pass,
    t.ast,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_passes_rcvd._unnamed,
            player_passes_rcvd.player_id,
            player_passes_rcvd.player_name_last_first,
            player_passes_rcvd.team_name,
            player_passes_rcvd.team_id,
            player_passes_rcvd.pass_type,
            player_passes_rcvd.g,
            player_passes_rcvd.pass_from,
            player_passes_rcvd.pass_teammate_player_id,
            player_passes_rcvd.frequency,
            player_passes_rcvd.pass,
            player_passes_rcvd.ast,
            player_passes_rcvd.fgm,
            player_passes_rcvd.fga,
            player_passes_rcvd.fg_pct,
            player_passes_rcvd.fg2m,
            player_passes_rcvd.fg2a,
            player_passes_rcvd.fg2_pct,
            player_passes_rcvd.fg3m,
            player_passes_rcvd.fg3a,
            player_passes_rcvd.fg3_pct,
            player_passes_rcvd.playerid,
            player_passes_rcvd.season,
            player_passes_rcvd.created_at,
            player_passes_rcvd.updated_at,
            player_passes_rcvd.row_id,
            player_passes_rcvd.season_type,
            row_number() OVER (PARTITION BY player_passes_rcvd.season, player_passes_rcvd.season_type, player_passes_rcvd.playerid, player_passes_rcvd.pass_teammate_player_id ORDER BY player_passes_rcvd.created_at DESC) AS rn
           FROM player_passes_rcvd) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_pre_post_allstar_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_pre_post_allstar_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.fgm,
    t.fga,
    t.fgm_pg,
    t.fga_pg,
    t.fg_pct,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_pre_post_allstar_advanced._unnamed,
            player_pre_post_allstar_advanced.group_set,
            player_pre_post_allstar_advanced.group_value,
            player_pre_post_allstar_advanced.gp,
            player_pre_post_allstar_advanced.w,
            player_pre_post_allstar_advanced.l,
            player_pre_post_allstar_advanced.w_pct,
            player_pre_post_allstar_advanced.min,
            player_pre_post_allstar_advanced.off_rating,
            player_pre_post_allstar_advanced.def_rating,
            player_pre_post_allstar_advanced.net_rating,
            player_pre_post_allstar_advanced.ast_pct,
            player_pre_post_allstar_advanced.ast_to,
            player_pre_post_allstar_advanced.ast_ratio,
            player_pre_post_allstar_advanced.oreb_pct,
            player_pre_post_allstar_advanced.dreb_pct,
            player_pre_post_allstar_advanced.reb_pct,
            player_pre_post_allstar_advanced.tm_tov_pct,
            player_pre_post_allstar_advanced.efg_pct,
            player_pre_post_allstar_advanced.ts_pct,
            player_pre_post_allstar_advanced.usg_pct,
            player_pre_post_allstar_advanced.pace,
            player_pre_post_allstar_advanced.pie,
            player_pre_post_allstar_advanced.fgm,
            player_pre_post_allstar_advanced.fga,
            player_pre_post_allstar_advanced.fgm_pg,
            player_pre_post_allstar_advanced.fga_pg,
            player_pre_post_allstar_advanced.fg_pct,
            player_pre_post_allstar_advanced.cfid,
            player_pre_post_allstar_advanced.cfparams,
            player_pre_post_allstar_advanced.playerid,
            player_pre_post_allstar_advanced.season,
            player_pre_post_allstar_advanced.created_at,
            player_pre_post_allstar_advanced.updated_at,
            player_pre_post_allstar_advanced.row_id,
            player_pre_post_allstar_advanced.season_type,
            row_number() OVER (PARTITION BY player_pre_post_allstar_advanced.season, player_pre_post_allstar_advanced.season_type, player_pre_post_allstar_advanced.playerid, player_pre_post_allstar_advanced.group_value ORDER BY player_pre_post_allstar_advanced.created_at DESC) AS rn
           FROM player_pre_post_allstar_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_pre_post_allstar_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_pre_post_allstar_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.dd2,
    t.td3,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_pre_post_allstar_base._unnamed,
            player_pre_post_allstar_base.group_set,
            player_pre_post_allstar_base.group_value,
            player_pre_post_allstar_base.gp,
            player_pre_post_allstar_base.w,
            player_pre_post_allstar_base.l,
            player_pre_post_allstar_base.w_pct,
            player_pre_post_allstar_base.min,
            player_pre_post_allstar_base.fgm,
            player_pre_post_allstar_base.fga,
            player_pre_post_allstar_base.fg_pct,
            player_pre_post_allstar_base.fg3m,
            player_pre_post_allstar_base.fg3a,
            player_pre_post_allstar_base.fg3_pct,
            player_pre_post_allstar_base.ftm,
            player_pre_post_allstar_base.fta,
            player_pre_post_allstar_base.ft_pct,
            player_pre_post_allstar_base.oreb,
            player_pre_post_allstar_base.dreb,
            player_pre_post_allstar_base.reb,
            player_pre_post_allstar_base.ast,
            player_pre_post_allstar_base.tov,
            player_pre_post_allstar_base.stl,
            player_pre_post_allstar_base.blk,
            player_pre_post_allstar_base.blka,
            player_pre_post_allstar_base.pf,
            player_pre_post_allstar_base.pfd,
            player_pre_post_allstar_base.pts,
            player_pre_post_allstar_base.plus_minus,
            player_pre_post_allstar_base.dd2,
            player_pre_post_allstar_base.td3,
            player_pre_post_allstar_base.cfid,
            player_pre_post_allstar_base.cfparams,
            player_pre_post_allstar_base.playerid,
            player_pre_post_allstar_base.season,
            player_pre_post_allstar_base.created_at,
            player_pre_post_allstar_base.updated_at,
            player_pre_post_allstar_base.row_id,
            player_pre_post_allstar_base.season_type,
            row_number() OVER (PARTITION BY player_pre_post_allstar_base.season, player_pre_post_allstar_base.playerid, player_pre_post_allstar_base.season_type, player_pre_post_allstar_base.group_value ORDER BY player_pre_post_allstar_base.created_at DESC) AS rn
           FROM player_pre_post_allstar_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_pre_post_allstar_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_pre_post_allstar_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_pre_post_allstar_misc._unnamed,
            player_pre_post_allstar_misc.group_set,
            player_pre_post_allstar_misc.group_value,
            player_pre_post_allstar_misc.gp,
            player_pre_post_allstar_misc.w,
            player_pre_post_allstar_misc.l,
            player_pre_post_allstar_misc.w_pct,
            player_pre_post_allstar_misc.min,
            player_pre_post_allstar_misc.pts_off_tov,
            player_pre_post_allstar_misc.pts_2nd_chance,
            player_pre_post_allstar_misc.pts_fb,
            player_pre_post_allstar_misc.pts_paint,
            player_pre_post_allstar_misc.opp_pts_off_tov,
            player_pre_post_allstar_misc.opp_pts_2nd_chance,
            player_pre_post_allstar_misc.opp_pts_fb,
            player_pre_post_allstar_misc.opp_pts_paint,
            player_pre_post_allstar_misc.blk,
            player_pre_post_allstar_misc.blka,
            player_pre_post_allstar_misc.pf,
            player_pre_post_allstar_misc.pfd,
            player_pre_post_allstar_misc.cfid,
            player_pre_post_allstar_misc.cfparams,
            player_pre_post_allstar_misc.playerid,
            player_pre_post_allstar_misc.season,
            player_pre_post_allstar_misc.created_at,
            player_pre_post_allstar_misc.updated_at,
            player_pre_post_allstar_misc.row_id,
            player_pre_post_allstar_misc.season_type,
            row_number() OVER (PARTITION BY player_pre_post_allstar_misc.season, player_pre_post_allstar_misc.playerid, player_pre_post_allstar_misc.season_type, player_pre_post_allstar_misc.group_value ORDER BY player_pre_post_allstar_misc.created_at DESC) AS rn
           FROM player_pre_post_allstar_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_pre_post_allstar_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_pre_post_allstar_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_pre_post_allstar_scoring._unnamed,
            player_pre_post_allstar_scoring.group_set,
            player_pre_post_allstar_scoring.group_value,
            player_pre_post_allstar_scoring.gp,
            player_pre_post_allstar_scoring.w,
            player_pre_post_allstar_scoring.l,
            player_pre_post_allstar_scoring.w_pct,
            player_pre_post_allstar_scoring.min,
            player_pre_post_allstar_scoring.pct_fga_2pt,
            player_pre_post_allstar_scoring.pct_fga_3pt,
            player_pre_post_allstar_scoring.pct_pts_2pt,
            player_pre_post_allstar_scoring.pct_pts_2pt_mr,
            player_pre_post_allstar_scoring.pct_pts_3pt,
            player_pre_post_allstar_scoring.pct_pts_fb,
            player_pre_post_allstar_scoring.pct_pts_ft,
            player_pre_post_allstar_scoring.pct_pts_off_tov,
            player_pre_post_allstar_scoring.pct_pts_paint,
            player_pre_post_allstar_scoring.pct_ast_2pm,
            player_pre_post_allstar_scoring.pct_uast_2pm,
            player_pre_post_allstar_scoring.pct_ast_3pm,
            player_pre_post_allstar_scoring.pct_uast_3pm,
            player_pre_post_allstar_scoring.pct_ast_fgm,
            player_pre_post_allstar_scoring.pct_uast_fgm,
            player_pre_post_allstar_scoring.cfid,
            player_pre_post_allstar_scoring.cfparams,
            player_pre_post_allstar_scoring.playerid,
            player_pre_post_allstar_scoring.season,
            player_pre_post_allstar_scoring.created_at,
            player_pre_post_allstar_scoring.updated_at,
            player_pre_post_allstar_scoring.row_id,
            player_pre_post_allstar_scoring.season_type,
            row_number() OVER (PARTITION BY player_pre_post_allstar_scoring.season, player_pre_post_allstar_scoring.playerid, player_pre_post_allstar_scoring.season_type, player_pre_post_allstar_scoring.group_value ORDER BY player_pre_post_allstar_scoring.created_at DESC) AS rn
           FROM player_pre_post_allstar_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_pre_post_allstar_usage; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_pre_post_allstar_usage AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.usg_pct,
    t.pct_fgm,
    t.pct_fga,
    t.pct_fg3m,
    t.pct_fg3a,
    t.pct_ftm,
    t.pct_fta,
    t.pct_oreb,
    t.pct_dreb,
    t.pct_reb,
    t.pct_ast,
    t.pct_tov,
    t.pct_stl,
    t.pct_blk,
    t.pct_blka,
    t.pct_pf,
    t.pct_pfd,
    t.pct_pts,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_pre_post_allstar_usage._unnamed,
            player_pre_post_allstar_usage.group_set,
            player_pre_post_allstar_usage.group_value,
            player_pre_post_allstar_usage.gp,
            player_pre_post_allstar_usage.w,
            player_pre_post_allstar_usage.l,
            player_pre_post_allstar_usage.w_pct,
            player_pre_post_allstar_usage.min,
            player_pre_post_allstar_usage.usg_pct,
            player_pre_post_allstar_usage.pct_fgm,
            player_pre_post_allstar_usage.pct_fga,
            player_pre_post_allstar_usage.pct_fg3m,
            player_pre_post_allstar_usage.pct_fg3a,
            player_pre_post_allstar_usage.pct_ftm,
            player_pre_post_allstar_usage.pct_fta,
            player_pre_post_allstar_usage.pct_oreb,
            player_pre_post_allstar_usage.pct_dreb,
            player_pre_post_allstar_usage.pct_reb,
            player_pre_post_allstar_usage.pct_ast,
            player_pre_post_allstar_usage.pct_tov,
            player_pre_post_allstar_usage.pct_stl,
            player_pre_post_allstar_usage.pct_blk,
            player_pre_post_allstar_usage.pct_blka,
            player_pre_post_allstar_usage.pct_pf,
            player_pre_post_allstar_usage.pct_pfd,
            player_pre_post_allstar_usage.pct_pts,
            player_pre_post_allstar_usage.cfid,
            player_pre_post_allstar_usage.cfparams,
            player_pre_post_allstar_usage.playerid,
            player_pre_post_allstar_usage.season,
            player_pre_post_allstar_usage.created_at,
            player_pre_post_allstar_usage.updated_at,
            player_pre_post_allstar_usage.row_id,
            player_pre_post_allstar_usage.season_type,
            row_number() OVER (PARTITION BY player_pre_post_allstar_usage.season, player_pre_post_allstar_usage.playerid, player_pre_post_allstar_usage.season_type, player_pre_post_allstar_usage.group_value ORDER BY player_pre_post_allstar_usage.created_at DESC) AS rn
           FROM player_pre_post_allstar_usage) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_reb_log_num_contested; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_reb_log_num_contested AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.g,
    t.reb_num_contesting_range,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_reb_log_num_contested._unnamed,
            player_reb_log_num_contested.player_id,
            player_reb_log_num_contested.player_name_last_first,
            player_reb_log_num_contested.sort_order,
            player_reb_log_num_contested.g,
            player_reb_log_num_contested.reb_num_contesting_range,
            player_reb_log_num_contested.reb_frequency,
            player_reb_log_num_contested.oreb,
            player_reb_log_num_contested.dreb,
            player_reb_log_num_contested.reb,
            player_reb_log_num_contested.c_oreb,
            player_reb_log_num_contested.c_dreb,
            player_reb_log_num_contested.c_reb,
            player_reb_log_num_contested.c_reb_pct,
            player_reb_log_num_contested.uc_oreb,
            player_reb_log_num_contested.uc_dreb,
            player_reb_log_num_contested.uc_reb,
            player_reb_log_num_contested.uc_reb_pct,
            player_reb_log_num_contested.playerid,
            player_reb_log_num_contested.season,
            player_reb_log_num_contested.created_at,
            player_reb_log_num_contested.updated_at,
            player_reb_log_num_contested.row_id,
            player_reb_log_num_contested.season_type,
            row_number() OVER (PARTITION BY player_reb_log_num_contested.season, player_reb_log_num_contested.season_type, player_reb_log_num_contested.playerid, player_reb_log_num_contested.reb_num_contesting_range ORDER BY player_reb_log_num_contested.created_at DESC) AS rn
           FROM player_reb_log_num_contested) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_reb_log_overall; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_reb_log_overall AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.g,
    t.overall,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_reb_log_overall._unnamed,
            player_reb_log_overall.player_id,
            player_reb_log_overall.player_name_last_first,
            player_reb_log_overall.g,
            player_reb_log_overall.overall,
            player_reb_log_overall.reb_frequency,
            player_reb_log_overall.oreb,
            player_reb_log_overall.dreb,
            player_reb_log_overall.reb,
            player_reb_log_overall.c_oreb,
            player_reb_log_overall.c_dreb,
            player_reb_log_overall.c_reb,
            player_reb_log_overall.c_reb_pct,
            player_reb_log_overall.uc_oreb,
            player_reb_log_overall.uc_dreb,
            player_reb_log_overall.uc_reb,
            player_reb_log_overall.uc_reb_pct,
            player_reb_log_overall.playerid,
            player_reb_log_overall.season,
            player_reb_log_overall.created_at,
            player_reb_log_overall.updated_at,
            player_reb_log_overall.row_id,
            player_reb_log_overall.season_type,
            row_number() OVER (PARTITION BY player_reb_log_overall.season, player_reb_log_overall.season_type, player_reb_log_overall.playerid ORDER BY player_reb_log_overall.created_at DESC) AS rn
           FROM player_reb_log_overall) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_reb_log_reb_dist; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_reb_log_reb_dist AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.g,
    t.reb_dist_range,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_reb_log_reb_dist._unnamed,
            player_reb_log_reb_dist.player_id,
            player_reb_log_reb_dist.player_name_last_first,
            player_reb_log_reb_dist.sort_order,
            player_reb_log_reb_dist.g,
            player_reb_log_reb_dist.reb_dist_range,
            player_reb_log_reb_dist.reb_frequency,
            player_reb_log_reb_dist.oreb,
            player_reb_log_reb_dist.dreb,
            player_reb_log_reb_dist.reb,
            player_reb_log_reb_dist.c_oreb,
            player_reb_log_reb_dist.c_dreb,
            player_reb_log_reb_dist.c_reb,
            player_reb_log_reb_dist.c_reb_pct,
            player_reb_log_reb_dist.uc_oreb,
            player_reb_log_reb_dist.uc_dreb,
            player_reb_log_reb_dist.uc_reb,
            player_reb_log_reb_dist.uc_reb_pct,
            player_reb_log_reb_dist.playerid,
            player_reb_log_reb_dist.season,
            player_reb_log_reb_dist.created_at,
            player_reb_log_reb_dist.updated_at,
            player_reb_log_reb_dist.row_id,
            player_reb_log_reb_dist.season_type,
            row_number() OVER (PARTITION BY player_reb_log_reb_dist.season, player_reb_log_reb_dist.season_type, player_reb_log_reb_dist.playerid, player_reb_log_reb_dist.reb_dist_range ORDER BY player_reb_log_reb_dist.created_at DESC) AS rn
           FROM player_reb_log_reb_dist) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_reb_log_shot_dist; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_reb_log_shot_dist AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.g,
    t.shot_dist_range,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_reb_log_shot_dist._unnamed,
            player_reb_log_shot_dist.player_id,
            player_reb_log_shot_dist.player_name_last_first,
            player_reb_log_shot_dist.sort_order,
            player_reb_log_shot_dist.g,
            player_reb_log_shot_dist.shot_dist_range,
            player_reb_log_shot_dist.reb_frequency,
            player_reb_log_shot_dist.oreb,
            player_reb_log_shot_dist.dreb,
            player_reb_log_shot_dist.reb,
            player_reb_log_shot_dist.c_oreb,
            player_reb_log_shot_dist.c_dreb,
            player_reb_log_shot_dist.c_reb,
            player_reb_log_shot_dist.c_reb_pct,
            player_reb_log_shot_dist.uc_oreb,
            player_reb_log_shot_dist.uc_dreb,
            player_reb_log_shot_dist.uc_reb,
            player_reb_log_shot_dist.uc_reb_pct,
            player_reb_log_shot_dist.playerid,
            player_reb_log_shot_dist.season,
            player_reb_log_shot_dist.created_at,
            player_reb_log_shot_dist.updated_at,
            player_reb_log_shot_dist.row_id,
            player_reb_log_shot_dist.season_type,
            row_number() OVER (PARTITION BY player_reb_log_shot_dist.season, player_reb_log_shot_dist.season_type, player_reb_log_shot_dist.playerid, player_reb_log_shot_dist.shot_dist_range ORDER BY player_reb_log_shot_dist.created_at DESC) AS rn
           FROM player_reb_log_shot_dist) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_reb_log_shot_type; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_reb_log_shot_type AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.g,
    t.shot_type_range,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_reb_log_shot_type._unnamed,
            player_reb_log_shot_type.player_id,
            player_reb_log_shot_type.player_name_last_first,
            player_reb_log_shot_type.sort_order,
            player_reb_log_shot_type.g,
            player_reb_log_shot_type.shot_type_range,
            player_reb_log_shot_type.reb_frequency,
            player_reb_log_shot_type.oreb,
            player_reb_log_shot_type.dreb,
            player_reb_log_shot_type.reb,
            player_reb_log_shot_type.c_oreb,
            player_reb_log_shot_type.c_dreb,
            player_reb_log_shot_type.c_reb,
            player_reb_log_shot_type.c_reb_pct,
            player_reb_log_shot_type.uc_oreb,
            player_reb_log_shot_type.uc_dreb,
            player_reb_log_shot_type.uc_reb,
            player_reb_log_shot_type.uc_reb_pct,
            player_reb_log_shot_type.playerid,
            player_reb_log_shot_type.season,
            player_reb_log_shot_type.created_at,
            player_reb_log_shot_type.updated_at,
            player_reb_log_shot_type.row_id,
            player_reb_log_shot_type.season_type,
            row_number() OVER (PARTITION BY player_reb_log_shot_type.season, player_reb_log_shot_type.season_type, player_reb_log_shot_type.playerid, player_reb_log_shot_type.shot_type_range ORDER BY player_reb_log_shot_type.created_at DESC) AS rn
           FROM player_reb_log_shot_type) t
  WHERE (t.rn = 1);


--
-- Name: vw_players; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_players AS
 SELECT t._unnamed,
    t.teamid,
    t.season,
    t.leagueid,
    t.player,
    t.num,
    t."position",
    t.height,
    t.weight,
    t.birth_date,
    t.age,
    t.exp,
    t.school,
    t.player_id,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.rn,
    t.l_season
   FROM ( SELECT players._unnamed,
            players.teamid,
            players.season,
            players.leagueid,
            players.player,
            players.num,
            players."position",
            players.height,
            players.weight,
            players.birth_date,
            players.age,
            players.exp,
            players.school,
            players.player_id,
            players.created_at,
            players.updated_at,
            players.row_id,
            players.l_season,
            row_number() OVER (PARTITION BY players.season, players.teamid, players.player_id ORDER BY players.created_at DESC) AS rn
           FROM players) t
  WHERE (t.rn = 1);


--
-- Name: vw_teams; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_teams AS
 SELECT t.team_id,
    t.team_name,
    t.team_abbrv_short,
    t.team_key,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.team_abbrv,
    t.rn
   FROM ( SELECT teams.team_id,
            teams.team_name,
            teams.team_abbrv_short,
            teams.team_key,
            teams.created_at,
            teams.updated_at,
            teams.row_id,
            teams.team_abbrv,
            row_number() OVER (PARTITION BY teams.team_id ORDER BY teams.created_at DESC) AS rn
           FROM teams) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_schedule; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_schedule AS
 SELECT p.player,
    p.player_id,
    p.age,
    'Home'::text AS loc,
    t.team_id,
    t.team_abbrv AS team,
    ta.team_id AS opponent_team_id,
    ta.team_abbrv AS opponent,
    s.game_date,
    s.season
   FROM (((game_schedule s
     JOIN vw_teams t ON ((s.home_team_id = t.team_id)))
     JOIN vw_teams ta ON ((s.away_team_id = ta.team_id)))
     JOIN vw_players p ON ((t.team_id = p.teamid)))
  WHERE (p.season = (split_part((s.season)::text, '-'::text, 1))::bigint)
UNION
 SELECT p.player,
    p.player_id,
    p.age,
    'Road'::text AS loc,
    t.team_id,
    t.team_abbrv AS team,
    th.team_id AS opponent_team_id,
    th.team_abbrv AS opponent,
    s.game_date,
    s.season
   FROM (((game_schedule s
     JOIN vw_teams t ON ((s.away_team_id = t.team_id)))
     JOIN vw_teams th ON ((s.home_team_id = th.team_id)))
     JOIN vw_players p ON ((t.team_id = p.teamid)))
  WHERE (p.season = (split_part((s.season)::text, '-'::text, 1))::bigint);


--
-- Name: vw_player_shot_log_closest_def; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_shot_log_closest_def AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.gp,
    t.g,
    t.close_def_dist_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_shot_log_closest_def._unnamed,
            player_shot_log_closest_def.player_id,
            player_shot_log_closest_def.player_name_last_first,
            player_shot_log_closest_def.sort_order,
            player_shot_log_closest_def.gp,
            player_shot_log_closest_def.g,
            player_shot_log_closest_def.close_def_dist_range,
            player_shot_log_closest_def.fga_frequency,
            player_shot_log_closest_def.fgm,
            player_shot_log_closest_def.fga,
            player_shot_log_closest_def.fg_pct,
            player_shot_log_closest_def.efg_pct,
            player_shot_log_closest_def.fg2a_frequency,
            player_shot_log_closest_def.fg2m,
            player_shot_log_closest_def.fg2a,
            player_shot_log_closest_def.fg2_pct,
            player_shot_log_closest_def.fg3a_frequency,
            player_shot_log_closest_def.fg3m,
            player_shot_log_closest_def.fg3a,
            player_shot_log_closest_def.fg3_pct,
            player_shot_log_closest_def.playerid,
            player_shot_log_closest_def.season,
            player_shot_log_closest_def.created_at,
            player_shot_log_closest_def.updated_at,
            player_shot_log_closest_def.row_id,
            player_shot_log_closest_def.season_type,
            row_number() OVER (PARTITION BY player_shot_log_closest_def.season, player_shot_log_closest_def.season_type, player_shot_log_closest_def.player_id, player_shot_log_closest_def.close_def_dist_range ORDER BY player_shot_log_closest_def.created_at DESC) AS rn
           FROM player_shot_log_closest_def) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_shot_log_dribble; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_shot_log_dribble AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.gp,
    t.g,
    t.dribble_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_shot_log_dribble._unnamed,
            player_shot_log_dribble.player_id,
            player_shot_log_dribble.player_name_last_first,
            player_shot_log_dribble.sort_order,
            player_shot_log_dribble.gp,
            player_shot_log_dribble.g,
            player_shot_log_dribble.dribble_range,
            player_shot_log_dribble.fga_frequency,
            player_shot_log_dribble.fgm,
            player_shot_log_dribble.fga,
            player_shot_log_dribble.fg_pct,
            player_shot_log_dribble.efg_pct,
            player_shot_log_dribble.fg2a_frequency,
            player_shot_log_dribble.fg2m,
            player_shot_log_dribble.fg2a,
            player_shot_log_dribble.fg2_pct,
            player_shot_log_dribble.fg3a_frequency,
            player_shot_log_dribble.fg3m,
            player_shot_log_dribble.fg3a,
            player_shot_log_dribble.fg3_pct,
            player_shot_log_dribble.playerid,
            player_shot_log_dribble.season,
            player_shot_log_dribble.created_at,
            player_shot_log_dribble.updated_at,
            player_shot_log_dribble.row_id,
            player_shot_log_dribble.season_type,
            row_number() OVER (PARTITION BY player_shot_log_dribble.season, player_shot_log_dribble.season_type, player_shot_log_dribble.player_id, player_shot_log_dribble.dribble_range ORDER BY player_shot_log_dribble.created_at DESC) AS rn
           FROM player_shot_log_dribble) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_shot_log_general; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_shot_log_general AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.gp,
    t.g,
    t.shot_type,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_shot_log_general._unnamed,
            player_shot_log_general.player_id,
            player_shot_log_general.player_name_last_first,
            player_shot_log_general.sort_order,
            player_shot_log_general.gp,
            player_shot_log_general.g,
            player_shot_log_general.shot_type,
            player_shot_log_general.fga_frequency,
            player_shot_log_general.fgm,
            player_shot_log_general.fga,
            player_shot_log_general.fg_pct,
            player_shot_log_general.efg_pct,
            player_shot_log_general.fg2a_frequency,
            player_shot_log_general.fg2m,
            player_shot_log_general.fg2a,
            player_shot_log_general.fg2_pct,
            player_shot_log_general.fg3a_frequency,
            player_shot_log_general.fg3m,
            player_shot_log_general.fg3a,
            player_shot_log_general.fg3_pct,
            player_shot_log_general.playerid,
            player_shot_log_general.season,
            player_shot_log_general.created_at,
            player_shot_log_general.updated_at,
            player_shot_log_general.row_id,
            player_shot_log_general.season_type,
            row_number() OVER (PARTITION BY player_shot_log_general.season, player_shot_log_general.season_type, player_shot_log_general.player_id, player_shot_log_general.shot_type ORDER BY player_shot_log_general.created_at DESC) AS rn
           FROM player_shot_log_general) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_shot_log_overall; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_shot_log_overall AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.gp,
    t.g,
    t.shot_type,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_shot_log_overall._unnamed,
            player_shot_log_overall.player_id,
            player_shot_log_overall.player_name_last_first,
            player_shot_log_overall.sort_order,
            player_shot_log_overall.gp,
            player_shot_log_overall.g,
            player_shot_log_overall.shot_type,
            player_shot_log_overall.fga_frequency,
            player_shot_log_overall.fgm,
            player_shot_log_overall.fga,
            player_shot_log_overall.fg_pct,
            player_shot_log_overall.efg_pct,
            player_shot_log_overall.fg2a_frequency,
            player_shot_log_overall.fg2m,
            player_shot_log_overall.fg2a,
            player_shot_log_overall.fg2_pct,
            player_shot_log_overall.fg3a_frequency,
            player_shot_log_overall.fg3m,
            player_shot_log_overall.fg3a,
            player_shot_log_overall.fg3_pct,
            player_shot_log_overall.playerid,
            player_shot_log_overall.season,
            player_shot_log_overall.created_at,
            player_shot_log_overall.updated_at,
            player_shot_log_overall.row_id,
            player_shot_log_overall.season_type,
            row_number() OVER (PARTITION BY player_shot_log_overall.season, player_shot_log_overall.season_type, player_shot_log_overall.player_id ORDER BY player_shot_log_overall.created_at DESC) AS rn
           FROM player_shot_log_overall) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_shot_log_shot_clock; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_shot_log_shot_clock AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.gp,
    t.g,
    t.shot_clock_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_shot_log_shot_clock._unnamed,
            player_shot_log_shot_clock.player_id,
            player_shot_log_shot_clock.player_name_last_first,
            player_shot_log_shot_clock.sort_order,
            player_shot_log_shot_clock.gp,
            player_shot_log_shot_clock.g,
            player_shot_log_shot_clock.shot_clock_range,
            player_shot_log_shot_clock.fga_frequency,
            player_shot_log_shot_clock.fgm,
            player_shot_log_shot_clock.fga,
            player_shot_log_shot_clock.fg_pct,
            player_shot_log_shot_clock.efg_pct,
            player_shot_log_shot_clock.fg2a_frequency,
            player_shot_log_shot_clock.fg2m,
            player_shot_log_shot_clock.fg2a,
            player_shot_log_shot_clock.fg2_pct,
            player_shot_log_shot_clock.fg3a_frequency,
            player_shot_log_shot_clock.fg3m,
            player_shot_log_shot_clock.fg3a,
            player_shot_log_shot_clock.fg3_pct,
            player_shot_log_shot_clock.playerid,
            player_shot_log_shot_clock.season,
            player_shot_log_shot_clock.created_at,
            player_shot_log_shot_clock.updated_at,
            player_shot_log_shot_clock.row_id,
            player_shot_log_shot_clock.season_type,
            row_number() OVER (PARTITION BY player_shot_log_shot_clock.season, player_shot_log_shot_clock.season_type, player_shot_log_shot_clock.player_id, player_shot_log_shot_clock.shot_clock_range ORDER BY player_shot_log_shot_clock.created_at DESC) AS rn
           FROM player_shot_log_shot_clock) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_shot_log_touch_time; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_shot_log_touch_time AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.gp,
    t.g,
    t.touch_time_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.playerid,
    t.season,
    t.season_type,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.rn
   FROM ( SELECT player_shot_log_touch_time._unnamed,
            player_shot_log_touch_time.player_id,
            player_shot_log_touch_time.player_name_last_first,
            player_shot_log_touch_time.sort_order,
            player_shot_log_touch_time.gp,
            player_shot_log_touch_time.g,
            player_shot_log_touch_time.touch_time_range,
            player_shot_log_touch_time.fga_frequency,
            player_shot_log_touch_time.fgm,
            player_shot_log_touch_time.fga,
            player_shot_log_touch_time.fg_pct,
            player_shot_log_touch_time.efg_pct,
            player_shot_log_touch_time.fg2a_frequency,
            player_shot_log_touch_time.fg2m,
            player_shot_log_touch_time.fg2a,
            player_shot_log_touch_time.fg2_pct,
            player_shot_log_touch_time.fg3a_frequency,
            player_shot_log_touch_time.fg3m,
            player_shot_log_touch_time.fg3a,
            player_shot_log_touch_time.fg3_pct,
            player_shot_log_touch_time.playerid,
            player_shot_log_touch_time.season,
            player_shot_log_touch_time.season_type,
            player_shot_log_touch_time.created_at,
            player_shot_log_touch_time.updated_at,
            player_shot_log_touch_time.row_id,
            row_number() OVER (PARTITION BY player_shot_log_touch_time.season, player_shot_log_touch_time.season_type, player_shot_log_touch_time.player_id, player_shot_log_touch_time.touch_time_range ORDER BY player_shot_log_touch_time.created_at DESC) AS rn
           FROM player_shot_log_touch_time) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_shot_trck_closest_def_10ft_plus; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_shot_trck_closest_def_10ft_plus AS
 SELECT t._unnamed,
    t.player_id,
    t.player_name_last_first,
    t.sort_order,
    t.gp,
    t.g,
    t.close_def_dist_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_shot_trck_closest_def_10ft_plus._unnamed,
            player_shot_trck_closest_def_10ft_plus.player_id,
            player_shot_trck_closest_def_10ft_plus.player_name_last_first,
            player_shot_trck_closest_def_10ft_plus.sort_order,
            player_shot_trck_closest_def_10ft_plus.gp,
            player_shot_trck_closest_def_10ft_plus.g,
            player_shot_trck_closest_def_10ft_plus.close_def_dist_range,
            player_shot_trck_closest_def_10ft_plus.fga_frequency,
            player_shot_trck_closest_def_10ft_plus.fgm,
            player_shot_trck_closest_def_10ft_plus.fga,
            player_shot_trck_closest_def_10ft_plus.fg_pct,
            player_shot_trck_closest_def_10ft_plus.efg_pct,
            player_shot_trck_closest_def_10ft_plus.fg2a_frequency,
            player_shot_trck_closest_def_10ft_plus.fg2m,
            player_shot_trck_closest_def_10ft_plus.fg2a,
            player_shot_trck_closest_def_10ft_plus.fg2_pct,
            player_shot_trck_closest_def_10ft_plus.fg3a_frequency,
            player_shot_trck_closest_def_10ft_plus.fg3m,
            player_shot_trck_closest_def_10ft_plus.fg3a,
            player_shot_trck_closest_def_10ft_plus.fg3_pct,
            player_shot_trck_closest_def_10ft_plus.playerid,
            player_shot_trck_closest_def_10ft_plus.season,
            player_shot_trck_closest_def_10ft_plus.created_at,
            player_shot_trck_closest_def_10ft_plus.updated_at,
            player_shot_trck_closest_def_10ft_plus.row_id,
            player_shot_trck_closest_def_10ft_plus.season_type,
            row_number() OVER (PARTITION BY player_shot_trck_closest_def_10ft_plus.season, player_shot_trck_closest_def_10ft_plus.season_type, player_shot_trck_closest_def_10ft_plus.player_id, player_shot_trck_closest_def_10ft_plus.close_def_dist_range ORDER BY player_shot_trck_closest_def_10ft_plus.created_at DESC) AS rn
           FROM player_shot_trck_closest_def_10ft_plus) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_win_lose_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_win_lose_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.fgm,
    t.fga,
    t.fgm_pg,
    t.fga_pg,
    t.fg_pct,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_win_lose_advanced._unnamed,
            player_win_lose_advanced.group_set,
            player_win_lose_advanced.group_value,
            player_win_lose_advanced.gp,
            player_win_lose_advanced.w,
            player_win_lose_advanced.l,
            player_win_lose_advanced.w_pct,
            player_win_lose_advanced.min,
            player_win_lose_advanced.off_rating,
            player_win_lose_advanced.def_rating,
            player_win_lose_advanced.net_rating,
            player_win_lose_advanced.ast_pct,
            player_win_lose_advanced.ast_to,
            player_win_lose_advanced.ast_ratio,
            player_win_lose_advanced.oreb_pct,
            player_win_lose_advanced.dreb_pct,
            player_win_lose_advanced.reb_pct,
            player_win_lose_advanced.tm_tov_pct,
            player_win_lose_advanced.efg_pct,
            player_win_lose_advanced.ts_pct,
            player_win_lose_advanced.usg_pct,
            player_win_lose_advanced.pace,
            player_win_lose_advanced.pie,
            player_win_lose_advanced.fgm,
            player_win_lose_advanced.fga,
            player_win_lose_advanced.fgm_pg,
            player_win_lose_advanced.fga_pg,
            player_win_lose_advanced.fg_pct,
            player_win_lose_advanced.cfid,
            player_win_lose_advanced.cfparams,
            player_win_lose_advanced.playerid,
            player_win_lose_advanced.season,
            player_win_lose_advanced.created_at,
            player_win_lose_advanced.updated_at,
            player_win_lose_advanced.row_id,
            player_win_lose_advanced.season_type,
            row_number() OVER (PARTITION BY player_win_lose_advanced.season, player_win_lose_advanced.season_type, player_win_lose_advanced.playerid, player_win_lose_advanced.group_value ORDER BY player_win_lose_advanced.created_at DESC) AS rn
           FROM player_win_lose_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_win_lose_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_win_lose_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.dd2,
    t.td3,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_win_lose_base._unnamed,
            player_win_lose_base.group_set,
            player_win_lose_base.group_value,
            player_win_lose_base.gp,
            player_win_lose_base.w,
            player_win_lose_base.l,
            player_win_lose_base.w_pct,
            player_win_lose_base.min,
            player_win_lose_base.fgm,
            player_win_lose_base.fga,
            player_win_lose_base.fg_pct,
            player_win_lose_base.fg3m,
            player_win_lose_base.fg3a,
            player_win_lose_base.fg3_pct,
            player_win_lose_base.ftm,
            player_win_lose_base.fta,
            player_win_lose_base.ft_pct,
            player_win_lose_base.oreb,
            player_win_lose_base.dreb,
            player_win_lose_base.reb,
            player_win_lose_base.ast,
            player_win_lose_base.tov,
            player_win_lose_base.stl,
            player_win_lose_base.blk,
            player_win_lose_base.blka,
            player_win_lose_base.pf,
            player_win_lose_base.pfd,
            player_win_lose_base.pts,
            player_win_lose_base.plus_minus,
            player_win_lose_base.dd2,
            player_win_lose_base.td3,
            player_win_lose_base.cfid,
            player_win_lose_base.cfparams,
            player_win_lose_base.playerid,
            player_win_lose_base.season,
            player_win_lose_base.created_at,
            player_win_lose_base.updated_at,
            player_win_lose_base.row_id,
            player_win_lose_base.season_type,
            row_number() OVER (PARTITION BY player_win_lose_base.season, player_win_lose_base.season_type, player_win_lose_base.playerid, player_win_lose_base.group_value ORDER BY player_win_lose_base.created_at DESC) AS rn
           FROM player_win_lose_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_win_lose_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_win_lose_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_win_lose_misc._unnamed,
            player_win_lose_misc.group_set,
            player_win_lose_misc.group_value,
            player_win_lose_misc.gp,
            player_win_lose_misc.w,
            player_win_lose_misc.l,
            player_win_lose_misc.w_pct,
            player_win_lose_misc.min,
            player_win_lose_misc.pts_off_tov,
            player_win_lose_misc.pts_2nd_chance,
            player_win_lose_misc.pts_fb,
            player_win_lose_misc.pts_paint,
            player_win_lose_misc.opp_pts_off_tov,
            player_win_lose_misc.opp_pts_2nd_chance,
            player_win_lose_misc.opp_pts_fb,
            player_win_lose_misc.opp_pts_paint,
            player_win_lose_misc.blk,
            player_win_lose_misc.blka,
            player_win_lose_misc.pf,
            player_win_lose_misc.pfd,
            player_win_lose_misc.cfid,
            player_win_lose_misc.cfparams,
            player_win_lose_misc.playerid,
            player_win_lose_misc.season,
            player_win_lose_misc.created_at,
            player_win_lose_misc.updated_at,
            player_win_lose_misc.row_id,
            player_win_lose_misc.season_type,
            row_number() OVER (PARTITION BY player_win_lose_misc.season, player_win_lose_misc.season_type, player_win_lose_misc.playerid, player_win_lose_misc.group_value ORDER BY player_win_lose_misc.created_at DESC) AS rn
           FROM player_win_lose_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_win_lose_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_win_lose_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_win_lose_scoring._unnamed,
            player_win_lose_scoring.group_set,
            player_win_lose_scoring.group_value,
            player_win_lose_scoring.gp,
            player_win_lose_scoring.w,
            player_win_lose_scoring.l,
            player_win_lose_scoring.w_pct,
            player_win_lose_scoring.min,
            player_win_lose_scoring.pct_fga_2pt,
            player_win_lose_scoring.pct_fga_3pt,
            player_win_lose_scoring.pct_pts_2pt,
            player_win_lose_scoring.pct_pts_2pt_mr,
            player_win_lose_scoring.pct_pts_3pt,
            player_win_lose_scoring.pct_pts_fb,
            player_win_lose_scoring.pct_pts_ft,
            player_win_lose_scoring.pct_pts_off_tov,
            player_win_lose_scoring.pct_pts_paint,
            player_win_lose_scoring.pct_ast_2pm,
            player_win_lose_scoring.pct_uast_2pm,
            player_win_lose_scoring.pct_ast_3pm,
            player_win_lose_scoring.pct_uast_3pm,
            player_win_lose_scoring.pct_ast_fgm,
            player_win_lose_scoring.pct_uast_fgm,
            player_win_lose_scoring.cfid,
            player_win_lose_scoring.cfparams,
            player_win_lose_scoring.playerid,
            player_win_lose_scoring.season,
            player_win_lose_scoring.created_at,
            player_win_lose_scoring.updated_at,
            player_win_lose_scoring.row_id,
            player_win_lose_scoring.season_type,
            row_number() OVER (PARTITION BY player_win_lose_scoring.season, player_win_lose_scoring.season_type, player_win_lose_scoring.playerid, player_win_lose_scoring.group_value ORDER BY player_win_lose_scoring.created_at DESC) AS rn
           FROM player_win_lose_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_player_win_lose_usage; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_player_win_lose_usage AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.usg_pct,
    t.pct_fgm,
    t.pct_fga,
    t.pct_fg3m,
    t.pct_fg3a,
    t.pct_ftm,
    t.pct_fta,
    t.pct_oreb,
    t.pct_dreb,
    t.pct_reb,
    t.pct_ast,
    t.pct_tov,
    t.pct_stl,
    t.pct_blk,
    t.pct_blka,
    t.pct_pf,
    t.pct_pfd,
    t.pct_pts,
    t.cfid,
    t.cfparams,
    t.playerid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT player_win_lose_usage._unnamed,
            player_win_lose_usage.group_set,
            player_win_lose_usage.group_value,
            player_win_lose_usage.gp,
            player_win_lose_usage.w,
            player_win_lose_usage.l,
            player_win_lose_usage.w_pct,
            player_win_lose_usage.min,
            player_win_lose_usage.usg_pct,
            player_win_lose_usage.pct_fgm,
            player_win_lose_usage.pct_fga,
            player_win_lose_usage.pct_fg3m,
            player_win_lose_usage.pct_fg3a,
            player_win_lose_usage.pct_ftm,
            player_win_lose_usage.pct_fta,
            player_win_lose_usage.pct_oreb,
            player_win_lose_usage.pct_dreb,
            player_win_lose_usage.pct_reb,
            player_win_lose_usage.pct_ast,
            player_win_lose_usage.pct_tov,
            player_win_lose_usage.pct_stl,
            player_win_lose_usage.pct_blk,
            player_win_lose_usage.pct_blka,
            player_win_lose_usage.pct_pf,
            player_win_lose_usage.pct_pfd,
            player_win_lose_usage.pct_pts,
            player_win_lose_usage.cfid,
            player_win_lose_usage.cfparams,
            player_win_lose_usage.playerid,
            player_win_lose_usage.season,
            player_win_lose_usage.created_at,
            player_win_lose_usage.updated_at,
            player_win_lose_usage.row_id,
            player_win_lose_usage.season_type,
            row_number() OVER (PARTITION BY player_win_lose_usage.season, player_win_lose_usage.season_type, player_win_lose_usage.playerid, player_win_lose_usage.group_value ORDER BY player_win_lose_usage.created_at DESC) AS rn
           FROM player_win_lose_usage) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_game_log; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_game_log AS
 SELECT t._unnamed,
    t.team_id,
    t.game_id,
    t.game_date,
    t.matchup,
    t.wl,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.stl,
    t.blk,
    t.tov,
    t.pf,
    t.pts,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.min,
    t.rn
   FROM ( SELECT team_game_log._unnamed,
            team_game_log.team_id,
            team_game_log.game_id,
            team_game_log.game_date,
            team_game_log.matchup,
            team_game_log.wl,
            team_game_log.fgm,
            team_game_log.fga,
            team_game_log.fg_pct,
            team_game_log.fg3m,
            team_game_log.fg3a,
            team_game_log.fg3_pct,
            team_game_log.ftm,
            team_game_log.fta,
            team_game_log.ft_pct,
            team_game_log.oreb,
            team_game_log.dreb,
            team_game_log.reb,
            team_game_log.ast,
            team_game_log.stl,
            team_game_log.blk,
            team_game_log.tov,
            team_game_log.pf,
            team_game_log.pts,
            team_game_log.teamid,
            team_game_log.season,
            team_game_log.created_at,
            team_game_log.updated_at,
            team_game_log.row_id,
            team_game_log.season_type,
            team_game_log.min,
            row_number() OVER (PARTITION BY team_game_log.team_id, team_game_log.game_id ORDER BY team_game_log.created_at DESC) AS rn
           FROM team_game_log) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_days_rest_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_days_rest_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_days_rest_range,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.pace,
    t.pie,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_days_rest_advanced._unnamed,
            team_general_days_rest_advanced.group_set,
            team_general_days_rest_advanced.group_value,
            team_general_days_rest_advanced.team_days_rest_range,
            team_general_days_rest_advanced.gp,
            team_general_days_rest_advanced.w,
            team_general_days_rest_advanced.l,
            team_general_days_rest_advanced.w_pct,
            team_general_days_rest_advanced.min,
            team_general_days_rest_advanced.off_rating,
            team_general_days_rest_advanced.def_rating,
            team_general_days_rest_advanced.net_rating,
            team_general_days_rest_advanced.ast_pct,
            team_general_days_rest_advanced.ast_to,
            team_general_days_rest_advanced.ast_ratio,
            team_general_days_rest_advanced.oreb_pct,
            team_general_days_rest_advanced.dreb_pct,
            team_general_days_rest_advanced.reb_pct,
            team_general_days_rest_advanced.tm_tov_pct,
            team_general_days_rest_advanced.efg_pct,
            team_general_days_rest_advanced.ts_pct,
            team_general_days_rest_advanced.pace,
            team_general_days_rest_advanced.pie,
            team_general_days_rest_advanced.cfid,
            team_general_days_rest_advanced.cfparams,
            team_general_days_rest_advanced.teamid,
            team_general_days_rest_advanced.season,
            team_general_days_rest_advanced.created_at,
            team_general_days_rest_advanced.updated_at,
            team_general_days_rest_advanced.row_id,
            team_general_days_rest_advanced.season_type,
            row_number() OVER (PARTITION BY team_general_days_rest_advanced.season, team_general_days_rest_advanced.season_type, team_general_days_rest_advanced.teamid, team_general_days_rest_advanced.team_days_rest_range ORDER BY team_general_days_rest_advanced.created_at DESC) AS rn
           FROM team_general_days_rest_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_days_rest_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_days_rest_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_days_rest_range,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_days_rest_base._unnamed,
            team_general_days_rest_base.group_set,
            team_general_days_rest_base.group_value,
            team_general_days_rest_base.team_days_rest_range,
            team_general_days_rest_base.gp,
            team_general_days_rest_base.w,
            team_general_days_rest_base.l,
            team_general_days_rest_base.w_pct,
            team_general_days_rest_base.min,
            team_general_days_rest_base.fgm,
            team_general_days_rest_base.fga,
            team_general_days_rest_base.fg_pct,
            team_general_days_rest_base.fg3m,
            team_general_days_rest_base.fg3a,
            team_general_days_rest_base.fg3_pct,
            team_general_days_rest_base.ftm,
            team_general_days_rest_base.fta,
            team_general_days_rest_base.ft_pct,
            team_general_days_rest_base.oreb,
            team_general_days_rest_base.dreb,
            team_general_days_rest_base.reb,
            team_general_days_rest_base.ast,
            team_general_days_rest_base.tov,
            team_general_days_rest_base.stl,
            team_general_days_rest_base.blk,
            team_general_days_rest_base.blka,
            team_general_days_rest_base.pf,
            team_general_days_rest_base.pfd,
            team_general_days_rest_base.pts,
            team_general_days_rest_base.plus_minus,
            team_general_days_rest_base.cfid,
            team_general_days_rest_base.cfparams,
            team_general_days_rest_base.teamid,
            team_general_days_rest_base.season,
            team_general_days_rest_base.created_at,
            team_general_days_rest_base.updated_at,
            team_general_days_rest_base.row_id,
            team_general_days_rest_base.season_type,
            row_number() OVER (PARTITION BY team_general_days_rest_base.season, team_general_days_rest_base.season_type, team_general_days_rest_base.teamid, team_general_days_rest_base.team_days_rest_range ORDER BY team_general_days_rest_base.created_at DESC) AS rn
           FROM team_general_days_rest_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_days_rest_four_factors; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_days_rest_four_factors AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_days_rest_range,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_days_rest_four_factors._unnamed,
            team_general_days_rest_four_factors.group_set,
            team_general_days_rest_four_factors.group_value,
            team_general_days_rest_four_factors.team_days_rest_range,
            team_general_days_rest_four_factors.gp,
            team_general_days_rest_four_factors.w,
            team_general_days_rest_four_factors.l,
            team_general_days_rest_four_factors.w_pct,
            team_general_days_rest_four_factors.min,
            team_general_days_rest_four_factors.efg_pct,
            team_general_days_rest_four_factors.fta_rate,
            team_general_days_rest_four_factors.tm_tov_pct,
            team_general_days_rest_four_factors.oreb_pct,
            team_general_days_rest_four_factors.opp_efg_pct,
            team_general_days_rest_four_factors.opp_fta_rate,
            team_general_days_rest_four_factors.opp_tov_pct,
            team_general_days_rest_four_factors.opp_oreb_pct,
            team_general_days_rest_four_factors.cfid,
            team_general_days_rest_four_factors.cfparams,
            team_general_days_rest_four_factors.teamid,
            team_general_days_rest_four_factors.season,
            team_general_days_rest_four_factors.created_at,
            team_general_days_rest_four_factors.updated_at,
            team_general_days_rest_four_factors.row_id,
            team_general_days_rest_four_factors.season_type,
            row_number() OVER (PARTITION BY team_general_days_rest_four_factors.season, team_general_days_rest_four_factors.season_type, team_general_days_rest_four_factors.teamid, team_general_days_rest_four_factors.team_days_rest_range ORDER BY team_general_days_rest_four_factors.created_at DESC) AS rn
           FROM team_general_days_rest_four_factors) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_days_rest_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_days_rest_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_days_rest_range,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_days_rest_misc._unnamed,
            team_general_days_rest_misc.group_set,
            team_general_days_rest_misc.group_value,
            team_general_days_rest_misc.team_days_rest_range,
            team_general_days_rest_misc.gp,
            team_general_days_rest_misc.w,
            team_general_days_rest_misc.l,
            team_general_days_rest_misc.w_pct,
            team_general_days_rest_misc.min,
            team_general_days_rest_misc.pts_off_tov,
            team_general_days_rest_misc.pts_2nd_chance,
            team_general_days_rest_misc.pts_fb,
            team_general_days_rest_misc.pts_paint,
            team_general_days_rest_misc.opp_pts_off_tov,
            team_general_days_rest_misc.opp_pts_2nd_chance,
            team_general_days_rest_misc.opp_pts_fb,
            team_general_days_rest_misc.opp_pts_paint,
            team_general_days_rest_misc.cfid,
            team_general_days_rest_misc.cfparams,
            team_general_days_rest_misc.teamid,
            team_general_days_rest_misc.season,
            team_general_days_rest_misc.created_at,
            team_general_days_rest_misc.updated_at,
            team_general_days_rest_misc.row_id,
            team_general_days_rest_misc.season_type,
            row_number() OVER (PARTITION BY team_general_days_rest_misc.season, team_general_days_rest_misc.season_type, team_general_days_rest_misc.teamid, team_general_days_rest_misc.team_days_rest_range ORDER BY team_general_days_rest_misc.created_at DESC) AS rn
           FROM team_general_days_rest_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_days_rest_opponent; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_days_rest_opponent AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_days_rest_range,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.opp_fgm,
    t.opp_fga,
    t.opp_fg_pct,
    t.opp_fg3m,
    t.opp_fg3a,
    t.opp_fg3_pct,
    t.opp_ftm,
    t.opp_fta,
    t.opp_ft_pct,
    t.opp_oreb,
    t.opp_dreb,
    t.opp_reb,
    t.opp_ast,
    t.opp_tov,
    t.opp_stl,
    t.opp_blk,
    t.opp_blka,
    t.opp_pf,
    t.opp_pfd,
    t.opp_pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_days_rest_opponent._unnamed,
            team_general_days_rest_opponent.group_set,
            team_general_days_rest_opponent.group_value,
            team_general_days_rest_opponent.team_days_rest_range,
            team_general_days_rest_opponent.gp,
            team_general_days_rest_opponent.w,
            team_general_days_rest_opponent.l,
            team_general_days_rest_opponent.w_pct,
            team_general_days_rest_opponent.min,
            team_general_days_rest_opponent.opp_fgm,
            team_general_days_rest_opponent.opp_fga,
            team_general_days_rest_opponent.opp_fg_pct,
            team_general_days_rest_opponent.opp_fg3m,
            team_general_days_rest_opponent.opp_fg3a,
            team_general_days_rest_opponent.opp_fg3_pct,
            team_general_days_rest_opponent.opp_ftm,
            team_general_days_rest_opponent.opp_fta,
            team_general_days_rest_opponent.opp_ft_pct,
            team_general_days_rest_opponent.opp_oreb,
            team_general_days_rest_opponent.opp_dreb,
            team_general_days_rest_opponent.opp_reb,
            team_general_days_rest_opponent.opp_ast,
            team_general_days_rest_opponent.opp_tov,
            team_general_days_rest_opponent.opp_stl,
            team_general_days_rest_opponent.opp_blk,
            team_general_days_rest_opponent.opp_blka,
            team_general_days_rest_opponent.opp_pf,
            team_general_days_rest_opponent.opp_pfd,
            team_general_days_rest_opponent.opp_pts,
            team_general_days_rest_opponent.plus_minus,
            team_general_days_rest_opponent.cfid,
            team_general_days_rest_opponent.cfparams,
            team_general_days_rest_opponent.teamid,
            team_general_days_rest_opponent.season,
            team_general_days_rest_opponent.created_at,
            team_general_days_rest_opponent.updated_at,
            team_general_days_rest_opponent.row_id,
            team_general_days_rest_opponent.season_type,
            row_number() OVER (PARTITION BY team_general_days_rest_opponent.season, team_general_days_rest_opponent.season_type, team_general_days_rest_opponent.teamid, team_general_days_rest_opponent.team_days_rest_range ORDER BY team_general_days_rest_opponent.created_at DESC) AS rn
           FROM team_general_days_rest_opponent) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_days_rest_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_days_rest_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_days_rest_range,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_days_rest_scoring._unnamed,
            team_general_days_rest_scoring.group_set,
            team_general_days_rest_scoring.group_value,
            team_general_days_rest_scoring.team_days_rest_range,
            team_general_days_rest_scoring.gp,
            team_general_days_rest_scoring.w,
            team_general_days_rest_scoring.l,
            team_general_days_rest_scoring.w_pct,
            team_general_days_rest_scoring.min,
            team_general_days_rest_scoring.pct_fga_2pt,
            team_general_days_rest_scoring.pct_fga_3pt,
            team_general_days_rest_scoring.pct_pts_2pt,
            team_general_days_rest_scoring.pct_pts_2pt_mr,
            team_general_days_rest_scoring.pct_pts_3pt,
            team_general_days_rest_scoring.pct_pts_fb,
            team_general_days_rest_scoring.pct_pts_ft,
            team_general_days_rest_scoring.pct_pts_off_tov,
            team_general_days_rest_scoring.pct_pts_paint,
            team_general_days_rest_scoring.pct_ast_2pm,
            team_general_days_rest_scoring.pct_uast_2pm,
            team_general_days_rest_scoring.pct_ast_3pm,
            team_general_days_rest_scoring.pct_uast_3pm,
            team_general_days_rest_scoring.pct_ast_fgm,
            team_general_days_rest_scoring.pct_uast_fgm,
            team_general_days_rest_scoring.cfid,
            team_general_days_rest_scoring.cfparams,
            team_general_days_rest_scoring.teamid,
            team_general_days_rest_scoring.season,
            team_general_days_rest_scoring.created_at,
            team_general_days_rest_scoring.updated_at,
            team_general_days_rest_scoring.row_id,
            team_general_days_rest_scoring.season_type,
            row_number() OVER (PARTITION BY team_general_days_rest_scoring.season, team_general_days_rest_scoring.season_type, team_general_days_rest_scoring.teamid, team_general_days_rest_scoring.team_days_rest_range ORDER BY team_general_days_rest_scoring.created_at DESC) AS rn
           FROM team_general_days_rest_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_location_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_location_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_game_location,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.pace,
    t.pie,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_location_advanced._unnamed,
            team_general_location_advanced.group_set,
            team_general_location_advanced.group_value,
            team_general_location_advanced.team_game_location,
            team_general_location_advanced.gp,
            team_general_location_advanced.w,
            team_general_location_advanced.l,
            team_general_location_advanced.w_pct,
            team_general_location_advanced.min,
            team_general_location_advanced.off_rating,
            team_general_location_advanced.def_rating,
            team_general_location_advanced.net_rating,
            team_general_location_advanced.ast_pct,
            team_general_location_advanced.ast_to,
            team_general_location_advanced.ast_ratio,
            team_general_location_advanced.oreb_pct,
            team_general_location_advanced.dreb_pct,
            team_general_location_advanced.reb_pct,
            team_general_location_advanced.tm_tov_pct,
            team_general_location_advanced.efg_pct,
            team_general_location_advanced.ts_pct,
            team_general_location_advanced.pace,
            team_general_location_advanced.pie,
            team_general_location_advanced.cfid,
            team_general_location_advanced.cfparams,
            team_general_location_advanced.teamid,
            team_general_location_advanced.season,
            team_general_location_advanced.created_at,
            team_general_location_advanced.updated_at,
            team_general_location_advanced.row_id,
            team_general_location_advanced.season_type,
            row_number() OVER (PARTITION BY team_general_location_advanced.season, team_general_location_advanced.season_type, team_general_location_advanced.teamid, team_general_location_advanced.team_game_location ORDER BY team_general_location_advanced.created_at DESC) AS rn
           FROM team_general_location_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_location_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_location_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_game_location,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_location_base._unnamed,
            team_general_location_base.group_set,
            team_general_location_base.group_value,
            team_general_location_base.team_game_location,
            team_general_location_base.gp,
            team_general_location_base.w,
            team_general_location_base.l,
            team_general_location_base.w_pct,
            team_general_location_base.min,
            team_general_location_base.fgm,
            team_general_location_base.fga,
            team_general_location_base.fg_pct,
            team_general_location_base.fg3m,
            team_general_location_base.fg3a,
            team_general_location_base.fg3_pct,
            team_general_location_base.ftm,
            team_general_location_base.fta,
            team_general_location_base.ft_pct,
            team_general_location_base.oreb,
            team_general_location_base.dreb,
            team_general_location_base.reb,
            team_general_location_base.ast,
            team_general_location_base.tov,
            team_general_location_base.stl,
            team_general_location_base.blk,
            team_general_location_base.blka,
            team_general_location_base.pf,
            team_general_location_base.pfd,
            team_general_location_base.pts,
            team_general_location_base.plus_minus,
            team_general_location_base.cfid,
            team_general_location_base.cfparams,
            team_general_location_base.teamid,
            team_general_location_base.season,
            team_general_location_base.created_at,
            team_general_location_base.updated_at,
            team_general_location_base.row_id,
            team_general_location_base.season_type,
            row_number() OVER (PARTITION BY team_general_location_base.season, team_general_location_base.season_type, team_general_location_base.teamid, team_general_location_base.team_game_location ORDER BY team_general_location_base.created_at DESC) AS rn
           FROM team_general_location_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_location_four_factors; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_location_four_factors AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_game_location,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_location_four_factors._unnamed,
            team_general_location_four_factors.group_set,
            team_general_location_four_factors.group_value,
            team_general_location_four_factors.team_game_location,
            team_general_location_four_factors.gp,
            team_general_location_four_factors.w,
            team_general_location_four_factors.l,
            team_general_location_four_factors.w_pct,
            team_general_location_four_factors.min,
            team_general_location_four_factors.efg_pct,
            team_general_location_four_factors.fta_rate,
            team_general_location_four_factors.tm_tov_pct,
            team_general_location_four_factors.oreb_pct,
            team_general_location_four_factors.opp_efg_pct,
            team_general_location_four_factors.opp_fta_rate,
            team_general_location_four_factors.opp_tov_pct,
            team_general_location_four_factors.opp_oreb_pct,
            team_general_location_four_factors.cfid,
            team_general_location_four_factors.cfparams,
            team_general_location_four_factors.teamid,
            team_general_location_four_factors.season,
            team_general_location_four_factors.created_at,
            team_general_location_four_factors.updated_at,
            team_general_location_four_factors.row_id,
            team_general_location_four_factors.season_type,
            row_number() OVER (PARTITION BY team_general_location_four_factors.season, team_general_location_four_factors.season_type, team_general_location_four_factors.teamid, team_general_location_four_factors.team_game_location ORDER BY team_general_location_four_factors.created_at DESC) AS rn
           FROM team_general_location_four_factors) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_location_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_location_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_game_location,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_location_misc._unnamed,
            team_general_location_misc.group_set,
            team_general_location_misc.group_value,
            team_general_location_misc.team_game_location,
            team_general_location_misc.gp,
            team_general_location_misc.w,
            team_general_location_misc.l,
            team_general_location_misc.w_pct,
            team_general_location_misc.min,
            team_general_location_misc.pts_off_tov,
            team_general_location_misc.pts_2nd_chance,
            team_general_location_misc.pts_fb,
            team_general_location_misc.pts_paint,
            team_general_location_misc.opp_pts_off_tov,
            team_general_location_misc.opp_pts_2nd_chance,
            team_general_location_misc.opp_pts_fb,
            team_general_location_misc.opp_pts_paint,
            team_general_location_misc.cfid,
            team_general_location_misc.cfparams,
            team_general_location_misc.teamid,
            team_general_location_misc.season,
            team_general_location_misc.created_at,
            team_general_location_misc.updated_at,
            team_general_location_misc.row_id,
            team_general_location_misc.season_type,
            row_number() OVER (PARTITION BY team_general_location_misc.season, team_general_location_misc.season_type, team_general_location_misc.teamid, team_general_location_misc.team_game_location ORDER BY team_general_location_misc.created_at DESC) AS rn
           FROM team_general_location_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_location_opponent; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_location_opponent AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_game_location,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.opp_fgm,
    t.opp_fga,
    t.opp_fg_pct,
    t.opp_fg3m,
    t.opp_fg3a,
    t.opp_fg3_pct,
    t.opp_ftm,
    t.opp_fta,
    t.opp_ft_pct,
    t.opp_oreb,
    t.opp_dreb,
    t.opp_reb,
    t.opp_ast,
    t.opp_tov,
    t.opp_stl,
    t.opp_blk,
    t.opp_blka,
    t.opp_pf,
    t.opp_pfd,
    t.opp_pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_location_opponent._unnamed,
            team_general_location_opponent.group_set,
            team_general_location_opponent.group_value,
            team_general_location_opponent.team_game_location,
            team_general_location_opponent.gp,
            team_general_location_opponent.w,
            team_general_location_opponent.l,
            team_general_location_opponent.w_pct,
            team_general_location_opponent.min,
            team_general_location_opponent.opp_fgm,
            team_general_location_opponent.opp_fga,
            team_general_location_opponent.opp_fg_pct,
            team_general_location_opponent.opp_fg3m,
            team_general_location_opponent.opp_fg3a,
            team_general_location_opponent.opp_fg3_pct,
            team_general_location_opponent.opp_ftm,
            team_general_location_opponent.opp_fta,
            team_general_location_opponent.opp_ft_pct,
            team_general_location_opponent.opp_oreb,
            team_general_location_opponent.opp_dreb,
            team_general_location_opponent.opp_reb,
            team_general_location_opponent.opp_ast,
            team_general_location_opponent.opp_tov,
            team_general_location_opponent.opp_stl,
            team_general_location_opponent.opp_blk,
            team_general_location_opponent.opp_blka,
            team_general_location_opponent.opp_pf,
            team_general_location_opponent.opp_pfd,
            team_general_location_opponent.opp_pts,
            team_general_location_opponent.plus_minus,
            team_general_location_opponent.cfid,
            team_general_location_opponent.cfparams,
            team_general_location_opponent.teamid,
            team_general_location_opponent.season,
            team_general_location_opponent.created_at,
            team_general_location_opponent.updated_at,
            team_general_location_opponent.row_id,
            team_general_location_opponent.season_type,
            row_number() OVER (PARTITION BY team_general_location_opponent.season, team_general_location_opponent.season_type, team_general_location_opponent.teamid, team_general_location_opponent.team_game_location ORDER BY team_general_location_opponent.created_at DESC) AS rn
           FROM team_general_location_opponent) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_location_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_location_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_game_location,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_location_scoring._unnamed,
            team_general_location_scoring.group_set,
            team_general_location_scoring.group_value,
            team_general_location_scoring.team_game_location,
            team_general_location_scoring.gp,
            team_general_location_scoring.w,
            team_general_location_scoring.l,
            team_general_location_scoring.w_pct,
            team_general_location_scoring.min,
            team_general_location_scoring.pct_fga_2pt,
            team_general_location_scoring.pct_fga_3pt,
            team_general_location_scoring.pct_pts_2pt,
            team_general_location_scoring.pct_pts_2pt_mr,
            team_general_location_scoring.pct_pts_3pt,
            team_general_location_scoring.pct_pts_fb,
            team_general_location_scoring.pct_pts_ft,
            team_general_location_scoring.pct_pts_off_tov,
            team_general_location_scoring.pct_pts_paint,
            team_general_location_scoring.pct_ast_2pm,
            team_general_location_scoring.pct_uast_2pm,
            team_general_location_scoring.pct_ast_3pm,
            team_general_location_scoring.pct_uast_3pm,
            team_general_location_scoring.pct_ast_fgm,
            team_general_location_scoring.pct_uast_fgm,
            team_general_location_scoring.cfid,
            team_general_location_scoring.cfparams,
            team_general_location_scoring.teamid,
            team_general_location_scoring.season,
            team_general_location_scoring.created_at,
            team_general_location_scoring.updated_at,
            team_general_location_scoring.row_id,
            team_general_location_scoring.season_type,
            row_number() OVER (PARTITION BY team_general_location_scoring.season, team_general_location_scoring.season_type, team_general_location_scoring.teamid, team_general_location_scoring.team_game_location ORDER BY team_general_location_scoring.created_at DESC) AS rn
           FROM team_general_location_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_month_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_month_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_month_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.pace,
    t.pie,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_month_advanced._unnamed,
            team_general_month_advanced.group_set,
            team_general_month_advanced.group_value,
            team_general_month_advanced.season_month_name,
            team_general_month_advanced.gp,
            team_general_month_advanced.w,
            team_general_month_advanced.l,
            team_general_month_advanced.w_pct,
            team_general_month_advanced.min,
            team_general_month_advanced.off_rating,
            team_general_month_advanced.def_rating,
            team_general_month_advanced.net_rating,
            team_general_month_advanced.ast_pct,
            team_general_month_advanced.ast_to,
            team_general_month_advanced.ast_ratio,
            team_general_month_advanced.oreb_pct,
            team_general_month_advanced.dreb_pct,
            team_general_month_advanced.reb_pct,
            team_general_month_advanced.tm_tov_pct,
            team_general_month_advanced.efg_pct,
            team_general_month_advanced.ts_pct,
            team_general_month_advanced.pace,
            team_general_month_advanced.pie,
            team_general_month_advanced.cfid,
            team_general_month_advanced.cfparams,
            team_general_month_advanced.teamid,
            team_general_month_advanced.season,
            team_general_month_advanced.created_at,
            team_general_month_advanced.updated_at,
            team_general_month_advanced.row_id,
            team_general_month_advanced.season_type,
            row_number() OVER (PARTITION BY team_general_month_advanced.season, team_general_month_advanced.season_type, team_general_month_advanced.teamid, team_general_month_advanced.season_month_name ORDER BY team_general_month_advanced.created_at DESC) AS rn
           FROM team_general_month_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_month_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_month_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_month_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_month_base._unnamed,
            team_general_month_base.group_set,
            team_general_month_base.group_value,
            team_general_month_base.season_month_name,
            team_general_month_base.gp,
            team_general_month_base.w,
            team_general_month_base.l,
            team_general_month_base.w_pct,
            team_general_month_base.min,
            team_general_month_base.fgm,
            team_general_month_base.fga,
            team_general_month_base.fg_pct,
            team_general_month_base.fg3m,
            team_general_month_base.fg3a,
            team_general_month_base.fg3_pct,
            team_general_month_base.ftm,
            team_general_month_base.fta,
            team_general_month_base.ft_pct,
            team_general_month_base.oreb,
            team_general_month_base.dreb,
            team_general_month_base.reb,
            team_general_month_base.ast,
            team_general_month_base.tov,
            team_general_month_base.stl,
            team_general_month_base.blk,
            team_general_month_base.blka,
            team_general_month_base.pf,
            team_general_month_base.pfd,
            team_general_month_base.pts,
            team_general_month_base.plus_minus,
            team_general_month_base.cfid,
            team_general_month_base.cfparams,
            team_general_month_base.teamid,
            team_general_month_base.season,
            team_general_month_base.created_at,
            team_general_month_base.updated_at,
            team_general_month_base.row_id,
            team_general_month_base.season_type,
            row_number() OVER (PARTITION BY team_general_month_base.season, team_general_month_base.season_type, team_general_month_base.teamid, team_general_month_base.season_month_name ORDER BY team_general_month_base.created_at DESC) AS rn
           FROM team_general_month_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_month_four_factors; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_month_four_factors AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_month_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_month_four_factors._unnamed,
            team_general_month_four_factors.group_set,
            team_general_month_four_factors.group_value,
            team_general_month_four_factors.season_month_name,
            team_general_month_four_factors.gp,
            team_general_month_four_factors.w,
            team_general_month_four_factors.l,
            team_general_month_four_factors.w_pct,
            team_general_month_four_factors.min,
            team_general_month_four_factors.efg_pct,
            team_general_month_four_factors.fta_rate,
            team_general_month_four_factors.tm_tov_pct,
            team_general_month_four_factors.oreb_pct,
            team_general_month_four_factors.opp_efg_pct,
            team_general_month_four_factors.opp_fta_rate,
            team_general_month_four_factors.opp_tov_pct,
            team_general_month_four_factors.opp_oreb_pct,
            team_general_month_four_factors.cfid,
            team_general_month_four_factors.cfparams,
            team_general_month_four_factors.teamid,
            team_general_month_four_factors.season,
            team_general_month_four_factors.created_at,
            team_general_month_four_factors.updated_at,
            team_general_month_four_factors.row_id,
            team_general_month_four_factors.season_type,
            row_number() OVER (PARTITION BY team_general_month_four_factors.season, team_general_month_four_factors.season_type, team_general_month_four_factors.teamid, team_general_month_four_factors.season_month_name ORDER BY team_general_month_four_factors.created_at DESC) AS rn
           FROM team_general_month_four_factors) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_month_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_month_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_month_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_month_misc._unnamed,
            team_general_month_misc.group_set,
            team_general_month_misc.group_value,
            team_general_month_misc.season_month_name,
            team_general_month_misc.gp,
            team_general_month_misc.w,
            team_general_month_misc.l,
            team_general_month_misc.w_pct,
            team_general_month_misc.min,
            team_general_month_misc.pts_off_tov,
            team_general_month_misc.pts_2nd_chance,
            team_general_month_misc.pts_fb,
            team_general_month_misc.pts_paint,
            team_general_month_misc.opp_pts_off_tov,
            team_general_month_misc.opp_pts_2nd_chance,
            team_general_month_misc.opp_pts_fb,
            team_general_month_misc.opp_pts_paint,
            team_general_month_misc.cfid,
            team_general_month_misc.cfparams,
            team_general_month_misc.teamid,
            team_general_month_misc.season,
            team_general_month_misc.created_at,
            team_general_month_misc.updated_at,
            team_general_month_misc.row_id,
            team_general_month_misc.season_type,
            row_number() OVER (PARTITION BY team_general_month_misc.season, team_general_month_misc.season_type, team_general_month_misc.teamid, team_general_month_misc.season_month_name ORDER BY team_general_month_misc.created_at DESC) AS rn
           FROM team_general_month_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_month_opponent; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_month_opponent AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_month_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.opp_fgm,
    t.opp_fga,
    t.opp_fg_pct,
    t.opp_fg3m,
    t.opp_fg3a,
    t.opp_fg3_pct,
    t.opp_ftm,
    t.opp_fta,
    t.opp_ft_pct,
    t.opp_oreb,
    t.opp_dreb,
    t.opp_reb,
    t.opp_ast,
    t.opp_tov,
    t.opp_stl,
    t.opp_blk,
    t.opp_blka,
    t.opp_pf,
    t.opp_pfd,
    t.opp_pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_month_opponent._unnamed,
            team_general_month_opponent.group_set,
            team_general_month_opponent.group_value,
            team_general_month_opponent.season_month_name,
            team_general_month_opponent.gp,
            team_general_month_opponent.w,
            team_general_month_opponent.l,
            team_general_month_opponent.w_pct,
            team_general_month_opponent.min,
            team_general_month_opponent.opp_fgm,
            team_general_month_opponent.opp_fga,
            team_general_month_opponent.opp_fg_pct,
            team_general_month_opponent.opp_fg3m,
            team_general_month_opponent.opp_fg3a,
            team_general_month_opponent.opp_fg3_pct,
            team_general_month_opponent.opp_ftm,
            team_general_month_opponent.opp_fta,
            team_general_month_opponent.opp_ft_pct,
            team_general_month_opponent.opp_oreb,
            team_general_month_opponent.opp_dreb,
            team_general_month_opponent.opp_reb,
            team_general_month_opponent.opp_ast,
            team_general_month_opponent.opp_tov,
            team_general_month_opponent.opp_stl,
            team_general_month_opponent.opp_blk,
            team_general_month_opponent.opp_blka,
            team_general_month_opponent.opp_pf,
            team_general_month_opponent.opp_pfd,
            team_general_month_opponent.opp_pts,
            team_general_month_opponent.plus_minus,
            team_general_month_opponent.cfid,
            team_general_month_opponent.cfparams,
            team_general_month_opponent.teamid,
            team_general_month_opponent.season,
            team_general_month_opponent.created_at,
            team_general_month_opponent.updated_at,
            team_general_month_opponent.row_id,
            team_general_month_opponent.season_type,
            row_number() OVER (PARTITION BY team_general_month_opponent.season, team_general_month_opponent.season_type, team_general_month_opponent.teamid, team_general_month_opponent.season_month_name ORDER BY team_general_month_opponent.created_at DESC) AS rn
           FROM team_general_month_opponent) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_month_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_month_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_month_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_month_scoring._unnamed,
            team_general_month_scoring.group_set,
            team_general_month_scoring.group_value,
            team_general_month_scoring.season_month_name,
            team_general_month_scoring.gp,
            team_general_month_scoring.w,
            team_general_month_scoring.l,
            team_general_month_scoring.w_pct,
            team_general_month_scoring.min,
            team_general_month_scoring.pct_fga_2pt,
            team_general_month_scoring.pct_fga_3pt,
            team_general_month_scoring.pct_pts_2pt,
            team_general_month_scoring.pct_pts_2pt_mr,
            team_general_month_scoring.pct_pts_3pt,
            team_general_month_scoring.pct_pts_fb,
            team_general_month_scoring.pct_pts_ft,
            team_general_month_scoring.pct_pts_off_tov,
            team_general_month_scoring.pct_pts_paint,
            team_general_month_scoring.pct_ast_2pm,
            team_general_month_scoring.pct_uast_2pm,
            team_general_month_scoring.pct_ast_3pm,
            team_general_month_scoring.pct_uast_3pm,
            team_general_month_scoring.pct_ast_fgm,
            team_general_month_scoring.pct_uast_fgm,
            team_general_month_scoring.cfid,
            team_general_month_scoring.cfparams,
            team_general_month_scoring.teamid,
            team_general_month_scoring.season,
            team_general_month_scoring.created_at,
            team_general_month_scoring.updated_at,
            team_general_month_scoring.row_id,
            team_general_month_scoring.season_type,
            row_number() OVER (PARTITION BY team_general_month_scoring.season, team_general_month_scoring.season_type, team_general_month_scoring.teamid, team_general_month_scoring.season_month_name ORDER BY team_general_month_scoring.created_at DESC) AS rn
           FROM team_general_month_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_overall_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_overall_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_year,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.pace,
    t.pie,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_overall_advanced._unnamed,
            team_general_overall_advanced.group_set,
            team_general_overall_advanced.group_value,
            team_general_overall_advanced.season_year,
            team_general_overall_advanced.gp,
            team_general_overall_advanced.w,
            team_general_overall_advanced.l,
            team_general_overall_advanced.w_pct,
            team_general_overall_advanced.min,
            team_general_overall_advanced.off_rating,
            team_general_overall_advanced.def_rating,
            team_general_overall_advanced.net_rating,
            team_general_overall_advanced.ast_pct,
            team_general_overall_advanced.ast_to,
            team_general_overall_advanced.ast_ratio,
            team_general_overall_advanced.oreb_pct,
            team_general_overall_advanced.dreb_pct,
            team_general_overall_advanced.reb_pct,
            team_general_overall_advanced.tm_tov_pct,
            team_general_overall_advanced.efg_pct,
            team_general_overall_advanced.ts_pct,
            team_general_overall_advanced.pace,
            team_general_overall_advanced.pie,
            team_general_overall_advanced.cfid,
            team_general_overall_advanced.cfparams,
            team_general_overall_advanced.teamid,
            team_general_overall_advanced.season,
            team_general_overall_advanced.created_at,
            team_general_overall_advanced.updated_at,
            team_general_overall_advanced.row_id,
            team_general_overall_advanced.season_type,
            row_number() OVER (PARTITION BY team_general_overall_advanced.season, team_general_overall_advanced.season_type, team_general_overall_advanced.teamid ORDER BY team_general_overall_advanced.created_at DESC) AS rn
           FROM team_general_overall_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_overall_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_overall_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_year,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_overall_base._unnamed,
            team_general_overall_base.group_set,
            team_general_overall_base.group_value,
            team_general_overall_base.season_year,
            team_general_overall_base.gp,
            team_general_overall_base.w,
            team_general_overall_base.l,
            team_general_overall_base.w_pct,
            team_general_overall_base.min,
            team_general_overall_base.fgm,
            team_general_overall_base.fga,
            team_general_overall_base.fg_pct,
            team_general_overall_base.fg3m,
            team_general_overall_base.fg3a,
            team_general_overall_base.fg3_pct,
            team_general_overall_base.ftm,
            team_general_overall_base.fta,
            team_general_overall_base.ft_pct,
            team_general_overall_base.oreb,
            team_general_overall_base.dreb,
            team_general_overall_base.reb,
            team_general_overall_base.ast,
            team_general_overall_base.tov,
            team_general_overall_base.stl,
            team_general_overall_base.blk,
            team_general_overall_base.blka,
            team_general_overall_base.pf,
            team_general_overall_base.pfd,
            team_general_overall_base.pts,
            team_general_overall_base.plus_minus,
            team_general_overall_base.cfid,
            team_general_overall_base.cfparams,
            team_general_overall_base.teamid,
            team_general_overall_base.season,
            team_general_overall_base.created_at,
            team_general_overall_base.updated_at,
            team_general_overall_base.row_id,
            team_general_overall_base.season_type,
            row_number() OVER (PARTITION BY team_general_overall_base.season, team_general_overall_base.season_type, team_general_overall_base.teamid ORDER BY team_general_overall_base.created_at DESC) AS rn
           FROM team_general_overall_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_overall_four_factors; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_overall_four_factors AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_year,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_overall_four_factors._unnamed,
            team_general_overall_four_factors.group_set,
            team_general_overall_four_factors.group_value,
            team_general_overall_four_factors.season_year,
            team_general_overall_four_factors.gp,
            team_general_overall_four_factors.w,
            team_general_overall_four_factors.l,
            team_general_overall_four_factors.w_pct,
            team_general_overall_four_factors.min,
            team_general_overall_four_factors.efg_pct,
            team_general_overall_four_factors.fta_rate,
            team_general_overall_four_factors.tm_tov_pct,
            team_general_overall_four_factors.oreb_pct,
            team_general_overall_four_factors.opp_efg_pct,
            team_general_overall_four_factors.opp_fta_rate,
            team_general_overall_four_factors.opp_tov_pct,
            team_general_overall_four_factors.opp_oreb_pct,
            team_general_overall_four_factors.cfid,
            team_general_overall_four_factors.cfparams,
            team_general_overall_four_factors.teamid,
            team_general_overall_four_factors.season,
            team_general_overall_four_factors.created_at,
            team_general_overall_four_factors.updated_at,
            team_general_overall_four_factors.row_id,
            team_general_overall_four_factors.season_type,
            row_number() OVER (PARTITION BY team_general_overall_four_factors.season, team_general_overall_four_factors.season_type, team_general_overall_four_factors.teamid ORDER BY team_general_overall_four_factors.created_at DESC) AS rn
           FROM team_general_overall_four_factors) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_overall_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_overall_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_year,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_overall_misc._unnamed,
            team_general_overall_misc.group_set,
            team_general_overall_misc.group_value,
            team_general_overall_misc.season_year,
            team_general_overall_misc.gp,
            team_general_overall_misc.w,
            team_general_overall_misc.l,
            team_general_overall_misc.w_pct,
            team_general_overall_misc.min,
            team_general_overall_misc.pts_off_tov,
            team_general_overall_misc.pts_2nd_chance,
            team_general_overall_misc.pts_fb,
            team_general_overall_misc.pts_paint,
            team_general_overall_misc.opp_pts_off_tov,
            team_general_overall_misc.opp_pts_2nd_chance,
            team_general_overall_misc.opp_pts_fb,
            team_general_overall_misc.opp_pts_paint,
            team_general_overall_misc.cfid,
            team_general_overall_misc.cfparams,
            team_general_overall_misc.teamid,
            team_general_overall_misc.season,
            team_general_overall_misc.created_at,
            team_general_overall_misc.updated_at,
            team_general_overall_misc.row_id,
            team_general_overall_misc.season_type,
            row_number() OVER (PARTITION BY team_general_overall_misc.season, team_general_overall_misc.season_type, team_general_overall_misc.teamid ORDER BY team_general_overall_misc.created_at DESC) AS rn
           FROM team_general_overall_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_overall_opponent; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_overall_opponent AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_year,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.opp_fgm,
    t.opp_fga,
    t.opp_fg_pct,
    t.opp_fg3m,
    t.opp_fg3a,
    t.opp_fg3_pct,
    t.opp_ftm,
    t.opp_fta,
    t.opp_ft_pct,
    t.opp_oreb,
    t.opp_dreb,
    t.opp_reb,
    t.opp_ast,
    t.opp_tov,
    t.opp_stl,
    t.opp_blk,
    t.opp_blka,
    t.opp_pf,
    t.opp_pfd,
    t.opp_pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_overall_opponent._unnamed,
            team_general_overall_opponent.group_set,
            team_general_overall_opponent.group_value,
            team_general_overall_opponent.season_year,
            team_general_overall_opponent.gp,
            team_general_overall_opponent.w,
            team_general_overall_opponent.l,
            team_general_overall_opponent.w_pct,
            team_general_overall_opponent.min,
            team_general_overall_opponent.opp_fgm,
            team_general_overall_opponent.opp_fga,
            team_general_overall_opponent.opp_fg_pct,
            team_general_overall_opponent.opp_fg3m,
            team_general_overall_opponent.opp_fg3a,
            team_general_overall_opponent.opp_fg3_pct,
            team_general_overall_opponent.opp_ftm,
            team_general_overall_opponent.opp_fta,
            team_general_overall_opponent.opp_ft_pct,
            team_general_overall_opponent.opp_oreb,
            team_general_overall_opponent.opp_dreb,
            team_general_overall_opponent.opp_reb,
            team_general_overall_opponent.opp_ast,
            team_general_overall_opponent.opp_tov,
            team_general_overall_opponent.opp_stl,
            team_general_overall_opponent.opp_blk,
            team_general_overall_opponent.opp_blka,
            team_general_overall_opponent.opp_pf,
            team_general_overall_opponent.opp_pfd,
            team_general_overall_opponent.opp_pts,
            team_general_overall_opponent.plus_minus,
            team_general_overall_opponent.cfid,
            team_general_overall_opponent.cfparams,
            team_general_overall_opponent.teamid,
            team_general_overall_opponent.season,
            team_general_overall_opponent.created_at,
            team_general_overall_opponent.updated_at,
            team_general_overall_opponent.row_id,
            team_general_overall_opponent.season_type,
            row_number() OVER (PARTITION BY team_general_overall_opponent.season, team_general_overall_opponent.season_type, team_general_overall_opponent.teamid ORDER BY team_general_overall_opponent.created_at DESC) AS rn
           FROM team_general_overall_opponent) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_overall_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_overall_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_year,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_overall_scoring._unnamed,
            team_general_overall_scoring.group_set,
            team_general_overall_scoring.group_value,
            team_general_overall_scoring.season_year,
            team_general_overall_scoring.gp,
            team_general_overall_scoring.w,
            team_general_overall_scoring.l,
            team_general_overall_scoring.w_pct,
            team_general_overall_scoring.min,
            team_general_overall_scoring.pct_fga_2pt,
            team_general_overall_scoring.pct_fga_3pt,
            team_general_overall_scoring.pct_pts_2pt,
            team_general_overall_scoring.pct_pts_2pt_mr,
            team_general_overall_scoring.pct_pts_3pt,
            team_general_overall_scoring.pct_pts_fb,
            team_general_overall_scoring.pct_pts_ft,
            team_general_overall_scoring.pct_pts_off_tov,
            team_general_overall_scoring.pct_pts_paint,
            team_general_overall_scoring.pct_ast_2pm,
            team_general_overall_scoring.pct_uast_2pm,
            team_general_overall_scoring.pct_ast_3pm,
            team_general_overall_scoring.pct_uast_3pm,
            team_general_overall_scoring.pct_ast_fgm,
            team_general_overall_scoring.pct_uast_fgm,
            team_general_overall_scoring.cfid,
            team_general_overall_scoring.cfparams,
            team_general_overall_scoring.teamid,
            team_general_overall_scoring.season,
            team_general_overall_scoring.created_at,
            team_general_overall_scoring.updated_at,
            team_general_overall_scoring.row_id,
            team_general_overall_scoring.season_type,
            row_number() OVER (PARTITION BY team_general_overall_scoring.season, team_general_overall_scoring.season_type, team_general_overall_scoring.teamid ORDER BY team_general_overall_scoring.created_at DESC) AS rn
           FROM team_general_overall_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_prepost_allstar_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_prepost_allstar_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_segment,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.pace,
    t.pie,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_prepost_allstar_advanced._unnamed,
            team_general_prepost_allstar_advanced.group_set,
            team_general_prepost_allstar_advanced.group_value,
            team_general_prepost_allstar_advanced.season_segment,
            team_general_prepost_allstar_advanced.gp,
            team_general_prepost_allstar_advanced.w,
            team_general_prepost_allstar_advanced.l,
            team_general_prepost_allstar_advanced.w_pct,
            team_general_prepost_allstar_advanced.min,
            team_general_prepost_allstar_advanced.off_rating,
            team_general_prepost_allstar_advanced.def_rating,
            team_general_prepost_allstar_advanced.net_rating,
            team_general_prepost_allstar_advanced.ast_pct,
            team_general_prepost_allstar_advanced.ast_to,
            team_general_prepost_allstar_advanced.ast_ratio,
            team_general_prepost_allstar_advanced.oreb_pct,
            team_general_prepost_allstar_advanced.dreb_pct,
            team_general_prepost_allstar_advanced.reb_pct,
            team_general_prepost_allstar_advanced.tm_tov_pct,
            team_general_prepost_allstar_advanced.efg_pct,
            team_general_prepost_allstar_advanced.ts_pct,
            team_general_prepost_allstar_advanced.pace,
            team_general_prepost_allstar_advanced.pie,
            team_general_prepost_allstar_advanced.cfid,
            team_general_prepost_allstar_advanced.cfparams,
            team_general_prepost_allstar_advanced.teamid,
            team_general_prepost_allstar_advanced.season,
            team_general_prepost_allstar_advanced.created_at,
            team_general_prepost_allstar_advanced.updated_at,
            team_general_prepost_allstar_advanced.row_id,
            team_general_prepost_allstar_advanced.season_type,
            row_number() OVER (PARTITION BY team_general_prepost_allstar_advanced.season, team_general_prepost_allstar_advanced.season_type, team_general_prepost_allstar_advanced.teamid, team_general_prepost_allstar_advanced.season_segment ORDER BY team_general_prepost_allstar_advanced.created_at DESC) AS rn
           FROM team_general_prepost_allstar_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_prepost_allstar_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_prepost_allstar_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_segment,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_prepost_allstar_base._unnamed,
            team_general_prepost_allstar_base.group_set,
            team_general_prepost_allstar_base.group_value,
            team_general_prepost_allstar_base.season_segment,
            team_general_prepost_allstar_base.gp,
            team_general_prepost_allstar_base.w,
            team_general_prepost_allstar_base.l,
            team_general_prepost_allstar_base.w_pct,
            team_general_prepost_allstar_base.min,
            team_general_prepost_allstar_base.fgm,
            team_general_prepost_allstar_base.fga,
            team_general_prepost_allstar_base.fg_pct,
            team_general_prepost_allstar_base.fg3m,
            team_general_prepost_allstar_base.fg3a,
            team_general_prepost_allstar_base.fg3_pct,
            team_general_prepost_allstar_base.ftm,
            team_general_prepost_allstar_base.fta,
            team_general_prepost_allstar_base.ft_pct,
            team_general_prepost_allstar_base.oreb,
            team_general_prepost_allstar_base.dreb,
            team_general_prepost_allstar_base.reb,
            team_general_prepost_allstar_base.ast,
            team_general_prepost_allstar_base.tov,
            team_general_prepost_allstar_base.stl,
            team_general_prepost_allstar_base.blk,
            team_general_prepost_allstar_base.blka,
            team_general_prepost_allstar_base.pf,
            team_general_prepost_allstar_base.pfd,
            team_general_prepost_allstar_base.pts,
            team_general_prepost_allstar_base.plus_minus,
            team_general_prepost_allstar_base.cfid,
            team_general_prepost_allstar_base.cfparams,
            team_general_prepost_allstar_base.teamid,
            team_general_prepost_allstar_base.season,
            team_general_prepost_allstar_base.created_at,
            team_general_prepost_allstar_base.updated_at,
            team_general_prepost_allstar_base.row_id,
            team_general_prepost_allstar_base.season_type,
            row_number() OVER (PARTITION BY team_general_prepost_allstar_base.season, team_general_prepost_allstar_base.season_type, team_general_prepost_allstar_base.teamid, team_general_prepost_allstar_base.season_segment ORDER BY team_general_prepost_allstar_base.created_at DESC) AS rn
           FROM team_general_prepost_allstar_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_prepost_allstar_four_factors; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_prepost_allstar_four_factors AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_segment,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_prepost_allstar_four_factors._unnamed,
            team_general_prepost_allstar_four_factors.group_set,
            team_general_prepost_allstar_four_factors.group_value,
            team_general_prepost_allstar_four_factors.season_segment,
            team_general_prepost_allstar_four_factors.gp,
            team_general_prepost_allstar_four_factors.w,
            team_general_prepost_allstar_four_factors.l,
            team_general_prepost_allstar_four_factors.w_pct,
            team_general_prepost_allstar_four_factors.min,
            team_general_prepost_allstar_four_factors.efg_pct,
            team_general_prepost_allstar_four_factors.fta_rate,
            team_general_prepost_allstar_four_factors.tm_tov_pct,
            team_general_prepost_allstar_four_factors.oreb_pct,
            team_general_prepost_allstar_four_factors.opp_efg_pct,
            team_general_prepost_allstar_four_factors.opp_fta_rate,
            team_general_prepost_allstar_four_factors.opp_tov_pct,
            team_general_prepost_allstar_four_factors.opp_oreb_pct,
            team_general_prepost_allstar_four_factors.cfid,
            team_general_prepost_allstar_four_factors.cfparams,
            team_general_prepost_allstar_four_factors.teamid,
            team_general_prepost_allstar_four_factors.season,
            team_general_prepost_allstar_four_factors.created_at,
            team_general_prepost_allstar_four_factors.updated_at,
            team_general_prepost_allstar_four_factors.row_id,
            team_general_prepost_allstar_four_factors.season_type,
            row_number() OVER (PARTITION BY team_general_prepost_allstar_four_factors.season, team_general_prepost_allstar_four_factors.season_type, team_general_prepost_allstar_four_factors.teamid, team_general_prepost_allstar_four_factors.season_segment ORDER BY team_general_prepost_allstar_four_factors.created_at DESC) AS rn
           FROM team_general_prepost_allstar_four_factors) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_prepost_allstar_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_prepost_allstar_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_segment,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_prepost_allstar_misc._unnamed,
            team_general_prepost_allstar_misc.group_set,
            team_general_prepost_allstar_misc.group_value,
            team_general_prepost_allstar_misc.season_segment,
            team_general_prepost_allstar_misc.gp,
            team_general_prepost_allstar_misc.w,
            team_general_prepost_allstar_misc.l,
            team_general_prepost_allstar_misc.w_pct,
            team_general_prepost_allstar_misc.min,
            team_general_prepost_allstar_misc.pts_off_tov,
            team_general_prepost_allstar_misc.pts_2nd_chance,
            team_general_prepost_allstar_misc.pts_fb,
            team_general_prepost_allstar_misc.pts_paint,
            team_general_prepost_allstar_misc.opp_pts_off_tov,
            team_general_prepost_allstar_misc.opp_pts_2nd_chance,
            team_general_prepost_allstar_misc.opp_pts_fb,
            team_general_prepost_allstar_misc.opp_pts_paint,
            team_general_prepost_allstar_misc.cfid,
            team_general_prepost_allstar_misc.cfparams,
            team_general_prepost_allstar_misc.teamid,
            team_general_prepost_allstar_misc.season,
            team_general_prepost_allstar_misc.created_at,
            team_general_prepost_allstar_misc.updated_at,
            team_general_prepost_allstar_misc.row_id,
            team_general_prepost_allstar_misc.season_type,
            row_number() OVER (PARTITION BY team_general_prepost_allstar_misc.season, team_general_prepost_allstar_misc.season_type, team_general_prepost_allstar_misc.teamid, team_general_prepost_allstar_misc.season_segment ORDER BY team_general_prepost_allstar_misc.created_at DESC) AS rn
           FROM team_general_prepost_allstar_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_prepost_allstar_opponent; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_prepost_allstar_opponent AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_segment,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.opp_fgm,
    t.opp_fga,
    t.opp_fg_pct,
    t.opp_fg3m,
    t.opp_fg3a,
    t.opp_fg3_pct,
    t.opp_ftm,
    t.opp_fta,
    t.opp_ft_pct,
    t.opp_oreb,
    t.opp_dreb,
    t.opp_reb,
    t.opp_ast,
    t.opp_tov,
    t.opp_stl,
    t.opp_blk,
    t.opp_blka,
    t.opp_pf,
    t.opp_pfd,
    t.opp_pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_prepost_allstar_opponent._unnamed,
            team_general_prepost_allstar_opponent.group_set,
            team_general_prepost_allstar_opponent.group_value,
            team_general_prepost_allstar_opponent.season_segment,
            team_general_prepost_allstar_opponent.gp,
            team_general_prepost_allstar_opponent.w,
            team_general_prepost_allstar_opponent.l,
            team_general_prepost_allstar_opponent.w_pct,
            team_general_prepost_allstar_opponent.min,
            team_general_prepost_allstar_opponent.opp_fgm,
            team_general_prepost_allstar_opponent.opp_fga,
            team_general_prepost_allstar_opponent.opp_fg_pct,
            team_general_prepost_allstar_opponent.opp_fg3m,
            team_general_prepost_allstar_opponent.opp_fg3a,
            team_general_prepost_allstar_opponent.opp_fg3_pct,
            team_general_prepost_allstar_opponent.opp_ftm,
            team_general_prepost_allstar_opponent.opp_fta,
            team_general_prepost_allstar_opponent.opp_ft_pct,
            team_general_prepost_allstar_opponent.opp_oreb,
            team_general_prepost_allstar_opponent.opp_dreb,
            team_general_prepost_allstar_opponent.opp_reb,
            team_general_prepost_allstar_opponent.opp_ast,
            team_general_prepost_allstar_opponent.opp_tov,
            team_general_prepost_allstar_opponent.opp_stl,
            team_general_prepost_allstar_opponent.opp_blk,
            team_general_prepost_allstar_opponent.opp_blka,
            team_general_prepost_allstar_opponent.opp_pf,
            team_general_prepost_allstar_opponent.opp_pfd,
            team_general_prepost_allstar_opponent.opp_pts,
            team_general_prepost_allstar_opponent.plus_minus,
            team_general_prepost_allstar_opponent.cfid,
            team_general_prepost_allstar_opponent.cfparams,
            team_general_prepost_allstar_opponent.teamid,
            team_general_prepost_allstar_opponent.season,
            team_general_prepost_allstar_opponent.created_at,
            team_general_prepost_allstar_opponent.updated_at,
            team_general_prepost_allstar_opponent.row_id,
            team_general_prepost_allstar_opponent.season_type,
            row_number() OVER (PARTITION BY team_general_prepost_allstar_opponent.season, team_general_prepost_allstar_opponent.season_type, team_general_prepost_allstar_opponent.teamid, team_general_prepost_allstar_opponent.season_segment ORDER BY team_general_prepost_allstar_opponent.created_at DESC) AS rn
           FROM team_general_prepost_allstar_opponent) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_prepost_allstar_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_prepost_allstar_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_segment,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_prepost_allstar_scoring._unnamed,
            team_general_prepost_allstar_scoring.group_set,
            team_general_prepost_allstar_scoring.group_value,
            team_general_prepost_allstar_scoring.season_segment,
            team_general_prepost_allstar_scoring.gp,
            team_general_prepost_allstar_scoring.w,
            team_general_prepost_allstar_scoring.l,
            team_general_prepost_allstar_scoring.w_pct,
            team_general_prepost_allstar_scoring.min,
            team_general_prepost_allstar_scoring.pct_fga_2pt,
            team_general_prepost_allstar_scoring.pct_fga_3pt,
            team_general_prepost_allstar_scoring.pct_pts_2pt,
            team_general_prepost_allstar_scoring.pct_pts_2pt_mr,
            team_general_prepost_allstar_scoring.pct_pts_3pt,
            team_general_prepost_allstar_scoring.pct_pts_fb,
            team_general_prepost_allstar_scoring.pct_pts_ft,
            team_general_prepost_allstar_scoring.pct_pts_off_tov,
            team_general_prepost_allstar_scoring.pct_pts_paint,
            team_general_prepost_allstar_scoring.pct_ast_2pm,
            team_general_prepost_allstar_scoring.pct_uast_2pm,
            team_general_prepost_allstar_scoring.pct_ast_3pm,
            team_general_prepost_allstar_scoring.pct_uast_3pm,
            team_general_prepost_allstar_scoring.pct_ast_fgm,
            team_general_prepost_allstar_scoring.pct_uast_fgm,
            team_general_prepost_allstar_scoring.cfid,
            team_general_prepost_allstar_scoring.cfparams,
            team_general_prepost_allstar_scoring.teamid,
            team_general_prepost_allstar_scoring.season,
            team_general_prepost_allstar_scoring.created_at,
            team_general_prepost_allstar_scoring.updated_at,
            team_general_prepost_allstar_scoring.row_id,
            team_general_prepost_allstar_scoring.season_type,
            row_number() OVER (PARTITION BY team_general_prepost_allstar_scoring.season, team_general_prepost_allstar_scoring.season_type, team_general_prepost_allstar_scoring.teamid, team_general_prepost_allstar_scoring.season_segment ORDER BY team_general_prepost_allstar_scoring.created_at DESC) AS rn
           FROM team_general_prepost_allstar_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_win_lose_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_win_lose_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.game_result,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.pace,
    t.pie,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_win_lose_advanced._unnamed,
            team_general_win_lose_advanced.group_set,
            team_general_win_lose_advanced.group_value,
            team_general_win_lose_advanced.game_result,
            team_general_win_lose_advanced.gp,
            team_general_win_lose_advanced.w,
            team_general_win_lose_advanced.l,
            team_general_win_lose_advanced.w_pct,
            team_general_win_lose_advanced.min,
            team_general_win_lose_advanced.off_rating,
            team_general_win_lose_advanced.def_rating,
            team_general_win_lose_advanced.net_rating,
            team_general_win_lose_advanced.ast_pct,
            team_general_win_lose_advanced.ast_to,
            team_general_win_lose_advanced.ast_ratio,
            team_general_win_lose_advanced.oreb_pct,
            team_general_win_lose_advanced.dreb_pct,
            team_general_win_lose_advanced.reb_pct,
            team_general_win_lose_advanced.tm_tov_pct,
            team_general_win_lose_advanced.efg_pct,
            team_general_win_lose_advanced.ts_pct,
            team_general_win_lose_advanced.pace,
            team_general_win_lose_advanced.pie,
            team_general_win_lose_advanced.cfid,
            team_general_win_lose_advanced.cfparams,
            team_general_win_lose_advanced.teamid,
            team_general_win_lose_advanced.season,
            team_general_win_lose_advanced.created_at,
            team_general_win_lose_advanced.updated_at,
            team_general_win_lose_advanced.row_id,
            team_general_win_lose_advanced.season_type,
            row_number() OVER (PARTITION BY team_general_win_lose_advanced.season, team_general_win_lose_advanced.season_type, team_general_win_lose_advanced.teamid, team_general_win_lose_advanced.game_result ORDER BY team_general_win_lose_advanced.created_at DESC) AS rn
           FROM team_general_win_lose_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_win_lose_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_win_lose_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.game_result,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_win_lose_base._unnamed,
            team_general_win_lose_base.group_set,
            team_general_win_lose_base.group_value,
            team_general_win_lose_base.game_result,
            team_general_win_lose_base.gp,
            team_general_win_lose_base.w,
            team_general_win_lose_base.l,
            team_general_win_lose_base.w_pct,
            team_general_win_lose_base.min,
            team_general_win_lose_base.fgm,
            team_general_win_lose_base.fga,
            team_general_win_lose_base.fg_pct,
            team_general_win_lose_base.fg3m,
            team_general_win_lose_base.fg3a,
            team_general_win_lose_base.fg3_pct,
            team_general_win_lose_base.ftm,
            team_general_win_lose_base.fta,
            team_general_win_lose_base.ft_pct,
            team_general_win_lose_base.oreb,
            team_general_win_lose_base.dreb,
            team_general_win_lose_base.reb,
            team_general_win_lose_base.ast,
            team_general_win_lose_base.tov,
            team_general_win_lose_base.stl,
            team_general_win_lose_base.blk,
            team_general_win_lose_base.blka,
            team_general_win_lose_base.pf,
            team_general_win_lose_base.pfd,
            team_general_win_lose_base.pts,
            team_general_win_lose_base.plus_minus,
            team_general_win_lose_base.cfid,
            team_general_win_lose_base.cfparams,
            team_general_win_lose_base.teamid,
            team_general_win_lose_base.season,
            team_general_win_lose_base.created_at,
            team_general_win_lose_base.updated_at,
            team_general_win_lose_base.row_id,
            team_general_win_lose_base.season_type,
            row_number() OVER (PARTITION BY team_general_win_lose_base.season, team_general_win_lose_base.season_type, team_general_win_lose_base.teamid, team_general_win_lose_base.game_result ORDER BY team_general_win_lose_base.created_at DESC) AS rn
           FROM team_general_win_lose_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_win_lose_four_factors; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_win_lose_four_factors AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.game_result,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_win_lose_four_factors._unnamed,
            team_general_win_lose_four_factors.group_set,
            team_general_win_lose_four_factors.group_value,
            team_general_win_lose_four_factors.game_result,
            team_general_win_lose_four_factors.gp,
            team_general_win_lose_four_factors.w,
            team_general_win_lose_four_factors.l,
            team_general_win_lose_four_factors.w_pct,
            team_general_win_lose_four_factors.min,
            team_general_win_lose_four_factors.efg_pct,
            team_general_win_lose_four_factors.fta_rate,
            team_general_win_lose_four_factors.tm_tov_pct,
            team_general_win_lose_four_factors.oreb_pct,
            team_general_win_lose_four_factors.opp_efg_pct,
            team_general_win_lose_four_factors.opp_fta_rate,
            team_general_win_lose_four_factors.opp_tov_pct,
            team_general_win_lose_four_factors.opp_oreb_pct,
            team_general_win_lose_four_factors.cfid,
            team_general_win_lose_four_factors.cfparams,
            team_general_win_lose_four_factors.teamid,
            team_general_win_lose_four_factors.season,
            team_general_win_lose_four_factors.created_at,
            team_general_win_lose_four_factors.updated_at,
            team_general_win_lose_four_factors.row_id,
            team_general_win_lose_four_factors.season_type,
            row_number() OVER (PARTITION BY team_general_win_lose_four_factors.season, team_general_win_lose_four_factors.season_type, team_general_win_lose_four_factors.teamid, team_general_win_lose_four_factors.game_result ORDER BY team_general_win_lose_four_factors.created_at DESC) AS rn
           FROM team_general_win_lose_four_factors) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_win_lose_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_win_lose_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.game_result,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_win_lose_misc._unnamed,
            team_general_win_lose_misc.group_set,
            team_general_win_lose_misc.group_value,
            team_general_win_lose_misc.game_result,
            team_general_win_lose_misc.gp,
            team_general_win_lose_misc.w,
            team_general_win_lose_misc.l,
            team_general_win_lose_misc.w_pct,
            team_general_win_lose_misc.min,
            team_general_win_lose_misc.pts_off_tov,
            team_general_win_lose_misc.pts_2nd_chance,
            team_general_win_lose_misc.pts_fb,
            team_general_win_lose_misc.pts_paint,
            team_general_win_lose_misc.opp_pts_off_tov,
            team_general_win_lose_misc.opp_pts_2nd_chance,
            team_general_win_lose_misc.opp_pts_fb,
            team_general_win_lose_misc.opp_pts_paint,
            team_general_win_lose_misc.cfid,
            team_general_win_lose_misc.cfparams,
            team_general_win_lose_misc.teamid,
            team_general_win_lose_misc.season,
            team_general_win_lose_misc.created_at,
            team_general_win_lose_misc.updated_at,
            team_general_win_lose_misc.row_id,
            team_general_win_lose_misc.season_type,
            row_number() OVER (PARTITION BY team_general_win_lose_misc.season, team_general_win_lose_misc.season_type, team_general_win_lose_misc.teamid, team_general_win_lose_misc.game_result ORDER BY team_general_win_lose_misc.created_at DESC) AS rn
           FROM team_general_win_lose_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_win_lose_opponent; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_win_lose_opponent AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.game_result,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.opp_fgm,
    t.opp_fga,
    t.opp_fg_pct,
    t.opp_fg3m,
    t.opp_fg3a,
    t.opp_fg3_pct,
    t.opp_ftm,
    t.opp_fta,
    t.opp_ft_pct,
    t.opp_oreb,
    t.opp_dreb,
    t.opp_reb,
    t.opp_ast,
    t.opp_tov,
    t.opp_stl,
    t.opp_blk,
    t.opp_blka,
    t.opp_pf,
    t.opp_pfd,
    t.opp_pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_win_lose_opponent._unnamed,
            team_general_win_lose_opponent.group_set,
            team_general_win_lose_opponent.group_value,
            team_general_win_lose_opponent.game_result,
            team_general_win_lose_opponent.gp,
            team_general_win_lose_opponent.w,
            team_general_win_lose_opponent.l,
            team_general_win_lose_opponent.w_pct,
            team_general_win_lose_opponent.min,
            team_general_win_lose_opponent.opp_fgm,
            team_general_win_lose_opponent.opp_fga,
            team_general_win_lose_opponent.opp_fg_pct,
            team_general_win_lose_opponent.opp_fg3m,
            team_general_win_lose_opponent.opp_fg3a,
            team_general_win_lose_opponent.opp_fg3_pct,
            team_general_win_lose_opponent.opp_ftm,
            team_general_win_lose_opponent.opp_fta,
            team_general_win_lose_opponent.opp_ft_pct,
            team_general_win_lose_opponent.opp_oreb,
            team_general_win_lose_opponent.opp_dreb,
            team_general_win_lose_opponent.opp_reb,
            team_general_win_lose_opponent.opp_ast,
            team_general_win_lose_opponent.opp_tov,
            team_general_win_lose_opponent.opp_stl,
            team_general_win_lose_opponent.opp_blk,
            team_general_win_lose_opponent.opp_blka,
            team_general_win_lose_opponent.opp_pf,
            team_general_win_lose_opponent.opp_pfd,
            team_general_win_lose_opponent.opp_pts,
            team_general_win_lose_opponent.plus_minus,
            team_general_win_lose_opponent.cfid,
            team_general_win_lose_opponent.cfparams,
            team_general_win_lose_opponent.teamid,
            team_general_win_lose_opponent.season,
            team_general_win_lose_opponent.created_at,
            team_general_win_lose_opponent.updated_at,
            team_general_win_lose_opponent.row_id,
            team_general_win_lose_opponent.season_type,
            row_number() OVER (PARTITION BY team_general_win_lose_opponent.season, team_general_win_lose_opponent.season_type, team_general_win_lose_opponent.teamid, team_general_win_lose_opponent.game_result ORDER BY team_general_win_lose_opponent.created_at DESC) AS rn
           FROM team_general_win_lose_opponent) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_general_win_lose_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_general_win_lose_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.game_result,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_general_win_lose_scoring._unnamed,
            team_general_win_lose_scoring.group_set,
            team_general_win_lose_scoring.group_value,
            team_general_win_lose_scoring.game_result,
            team_general_win_lose_scoring.gp,
            team_general_win_lose_scoring.w,
            team_general_win_lose_scoring.l,
            team_general_win_lose_scoring.w_pct,
            team_general_win_lose_scoring.min,
            team_general_win_lose_scoring.pct_fga_2pt,
            team_general_win_lose_scoring.pct_fga_3pt,
            team_general_win_lose_scoring.pct_pts_2pt,
            team_general_win_lose_scoring.pct_pts_2pt_mr,
            team_general_win_lose_scoring.pct_pts_3pt,
            team_general_win_lose_scoring.pct_pts_fb,
            team_general_win_lose_scoring.pct_pts_ft,
            team_general_win_lose_scoring.pct_pts_off_tov,
            team_general_win_lose_scoring.pct_pts_paint,
            team_general_win_lose_scoring.pct_ast_2pm,
            team_general_win_lose_scoring.pct_uast_2pm,
            team_general_win_lose_scoring.pct_ast_3pm,
            team_general_win_lose_scoring.pct_uast_3pm,
            team_general_win_lose_scoring.pct_ast_fgm,
            team_general_win_lose_scoring.pct_uast_fgm,
            team_general_win_lose_scoring.cfid,
            team_general_win_lose_scoring.cfparams,
            team_general_win_lose_scoring.teamid,
            team_general_win_lose_scoring.season,
            team_general_win_lose_scoring.created_at,
            team_general_win_lose_scoring.updated_at,
            team_general_win_lose_scoring.row_id,
            team_general_win_lose_scoring.season_type,
            row_number() OVER (PARTITION BY team_general_win_lose_scoring.season, team_general_win_lose_scoring.season_type, team_general_win_lose_scoring.teamid, team_general_win_lose_scoring.game_result ORDER BY team_general_win_lose_scoring.created_at DESC) AS rn
           FROM team_general_win_lose_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_lineup_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_lineup_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.group_id,
    t.group_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.pace,
    t.pie,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_lineup_advanced._unnamed,
            team_lineup_advanced.group_set,
            team_lineup_advanced.group_id,
            team_lineup_advanced.group_name,
            team_lineup_advanced.gp,
            team_lineup_advanced.w,
            team_lineup_advanced.l,
            team_lineup_advanced.w_pct,
            team_lineup_advanced.min,
            team_lineup_advanced.off_rating,
            team_lineup_advanced.def_rating,
            team_lineup_advanced.net_rating,
            team_lineup_advanced.ast_pct,
            team_lineup_advanced.ast_to,
            team_lineup_advanced.ast_ratio,
            team_lineup_advanced.oreb_pct,
            team_lineup_advanced.dreb_pct,
            team_lineup_advanced.reb_pct,
            team_lineup_advanced.tm_tov_pct,
            team_lineup_advanced.efg_pct,
            team_lineup_advanced.ts_pct,
            team_lineup_advanced.pace,
            team_lineup_advanced.pie,
            team_lineup_advanced.teamid,
            team_lineup_advanced.season,
            team_lineup_advanced.created_at,
            team_lineup_advanced.updated_at,
            team_lineup_advanced.row_id,
            team_lineup_advanced.season_type,
            row_number() OVER (PARTITION BY team_lineup_advanced.season, team_lineup_advanced.season_type, team_lineup_advanced.teamid, team_lineup_advanced.group_id ORDER BY team_lineup_advanced.created_at DESC) AS rn
           FROM team_lineup_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_lineup_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_lineup_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_id,
    t.group_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_lineup_base._unnamed,
            team_lineup_base.group_set,
            team_lineup_base.group_id,
            team_lineup_base.group_name,
            team_lineup_base.gp,
            team_lineup_base.w,
            team_lineup_base.l,
            team_lineup_base.w_pct,
            team_lineup_base.min,
            team_lineup_base.fgm,
            team_lineup_base.fga,
            team_lineup_base.fg_pct,
            team_lineup_base.fg3m,
            team_lineup_base.fg3a,
            team_lineup_base.fg3_pct,
            team_lineup_base.ftm,
            team_lineup_base.fta,
            team_lineup_base.ft_pct,
            team_lineup_base.oreb,
            team_lineup_base.dreb,
            team_lineup_base.reb,
            team_lineup_base.ast,
            team_lineup_base.tov,
            team_lineup_base.stl,
            team_lineup_base.blk,
            team_lineup_base.blka,
            team_lineup_base.pf,
            team_lineup_base.pfd,
            team_lineup_base.pts,
            team_lineup_base.plus_minus,
            team_lineup_base.teamid,
            team_lineup_base.season,
            team_lineup_base.created_at,
            team_lineup_base.updated_at,
            team_lineup_base.row_id,
            team_lineup_base.season_type,
            row_number() OVER (PARTITION BY team_lineup_base.season, team_lineup_base.season_type, team_lineup_base.teamid, team_lineup_base.group_id ORDER BY team_lineup_base.created_at DESC) AS rn
           FROM team_lineup_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_lineup_four_factors; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_lineup_four_factors AS
 SELECT t._unnamed,
    t.group_set,
    t.group_id,
    t.group_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_lineup_four_factors._unnamed,
            team_lineup_four_factors.group_set,
            team_lineup_four_factors.group_id,
            team_lineup_four_factors.group_name,
            team_lineup_four_factors.gp,
            team_lineup_four_factors.w,
            team_lineup_four_factors.l,
            team_lineup_four_factors.w_pct,
            team_lineup_four_factors.min,
            team_lineup_four_factors.efg_pct,
            team_lineup_four_factors.fta_rate,
            team_lineup_four_factors.tm_tov_pct,
            team_lineup_four_factors.oreb_pct,
            team_lineup_four_factors.opp_efg_pct,
            team_lineup_four_factors.opp_fta_rate,
            team_lineup_four_factors.opp_tov_pct,
            team_lineup_four_factors.opp_oreb_pct,
            team_lineup_four_factors.teamid,
            team_lineup_four_factors.season,
            team_lineup_four_factors.created_at,
            team_lineup_four_factors.updated_at,
            team_lineup_four_factors.row_id,
            team_lineup_four_factors.season_type,
            row_number() OVER (PARTITION BY team_lineup_four_factors.season, team_lineup_four_factors.season_type, team_lineup_four_factors.teamid, team_lineup_four_factors.group_id ORDER BY team_lineup_four_factors.created_at DESC) AS rn
           FROM team_lineup_four_factors) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_lineup_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_lineup_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.group_id,
    t.group_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_lineup_misc._unnamed,
            team_lineup_misc.group_set,
            team_lineup_misc.group_id,
            team_lineup_misc.group_name,
            team_lineup_misc.gp,
            team_lineup_misc.w,
            team_lineup_misc.l,
            team_lineup_misc.w_pct,
            team_lineup_misc.min,
            team_lineup_misc.pts_off_tov,
            team_lineup_misc.pts_2nd_chance,
            team_lineup_misc.pts_fb,
            team_lineup_misc.pts_paint,
            team_lineup_misc.opp_pts_off_tov,
            team_lineup_misc.opp_pts_2nd_chance,
            team_lineup_misc.opp_pts_fb,
            team_lineup_misc.opp_pts_paint,
            team_lineup_misc.teamid,
            team_lineup_misc.season,
            team_lineup_misc.created_at,
            team_lineup_misc.updated_at,
            team_lineup_misc.row_id,
            team_lineup_misc.season_type,
            row_number() OVER (PARTITION BY team_lineup_misc.season, team_lineup_misc.season_type, team_lineup_misc.teamid, team_lineup_misc.group_id ORDER BY team_lineup_misc.created_at DESC) AS rn
           FROM team_lineup_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_lineup_opponent; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_lineup_opponent AS
 SELECT t._unnamed,
    t.group_set,
    t.group_id,
    t.group_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.opp_fgm,
    t.opp_fga,
    t.opp_fg_pct,
    t.opp_fg3m,
    t.opp_fg3a,
    t.opp_fg3_pct,
    t.opp_ftm,
    t.opp_fta,
    t.opp_ft_pct,
    t.opp_oreb,
    t.opp_dreb,
    t.opp_reb,
    t.opp_ast,
    t.opp_tov,
    t.opp_stl,
    t.opp_blk,
    t.opp_blka,
    t.opp_pf,
    t.opp_pfd,
    t.opp_pts,
    t.plus_minus,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_lineup_opponent._unnamed,
            team_lineup_opponent.group_set,
            team_lineup_opponent.group_id,
            team_lineup_opponent.group_name,
            team_lineup_opponent.gp,
            team_lineup_opponent.w,
            team_lineup_opponent.l,
            team_lineup_opponent.w_pct,
            team_lineup_opponent.min,
            team_lineup_opponent.opp_fgm,
            team_lineup_opponent.opp_fga,
            team_lineup_opponent.opp_fg_pct,
            team_lineup_opponent.opp_fg3m,
            team_lineup_opponent.opp_fg3a,
            team_lineup_opponent.opp_fg3_pct,
            team_lineup_opponent.opp_ftm,
            team_lineup_opponent.opp_fta,
            team_lineup_opponent.opp_ft_pct,
            team_lineup_opponent.opp_oreb,
            team_lineup_opponent.opp_dreb,
            team_lineup_opponent.opp_reb,
            team_lineup_opponent.opp_ast,
            team_lineup_opponent.opp_tov,
            team_lineup_opponent.opp_stl,
            team_lineup_opponent.opp_blk,
            team_lineup_opponent.opp_blka,
            team_lineup_opponent.opp_pf,
            team_lineup_opponent.opp_pfd,
            team_lineup_opponent.opp_pts,
            team_lineup_opponent.plus_minus,
            team_lineup_opponent.teamid,
            team_lineup_opponent.season,
            team_lineup_opponent.created_at,
            team_lineup_opponent.updated_at,
            team_lineup_opponent.row_id,
            team_lineup_opponent.season_type,
            row_number() OVER (PARTITION BY team_lineup_opponent.season, team_lineup_opponent.season_type, team_lineup_opponent.teamid, team_lineup_opponent.group_id ORDER BY team_lineup_opponent.created_at DESC) AS rn
           FROM team_lineup_opponent) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_lineup_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_lineup_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.group_id,
    t.group_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_lineup_scoring._unnamed,
            team_lineup_scoring.group_set,
            team_lineup_scoring.group_id,
            team_lineup_scoring.group_name,
            team_lineup_scoring.gp,
            team_lineup_scoring.w,
            team_lineup_scoring.l,
            team_lineup_scoring.w_pct,
            team_lineup_scoring.min,
            team_lineup_scoring.pct_fga_2pt,
            team_lineup_scoring.pct_fga_3pt,
            team_lineup_scoring.pct_pts_2pt,
            team_lineup_scoring.pct_pts_2pt_mr,
            team_lineup_scoring.pct_pts_3pt,
            team_lineup_scoring.pct_pts_fb,
            team_lineup_scoring.pct_pts_ft,
            team_lineup_scoring.pct_pts_off_tov,
            team_lineup_scoring.pct_pts_paint,
            team_lineup_scoring.pct_ast_2pm,
            team_lineup_scoring.pct_uast_2pm,
            team_lineup_scoring.pct_ast_3pm,
            team_lineup_scoring.pct_uast_3pm,
            team_lineup_scoring.pct_ast_fgm,
            team_lineup_scoring.pct_uast_fgm,
            team_lineup_scoring.teamid,
            team_lineup_scoring.season,
            team_lineup_scoring.created_at,
            team_lineup_scoring.updated_at,
            team_lineup_scoring.row_id,
            team_lineup_scoring.season_type,
            row_number() OVER (PARTITION BY team_lineup_scoring.season, team_lineup_scoring.season_type, team_lineup_scoring.teamid, team_lineup_scoring.group_id ORDER BY team_lineup_scoring.created_at DESC) AS rn
           FROM team_lineup_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.player_id,
    t.player_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.fgm,
    t.fga,
    t.fgm_pg,
    t.fga_pg,
    t.fg_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_advanced._unnamed,
            team_player_advanced.group_set,
            team_player_advanced.player_id,
            team_player_advanced.player_name,
            team_player_advanced.gp,
            team_player_advanced.w,
            team_player_advanced.l,
            team_player_advanced.w_pct,
            team_player_advanced.min,
            team_player_advanced.off_rating,
            team_player_advanced.def_rating,
            team_player_advanced.net_rating,
            team_player_advanced.ast_pct,
            team_player_advanced.ast_to,
            team_player_advanced.ast_ratio,
            team_player_advanced.oreb_pct,
            team_player_advanced.dreb_pct,
            team_player_advanced.reb_pct,
            team_player_advanced.tm_tov_pct,
            team_player_advanced.efg_pct,
            team_player_advanced.ts_pct,
            team_player_advanced.usg_pct,
            team_player_advanced.pace,
            team_player_advanced.pie,
            team_player_advanced.fgm,
            team_player_advanced.fga,
            team_player_advanced.fgm_pg,
            team_player_advanced.fga_pg,
            team_player_advanced.fg_pct,
            team_player_advanced.teamid,
            team_player_advanced.season,
            team_player_advanced.created_at,
            team_player_advanced.updated_at,
            team_player_advanced.row_id,
            team_player_advanced.season_type,
            row_number() OVER (PARTITION BY team_player_advanced.season, team_player_advanced.season_type, team_player_advanced.teamid, team_player_advanced.player_id ORDER BY team_player_advanced.created_at DESC) AS rn
           FROM team_player_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_base AS
 SELECT t._unnamed,
    t.group_set,
    t.player_id,
    t.player_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.dd2,
    t.td3,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_base._unnamed,
            team_player_base.group_set,
            team_player_base.player_id,
            team_player_base.player_name,
            team_player_base.gp,
            team_player_base.w,
            team_player_base.l,
            team_player_base.w_pct,
            team_player_base.min,
            team_player_base.fgm,
            team_player_base.fga,
            team_player_base.fg_pct,
            team_player_base.fg3m,
            team_player_base.fg3a,
            team_player_base.fg3_pct,
            team_player_base.ftm,
            team_player_base.fta,
            team_player_base.ft_pct,
            team_player_base.oreb,
            team_player_base.dreb,
            team_player_base.reb,
            team_player_base.ast,
            team_player_base.tov,
            team_player_base.stl,
            team_player_base.blk,
            team_player_base.blka,
            team_player_base.pf,
            team_player_base.pfd,
            team_player_base.pts,
            team_player_base.plus_minus,
            team_player_base.dd2,
            team_player_base.td3,
            team_player_base.teamid,
            team_player_base.season,
            team_player_base.created_at,
            team_player_base.updated_at,
            team_player_base.row_id,
            team_player_base.season_type,
            row_number() OVER (PARTITION BY team_player_base.season, team_player_base.season_type, team_player_base.teamid, team_player_base.player_id ORDER BY team_player_base.created_at DESC) AS rn
           FROM team_player_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_off_sum_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_off_sum_base AS
 SELECT t._unnamed,
    t.group_set,
    t.team_id,
    t.team_abbreviation,
    t.team_name,
    t.vs_player_id,
    t.vs_player_name,
    t.court_status,
    t.gp,
    t.min,
    t.plus_minus,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_off_sum_base._unnamed,
            team_player_off_sum_base.group_set,
            team_player_off_sum_base.team_id,
            team_player_off_sum_base.team_abbreviation,
            team_player_off_sum_base.team_name,
            team_player_off_sum_base.vs_player_id,
            team_player_off_sum_base.vs_player_name,
            team_player_off_sum_base.court_status,
            team_player_off_sum_base.gp,
            team_player_off_sum_base.min,
            team_player_off_sum_base.plus_minus,
            team_player_off_sum_base.off_rating,
            team_player_off_sum_base.def_rating,
            team_player_off_sum_base.net_rating,
            team_player_off_sum_base.teamid,
            team_player_off_sum_base.season,
            team_player_off_sum_base.created_at,
            team_player_off_sum_base.updated_at,
            team_player_off_sum_base.row_id,
            team_player_off_sum_base.season_type,
            row_number() OVER (PARTITION BY team_player_off_sum_base.season, team_player_off_sum_base.season_type, team_player_off_sum_base.teamid, team_player_off_sum_base.vs_player_id ORDER BY team_player_off_sum_base.created_at DESC) AS rn
           FROM team_player_off_sum_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_on_off_advanced; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_on_off_advanced AS
 SELECT t._unnamed,
    t.group_set,
    t.team_id,
    t.team_abbreviation,
    t.team_name,
    t.vs_player_id,
    t.vs_player_name,
    t.court_status,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.pace,
    t.pie,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_on_off_advanced._unnamed,
            team_player_on_off_advanced.group_set,
            team_player_on_off_advanced.team_id,
            team_player_on_off_advanced.team_abbreviation,
            team_player_on_off_advanced.team_name,
            team_player_on_off_advanced.vs_player_id,
            team_player_on_off_advanced.vs_player_name,
            team_player_on_off_advanced.court_status,
            team_player_on_off_advanced.gp,
            team_player_on_off_advanced.w,
            team_player_on_off_advanced.l,
            team_player_on_off_advanced.w_pct,
            team_player_on_off_advanced.min,
            team_player_on_off_advanced.off_rating,
            team_player_on_off_advanced.def_rating,
            team_player_on_off_advanced.net_rating,
            team_player_on_off_advanced.ast_pct,
            team_player_on_off_advanced.ast_to,
            team_player_on_off_advanced.ast_ratio,
            team_player_on_off_advanced.oreb_pct,
            team_player_on_off_advanced.dreb_pct,
            team_player_on_off_advanced.reb_pct,
            team_player_on_off_advanced.tm_tov_pct,
            team_player_on_off_advanced.efg_pct,
            team_player_on_off_advanced.ts_pct,
            team_player_on_off_advanced.pace,
            team_player_on_off_advanced.pie,
            team_player_on_off_advanced.teamid,
            team_player_on_off_advanced.season,
            team_player_on_off_advanced.created_at,
            team_player_on_off_advanced.updated_at,
            team_player_on_off_advanced.row_id,
            team_player_on_off_advanced.season_type,
            row_number() OVER (PARTITION BY team_player_on_off_advanced.season, team_player_on_off_advanced.season_type, team_player_on_off_advanced.teamid, team_player_on_off_advanced.vs_player_id ORDER BY team_player_on_off_advanced.created_at DESC) AS rn
           FROM team_player_on_off_advanced) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_on_off_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_on_off_base AS
 SELECT t._unnamed,
    t.group_set,
    t.team_id,
    t.team_abbreviation,
    t.team_name,
    t.vs_player_id,
    t.vs_player_name,
    t.court_status,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_on_off_base._unnamed,
            team_player_on_off_base.group_set,
            team_player_on_off_base.team_id,
            team_player_on_off_base.team_abbreviation,
            team_player_on_off_base.team_name,
            team_player_on_off_base.vs_player_id,
            team_player_on_off_base.vs_player_name,
            team_player_on_off_base.court_status,
            team_player_on_off_base.gp,
            team_player_on_off_base.w,
            team_player_on_off_base.l,
            team_player_on_off_base.w_pct,
            team_player_on_off_base.min,
            team_player_on_off_base.fgm,
            team_player_on_off_base.fga,
            team_player_on_off_base.fg_pct,
            team_player_on_off_base.fg3m,
            team_player_on_off_base.fg3a,
            team_player_on_off_base.fg3_pct,
            team_player_on_off_base.ftm,
            team_player_on_off_base.fta,
            team_player_on_off_base.ft_pct,
            team_player_on_off_base.oreb,
            team_player_on_off_base.dreb,
            team_player_on_off_base.reb,
            team_player_on_off_base.ast,
            team_player_on_off_base.tov,
            team_player_on_off_base.stl,
            team_player_on_off_base.blk,
            team_player_on_off_base.blka,
            team_player_on_off_base.pf,
            team_player_on_off_base.pfd,
            team_player_on_off_base.pts,
            team_player_on_off_base.plus_minus,
            team_player_on_off_base.teamid,
            team_player_on_off_base.season,
            team_player_on_off_base.created_at,
            team_player_on_off_base.updated_at,
            team_player_on_off_base.row_id,
            team_player_on_off_base.season_type,
            row_number() OVER (PARTITION BY team_player_on_off_base.season, team_player_on_off_base.season_type, team_player_on_off_base.teamid, team_player_on_off_base.vs_player_id ORDER BY team_player_on_off_base.created_at DESC) AS rn
           FROM team_player_on_off_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_on_off_four_factors; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_on_off_four_factors AS
 SELECT t._unnamed,
    t.group_set,
    t.team_id,
    t.team_abbreviation,
    t.team_name,
    t.vs_player_id,
    t.vs_player_name,
    t.court_status,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.efg_pct,
    t.fta_rate,
    t.tm_tov_pct,
    t.oreb_pct,
    t.opp_efg_pct,
    t.opp_fta_rate,
    t.opp_tov_pct,
    t.opp_oreb_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_on_off_four_factors._unnamed,
            team_player_on_off_four_factors.group_set,
            team_player_on_off_four_factors.team_id,
            team_player_on_off_four_factors.team_abbreviation,
            team_player_on_off_four_factors.team_name,
            team_player_on_off_four_factors.vs_player_id,
            team_player_on_off_four_factors.vs_player_name,
            team_player_on_off_four_factors.court_status,
            team_player_on_off_four_factors.gp,
            team_player_on_off_four_factors.w,
            team_player_on_off_four_factors.l,
            team_player_on_off_four_factors.w_pct,
            team_player_on_off_four_factors.min,
            team_player_on_off_four_factors.efg_pct,
            team_player_on_off_four_factors.fta_rate,
            team_player_on_off_four_factors.tm_tov_pct,
            team_player_on_off_four_factors.oreb_pct,
            team_player_on_off_four_factors.opp_efg_pct,
            team_player_on_off_four_factors.opp_fta_rate,
            team_player_on_off_four_factors.opp_tov_pct,
            team_player_on_off_four_factors.opp_oreb_pct,
            team_player_on_off_four_factors.teamid,
            team_player_on_off_four_factors.season,
            team_player_on_off_four_factors.created_at,
            team_player_on_off_four_factors.updated_at,
            team_player_on_off_four_factors.row_id,
            team_player_on_off_four_factors.season_type,
            row_number() OVER (PARTITION BY team_player_on_off_four_factors.season, team_player_on_off_four_factors.season_type, team_player_on_off_four_factors.teamid, team_player_on_off_four_factors.vs_player_id ORDER BY team_player_on_off_four_factors.created_at DESC) AS rn
           FROM team_player_on_off_four_factors) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_on_off_misc; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_on_off_misc AS
 SELECT t._unnamed,
    t.group_set,
    t.team_id,
    t.team_abbreviation,
    t.team_name,
    t.vs_player_id,
    t.vs_player_name,
    t.court_status,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pts_off_tov,
    t.pts_2nd_chance,
    t.pts_fb,
    t.pts_paint,
    t.opp_pts_off_tov,
    t.opp_pts_2nd_chance,
    t.opp_pts_fb,
    t.opp_pts_paint,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_on_off_misc._unnamed,
            team_player_on_off_misc.group_set,
            team_player_on_off_misc.team_id,
            team_player_on_off_misc.team_abbreviation,
            team_player_on_off_misc.team_name,
            team_player_on_off_misc.vs_player_id,
            team_player_on_off_misc.vs_player_name,
            team_player_on_off_misc.court_status,
            team_player_on_off_misc.gp,
            team_player_on_off_misc.w,
            team_player_on_off_misc.l,
            team_player_on_off_misc.w_pct,
            team_player_on_off_misc.min,
            team_player_on_off_misc.pts_off_tov,
            team_player_on_off_misc.pts_2nd_chance,
            team_player_on_off_misc.pts_fb,
            team_player_on_off_misc.pts_paint,
            team_player_on_off_misc.opp_pts_off_tov,
            team_player_on_off_misc.opp_pts_2nd_chance,
            team_player_on_off_misc.opp_pts_fb,
            team_player_on_off_misc.opp_pts_paint,
            team_player_on_off_misc.teamid,
            team_player_on_off_misc.season,
            team_player_on_off_misc.created_at,
            team_player_on_off_misc.updated_at,
            team_player_on_off_misc.row_id,
            team_player_on_off_misc.season_type,
            row_number() OVER (PARTITION BY team_player_on_off_misc.season, team_player_on_off_misc.season_type, team_player_on_off_misc.teamid, team_player_on_off_misc.vs_player_id ORDER BY team_player_on_off_misc.created_at DESC) AS rn
           FROM team_player_on_off_misc) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_on_off_opponent; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_on_off_opponent AS
 SELECT t._unnamed,
    t.group_set,
    t.team_id,
    t.team_abbreviation,
    t.team_name,
    t.vs_player_id,
    t.vs_player_name,
    t.court_status,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.opp_fgm,
    t.opp_fga,
    t.opp_fg_pct,
    t.opp_fg3m,
    t.opp_fg3a,
    t.opp_fg3_pct,
    t.opp_ftm,
    t.opp_fta,
    t.opp_ft_pct,
    t.opp_oreb,
    t.opp_dreb,
    t.opp_reb,
    t.opp_ast,
    t.opp_tov,
    t.opp_stl,
    t.opp_blk,
    t.opp_blka,
    t.opp_pf,
    t.opp_pfd,
    t.opp_pts,
    t.plus_minus,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_on_off_opponent._unnamed,
            team_player_on_off_opponent.group_set,
            team_player_on_off_opponent.team_id,
            team_player_on_off_opponent.team_abbreviation,
            team_player_on_off_opponent.team_name,
            team_player_on_off_opponent.vs_player_id,
            team_player_on_off_opponent.vs_player_name,
            team_player_on_off_opponent.court_status,
            team_player_on_off_opponent.gp,
            team_player_on_off_opponent.w,
            team_player_on_off_opponent.l,
            team_player_on_off_opponent.w_pct,
            team_player_on_off_opponent.min,
            team_player_on_off_opponent.opp_fgm,
            team_player_on_off_opponent.opp_fga,
            team_player_on_off_opponent.opp_fg_pct,
            team_player_on_off_opponent.opp_fg3m,
            team_player_on_off_opponent.opp_fg3a,
            team_player_on_off_opponent.opp_fg3_pct,
            team_player_on_off_opponent.opp_ftm,
            team_player_on_off_opponent.opp_fta,
            team_player_on_off_opponent.opp_ft_pct,
            team_player_on_off_opponent.opp_oreb,
            team_player_on_off_opponent.opp_dreb,
            team_player_on_off_opponent.opp_reb,
            team_player_on_off_opponent.opp_ast,
            team_player_on_off_opponent.opp_tov,
            team_player_on_off_opponent.opp_stl,
            team_player_on_off_opponent.opp_blk,
            team_player_on_off_opponent.opp_blka,
            team_player_on_off_opponent.opp_pf,
            team_player_on_off_opponent.opp_pfd,
            team_player_on_off_opponent.opp_pts,
            team_player_on_off_opponent.plus_minus,
            team_player_on_off_opponent.teamid,
            team_player_on_off_opponent.season,
            team_player_on_off_opponent.created_at,
            team_player_on_off_opponent.updated_at,
            team_player_on_off_opponent.row_id,
            team_player_on_off_opponent.season_type,
            row_number() OVER (PARTITION BY team_player_on_off_opponent.season, team_player_on_off_opponent.season_type, team_player_on_off_opponent.teamid, team_player_on_off_opponent.vs_player_id ORDER BY team_player_on_off_opponent.created_at DESC) AS rn
           FROM team_player_on_off_opponent) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_on_off_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_on_off_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.team_id,
    t.team_abbreviation,
    t.team_name,
    t.vs_player_id,
    t.vs_player_name,
    t.court_status,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.pct_fga_2pt,
    t.pct_fga_3pt,
    t.pct_pts_2pt,
    t.pct_pts_2pt_mr,
    t.pct_pts_3pt,
    t.pct_pts_fb,
    t.pct_pts_ft,
    t.pct_pts_off_tov,
    t.pct_pts_paint,
    t.pct_ast_2pm,
    t.pct_uast_2pm,
    t.pct_ast_3pm,
    t.pct_uast_3pm,
    t.pct_ast_fgm,
    t.pct_uast_fgm,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_on_off_scoring._unnamed,
            team_player_on_off_scoring.group_set,
            team_player_on_off_scoring.team_id,
            team_player_on_off_scoring.team_abbreviation,
            team_player_on_off_scoring.team_name,
            team_player_on_off_scoring.vs_player_id,
            team_player_on_off_scoring.vs_player_name,
            team_player_on_off_scoring.court_status,
            team_player_on_off_scoring.gp,
            team_player_on_off_scoring.w,
            team_player_on_off_scoring.l,
            team_player_on_off_scoring.w_pct,
            team_player_on_off_scoring.min,
            team_player_on_off_scoring.pct_fga_2pt,
            team_player_on_off_scoring.pct_fga_3pt,
            team_player_on_off_scoring.pct_pts_2pt,
            team_player_on_off_scoring.pct_pts_2pt_mr,
            team_player_on_off_scoring.pct_pts_3pt,
            team_player_on_off_scoring.pct_pts_fb,
            team_player_on_off_scoring.pct_pts_ft,
            team_player_on_off_scoring.pct_pts_off_tov,
            team_player_on_off_scoring.pct_pts_paint,
            team_player_on_off_scoring.pct_ast_2pm,
            team_player_on_off_scoring.pct_uast_2pm,
            team_player_on_off_scoring.pct_ast_3pm,
            team_player_on_off_scoring.pct_uast_3pm,
            team_player_on_off_scoring.pct_ast_fgm,
            team_player_on_off_scoring.pct_uast_fgm,
            team_player_on_off_scoring.teamid,
            team_player_on_off_scoring.season,
            team_player_on_off_scoring.created_at,
            team_player_on_off_scoring.updated_at,
            team_player_on_off_scoring.row_id,
            team_player_on_off_scoring.season_type,
            row_number() OVER (PARTITION BY team_player_on_off_scoring.season, team_player_on_off_scoring.season_type, team_player_on_off_scoring.teamid, team_player_on_off_scoring.vs_player_id ORDER BY team_player_on_off_scoring.created_at DESC) AS rn
           FROM team_player_on_off_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_on_sum_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_on_sum_base AS
 SELECT t._unnamed,
    t.group_set,
    t.team_id,
    t.team_abbreviation,
    t.team_name,
    t.vs_player_id,
    t.vs_player_name,
    t.court_status,
    t.gp,
    t.min,
    t.plus_minus,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_on_sum_base._unnamed,
            team_player_on_sum_base.group_set,
            team_player_on_sum_base.team_id,
            team_player_on_sum_base.team_abbreviation,
            team_player_on_sum_base.team_name,
            team_player_on_sum_base.vs_player_id,
            team_player_on_sum_base.vs_player_name,
            team_player_on_sum_base.court_status,
            team_player_on_sum_base.gp,
            team_player_on_sum_base.min,
            team_player_on_sum_base.plus_minus,
            team_player_on_sum_base.off_rating,
            team_player_on_sum_base.def_rating,
            team_player_on_sum_base.net_rating,
            team_player_on_sum_base.teamid,
            team_player_on_sum_base.season,
            team_player_on_sum_base.created_at,
            team_player_on_sum_base.updated_at,
            team_player_on_sum_base.row_id,
            team_player_on_sum_base.season_type,
            row_number() OVER (PARTITION BY team_player_on_sum_base.season, team_player_on_sum_base.season_type, team_player_on_sum_base.teamid, team_player_on_sum_base.vs_player_id ORDER BY team_player_on_sum_base.created_at DESC) AS rn
           FROM team_player_on_sum_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_passes_made; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_passes_made AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.pass_type,
    t.g,
    t.pass_from,
    t.pass_teammate_player_id,
    t.frequency,
    t.pass,
    t.ast,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_passes_made._unnamed,
            team_player_passes_made.team_id,
            team_player_passes_made.team_name,
            team_player_passes_made.pass_type,
            team_player_passes_made.g,
            team_player_passes_made.pass_from,
            team_player_passes_made.pass_teammate_player_id,
            team_player_passes_made.frequency,
            team_player_passes_made.pass,
            team_player_passes_made.ast,
            team_player_passes_made.fgm,
            team_player_passes_made.fga,
            team_player_passes_made.fg_pct,
            team_player_passes_made.fg2m,
            team_player_passes_made.fg2a,
            team_player_passes_made.fg2_pct,
            team_player_passes_made.fg3m,
            team_player_passes_made.fg3a,
            team_player_passes_made.fg3_pct,
            team_player_passes_made.teamid,
            team_player_passes_made.season,
            team_player_passes_made.created_at,
            team_player_passes_made.updated_at,
            team_player_passes_made.row_id,
            team_player_passes_made.season_type,
            row_number() OVER (PARTITION BY team_player_passes_made.season, team_player_passes_made.season_type, team_player_passes_made.teamid, team_player_passes_made.pass_teammate_player_id ORDER BY team_player_passes_made.created_at DESC) AS rn
           FROM team_player_passes_made) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_passes_rcvd; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_passes_rcvd AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.pass_type,
    t.g,
    t.pass_to,
    t.pass_teammate_player_id,
    t.frequency,
    t.pass,
    t.ast,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_passes_rcvd._unnamed,
            team_player_passes_rcvd.team_id,
            team_player_passes_rcvd.team_name,
            team_player_passes_rcvd.pass_type,
            team_player_passes_rcvd.g,
            team_player_passes_rcvd.pass_to,
            team_player_passes_rcvd.pass_teammate_player_id,
            team_player_passes_rcvd.frequency,
            team_player_passes_rcvd.pass,
            team_player_passes_rcvd.ast,
            team_player_passes_rcvd.fgm,
            team_player_passes_rcvd.fga,
            team_player_passes_rcvd.fg_pct,
            team_player_passes_rcvd.fg2m,
            team_player_passes_rcvd.fg2a,
            team_player_passes_rcvd.fg2_pct,
            team_player_passes_rcvd.fg3m,
            team_player_passes_rcvd.fg3a,
            team_player_passes_rcvd.fg3_pct,
            team_player_passes_rcvd.teamid,
            team_player_passes_rcvd.season,
            team_player_passes_rcvd.created_at,
            team_player_passes_rcvd.updated_at,
            team_player_passes_rcvd.row_id,
            team_player_passes_rcvd.season_type,
            row_number() OVER (PARTITION BY team_player_passes_rcvd.season, team_player_passes_rcvd.season_type, team_player_passes_rcvd.teamid, team_player_passes_rcvd.pass_teammate_player_id ORDER BY team_player_passes_rcvd.created_at DESC) AS rn
           FROM team_player_passes_rcvd) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_scoring; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_scoring AS
 SELECT t._unnamed,
    t.group_set,
    t.player_id,
    t.player_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.off_rating,
    t.def_rating,
    t.net_rating,
    t.ast_pct,
    t.ast_to,
    t.ast_ratio,
    t.oreb_pct,
    t.dreb_pct,
    t.reb_pct,
    t.tm_tov_pct,
    t.efg_pct,
    t.ts_pct,
    t.usg_pct,
    t.pace,
    t.pie,
    t.fgm,
    t.fga,
    t.fgm_pg,
    t.fga_pg,
    t.fg_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_scoring._unnamed,
            team_player_scoring.group_set,
            team_player_scoring.player_id,
            team_player_scoring.player_name,
            team_player_scoring.gp,
            team_player_scoring.w,
            team_player_scoring.l,
            team_player_scoring.w_pct,
            team_player_scoring.min,
            team_player_scoring.off_rating,
            team_player_scoring.def_rating,
            team_player_scoring.net_rating,
            team_player_scoring.ast_pct,
            team_player_scoring.ast_to,
            team_player_scoring.ast_ratio,
            team_player_scoring.oreb_pct,
            team_player_scoring.dreb_pct,
            team_player_scoring.reb_pct,
            team_player_scoring.tm_tov_pct,
            team_player_scoring.efg_pct,
            team_player_scoring.ts_pct,
            team_player_scoring.usg_pct,
            team_player_scoring.pace,
            team_player_scoring.pie,
            team_player_scoring.fgm,
            team_player_scoring.fga,
            team_player_scoring.fgm_pg,
            team_player_scoring.fga_pg,
            team_player_scoring.fg_pct,
            team_player_scoring.teamid,
            team_player_scoring.season,
            team_player_scoring.created_at,
            team_player_scoring.updated_at,
            team_player_scoring.row_id,
            team_player_scoring.season_type,
            row_number() OVER (PARTITION BY team_player_scoring.season, team_player_scoring.season_type, team_player_scoring.player_id ORDER BY team_player_scoring.created_at DESC) AS rn
           FROM team_player_scoring) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_player_usage; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_player_usage AS
 SELECT t._unnamed,
    t.group_set,
    t.player_id,
    t.player_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.usg_pct,
    t.pct_fgm,
    t.pct_fga,
    t.pct_fg3m,
    t.pct_fg3a,
    t.pct_ftm,
    t.pct_fta,
    t.pct_oreb,
    t.pct_dreb,
    t.pct_reb,
    t.pct_ast,
    t.pct_tov,
    t.pct_stl,
    t.pct_blk,
    t.pct_blka,
    t.pct_pf,
    t.pct_pfd,
    t.pct_pts,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_player_usage._unnamed,
            team_player_usage.group_set,
            team_player_usage.player_id,
            team_player_usage.player_name,
            team_player_usage.gp,
            team_player_usage.w,
            team_player_usage.l,
            team_player_usage.w_pct,
            team_player_usage.min,
            team_player_usage.usg_pct,
            team_player_usage.pct_fgm,
            team_player_usage.pct_fga,
            team_player_usage.pct_fg3m,
            team_player_usage.pct_fg3a,
            team_player_usage.pct_ftm,
            team_player_usage.pct_fta,
            team_player_usage.pct_oreb,
            team_player_usage.pct_dreb,
            team_player_usage.pct_reb,
            team_player_usage.pct_ast,
            team_player_usage.pct_tov,
            team_player_usage.pct_stl,
            team_player_usage.pct_blk,
            team_player_usage.pct_blka,
            team_player_usage.pct_pf,
            team_player_usage.pct_pfd,
            team_player_usage.pct_pts,
            team_player_usage.teamid,
            team_player_usage.season,
            team_player_usage.created_at,
            team_player_usage.updated_at,
            team_player_usage.row_id,
            team_player_usage.season_type,
            row_number() OVER (PARTITION BY team_player_usage.season, team_player_usage.season_type, team_player_usage.player_id ORDER BY team_player_usage.created_at DESC) AS rn
           FROM team_player_usage) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_reb_trck_num_contested; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_reb_trck_num_contested AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.reb_num_contesting_range,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_reb_trck_num_contested._unnamed,
            team_reb_trck_num_contested.team_id,
            team_reb_trck_num_contested.team_name,
            team_reb_trck_num_contested.sort_order,
            team_reb_trck_num_contested.g,
            team_reb_trck_num_contested.reb_num_contesting_range,
            team_reb_trck_num_contested.reb_frequency,
            team_reb_trck_num_contested.oreb,
            team_reb_trck_num_contested.dreb,
            team_reb_trck_num_contested.reb,
            team_reb_trck_num_contested.c_oreb,
            team_reb_trck_num_contested.c_dreb,
            team_reb_trck_num_contested.c_reb,
            team_reb_trck_num_contested.c_reb_pct,
            team_reb_trck_num_contested.uc_oreb,
            team_reb_trck_num_contested.uc_dreb,
            team_reb_trck_num_contested.uc_reb,
            team_reb_trck_num_contested.uc_reb_pct,
            team_reb_trck_num_contested.teamid,
            team_reb_trck_num_contested.season,
            team_reb_trck_num_contested.created_at,
            team_reb_trck_num_contested.updated_at,
            team_reb_trck_num_contested.row_id,
            team_reb_trck_num_contested.season_type,
            row_number() OVER (PARTITION BY team_reb_trck_num_contested.season, team_reb_trck_num_contested.season_type, team_reb_trck_num_contested.team_id, team_reb_trck_num_contested.reb_num_contesting_range ORDER BY team_reb_trck_num_contested.created_at DESC) AS rn
           FROM team_reb_trck_num_contested) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_reb_trck_overall; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_reb_trck_overall AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.g,
    t.overall,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_reb_trck_overall._unnamed,
            team_reb_trck_overall.team_id,
            team_reb_trck_overall.team_name,
            team_reb_trck_overall.g,
            team_reb_trck_overall.overall,
            team_reb_trck_overall.reb_frequency,
            team_reb_trck_overall.oreb,
            team_reb_trck_overall.dreb,
            team_reb_trck_overall.reb,
            team_reb_trck_overall.c_oreb,
            team_reb_trck_overall.c_dreb,
            team_reb_trck_overall.c_reb,
            team_reb_trck_overall.c_reb_pct,
            team_reb_trck_overall.uc_oreb,
            team_reb_trck_overall.uc_dreb,
            team_reb_trck_overall.uc_reb,
            team_reb_trck_overall.uc_reb_pct,
            team_reb_trck_overall.teamid,
            team_reb_trck_overall.season,
            team_reb_trck_overall.created_at,
            team_reb_trck_overall.updated_at,
            team_reb_trck_overall.row_id,
            team_reb_trck_overall.season_type,
            row_number() OVER (PARTITION BY team_reb_trck_overall.season, team_reb_trck_overall.season_type, team_reb_trck_overall.team_id ORDER BY team_reb_trck_overall.created_at DESC) AS rn
           FROM team_reb_trck_overall) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_reb_trck_reb_dist; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_reb_trck_reb_dist AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.reb_dist_range,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_reb_trck_reb_dist._unnamed,
            team_reb_trck_reb_dist.team_id,
            team_reb_trck_reb_dist.team_name,
            team_reb_trck_reb_dist.sort_order,
            team_reb_trck_reb_dist.g,
            team_reb_trck_reb_dist.reb_dist_range,
            team_reb_trck_reb_dist.reb_frequency,
            team_reb_trck_reb_dist.oreb,
            team_reb_trck_reb_dist.dreb,
            team_reb_trck_reb_dist.reb,
            team_reb_trck_reb_dist.c_oreb,
            team_reb_trck_reb_dist.c_dreb,
            team_reb_trck_reb_dist.c_reb,
            team_reb_trck_reb_dist.c_reb_pct,
            team_reb_trck_reb_dist.uc_oreb,
            team_reb_trck_reb_dist.uc_dreb,
            team_reb_trck_reb_dist.uc_reb,
            team_reb_trck_reb_dist.uc_reb_pct,
            team_reb_trck_reb_dist.teamid,
            team_reb_trck_reb_dist.season,
            team_reb_trck_reb_dist.created_at,
            team_reb_trck_reb_dist.updated_at,
            team_reb_trck_reb_dist.row_id,
            team_reb_trck_reb_dist.season_type,
            row_number() OVER (PARTITION BY team_reb_trck_reb_dist.season, team_reb_trck_reb_dist.season_type, team_reb_trck_reb_dist.team_id, team_reb_trck_reb_dist.reb_dist_range ORDER BY team_reb_trck_reb_dist.created_at DESC) AS rn
           FROM team_reb_trck_reb_dist) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_reb_trck_shot_dist; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_reb_trck_shot_dist AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.shot_dist_range,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_reb_trck_shot_dist._unnamed,
            team_reb_trck_shot_dist.team_id,
            team_reb_trck_shot_dist.team_name,
            team_reb_trck_shot_dist.sort_order,
            team_reb_trck_shot_dist.g,
            team_reb_trck_shot_dist.shot_dist_range,
            team_reb_trck_shot_dist.reb_frequency,
            team_reb_trck_shot_dist.oreb,
            team_reb_trck_shot_dist.dreb,
            team_reb_trck_shot_dist.reb,
            team_reb_trck_shot_dist.c_oreb,
            team_reb_trck_shot_dist.c_dreb,
            team_reb_trck_shot_dist.c_reb,
            team_reb_trck_shot_dist.c_reb_pct,
            team_reb_trck_shot_dist.uc_oreb,
            team_reb_trck_shot_dist.uc_dreb,
            team_reb_trck_shot_dist.uc_reb,
            team_reb_trck_shot_dist.uc_reb_pct,
            team_reb_trck_shot_dist.teamid,
            team_reb_trck_shot_dist.season,
            team_reb_trck_shot_dist.created_at,
            team_reb_trck_shot_dist.updated_at,
            team_reb_trck_shot_dist.row_id,
            team_reb_trck_shot_dist.season_type,
            row_number() OVER (PARTITION BY team_reb_trck_shot_dist.season, team_reb_trck_shot_dist.season_type, team_reb_trck_shot_dist.team_id, team_reb_trck_shot_dist.shot_dist_range ORDER BY team_reb_trck_shot_dist.created_at DESC) AS rn
           FROM team_reb_trck_shot_dist) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_reb_trck_shot_type; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_reb_trck_shot_type AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.shot_type_range,
    t.reb_frequency,
    t.oreb,
    t.dreb,
    t.reb,
    t.c_oreb,
    t.c_dreb,
    t.c_reb,
    t.c_reb_pct,
    t.uc_oreb,
    t.uc_dreb,
    t.uc_reb,
    t.uc_reb_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_reb_trck_shot_type._unnamed,
            team_reb_trck_shot_type.team_id,
            team_reb_trck_shot_type.team_name,
            team_reb_trck_shot_type.sort_order,
            team_reb_trck_shot_type.g,
            team_reb_trck_shot_type.shot_type_range,
            team_reb_trck_shot_type.reb_frequency,
            team_reb_trck_shot_type.oreb,
            team_reb_trck_shot_type.dreb,
            team_reb_trck_shot_type.reb,
            team_reb_trck_shot_type.c_oreb,
            team_reb_trck_shot_type.c_dreb,
            team_reb_trck_shot_type.c_reb,
            team_reb_trck_shot_type.c_reb_pct,
            team_reb_trck_shot_type.uc_oreb,
            team_reb_trck_shot_type.uc_dreb,
            team_reb_trck_shot_type.uc_reb,
            team_reb_trck_shot_type.uc_reb_pct,
            team_reb_trck_shot_type.teamid,
            team_reb_trck_shot_type.season,
            team_reb_trck_shot_type.created_at,
            team_reb_trck_shot_type.updated_at,
            team_reb_trck_shot_type.row_id,
            team_reb_trck_shot_type.season_type,
            row_number() OVER (PARTITION BY team_reb_trck_shot_type.shot_type_range ORDER BY team_reb_trck_shot_type.created_at DESC) AS rn
           FROM team_reb_trck_shot_type) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shooting_days_rest_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shooting_days_rest_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_days_rest_range,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shooting_days_rest_base._unnamed,
            team_shooting_days_rest_base.group_set,
            team_shooting_days_rest_base.group_value,
            team_shooting_days_rest_base.team_days_rest_range,
            team_shooting_days_rest_base.gp,
            team_shooting_days_rest_base.w,
            team_shooting_days_rest_base.l,
            team_shooting_days_rest_base.w_pct,
            team_shooting_days_rest_base.min,
            team_shooting_days_rest_base.fgm,
            team_shooting_days_rest_base.fga,
            team_shooting_days_rest_base.fg_pct,
            team_shooting_days_rest_base.fg3m,
            team_shooting_days_rest_base.fg3a,
            team_shooting_days_rest_base.fg3_pct,
            team_shooting_days_rest_base.ftm,
            team_shooting_days_rest_base.fta,
            team_shooting_days_rest_base.ft_pct,
            team_shooting_days_rest_base.oreb,
            team_shooting_days_rest_base.dreb,
            team_shooting_days_rest_base.reb,
            team_shooting_days_rest_base.ast,
            team_shooting_days_rest_base.tov,
            team_shooting_days_rest_base.stl,
            team_shooting_days_rest_base.blk,
            team_shooting_days_rest_base.blka,
            team_shooting_days_rest_base.pf,
            team_shooting_days_rest_base.pfd,
            team_shooting_days_rest_base.pts,
            team_shooting_days_rest_base.plus_minus,
            team_shooting_days_rest_base.cfid,
            team_shooting_days_rest_base.cfparams,
            team_shooting_days_rest_base.teamid,
            team_shooting_days_rest_base.season,
            team_shooting_days_rest_base.created_at,
            team_shooting_days_rest_base.updated_at,
            team_shooting_days_rest_base.row_id,
            team_shooting_days_rest_base.season_type,
            row_number() OVER (PARTITION BY team_shooting_days_rest_base.season, team_shooting_days_rest_base.season_type, team_shooting_days_rest_base.teamid, team_shooting_days_rest_base.team_days_rest_range ORDER BY team_shooting_days_rest_base.created_at DESC) AS rn
           FROM team_shooting_days_rest_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shooting_location_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shooting_location_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.team_game_location,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shooting_location_base._unnamed,
            team_shooting_location_base.group_set,
            team_shooting_location_base.group_value,
            team_shooting_location_base.team_game_location,
            team_shooting_location_base.gp,
            team_shooting_location_base.w,
            team_shooting_location_base.l,
            team_shooting_location_base.w_pct,
            team_shooting_location_base.min,
            team_shooting_location_base.fgm,
            team_shooting_location_base.fga,
            team_shooting_location_base.fg_pct,
            team_shooting_location_base.fg3m,
            team_shooting_location_base.fg3a,
            team_shooting_location_base.fg3_pct,
            team_shooting_location_base.ftm,
            team_shooting_location_base.fta,
            team_shooting_location_base.ft_pct,
            team_shooting_location_base.oreb,
            team_shooting_location_base.dreb,
            team_shooting_location_base.reb,
            team_shooting_location_base.ast,
            team_shooting_location_base.tov,
            team_shooting_location_base.stl,
            team_shooting_location_base.blk,
            team_shooting_location_base.blka,
            team_shooting_location_base.pf,
            team_shooting_location_base.pfd,
            team_shooting_location_base.pts,
            team_shooting_location_base.plus_minus,
            team_shooting_location_base.cfid,
            team_shooting_location_base.cfparams,
            team_shooting_location_base.teamid,
            team_shooting_location_base.season,
            team_shooting_location_base.created_at,
            team_shooting_location_base.updated_at,
            team_shooting_location_base.row_id,
            team_shooting_location_base.season_type,
            row_number() OVER (PARTITION BY team_shooting_location_base.season, team_shooting_location_base.season_type, team_shooting_location_base.teamid, team_shooting_location_base.team_game_location ORDER BY team_shooting_location_base.created_at DESC) AS rn
           FROM team_shooting_location_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shooting_month_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shooting_month_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_month_name,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shooting_month_base._unnamed,
            team_shooting_month_base.group_set,
            team_shooting_month_base.group_value,
            team_shooting_month_base.season_month_name,
            team_shooting_month_base.gp,
            team_shooting_month_base.w,
            team_shooting_month_base.l,
            team_shooting_month_base.w_pct,
            team_shooting_month_base.min,
            team_shooting_month_base.fgm,
            team_shooting_month_base.fga,
            team_shooting_month_base.fg_pct,
            team_shooting_month_base.fg3m,
            team_shooting_month_base.fg3a,
            team_shooting_month_base.fg3_pct,
            team_shooting_month_base.ftm,
            team_shooting_month_base.fta,
            team_shooting_month_base.ft_pct,
            team_shooting_month_base.oreb,
            team_shooting_month_base.dreb,
            team_shooting_month_base.reb,
            team_shooting_month_base.ast,
            team_shooting_month_base.tov,
            team_shooting_month_base.stl,
            team_shooting_month_base.blk,
            team_shooting_month_base.blka,
            team_shooting_month_base.pf,
            team_shooting_month_base.pfd,
            team_shooting_month_base.pts,
            team_shooting_month_base.plus_minus,
            team_shooting_month_base.cfid,
            team_shooting_month_base.cfparams,
            team_shooting_month_base.teamid,
            team_shooting_month_base.season,
            team_shooting_month_base.created_at,
            team_shooting_month_base.updated_at,
            team_shooting_month_base.row_id,
            team_shooting_month_base.season_type,
            row_number() OVER (PARTITION BY team_shooting_month_base.season, team_shooting_month_base.season_type, team_shooting_month_base.teamid, team_shooting_month_base.season_month_name ORDER BY team_shooting_month_base.created_at DESC) AS rn
           FROM team_shooting_month_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shooting_overall_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shooting_overall_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_year,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shooting_overall_base._unnamed,
            team_shooting_overall_base.group_set,
            team_shooting_overall_base.group_value,
            team_shooting_overall_base.season_year,
            team_shooting_overall_base.gp,
            team_shooting_overall_base.w,
            team_shooting_overall_base.l,
            team_shooting_overall_base.w_pct,
            team_shooting_overall_base.min,
            team_shooting_overall_base.fgm,
            team_shooting_overall_base.fga,
            team_shooting_overall_base.fg_pct,
            team_shooting_overall_base.fg3m,
            team_shooting_overall_base.fg3a,
            team_shooting_overall_base.fg3_pct,
            team_shooting_overall_base.ftm,
            team_shooting_overall_base.fta,
            team_shooting_overall_base.ft_pct,
            team_shooting_overall_base.oreb,
            team_shooting_overall_base.dreb,
            team_shooting_overall_base.reb,
            team_shooting_overall_base.ast,
            team_shooting_overall_base.tov,
            team_shooting_overall_base.stl,
            team_shooting_overall_base.blk,
            team_shooting_overall_base.blka,
            team_shooting_overall_base.pf,
            team_shooting_overall_base.pfd,
            team_shooting_overall_base.pts,
            team_shooting_overall_base.plus_minus,
            team_shooting_overall_base.cfid,
            team_shooting_overall_base.cfparams,
            team_shooting_overall_base.teamid,
            team_shooting_overall_base.season,
            team_shooting_overall_base.created_at,
            team_shooting_overall_base.updated_at,
            team_shooting_overall_base.row_id,
            team_shooting_overall_base.season_type,
            row_number() OVER (PARTITION BY team_shooting_overall_base.season, team_shooting_overall_base.season_type, team_shooting_overall_base.teamid ORDER BY team_shooting_overall_base.created_at DESC) AS rn
           FROM team_shooting_overall_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shooting_prepost_allstar_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shooting_prepost_allstar_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.season_segment,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shooting_prepost_allstar_base._unnamed,
            team_shooting_prepost_allstar_base.group_set,
            team_shooting_prepost_allstar_base.group_value,
            team_shooting_prepost_allstar_base.season_segment,
            team_shooting_prepost_allstar_base.gp,
            team_shooting_prepost_allstar_base.w,
            team_shooting_prepost_allstar_base.l,
            team_shooting_prepost_allstar_base.w_pct,
            team_shooting_prepost_allstar_base.min,
            team_shooting_prepost_allstar_base.fgm,
            team_shooting_prepost_allstar_base.fga,
            team_shooting_prepost_allstar_base.fg_pct,
            team_shooting_prepost_allstar_base.fg3m,
            team_shooting_prepost_allstar_base.fg3a,
            team_shooting_prepost_allstar_base.fg3_pct,
            team_shooting_prepost_allstar_base.ftm,
            team_shooting_prepost_allstar_base.fta,
            team_shooting_prepost_allstar_base.ft_pct,
            team_shooting_prepost_allstar_base.oreb,
            team_shooting_prepost_allstar_base.dreb,
            team_shooting_prepost_allstar_base.reb,
            team_shooting_prepost_allstar_base.ast,
            team_shooting_prepost_allstar_base.tov,
            team_shooting_prepost_allstar_base.stl,
            team_shooting_prepost_allstar_base.blk,
            team_shooting_prepost_allstar_base.blka,
            team_shooting_prepost_allstar_base.pf,
            team_shooting_prepost_allstar_base.pfd,
            team_shooting_prepost_allstar_base.pts,
            team_shooting_prepost_allstar_base.plus_minus,
            team_shooting_prepost_allstar_base.cfid,
            team_shooting_prepost_allstar_base.cfparams,
            team_shooting_prepost_allstar_base.teamid,
            team_shooting_prepost_allstar_base.season,
            team_shooting_prepost_allstar_base.created_at,
            team_shooting_prepost_allstar_base.updated_at,
            team_shooting_prepost_allstar_base.row_id,
            team_shooting_prepost_allstar_base.season_type,
            row_number() OVER (PARTITION BY team_shooting_prepost_allstar_base.season, team_shooting_prepost_allstar_base.season_type, team_shooting_prepost_allstar_base.teamid, team_shooting_prepost_allstar_base.season_segment ORDER BY team_shooting_prepost_allstar_base.created_at DESC) AS rn
           FROM team_shooting_prepost_allstar_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shooting_win_lose_base; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shooting_win_lose_base AS
 SELECT t._unnamed,
    t.group_set,
    t.group_value,
    t.game_result,
    t.gp,
    t.w,
    t.l,
    t.w_pct,
    t.min,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.ftm,
    t.fta,
    t.ft_pct,
    t.oreb,
    t.dreb,
    t.reb,
    t.ast,
    t.tov,
    t.stl,
    t.blk,
    t.blka,
    t.pf,
    t.pfd,
    t.pts,
    t.plus_minus,
    t.cfid,
    t.cfparams,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shooting_win_lose_base._unnamed,
            team_shooting_win_lose_base.group_set,
            team_shooting_win_lose_base.group_value,
            team_shooting_win_lose_base.game_result,
            team_shooting_win_lose_base.gp,
            team_shooting_win_lose_base.w,
            team_shooting_win_lose_base.l,
            team_shooting_win_lose_base.w_pct,
            team_shooting_win_lose_base.min,
            team_shooting_win_lose_base.fgm,
            team_shooting_win_lose_base.fga,
            team_shooting_win_lose_base.fg_pct,
            team_shooting_win_lose_base.fg3m,
            team_shooting_win_lose_base.fg3a,
            team_shooting_win_lose_base.fg3_pct,
            team_shooting_win_lose_base.ftm,
            team_shooting_win_lose_base.fta,
            team_shooting_win_lose_base.ft_pct,
            team_shooting_win_lose_base.oreb,
            team_shooting_win_lose_base.dreb,
            team_shooting_win_lose_base.reb,
            team_shooting_win_lose_base.ast,
            team_shooting_win_lose_base.tov,
            team_shooting_win_lose_base.stl,
            team_shooting_win_lose_base.blk,
            team_shooting_win_lose_base.blka,
            team_shooting_win_lose_base.pf,
            team_shooting_win_lose_base.pfd,
            team_shooting_win_lose_base.pts,
            team_shooting_win_lose_base.plus_minus,
            team_shooting_win_lose_base.cfid,
            team_shooting_win_lose_base.cfparams,
            team_shooting_win_lose_base.teamid,
            team_shooting_win_lose_base.season,
            team_shooting_win_lose_base.created_at,
            team_shooting_win_lose_base.updated_at,
            team_shooting_win_lose_base.row_id,
            team_shooting_win_lose_base.season_type,
            row_number() OVER (PARTITION BY team_shooting_win_lose_base.season, team_shooting_win_lose_base.season_type, team_shooting_win_lose_base.teamid, team_shooting_win_lose_base.game_result ORDER BY team_shooting_win_lose_base.created_at DESC) AS rn
           FROM team_shooting_win_lose_base) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shot_trck_closest_def; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shot_trck_closest_def AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.close_def_dist_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shot_trck_closest_def._unnamed,
            team_shot_trck_closest_def.team_id,
            team_shot_trck_closest_def.team_name,
            team_shot_trck_closest_def.sort_order,
            team_shot_trck_closest_def.g,
            team_shot_trck_closest_def.close_def_dist_range,
            team_shot_trck_closest_def.fga_frequency,
            team_shot_trck_closest_def.fgm,
            team_shot_trck_closest_def.fga,
            team_shot_trck_closest_def.fg_pct,
            team_shot_trck_closest_def.efg_pct,
            team_shot_trck_closest_def.fg2a_frequency,
            team_shot_trck_closest_def.fg2m,
            team_shot_trck_closest_def.fg2a,
            team_shot_trck_closest_def.fg2_pct,
            team_shot_trck_closest_def.fg3a_frequency,
            team_shot_trck_closest_def.fg3m,
            team_shot_trck_closest_def.fg3a,
            team_shot_trck_closest_def.fg3_pct,
            team_shot_trck_closest_def.teamid,
            team_shot_trck_closest_def.season,
            team_shot_trck_closest_def.created_at,
            team_shot_trck_closest_def.updated_at,
            team_shot_trck_closest_def.row_id,
            team_shot_trck_closest_def.season_type,
            row_number() OVER (PARTITION BY team_shot_trck_closest_def.season, team_shot_trck_closest_def.season_type, team_shot_trck_closest_def.teamid, team_shot_trck_closest_def.close_def_dist_range ORDER BY team_shot_trck_closest_def.created_at DESC) AS rn
           FROM team_shot_trck_closest_def) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shot_trck_closest_def_10ft_plus; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shot_trck_closest_def_10ft_plus AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.touch_time_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shot_trck_closest_def_10ft_plus._unnamed,
            team_shot_trck_closest_def_10ft_plus.team_id,
            team_shot_trck_closest_def_10ft_plus.team_name,
            team_shot_trck_closest_def_10ft_plus.sort_order,
            team_shot_trck_closest_def_10ft_plus.g,
            team_shot_trck_closest_def_10ft_plus.touch_time_range,
            team_shot_trck_closest_def_10ft_plus.fga_frequency,
            team_shot_trck_closest_def_10ft_plus.fgm,
            team_shot_trck_closest_def_10ft_plus.fga,
            team_shot_trck_closest_def_10ft_plus.fg_pct,
            team_shot_trck_closest_def_10ft_plus.efg_pct,
            team_shot_trck_closest_def_10ft_plus.fg2a_frequency,
            team_shot_trck_closest_def_10ft_plus.fg2m,
            team_shot_trck_closest_def_10ft_plus.fg2a,
            team_shot_trck_closest_def_10ft_plus.fg2_pct,
            team_shot_trck_closest_def_10ft_plus.fg3a_frequency,
            team_shot_trck_closest_def_10ft_plus.fg3m,
            team_shot_trck_closest_def_10ft_plus.fg3a,
            team_shot_trck_closest_def_10ft_plus.fg3_pct,
            team_shot_trck_closest_def_10ft_plus.teamid,
            team_shot_trck_closest_def_10ft_plus.season,
            team_shot_trck_closest_def_10ft_plus.created_at,
            team_shot_trck_closest_def_10ft_plus.updated_at,
            team_shot_trck_closest_def_10ft_plus.row_id,
            team_shot_trck_closest_def_10ft_plus.season_type,
            row_number() OVER (PARTITION BY team_shot_trck_closest_def_10ft_plus.season, team_shot_trck_closest_def_10ft_plus.season_type, team_shot_trck_closest_def_10ft_plus.teamid, team_shot_trck_closest_def_10ft_plus.touch_time_range ORDER BY team_shot_trck_closest_def_10ft_plus.created_at DESC) AS rn
           FROM team_shot_trck_closest_def_10ft_plus) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shot_trck_dribble; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shot_trck_dribble AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.dribble_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shot_trck_dribble._unnamed,
            team_shot_trck_dribble.team_id,
            team_shot_trck_dribble.team_name,
            team_shot_trck_dribble.sort_order,
            team_shot_trck_dribble.g,
            team_shot_trck_dribble.dribble_range,
            team_shot_trck_dribble.fga_frequency,
            team_shot_trck_dribble.fgm,
            team_shot_trck_dribble.fga,
            team_shot_trck_dribble.fg_pct,
            team_shot_trck_dribble.efg_pct,
            team_shot_trck_dribble.fg2a_frequency,
            team_shot_trck_dribble.fg2m,
            team_shot_trck_dribble.fg2a,
            team_shot_trck_dribble.fg2_pct,
            team_shot_trck_dribble.fg3a_frequency,
            team_shot_trck_dribble.fg3m,
            team_shot_trck_dribble.fg3a,
            team_shot_trck_dribble.fg3_pct,
            team_shot_trck_dribble.teamid,
            team_shot_trck_dribble.season,
            team_shot_trck_dribble.created_at,
            team_shot_trck_dribble.updated_at,
            team_shot_trck_dribble.row_id,
            team_shot_trck_dribble.season_type,
            row_number() OVER (PARTITION BY team_shot_trck_dribble.season, team_shot_trck_dribble.season_type, team_shot_trck_dribble.teamid, team_shot_trck_dribble.dribble_range ORDER BY team_shot_trck_dribble.created_at DESC) AS rn
           FROM team_shot_trck_dribble) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shot_trck_general; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shot_trck_general AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.shot_type,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shot_trck_general._unnamed,
            team_shot_trck_general.team_id,
            team_shot_trck_general.team_name,
            team_shot_trck_general.sort_order,
            team_shot_trck_general.g,
            team_shot_trck_general.shot_type,
            team_shot_trck_general.fga_frequency,
            team_shot_trck_general.fgm,
            team_shot_trck_general.fga,
            team_shot_trck_general.fg_pct,
            team_shot_trck_general.efg_pct,
            team_shot_trck_general.fg2a_frequency,
            team_shot_trck_general.fg2m,
            team_shot_trck_general.fg2a,
            team_shot_trck_general.fg2_pct,
            team_shot_trck_general.fg3a_frequency,
            team_shot_trck_general.fg3m,
            team_shot_trck_general.fg3a,
            team_shot_trck_general.fg3_pct,
            team_shot_trck_general.teamid,
            team_shot_trck_general.season,
            team_shot_trck_general.created_at,
            team_shot_trck_general.updated_at,
            team_shot_trck_general.row_id,
            team_shot_trck_general.season_type,
            row_number() OVER (PARTITION BY team_shot_trck_general.season, team_shot_trck_general.season_type, team_shot_trck_general.teamid, team_shot_trck_general.shot_type ORDER BY team_shot_trck_general.created_at DESC) AS rn
           FROM team_shot_trck_general) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shot_trck_shot_clock; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shot_trck_shot_clock AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.shot_clock_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.teamid,
    t.season,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.rn
   FROM ( SELECT team_shot_trck_shot_clock._unnamed,
            team_shot_trck_shot_clock.team_id,
            team_shot_trck_shot_clock.team_name,
            team_shot_trck_shot_clock.sort_order,
            team_shot_trck_shot_clock.g,
            team_shot_trck_shot_clock.shot_clock_range,
            team_shot_trck_shot_clock.fga_frequency,
            team_shot_trck_shot_clock.fgm,
            team_shot_trck_shot_clock.fga,
            team_shot_trck_shot_clock.fg_pct,
            team_shot_trck_shot_clock.efg_pct,
            team_shot_trck_shot_clock.fg2a_frequency,
            team_shot_trck_shot_clock.fg2m,
            team_shot_trck_shot_clock.fg2a,
            team_shot_trck_shot_clock.fg2_pct,
            team_shot_trck_shot_clock.fg3a_frequency,
            team_shot_trck_shot_clock.fg3m,
            team_shot_trck_shot_clock.fg3a,
            team_shot_trck_shot_clock.fg3_pct,
            team_shot_trck_shot_clock.teamid,
            team_shot_trck_shot_clock.season,
            team_shot_trck_shot_clock.created_at,
            team_shot_trck_shot_clock.updated_at,
            team_shot_trck_shot_clock.row_id,
            team_shot_trck_shot_clock.season_type,
            row_number() OVER (PARTITION BY team_shot_trck_shot_clock.season, team_shot_trck_shot_clock.season_type, team_shot_trck_shot_clock.teamid, team_shot_trck_shot_clock.shot_clock_range ORDER BY team_shot_trck_shot_clock.created_at DESC) AS rn
           FROM team_shot_trck_shot_clock) t
  WHERE (t.rn = 1);


--
-- Name: vw_team_shot_trck_touch_time; Type: VIEW; Schema: lnd; Owner: -
--

CREATE VIEW vw_team_shot_trck_touch_time AS
 SELECT t._unnamed,
    t.team_id,
    t.team_name,
    t.sort_order,
    t.g,
    t.close_def_dist_range,
    t.fga_frequency,
    t.fgm,
    t.fga,
    t.fg_pct,
    t.efg_pct,
    t.fg2a_frequency,
    t.fg2m,
    t.fg2a,
    t.fg2_pct,
    t.fg3a_frequency,
    t.fg3m,
    t.fg3a,
    t.fg3_pct,
    t.teamid,
    t.created_at,
    t.updated_at,
    t.row_id,
    t.season_type,
    t.season,
    t.rn
   FROM ( SELECT team_shot_trck_touch_time._unnamed,
            team_shot_trck_touch_time.team_id,
            team_shot_trck_touch_time.team_name,
            team_shot_trck_touch_time.sort_order,
            team_shot_trck_touch_time.g,
            team_shot_trck_touch_time.close_def_dist_range,
            team_shot_trck_touch_time.fga_frequency,
            team_shot_trck_touch_time.fgm,
            team_shot_trck_touch_time.fga,
            team_shot_trck_touch_time.fg_pct,
            team_shot_trck_touch_time.efg_pct,
            team_shot_trck_touch_time.fg2a_frequency,
            team_shot_trck_touch_time.fg2m,
            team_shot_trck_touch_time.fg2a,
            team_shot_trck_touch_time.fg2_pct,
            team_shot_trck_touch_time.fg3a_frequency,
            team_shot_trck_touch_time.fg3m,
            team_shot_trck_touch_time.fg3a,
            team_shot_trck_touch_time.fg3_pct,
            team_shot_trck_touch_time.teamid,
            team_shot_trck_touch_time.created_at,
            team_shot_trck_touch_time.updated_at,
            team_shot_trck_touch_time.row_id,
            team_shot_trck_touch_time.season_type,
            team_shot_trck_touch_time.season,
            row_number() OVER (PARTITION BY team_shot_trck_touch_time.season, team_shot_trck_touch_time.season_type, team_shot_trck_touch_time.teamid, team_shot_trck_touch_time.close_def_dist_range ORDER BY team_shot_trck_touch_time.created_at DESC) AS rn
           FROM team_shot_trck_touch_time) t
  WHERE (t.rn = 1);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY coaches ALTER COLUMN row_id SET DEFAULT nextval('coaches_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY column_desc ALTER COLUMN row_id SET DEFAULT nextval('column_desc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY dk_players ALTER COLUMN row_id SET DEFAULT nextval('dk_players_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY fd_players ALTER COLUMN row_id SET DEFAULT nextval('fd_players_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_player_adv_stat ALTER COLUMN row_id SET DEFAULT nextval('game_player_adv_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_player_four_factor_stat ALTER COLUMN row_id SET DEFAULT nextval('game_player_four_factor_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_player_misc_stat ALTER COLUMN row_id SET DEFAULT nextval('game_player_misc_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_player_scoring_stat ALTER COLUMN row_id SET DEFAULT nextval('game_player_scoring_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_player_stat ALTER COLUMN row_id SET DEFAULT nextval('game_player_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_player_trck_stat ALTER COLUMN row_id SET DEFAULT nextval('game_player_trck_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_player_usage_stat ALTER COLUMN row_id SET DEFAULT nextval('game_player_usage_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_schedule ALTER COLUMN row_id SET DEFAULT nextval('game_schedule_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_starter_bench ALTER COLUMN row_id SET DEFAULT nextval('game_starter_bench_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_team_adv_stat ALTER COLUMN row_id SET DEFAULT nextval('game_team_adv_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_team_four_factor_stat ALTER COLUMN row_id SET DEFAULT nextval('game_team_four_factor_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_team_misc_stat ALTER COLUMN row_id SET DEFAULT nextval('game_team_misc_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_team_scoring_stat ALTER COLUMN row_id SET DEFAULT nextval('game_team_scoring_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_team_stat ALTER COLUMN row_id SET DEFAULT nextval('game_team_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_team_trck_stat ALTER COLUMN row_id SET DEFAULT nextval('game_team_trck_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY game_team_usage_stat ALTER COLUMN row_id SET DEFAULT nextval('game_team_usage_stat_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY games ALTER COLUMN row_id SET DEFAULT nextval('games_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_days_rest_advanced ALTER COLUMN row_id SET DEFAULT nextval('player_days_rest_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_days_rest_base ALTER COLUMN row_id SET DEFAULT nextval('player_days_rest_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_days_rest_misc ALTER COLUMN row_id SET DEFAULT nextval('player_days_rest_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_days_rest_scoring ALTER COLUMN row_id SET DEFAULT nextval('player_days_rest_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_days_rest_usage ALTER COLUMN row_id SET DEFAULT nextval('player_days_rest_usage_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_defense ALTER COLUMN row_id SET DEFAULT nextval('player_defense_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_game_log ALTER COLUMN row_id SET DEFAULT nextval('player_game_log_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_location_advanced ALTER COLUMN row_id SET DEFAULT nextval('player_location_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_location_base ALTER COLUMN row_id SET DEFAULT nextval('player_location_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_location_misc ALTER COLUMN row_id SET DEFAULT nextval('player_location_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_location_scoring ALTER COLUMN row_id SET DEFAULT nextval('player_location_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_location_usage ALTER COLUMN row_id SET DEFAULT nextval('player_location_usage_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_month_advanced ALTER COLUMN row_id SET DEFAULT nextval('player_month_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_month_base ALTER COLUMN row_id SET DEFAULT nextval('player_month_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_month_misc ALTER COLUMN row_id SET DEFAULT nextval('player_month_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_month_scoring ALTER COLUMN row_id SET DEFAULT nextval('player_month_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_month_usage ALTER COLUMN row_id SET DEFAULT nextval('player_month_usage_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_overall_advanced ALTER COLUMN row_id SET DEFAULT nextval('player_overall_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_overall_base ALTER COLUMN row_id SET DEFAULT nextval('player_overall_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_overall_misc ALTER COLUMN row_id SET DEFAULT nextval('player_overall_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_overall_scoring ALTER COLUMN row_id SET DEFAULT nextval('player_overall_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_overall_usage ALTER COLUMN row_id SET DEFAULT nextval('player_overall_usage_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_passes_made ALTER COLUMN row_id SET DEFAULT nextval('player_passes_made_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_passes_rcvd ALTER COLUMN row_id SET DEFAULT nextval('player_passes_rcvd_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_pre_post_allstar_advanced ALTER COLUMN row_id SET DEFAULT nextval('player_pre_post_allstar_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_pre_post_allstar_base ALTER COLUMN row_id SET DEFAULT nextval('player_pre_post_allstar_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_pre_post_allstar_misc ALTER COLUMN row_id SET DEFAULT nextval('player_pre_post_allstar_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_pre_post_allstar_scoring ALTER COLUMN row_id SET DEFAULT nextval('player_pre_post_allstar_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_pre_post_allstar_usage ALTER COLUMN row_id SET DEFAULT nextval('player_pre_post_allstar_usage_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_reb_log_num_contested ALTER COLUMN row_id SET DEFAULT nextval('player_reb_log_num_contested_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_reb_log_overall ALTER COLUMN row_id SET DEFAULT nextval('player_reb_log_overall_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_reb_log_reb_dist ALTER COLUMN row_id SET DEFAULT nextval('player_reb_log_reb_dist_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_reb_log_shot_dist ALTER COLUMN row_id SET DEFAULT nextval('player_reb_log_shot_dist_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_reb_log_shot_type ALTER COLUMN row_id SET DEFAULT nextval('player_reb_log_shot_type_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_shot_log_closest_def ALTER COLUMN row_id SET DEFAULT nextval('player_shot_log_closest_def_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_shot_log_dribble ALTER COLUMN row_id SET DEFAULT nextval('player_shot_log_dribble_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_shot_log_general ALTER COLUMN row_id SET DEFAULT nextval('player_shot_log_general_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_shot_log_overall ALTER COLUMN row_id SET DEFAULT nextval('player_shot_log_overall_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_shot_log_shot_clock ALTER COLUMN row_id SET DEFAULT nextval('player_shot_log_shot_clock_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_shot_log_touch_time ALTER COLUMN row_id SET DEFAULT nextval('player_shot_log_touch_time_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_shot_trck_closest_def_10ft_plus ALTER COLUMN row_id SET DEFAULT nextval('player_shot_trck_closest_def_10ft_plus_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_starting_pos_advanced ALTER COLUMN row_id SET DEFAULT nextval('player_starting_pos_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_starting_pos_base ALTER COLUMN row_id SET DEFAULT nextval('player_starting_pos_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_starting_pos_misc ALTER COLUMN row_id SET DEFAULT nextval('player_starting_pos_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_starting_pos_scoring ALTER COLUMN row_id SET DEFAULT nextval('player_starting_pos_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_starting_pos_usage ALTER COLUMN row_id SET DEFAULT nextval('player_starting_pos_usage_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_win_lose_advanced ALTER COLUMN row_id SET DEFAULT nextval('player_win_lose_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_win_lose_base ALTER COLUMN row_id SET DEFAULT nextval('player_win_lose_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_win_lose_misc ALTER COLUMN row_id SET DEFAULT nextval('player_win_lose_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_win_lose_scoring ALTER COLUMN row_id SET DEFAULT nextval('player_win_lose_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY player_win_lose_usage ALTER COLUMN row_id SET DEFAULT nextval('player_win_lose_usage_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY players ALTER COLUMN row_id SET DEFAULT nextval('players_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY season_start_end ALTER COLUMN row_id SET DEFAULT nextval('season_start_end_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY seasons ALTER COLUMN row_id SET DEFAULT nextval('seasons_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_game_log ALTER COLUMN row_id SET DEFAULT nextval('team_game_log_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_days_rest_advanced ALTER COLUMN row_id SET DEFAULT nextval('team_general_days_rest_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_days_rest_base ALTER COLUMN row_id SET DEFAULT nextval('team_general_days_rest_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_days_rest_four_factors ALTER COLUMN row_id SET DEFAULT nextval('team_general_days_rest_four_factors_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_days_rest_misc ALTER COLUMN row_id SET DEFAULT nextval('team_general_days_rest_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_days_rest_opponent ALTER COLUMN row_id SET DEFAULT nextval('team_general_days_rest_opponent_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_days_rest_scoring ALTER COLUMN row_id SET DEFAULT nextval('team_general_days_rest_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_location_advanced ALTER COLUMN row_id SET DEFAULT nextval('team_general_location_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_location_base ALTER COLUMN row_id SET DEFAULT nextval('team_general_location_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_location_four_factors ALTER COLUMN row_id SET DEFAULT nextval('team_general_location_four_factors_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_location_misc ALTER COLUMN row_id SET DEFAULT nextval('team_general_location_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_location_opponent ALTER COLUMN row_id SET DEFAULT nextval('team_general_location_opponent_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_location_scoring ALTER COLUMN row_id SET DEFAULT nextval('team_general_location_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_month_advanced ALTER COLUMN row_id SET DEFAULT nextval('team_general_month_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_month_base ALTER COLUMN row_id SET DEFAULT nextval('team_general_month_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_month_four_factors ALTER COLUMN row_id SET DEFAULT nextval('team_general_month_four_factors_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_month_misc ALTER COLUMN row_id SET DEFAULT nextval('team_general_month_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_month_opponent ALTER COLUMN row_id SET DEFAULT nextval('team_general_month_opponent_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_month_scoring ALTER COLUMN row_id SET DEFAULT nextval('team_general_month_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_overall_advanced ALTER COLUMN row_id SET DEFAULT nextval('team_general_overall_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_overall_base ALTER COLUMN row_id SET DEFAULT nextval('team_general_overall_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_overall_four_factors ALTER COLUMN row_id SET DEFAULT nextval('team_general_overall_four_factors_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_overall_misc ALTER COLUMN row_id SET DEFAULT nextval('team_general_overall_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_overall_opponent ALTER COLUMN row_id SET DEFAULT nextval('team_general_overall_opponent_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_overall_scoring ALTER COLUMN row_id SET DEFAULT nextval('team_general_overall_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_prepost_allstar_advanced ALTER COLUMN row_id SET DEFAULT nextval('team_general_prepost_allstar_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_prepost_allstar_base ALTER COLUMN row_id SET DEFAULT nextval('team_general_prepost_allstar_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_prepost_allstar_four_factors ALTER COLUMN row_id SET DEFAULT nextval('team_general_prepost_allstar_four_factors_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_prepost_allstar_misc ALTER COLUMN row_id SET DEFAULT nextval('team_general_prepost_allstar_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_prepost_allstar_opponent ALTER COLUMN row_id SET DEFAULT nextval('team_general_prepost_allstar_opponent_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_prepost_allstar_scoring ALTER COLUMN row_id SET DEFAULT nextval('team_general_prepost_allstar_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_win_lose_advanced ALTER COLUMN row_id SET DEFAULT nextval('team_general_win_lose_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_win_lose_base ALTER COLUMN row_id SET DEFAULT nextval('team_general_win_lose_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_win_lose_four_factors ALTER COLUMN row_id SET DEFAULT nextval('team_general_win_lose_four_factors_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_win_lose_misc ALTER COLUMN row_id SET DEFAULT nextval('team_general_win_lose_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_win_lose_opponent ALTER COLUMN row_id SET DEFAULT nextval('team_general_win_lose_opponent_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_general_win_lose_scoring ALTER COLUMN row_id SET DEFAULT nextval('team_general_win_lose_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_lineup_advanced ALTER COLUMN row_id SET DEFAULT nextval('team_lineup_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_lineup_base ALTER COLUMN row_id SET DEFAULT nextval('team_lineup_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_lineup_four_factors ALTER COLUMN row_id SET DEFAULT nextval('team_lineup_four_factors_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_lineup_misc ALTER COLUMN row_id SET DEFAULT nextval('team_lineup_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_lineup_opponent ALTER COLUMN row_id SET DEFAULT nextval('team_lineup_opponent_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_lineup_scoring ALTER COLUMN row_id SET DEFAULT nextval('team_lineup_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_advanced ALTER COLUMN row_id SET DEFAULT nextval('team_player_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_base ALTER COLUMN row_id SET DEFAULT nextval('team_player_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_off_sum_base ALTER COLUMN row_id SET DEFAULT nextval('team_player_off_sum_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_on_off_advanced ALTER COLUMN row_id SET DEFAULT nextval('team_player_on_off_advanced_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_on_off_base ALTER COLUMN row_id SET DEFAULT nextval('team_player_on_off_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_on_off_four_factors ALTER COLUMN row_id SET DEFAULT nextval('team_player_on_off_four_factors_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_on_off_misc ALTER COLUMN row_id SET DEFAULT nextval('team_player_on_off_misc_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_on_off_opponent ALTER COLUMN row_id SET DEFAULT nextval('team_player_on_off_opponent_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_on_off_scoring ALTER COLUMN row_id SET DEFAULT nextval('team_player_on_off_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_on_sum_base ALTER COLUMN row_id SET DEFAULT nextval('team_player_on_sum_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_passes_made ALTER COLUMN row_id SET DEFAULT nextval('team_player_passes_made_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_passes_rcvd ALTER COLUMN row_id SET DEFAULT nextval('team_player_passes_rcvd_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_scoring ALTER COLUMN row_id SET DEFAULT nextval('team_player_scoring_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_player_usage ALTER COLUMN row_id SET DEFAULT nextval('team_player_usage_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_reb_trck_num_contested ALTER COLUMN row_id SET DEFAULT nextval('team_reb_trck_num_contested_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_reb_trck_overall ALTER COLUMN row_id SET DEFAULT nextval('team_reb_trck_overall_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_reb_trck_reb_dist ALTER COLUMN row_id SET DEFAULT nextval('team_reb_trck_reb_dist_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_reb_trck_shot_dist ALTER COLUMN row_id SET DEFAULT nextval('team_reb_trck_shot_dist_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_reb_trck_shot_type ALTER COLUMN row_id SET DEFAULT nextval('team_reb_trck_shot_type_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shooting_days_rest_base ALTER COLUMN row_id SET DEFAULT nextval('team_shooting_days_rest_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shooting_location_base ALTER COLUMN row_id SET DEFAULT nextval('team_shooting_location_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shooting_month_base ALTER COLUMN row_id SET DEFAULT nextval('team_shooting_month_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shooting_overall_base ALTER COLUMN row_id SET DEFAULT nextval('team_shooting_overall_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shooting_prepost_allstar_base ALTER COLUMN row_id SET DEFAULT nextval('team_shooting_prepost_allstar_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shooting_win_lose_base ALTER COLUMN row_id SET DEFAULT nextval('team_shooting_win_lose_base_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shot_trck_closest_def ALTER COLUMN row_id SET DEFAULT nextval('team_shot_trck_closest_def_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shot_trck_closest_def_10ft_plus ALTER COLUMN row_id SET DEFAULT nextval('team_shot_trck_closest_def_10ft_plus_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shot_trck_dribble ALTER COLUMN row_id SET DEFAULT nextval('team_shot_trck_dribble_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shot_trck_general ALTER COLUMN row_id SET DEFAULT nextval('team_shot_trck_general_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shot_trck_shot_clock ALTER COLUMN row_id SET DEFAULT nextval('team_shot_trck_shot_clock_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY team_shot_trck_touch_time ALTER COLUMN row_id SET DEFAULT nextval('team_shot_trck_touch_time_row_id_seq'::regclass);


--
-- Name: row_id; Type: DEFAULT; Schema: lnd; Owner: -
--

ALTER TABLE ONLY teams ALTER COLUMN row_id SET DEFAULT nextval('teams_row_id_seq'::regclass);


--
-- Name: pk_season_start_end; Type: CONSTRAINT; Schema: lnd; Owner: -; Tablespace: 
--

ALTER TABLE ONLY season_start_end
    ADD CONSTRAINT pk_season_start_end PRIMARY KEY (season, season_type);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: lnd; Owner: -; Tablespace: 
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: idx_game_team_adv_stat_game_id; Type: INDEX; Schema: lnd; Owner: -; Tablespace: 
--

CREATE INDEX idx_game_team_adv_stat_game_id ON game_team_adv_stat USING btree (game_id);


--
-- Name: idx_games_game_id; Type: INDEX; Schema: lnd; Owner: -; Tablespace: 
--

CREATE INDEX idx_games_game_id ON games USING btree (game_id);


--
-- Name: idx_games_season; Type: INDEX; Schema: lnd; Owner: -; Tablespace: 
--

CREATE INDEX idx_games_season ON games USING btree (season);


--
-- PostgreSQL database dump complete
--


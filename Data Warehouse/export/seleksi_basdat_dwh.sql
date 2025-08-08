--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-08-08 19:34:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 17113)
-- Name: dim_apps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_apps (
    app_id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    price_text character varying(50),
    apk_size_mb real
);


ALTER TABLE public.dim_apps OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17118)
-- Name: dim_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_categories (
    category_id integer NOT NULL,
    category_name character varying(100) NOT NULL
);


ALTER TABLE public.dim_categories OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17108)
-- Name: dim_developers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_developers (
    developer_id integer NOT NULL,
    developer_name character varying(255) NOT NULL,
    active_year integer,
    active_month integer,
    app_count integer,
    total_downloads bigint,
    average_rating real,
    total_rating_count bigint
);


ALTER TABLE public.dim_developers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17123)
-- Name: dim_maturityratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_maturityratings (
    maturity_id integer NOT NULL,
    maturity_level character varying(50) NOT NULL
);


ALTER TABLE public.dim_maturityratings OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17129)
-- Name: fact_appranking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_appranking (
    fact_id integer NOT NULL,
    app_id integer,
    developer_id integer,
    category_id integer,
    maturity_id integer,
    rank integer,
    rating real,
    total_installs bigint,
    recent_installs bigint,
    price_numeric numeric(10,2)
);


ALTER TABLE public.fact_appranking OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17128)
-- Name: fact_appranking_fact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fact_appranking_fact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_appranking_fact_id_seq OWNER TO postgres;

--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 221
-- Name: fact_appranking_fact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fact_appranking_fact_id_seq OWNED BY public.fact_appranking.fact_id;


--
-- TOC entry 4711 (class 2604 OID 17132)
-- Name: fact_appranking fact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_appranking ALTER COLUMN fact_id SET DEFAULT nextval('public.fact_appranking_fact_id_seq'::regclass);


--
-- TOC entry 4872 (class 0 OID 17113)
-- Dependencies: 218
-- Data for Name: dim_apps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_apps (app_id, app_name, price_text, apk_size_mb) FROM stdin;
1	ChatGPT	Free	43.6
2	TikTok - Videos, Shop & LIVE	Free	158.7
3	Threads	Free	79.3
4	WhatsApp Messenger	Free	71.7
5	Temu: Shop Like a Billionaire	Free	44.6
6	Instagram	Free	113.5
7	TikTok Lite - Faster TikTok	Free	18.6
8	DramaBox - Stream Drama Shorts	Free	59.7
9	Cash App	Free	43.6
10	Snapchat	Free	128.3
11	Telegram	Free	56.5
12	SHEIN-Shopping Online	Free	100.7
13	ReelShort - Stream Drama & TV	Free	52.2
14	Messenger	Free	85.2
15	Pick Drama	Free	39.7
16	Whatnot: Shop, Sell, Connect	Free	67.3
17	Facebook	Free	88.8
18	Grok - AI Assistant	Free	24.1
19	Tea Dating Advice	Free	\N
20	Walmart: Shopping & Savings	Free	110.6
21	Easy Homescreen	Free	68.5
22	CapCut - Video Editor	Free	193.5
23	Netflix	Free	36.6
24	PayPal - Pay, Send, Save	Free	118.5
25	Discord - Talk, Play, Hang Out	Free	164.6
26	Tubi: Free Movies & Live TV	Free	33
27	Indeed Job Search	Free	82.3
28	Life360: Stay Connected & Safe	Free	\N
29	TextNow: Call + Text Unlimited	Free	119.4
30	Pop Drama	Free	32.2
31	McDonald's	Free	105.7
32	Chime – Mobile Banking	Free	\N
33	HBO Max: Stream TV & Movies	Free	63.2
34	PDF Reader and Photo to PDF	Free	39.4
35	Prime Video	Free	62
36	Duolingo: Language Lessons	Free	44.9
37	Amazon Shopping	Free	101.3
38	NetShort - Popular Dramas & TV	Free	78.7
39	AliExpress - Shopping App	Free	39.5
40	Pinterest	Free	47.7
41	DoorDash: Food, Grocery, More	Free	121.5
42	Venmo	Free	94.8
43	Zoom Workplace	Free	195.1
44	The Roku App (Official)	Free	30.6
45	Spotify: Music and Podcasts	Free	55.5
46	Google Gemini	Free	2.88
47	Uber - Request a ride	Free	130.7
48	Chick-fil-A®	Free	61.1
49	Peacock TV: Stream TV & Movies	Free	44.9
50	Alibaba.com - B2B marketplace	Free	72.3
51	PlutoTV: Live TV & Free Movies	Free	25.7
52	PictureThis - Plant Identifier	Free	54.9
53	Shop: All your favorite brands	Free	85.3
54	Brightest Flashlight Launcher	Free	\N
55	Microsoft Teams	Free	187.5
56	KFC US - Ordering App	Free	39.9
57	T-Life	Free	152.3
58	The Roku Channel	Free	\N
59	Disney+	Free	23.2
60	PhotoRescue-Recover Files	Free	32.7
61	Microsoft Authenticator	Free	113.8
62	Canva: AI Photo & Video Editor	Free	15.7
63	AntiVirus Toolkit	Free	33.7
64	Lyft	Free	68.6
65	NewsBreak: Local News & Alerts	Free	32.6
66	Microsoft Edge: AI browser	Free	189.3
67	X (Formerly Twitter)	Free	85.7
68	Photo Recover-File Recovery	Free	35.9
69	PolyBuzz: Chat with AI Friends	Free	75.7
70	DoorDash - Dasher	Free	233.5
71	Crunchyroll	Free	55.9
72	Uber Eats: Food Delivery	Free	101.3
73	Facebook Lite	Free	2.82
74	KashKick: Get paid to have fun	Free	\N
75	testerup - earn money	Free	56
76	Paramount+	Free	43.9
77	Capital One Mobile	Free	\N
78	Intuit Credit Karma	Free	42.2
79	Lemon8 - Lifestyle Community	Free	83
80	BESTPLAY Play to earn & donate	Free	44.5
81	Twitch: Live Streaming	Free	91.9
82	eBay online shopping & selling	Free	69
83	Freecash: Earn Money & Rewards	Free	12
84	QR & Barcode Scanner Launcher	Free	\N
85	Move to iOS	Free	9.96
86	Hizen VPN - Fast & Secure VPN	Free	26.7
87	Apple TV	Free	\N
88	FlickReels - Short Drama & TV	Free	63
89	Plex: Stream Movies & TV	Free	35.3
90	Pandora - Music & Podcasts	Free	69.6
91	Upside: Cash Back - Gas & Food	Free	24.2
92	Google Authenticator	Free	6
93	Waze Navigation & Live Traffic	Free	79.7
94	QR & Barcode Scanner	Free	14.9
95	Samsung Smart Switch Mobile	Free	39.1
96	Expedia: Hotels, Flights, Cars	Free	\N
97	Google Translate	Free	43.7
98	Malwarebytes Mobile Security	Free	33
99	Picsart AI Photo Editor, Video	Free	62.7
100	MyChart	Free	44.6
101	Airbnb	Free	51.7
102	Blood Pressure Tracker	Free	64
103	Google Wallet	Free	19.7
104	Geotag Photo: Camera Location	Free	23.2
105	AI Cleaner - Phone Cleaner	Free	\N
106	Audible: Audio Entertainment	Free	160.2
107	CoinSnap - Coin Identifier	Free	67.6
108	Sam’s Club: Pickup & Delivery	Free	92.1
109	ZEPETO: Avatar, Connect & Live	Free	192.4
110	Cash Giraffe: Games & Rewards	Free	82.5
111	Open Browser - Smart & Safe	Free	45.1
112	RapidTV - Short Dramas	Free	28.4
113	Bigo Live - Live Streaming App	Free	61.7
114	BURGER KING® App	Free	56.1
115	Scoopz: Real Life, Real Video	Free	69
116	YouTube Kids	Free	33.8
117	Pocket FM: Audio Series	Free	83.7
118	Reddit	Free	54
119	Ring - Always Home	Free	177.4
120	Fetch: America’s Rewards App	Free	207
121	PDF Reader – Reader & Editor	Free	64.8
122	WEBTOON: Manga, Comics, Manhwa	Free	64.2
123	PDF Reader - PDF Viewer	Free	60.8
124	FlareFlow: 1-Minute Dramas!	Free	76.2
125	Signal Private Messenger	Free	82.9
126	Progressive	Free	153.9
127	WhatsApp Business	Free	78
128	Vrbo Vacation Rentals	Free	\N
129	Weather Now Launcher - Radar	Free	56.4
130	Affirm: Buy now, pay over time	Free	56.9
131	Instacart: Get Food Delivery	Free	53.6
132	Simple Bible Daily Verse Alarm	Free	65.1
133	Video&Drama Player All Format	Free	52.2
134	Domino's Pizza USA	Free	80.4
135	PlayWell: Play to Earn	Free	31.2
136	Chase Mobile	Free	\N
137	Adobe Acrobat Reader: Edit PDF	Free	118.4
138	CVS Health	Free	\N
139	Zelle®	Free	\N
140	Hulu: Stream TV shows & movies	Free	17.9
141	Perplexity - Ask Anything	Free	64.3
142	Chai: Chat AI Platform	Free	69
143	Pizza Hut - Delivery & Takeout	Free	150
144	Zillow: Homes For Sale & Rent	Free	\N
145	Linky AI: Chat, Play, Connect	Free	245.8
146	Smart Remote - Easy TV Control	Free	\N
147	OfferUp: Buy. Sell. Simple.	Free	\N
148	Norton360 Antivirus & Security	Free	\N
149	1Weather Forecasts & Radar	Free	59
150	JustPlay: Earn Money or Donate	Free	58.2
151	Booking.com: Hotels & Travel	Free	99.9
152	Too Good To Go: End Food Waste	Free	39.1
153	Planet Fitness	Free	\N
154	OnePay – Mobile Banking	Free	109
155	VPN Proton: Fast & Secure VPN	Free	35.9
156	Coinbase: Buy BTC, ETH, SOL	Free	164.5
157	Authenticator App - SafeAuth	Free	31.5
158	NordVPN – fast VPN for privacy	Free	37.4
159	Instabridge: WiFi Hotspot Map	Free	73.1
160	Costco Wholesale	Free	\N
161	Uber - Driver: Drive & Deliver	Free	175.5
162	AllTrails: Hike, Bike & Run	Free	115
163	Zangi Private Messenger	Free	71.9
164	MISTPLAY: Play to Earn Money	Free	52.7
165	Warm Weather	Free	30.2
166	Etsy: A Special Marketplace	Free	27.6
167	Xfinity	Free	\N
168	State Farm®	Free	60.1
169	Zedge™ Wallpapers & Ringtones	Free	73.6
170	GoodShort - Movies & Dramas	Free	34.2
171	Impulse - Brain Training Games	Free	\N
172	Photo Recovery & File Recovery	Free	24.3
173	ShotShort-Dramas&Shorts	Free	66.9
174	Claude by Anthropic	Free	12.3
175	CoinIn – Coin Scan Identifier	Free	6.67
176	Google Earth	Free	87.7
177	Brave Private Web Browser, VPN	Free	194.6
178	Robinhood: Trading & Investing	Free	116.8
179	My Spectrum	Free	\N
180	KJV Bible: Audio+Verse	Free	35.8
181	Suno - AI Music & Songs	Free	26
182	Little Caesars	Free	37.9
183	Deepsearch AI Search Assistant	Free	101
184	ReciMe: Recipes & Meal Planner	Free	\N
185	The CW	Free	26.9
186	GroupMe	Free	141.4
187	DuckDuckGo Browser, Search, AI	Free	47.9
188	Rocket Money - Bills & Budgets	Free	82.6
189	Brigit: Cash Advance & Credit	Free	54.7
190	Amazon Alexa	Free	\N
191	UKG Pro	Free	78.9
192	Tinder Dating App: Chat & Date	Free	83.3
193	Universal TV Remote for All TV	Free	80.4
194	Wayfair - Shop All Things Home	Free	\N
195	Finch: Self-Care Pet	Free	85.1
196	BandLab – Music Making Studio	Free	51.8
197	TV Remote: Roku Remote Control	Free	23
198	Cleo AI: Cash advance & Credit	Free	\N
199	ADP Mobile Solutions	Free	92.7
200	The Home Depot	Free	78
\.


--
-- TOC entry 4873 (class 0 OID 17118)
-- Dependencies: 219
-- Data for Name: dim_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_categories (category_id, category_name) FROM stdin;
1	Maps & Navigation
2	Shopping
3	Health & Fitness
4	Entertainment
5	News & Magazines
6	Comics
7	Video Players & Editors
8	Photography
9	Travel & Local
10	Music & Audio
11	Finance
12	Art & Design
13	House & Home
14	Social
15	Medical
16	Communication
17	Education
18	Tools
19	Books & Reference
20	Productivity
21	Dating
22	Personalization
23	Lifestyle
24	Food & Drink
25	Weather
26	Business
\.


--
-- TOC entry 4871 (class 0 OID 17108)
-- Dependencies: 217
-- Data for Name: dim_developers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_developers (developer_id, developer_name, active_year, active_month, app_count, total_downloads, average_rating, total_rating_count) FROM stdin;
1	OpenAI	2023	7	1	600000000	4.78	23000000
2	TikTok Pte. Ltd.	2015	7	10	7000000000	4.24	98000000
3	Instagram	2012	4	4	8000000000	3.94	160000000
4	WhatsApp LLC	2010	10	2	10000000000	4.41	220000000
5	Temu	2022	8	2	800000000	4.62	8700000
6	STORYMATRIX	2022	2	1	100000000	4.64	2800000
7	Block, Inc.	2010	5	15	100000000	4.66	3900000
8	Snap Inc	2012	10	2	4000000000	4.13	36000000
9	Telegram FZ-LLC	2013	10	2	3000000000	4.11	16000000
10	Roadget Business PTE. LTD.	2014	3	2	900000000	3.95	6700000
11	NewLeaf Publishing	2022	8	1	100000000	4.58	1000000
12	Meta Platforms, Inc.	\N	\N	12	20000000000	4.49	300000000
13	createwonderful	2025	4	1	6000000	3.68	1200
14	Whatnot Inc.	2019	12	1	7000000	4.65	150000
15	xAI	2025	2	1	50000000	4.84	1000000
16	Tea Dating Advice Inc.	2024	3	1	500000	3.98	11000
17	Walmart	2011	5	21	100000000	4.71	6100000
18	Homescreen Apps	2023	1	7	20000000	3.97	200000
19	Bytedance Pte. Ltd.	2014	1	3	2000000000	3.57	12000000
20	Netflix, Inc.	2011	5	96	4000000000	3.93	15000000
21	PayPal Mobile	\N	\N	4	500000000	4.23	3600000
22	Discord Inc.	2015	5	1	600000000	4.27	6000000
23	Tubi TV	2012	3	1	200000000	4.86	1900000
24	Indeed Jobs	2010	1	3	200000000	4.69	10000000
25	Life360	2010	2	1	200000000	4.48	2100000
26	TextNow, Inc.	2012	9	2	100000000	4.49	1500000
27	zhidalingtong	2024	9	3	400000	4.79	960
28	McDonalds USA, LLC	2014	10	1	70000000	4.36	2100000
29	Chime	2014	3	2	30000000	4.69	850000
30	WarnerMedia Global Digital Services, LLC	2015	7	3	100000000	4.79	3700000
31	LG apps	2023	10	1	20000000	4.22	53000
32	Amazon Mobile LLC	\N	\N	54	4000000000	4.3	33000000
33	Duolingo	2013	5	2	800000000	4.45	33000000
34	NETSTORY PTE. LTD.	2024	7	1	20000000	4.14	910000
35	Alibaba Mobile	2012	9	3	1000000000	4.46	18000000
36	Pinterest	2012	8	3	1000000000	4.38	11000000
37	DoorDash	2013	12	4	100000000	4.63	5800000
38	Venmo	2010	5	1	60000000	4.15	840000
39	zoom.com	2013	1	6	1000000000	4.11	4200000
40	Roku, Inc. & its affiliates	2012	3	3	90000000	4.69	3500000
41	Spotify AB	2014	5	6	3000000000	4.31	32000000
42	Google LLC	\N	\N	159	400000000000	4.16	610000000
43	Uber Technologies, Inc.	2010	10	8	2000000000	4.51	28000000
44	Chick-fil-A, Inc.	2013	5	3	20000000	4.55	200000
45	Peacock TV LLC	2020	7	1	50000000	4.6	450000
46	Pluto, Inc.	2014	3	1	200000000	4.03	630000
47	Glority Global Group Ltd.	2017	7	4	100000000	4.6	850000
48	Shopify Inc.	2014	9	7	80000000	4.46	670000
49	AtomApplications	2023	2	12	20000000	4.26	100000
50	Microsoft Corporation	2011	4	75	20000000000	4.64	71000000
51	KFC US	2021	2	2	7000000	3.39	24000
52	T-Mobile USA	\N	\N	20	200000000	4.48	1300000
53	Disney	2010	6	70	800000000	4.43	7300000
54	SunnyTech Limited	2021	8	2	3000000	4.06	3100
55	Canva	2017	11	1	600000000	4.8	21000000
56	ApplineDev	2023	8	1	6000000	4.54	51000
57	Lyft, Inc.	2012	8	17	80000000	4.43	710000
58	Particle Media Inc.	2016	6	2	90000000	4.63	570000
59	X Corp.	2010	4	2	2000000000	3.73	22000000
60	NetConnect	2023	9	2	4000000	3.53	3800
61	CLOUD WHALE INTERACTIVE TECHNOLOGY LLC.	2023	4	1	30000000	3.83	560000
62	Crunchyroll, LLC	2010	12	70	200000000	4.72	3000000
63	Besitos Corporation LLC	2021	2	1	3000000	4.5	61000
64	aestimium GmbH	2017	6	1	10000000	4.13	160000
65	CBS Interactive, Inc.	\N	\N	9	90000000	4.1	760000
66	Capital One Services, LLC	2011	7	6	60000000	4.54	1900000
67	Credit Karma, LLC	2013	2	2	60000000	4.68	3100000
68	Bestplay	2023	4	1	9000000	4.69	140000
69	Twitch Interactive, Inc.	2012	4	2	300000000	4.01	5200000
70	eBay Mobile	2010	2	3	400000000	4.66	4700000
71	Freecash	2021	8	1	20000000	4.35	180000
72	Apple	2015	9	7	500000000	4.33	890000
73	Appfusion	2025	1	1	5000000	4.8	46000
74	FARSUNPTE.LTD.	2024	9	1	10000000	4.63	260000
75	Plex, Inc.	2011	2	5	90000000	4.07	400000
76	Pandora	\N	\N	2	300000000	3.95	3200000
77	Upside Inc.	2016	4	1	20000000	4.57	410000
78	Waze	\N	\N	1	600000000	4.14	8600000
79	Gamma Play	2014	12	17	900000000	4.79	4300000
80	Samsung Electronics Co.,  Ltd.	2011	2	124	60000000000	4.26	35000000
81	Expedia	2011	5	2	70000000	4.8	1200000
82	Malwarebytes	2013	5	3	40000000	4.48	500000
83	PicsArt, Inc.	2011	11	5	1000000000	4.07	12000000
84	Epic Systems Corporation	2011	9	7	30000000	4.55	230000
85	Airbnb	2012	1	2	200000000	4.44	1700000
86	AT Technologyy	2022	6	4	10000000	4.02	8300
87	MIA Studio Inc	2020	11	32	200000000	4.32	590000
88	GRIMLAX TRADE, S.L.	2024	12	1	2000000	4.38	32000
89	Audible, Inc.	2010	8	1	200000000	4.6	1600000
90	Next Vision Limited	2019	10	12	40000000	4.44	260000
91	Sam's Club	2010	9	2	40000000	4.86	510000
92	Naver Z Corporation	2018	9	2	500000000	4.57	4800000
93	Cash Giraffe	2022	7	1	20000000	4.3	450000
94	AdPulse INC	2025	4	3	2000000	4.82	37000
95	Kennedyy	2023	9	4	50000000	4.56	79000
96	Bigo Technology Pte. Ltd.	2016	3	2	800000000	4.46	6300000
97	Burger King, Inc.	2012	7	29	80000000	4.07	670000
98	Local AI, Inc.	2023	7	2	8000000	4.71	65000
99	Pocket FM Corp.	2018	9	4	200000000	4.56	4099999
100	reddit Inc.	2014	9	1	200000000	4.63	4000000
101	Ring.com	2014	11	2	40000000	4.21	440000
102	Fetch Rewards	2013	11	1	20000000	4.69	1400000
103	Ora Tools	2023	1	7	10000000	4.72	99000
104	NAVER WEBTOON	2010	12	3	200000000	4.53	4300000
105	QR Code Scanner.	2021	7	11	900000000	4.53	4099999
106	FlareFlow Pte. Ltd.	2025	3	1	5000000	4.71	55000
107	Signal Foundation	2010	5	1	200000000	4.55	2700000
108	Progressive Insurance	2010	4	2	20000000	4.64	200000
109	Vrbo	2011	6	3	40000000	4.72	310000
110	Affirm, Inc	2016	6	1	10000000	4.83	470000
111	Instacart	2014	5	6	30000000	4.16	450000
112	Reminders & Alarms	2023	5	5	2000000	4.72	47000
113	Griffin Atlas USA	2024	11	4	1000000	3.42	300
114	Domino's Pizza LLC	2012	2	15	40000000	4.64	2300000
115	PlayWell Team	2022	2	1	3000000	4.52	310000
116	JPMorgan Chase	2010	11	7	60000000	4.49	2000000
117	Adobe	\N	\N	22	2000000000	4.56	16000000
118	CVS Pharmacy	2011	6	4	20000000	3.4	390000
119	Early Warning Services, LLC	2017	9	1	30000000	4.09	160000
120	PerplexityAI	2023	5	1	30000000	4.66	890000
121	Chai Research Corp.	2021	12	1	10000000	4.29	400000
122	Pizza Hut Inc	2011	5	2	30000000	3.99	960000
123	Zillow	2010	3	6	60000000	4.77	1500000
124	Skywork AI Pte. Ltd.	2023	7	2	10000000	4.08	87000
125	Figuredin	2024	9	2	2000000	4.6	8100
126	OfferUp Inc.	2013	10	1	80000000	4.38	1200000
127	NortonMobile	\N	\N	10	100000000	4.56	2300000
128	OneLouder Apps	\N	\N	1	100000000	4.39	1100000
129	JustPlay GmbH	2020	11	1	30000000	4.45	1200000
130	Booking.com Hotels & Vacation Rentals	2011	2	3	700000000	4.79	5000000
131	Too Good To Go Aps	2016	1	1	60000000	4.85	1700000
132	Planet Fitness	2015	2	3	20000000	4.65	70000
133	ONE Finance, Inc.	2016	9	2	7000000	4.77	160000
134	Proton AG	2016	3	6	70000000	4.64	580000
135	Coinbase Inc	2013	3	1	50000000	4.45	890000
136	SafeAuth Services.	2023	6	1	20000000	4.3	100000
137	Nord Security	2016	5	5	100000000	4.56	1100000
138	Degoo Backup AB - Cloud	2012	11	4	300000000	4.2	4600000
139	Costco Wholesale	2012	6	11	30000000	4.7	300000
140	AllTrails, LLC	\N	\N	1	40000000	4.7	370000
141	Secret Phone, Inc	2014	11	1	40000000	4.3	180000
142	MISTPLAY	2016	7	1	50000000	4.52	820000
143	LKW ELE	2024	12	2	2000000	4.32	2400
144	Etsy, Inc	2012	12	2	70000000	4.83	1900000
145	Comcast	2011	2	6	40000000	3.18	390000
146	State Farm Insurance	2010	4	5	20000000	4.46	500000
147	Zedge	\N	\N	4	600000000	4.66	16000000
148	GoodNovel	2020	4	5	70000000	4.77	3300000
149	GMRD Apps Limited	2024	3	1	20000000	4.52	460000
150	PixelArmor	2023	10	2	4000000	3.68	3000
151	SUNSHINING NETWORK LIMITED	2023	12	1	7000000	4.72	38000
152	Anthropic PBC	2024	7	1	6000000	4.66	96000
153	PlantIn	2021	3	2	10000000	4.02	130000
154	Brave Software	2014	3	3	200000000	4.73	2600000
155	Robinhood	2015	8	5	20000000	4.22	530000
156	Charter/Spectrum	2011	12	8	40000000	4.72	1300000
157	JSK Developer	2020	2	3	3000000	4.67	13000
158	Suno, Inc	2024	12	1	20000000	4.8	500000
159	Little Caesar Enterprises, Inc.	2016	9	2	20000000	4.74	520000
160	xStudios	2021	7	3	1000000	4.33	60000
161	ReciMe	2023	6	1	300000	4.68	5200
162	The CW Network	2012	3	1	20000000	3.81	320000
163	GroupMe	2010	11	1	30000000	4.6	590000
164	DuckDuckGo	2011	4	1	70000000	4.7	2100000
165	Rocket Money - Bills & Budgets	2016	7	1	10000000	4.65	100000
166	Brigit	2018	4	1	8000000	4.73	270000
167	UKG, Inc.	2011	1	14	20000000	4.03	170000
168	Tinder LLC	2013	7	1	500000000	3.79	8199999
169	BoostVision	2022	1	9	80000000	4.3	620000
170	Wayfair, LLC	2013	11	7	40000000	4.8	380000
171	Finch Care Public Benefit Corporation	2021	5	1	10000000	4.91	430000
172	BandLab Technologies	2011	4	2	100000000	4.67	700000
173	TV Master - Smart TV Remote Control	2020	6	8	90000000	4.42	780000
174	Cleo AI	2019	2	1	4000000	3.98	85000
175	ADP, INC.	2011	5	9	40000000	4.58	720000
176	The Home Depot, Inc	2011	3	3	30000000	4.41	810000
\.


--
-- TOC entry 4874 (class 0 OID 17123)
-- Dependencies: 220
-- Data for Name: dim_maturityratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_maturityratings (maturity_id, maturity_level) FROM stdin;
1	High
2	Medium
3	Low
\.


--
-- TOC entry 4876 (class 0 OID 17129)
-- Dependencies: 222
-- Data for Name: fact_appranking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_appranking (fact_id, app_id, developer_id, category_id, maturity_id, rank, rating, total_installs, recent_installs, price_numeric) FROM stdin;
1	1	1	20	2	1	4.8	630000000	66000000	0.00
2	2	2	14	2	2	4.1	3800000000	52000000	0.00
3	3	3	14	2	3	4	450000000	18000000	0.00
4	4	4	16	\N	4	4.4	11000000000	110000000	0.00
5	5	5	2	2	5	4.6	820000000	37000000	0.00
6	6	3	14	2	6	3.9	6500000000	58000000	0.00
7	7	2	14	2	7	4.3	5100000	950000	0.00
8	8	6	4	2	8	4.6	140000000	15000000	0.00
9	9	7	11	\N	9	4.7	120000000	1100000	0.00
10	10	8	16	2	10	4.1	3600000000	43000000	0.00
11	11	9	16	1	11	4.1	2400000000	32000000	0.00
12	12	10	2	2	12	3.9	830000000	14000000	0.00
13	13	11	4	2	13	4.6	100000000	13000000	0.00
14	14	12	16	\N	14	4.7	7200000000	37000000	0.00
15	15	13	4	2	15	3.7	5700000	5500000	0.00
16	16	14	2	1	16	4.6	6900000	700000	0.00
17	17	12	14	2	17	4.4	11000000000	74000000	0.00
18	18	15	20	2	18	4.8	53000000	3900000	0.00
19	19	16	21	1	19	4	470000	330000	0.00
20	20	17	2	\N	20	4.7	120000000	970000	0.00
21	21	18	22	\N	21	3.9	11000000	670000	0.00
22	22	19	7	2	22	3.5	1400000000	30000000	0.00
23	23	20	4	2	23	3.9	3100000000	29000000	0.00
24	24	21	11	\N	24	4.3	420000000	4300000	0.00
25	25	22	16	2	25	4.3	550000000	7300000	0.00
26	26	23	4	2	26	4.9	200000000	1800000	0.00
27	27	24	26	\N	27	4.7	230000000	2400000	0.00
28	28	25	23	\N	28	4.5	180000000	2600000	0.00
29	29	26	16	\N	29	4.5	120000000	830000	0.00
30	30	27	4	1	30	4.8	400000	380000	0.00
31	31	28	24	\N	31	4.4	71000000	680000	0.00
32	32	29	11	\N	32	4.7	33000000	590000	0.00
33	33	30	4	2	33	4.8	130000000	5000000	0.00
34	34	31	20	\N	34	4.2	20000000	5900000	0.00
35	35	32	4	2	35	4	760000000	8900000	0.00
36	36	33	17	\N	36	4.5	750000000	12000000	0.00
37	37	32	2	2	37	4.4	930000000	9900000	0.00
38	38	34	4	2	38	4.1	23000000	4400000	0.00
39	39	35	2	2	39	4.5	770000000	6200000	0.00
40	40	36	23	2	40	4.4	1300000000	18000000	0.00
41	41	37	24	\N	41	4.7	75000000	750000	0.00
42	42	38	11	\N	42	4.2	62000000	600000	0.00
43	43	39	26	\N	43	4.1	1300000000	10000000	0.00
44	44	40	4	2	44	4.7	86000000	1100000	0.00
45	45	41	10	2	45	4.3	2500000000	33000000	0.00
46	46	42	20	2	46	4.5	550000000	94000000	0.00
47	47	43	1	\N	47	4.4	990000000	9900000	0.00
48	48	44	24	\N	48	4.6	24000000	420000	0.00
49	49	45	4	2	49	4.6	47000000	660000	0.00
50	50	35	2	2	50	4.4	560000000	7100000	0.00
51	51	46	4	2	51	4	250000000	2000000	0.00
52	52	47	17	\N	52	4.6	62000000	1200000	0.00
53	53	48	2	\N	53	4.5	51000000	800000	0.00
54	54	49	18	\N	54	4.3	3100000	330000	0.00
55	55	50	26	\N	55	4.6	520000000	5800000	0.00
56	56	51	24	\N	56	3.4	7400000	250000	0.00
57	57	52	23	\N	57	4.7	28000000	560000	0.00
58	58	40	4	2	58	4	2700000	280000	0.00
59	59	53	4	2	59	4.4	470000000	6200000	0.00
60	60	54	18	\N	60	4	2500000	1200000	0.00
61	61	50	26	\N	61	4.6	170000000	3000000	0.00
62	62	55	12	3	62	4.8	570000000	12000000	0.00
63	63	56	18	\N	63	4.5	6500000	760000	0.00
64	64	57	1	\N	64	4.4	71000000	610000	0.00
65	65	58	5	2	65	4.6	85000000	630000	0.00
66	66	50	16	\N	66	4.7	130000000	2800000	0.00
67	67	59	5	1	67	3.7	1700000000	9700000	0.00
68	68	60	18	\N	68	3.5	4200000	1100000	0.00
69	69	61	4	2	69	3.8	31000000	1600000	0.00
70	70	37	26	\N	70	4.3	25000000	390000	0.00
71	71	62	4	2	71	4.7	180000000	5600000	0.00
72	72	43	24	\N	72	4.6	260000000	1700000	0.00
73	73	12	14	2	73	4.5	3700000000	35000000	0.00
74	74	63	23	1	74	4.5	3400000	330000	0.00
75	75	64	11	\N	75	4.1	11000000	440000	0.00
76	76	65	4	2	76	4	40000000	440000	0.00
77	77	66	11	\N	77	4.5	48000000	420000	0.00
78	78	67	11	\N	78	4.7	54000000	440000	0.00
79	79	2	23	2	79	4.7	30000000	1000000	0.00
80	80	68	4	1	80	4.7	8700000	1000000	0.00
81	81	69	4	2	81	4	310000000	4600000	0.00
82	82	70	2	2	82	4.7	390000000	1700000	0.00
83	83	71	11	1	83	4.3	16000000	820000	0.00
84	84	49	18	\N	84	4.2	4300000	230000	0.00
85	85	72	18	\N	85	3.7	210000000	2900000	0.00
86	86	73	18	\N	86	4.8	5200000	2500000	0.00
87	87	72	4	2	87	3.7	80000000	3400000	0.00
88	88	74	4	2	88	4.6	12000000	2800000	0.00
89	89	75	4	2	89	4	83000000	1800000	0.00
90	90	76	10	2	90	4	310000000	630000	0.00
91	91	77	9	\N	91	4.6	17000000	280000	0.00
92	92	42	18	\N	92	3.7	250000000	4300000	0.00
93	93	78	1	\N	93	4.1	590000000	5100000	0.00
94	94	79	18	\N	94	4.8	700000000	8100000	0.00
95	95	80	18	\N	95	3.9	1500000000	53000000	0.00
96	96	81	9	\N	96	4.8	68000000	680000	0.00
97	97	42	18	\N	97	4.3	1500000000	9000000	0.00
98	98	82	18	\N	98	4.5	42000000	850000	0.00
99	99	83	8	2	99	4.1	1300000000	8700000	0.00
100	100	84	15	\N	100	4.6	27000000	350000	0.00
101	101	85	9	\N	101	4.4	230000000	2600000	0.00
102	102	86	3	\N	102	4	9700000	1300000	0.00
103	103	42	11	\N	103	4.5	1400000000	45000000	0.00
104	104	87	8	\N	104	0	18000000	2700000	0.00
105	105	88	18	\N	105	4.4	1700000	700000	0.00
106	106	89	19	2	106	4.6	250000000	1300000	0.00
107	107	90	18	\N	107	4.4	10000000	350000	0.00
108	108	91	2	\N	108	4.9	36000000	360000	0.00
109	109	92	4	2	109	4.6	210000000	2000000	0.00
110	110	93	23	\N	110	4.3	18000000	430000	0.00
111	111	94	18	2	111	4.8	2300000	1300000	0.00
112	112	95	4	2	112	4.6	45000000	5900000	0.00
113	113	96	14	2	113	4.5	740000000	5200000	0.00
114	114	97	24	\N	114	4.5	25000000	270000	0.00
115	115	98	4	1	115	4.7	7900000	280000	0.00
116	116	42	4	\N	116	4.2	780000000	9800000	0.00
117	117	99	10	2	117	4.6	190000000	3100000	0.00
118	118	100	14	1	118	4.6	200000000	1900000	0.00
119	119	101	23	\N	119	4.1	33000000	500000	0.00
120	120	102	2	\N	120	4.7	24000000	310000	0.00
121	121	103	18	\N	121	3.9	130000	130000	0.00
122	122	104	6	2	122	4.5	150000000	1500000	0.00
123	123	105	20	\N	123	4.6	260000000	9600000	0.00
124	124	106	4	2	124	4.7	4700000	1700000	0.00
125	125	107	16	\N	125	4.6	170000000	1700000	0.00
126	126	108	11	\N	126	4.6	22000000	280000	0.00
127	127	4	16	\N	127	4.4	1800000000	31000000	0.00
128	128	109	9	\N	128	4.8	23000000	310000	0.00
129	129	18	25	\N	129	4.1	4600000	230000	0.00
130	130	110	2	\N	130	4.8	14000000	270000	0.00
131	131	111	24	\N	131	4.1	24000000	270000	0.00
132	132	112	17	\N	132	4.8	810000	160000	0.00
133	133	113	7	\N	133	3.5	1000000	720000	0.00
134	134	114	24	\N	134	4.7	33000000	280000	0.00
135	135	115	4	2	135	4.5	3200000	160000	0.00
136	136	116	11	\N	136	4.5	55000000	350000	0.00
137	137	117	20	\N	137	4.5	840000000	6500000	0.00
138	138	118	15	\N	138	3.4	23000000	250000	0.00
139	139	119	11	\N	139	4.1	31000000	270000	0.00
140	140	53	4	2	140	4.5	100000000	390000	0.00
141	141	120	20	2	141	4.7	26000000	6600000	0.00
142	142	121	4	1	142	4.3	15000000	820000	0.00
143	143	122	24	\N	143	4	25000000	220000	0.00
144	144	123	13	\N	144	4.8	54000000	290000	0.00
145	145	124	14	1	145	4.1	13000000	1100000	0.00
146	146	125	18	\N	146	4.6	1700000	430000	0.00
147	147	126	2	\N	147	4.4	78000000	290000	0.00
148	148	127	18	\N	148	4.6	85000000	1200000	0.00
149	149	128	25	\N	149	4.4	150000000	3600000	0.00
150	150	129	4	1	150	4.4	28000000	450000	0.00
151	151	130	9	\N	151	4.8	740000000	7800000	0.00
152	152	131	24	\N	152	4.9	64000000	910000	0.00
153	153	132	3	\N	153	4.6	17000000	250000	0.00
154	154	133	11	\N	154	4.7	4700000	200000	0.00
155	155	134	18	\N	155	4.7	62000000	4200000	0.00
156	156	135	11	\N	156	4.5	51000000	450000	0.00
157	157	136	18	\N	157	4.3	25000000	1500000	0.00
158	158	137	18	\N	158	4.6	100000000	1800000	0.00
159	159	138	9	2	159	4.2	280000000	3800000	0.00
160	160	139	2	\N	160	4.7	19000000	270000	0.00
161	161	43	26	\N	161	4.6	190000000	2100000	0.00
162	162	140	3	\N	162	4.7	39000000	850000	0.00
163	163	141	16	\N	163	4.3	39000000	1700000	0.00
164	164	142	4	2	164	4.5	46000000	450000	0.00
165	165	143	25	\N	165	4.3	2100000	1100000	0.00
166	166	144	2	2	166	4.8	62000000	670000	0.00
167	167	145	20	\N	167	3.2	19000000	260000	0.00
168	168	146	11	\N	168	4.6	15000000	210000	0.00
169	169	147	22	2	169	4.7	610000000	3000000	0.00
170	170	148	4	2	170	4.9	37000000	3200000	0.00
171	171	149	3	\N	171	4.5	18000000	1400000	0.00
172	172	150	18	\N	172	3.6	3100000	780000	0.00
173	173	151	4	1	173	4.7	6700000	2300000	0.00
174	174	152	20	2	174	4.7	6300000	580000	0.00
175	175	153	18	\N	175	4.4	390000	230000	0.00
176	176	42	9	\N	176	3.9	560000000	2700000	0.00
177	177	154	16	\N	177	4.7	210000000	3400000	0.00
178	178	155	11	\N	178	4.2	24000000	190000	0.00
179	179	156	18	\N	179	4.7	20000000	250000	0.00
180	180	157	19	\N	180	4.6	2000000	170000	0.00
181	181	158	10	2	181	4.8	15000000	1400000	0.00
182	182	159	24	\N	182	4.7	21000000	240000	0.00
183	183	160	23	2	183	4.3	1100000	680000	0.00
184	184	161	24	2	184	4.7	270000	160000	0.00
185	185	162	4	2	185	3.8	21000000	130000	0.00
186	186	163	16	2	186	4.6	33000000	210000	0.00
187	187	164	20	\N	187	4.7	73000000	1100000	0.00
188	188	165	11	\N	188	4.7	12000000	180000	0.00
189	189	166	11	\N	189	4.7	7600000	170000	0.00
190	190	32	23	\N	190	4.2	180000000	1900000	0.00
191	191	167	26	\N	191	4.5	3200000	210000	0.00
192	192	168	21	1	192	3.8	450000000	3400000	0.00
193	193	169	18	\N	193	4.3	21000000	980000	0.00
194	194	170	2	\N	194	4.8	37000000	290000	0.00
195	195	171	3	\N	195	4.9	11000000	330000	0.00
196	196	172	10	2	196	4.7	110000000	1600000	0.00
197	197	173	18	\N	197	4.7	14000000	480000	0.00
198	198	174	11	2	198	4	4200000	160000	0.00
199	199	175	26	\N	199	4.6	32000000	280000	0.00
200	200	176	2	\N	200	4.5	29000000	250000	0.00
\.


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 221
-- Name: fact_appranking_fact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fact_appranking_fact_id_seq', 200, true);


--
-- TOC entry 4715 (class 2606 OID 17117)
-- Name: dim_apps dim_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_apps
    ADD CONSTRAINT dim_apps_pkey PRIMARY KEY (app_id);


--
-- TOC entry 4717 (class 2606 OID 17122)
-- Name: dim_categories dim_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_categories
    ADD CONSTRAINT dim_categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 4713 (class 2606 OID 17112)
-- Name: dim_developers dim_developers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_developers
    ADD CONSTRAINT dim_developers_pkey PRIMARY KEY (developer_id);


--
-- TOC entry 4719 (class 2606 OID 17127)
-- Name: dim_maturityratings dim_maturityratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_maturityratings
    ADD CONSTRAINT dim_maturityratings_pkey PRIMARY KEY (maturity_id);


--
-- TOC entry 4721 (class 2606 OID 17134)
-- Name: fact_appranking fact_appranking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_appranking
    ADD CONSTRAINT fact_appranking_pkey PRIMARY KEY (fact_id);


--
-- TOC entry 4722 (class 2606 OID 17135)
-- Name: fact_appranking fact_appranking_app_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_appranking
    ADD CONSTRAINT fact_appranking_app_id_fkey FOREIGN KEY (app_id) REFERENCES public.dim_apps(app_id);


--
-- TOC entry 4723 (class 2606 OID 17145)
-- Name: fact_appranking fact_appranking_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_appranking
    ADD CONSTRAINT fact_appranking_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.dim_categories(category_id);


--
-- TOC entry 4724 (class 2606 OID 17140)
-- Name: fact_appranking fact_appranking_developer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_appranking
    ADD CONSTRAINT fact_appranking_developer_id_fkey FOREIGN KEY (developer_id) REFERENCES public.dim_developers(developer_id);


--
-- TOC entry 4725 (class 2606 OID 17150)
-- Name: fact_appranking fact_appranking_maturity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_appranking
    ADD CONSTRAINT fact_appranking_maturity_id_fkey FOREIGN KEY (maturity_id) REFERENCES public.dim_maturityratings(maturity_id);


-- Completed on 2025-08-08 19:34:40

--
-- PostgreSQL database dump complete
--


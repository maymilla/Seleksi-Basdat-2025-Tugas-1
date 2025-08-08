--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-08-08 19:31:09

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
-- TOC entry 226 (class 1259 OID 17067)
-- Name: apps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apps (
    app_id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    category_id integer,
    developer_id integer,
    maturity_id integer,
    price_numeric numeric(10,2),
    apk_size_mb real,
    source_url text,
    price_text character varying(50)
);


ALTER TABLE public.apps OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17066)
-- Name: apps_app_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apps_app_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.apps_app_id_seq OWNER TO postgres;

--
-- TOC entry 4913 (class 0 OID 0)
-- Dependencies: 225
-- Name: apps_app_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apps_app_id_seq OWNED BY public.apps.app_id;


--
-- TOC entry 218 (class 1259 OID 17026)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(100) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17025)
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- TOC entry 222 (class 1259 OID 17044)
-- Name: developers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.developers (
    developer_id integer NOT NULL,
    developer_name character varying(255) NOT NULL,
    active_year integer,
    active_month integer,
    source_url text
);


ALTER TABLE public.developers OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17043)
-- Name: developers_developer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.developers_developer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.developers_developer_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 221
-- Name: developers_developer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.developers_developer_id_seq OWNED BY public.developers.developer_id;


--
-- TOC entry 224 (class 1259 OID 17055)
-- Name: developerstats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.developerstats (
    stat_id integer NOT NULL,
    developer_id integer NOT NULL,
    app_count integer,
    total_downloads bigint,
    average_rating real,
    total_rating_count bigint
);


ALTER TABLE public.developerstats OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17054)
-- Name: developerstats_stat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.developerstats_stat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.developerstats_stat_id_seq OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 223
-- Name: developerstats_stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.developerstats_stat_id_seq OWNED BY public.developerstats.stat_id;


--
-- TOC entry 220 (class 1259 OID 17035)
-- Name: maturityratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maturityratings (
    maturity_id integer NOT NULL,
    maturity_level character varying(50) NOT NULL
);


ALTER TABLE public.maturityratings OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17034)
-- Name: maturityratings_maturity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maturityratings_maturity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maturityratings_maturity_id_seq OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 219
-- Name: maturityratings_maturity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maturityratings_maturity_id_seq OWNED BY public.maturityratings.maturity_id;


--
-- TOC entry 228 (class 1259 OID 17093)
-- Name: rankings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rankings (
    ranking_id integer NOT NULL,
    app_id integer NOT NULL,
    rank integer,
    rating real,
    total_installs bigint,
    recent_installs bigint
);


ALTER TABLE public.rankings OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17092)
-- Name: rankings_ranking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rankings_ranking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rankings_ranking_id_seq OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 227
-- Name: rankings_ranking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rankings_ranking_id_seq OWNED BY public.rankings.ranking_id;


--
-- TOC entry 4724 (class 2604 OID 17070)
-- Name: apps app_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps ALTER COLUMN app_id SET DEFAULT nextval('public.apps_app_id_seq'::regclass);


--
-- TOC entry 4720 (class 2604 OID 17029)
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 17047)
-- Name: developers developer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.developers ALTER COLUMN developer_id SET DEFAULT nextval('public.developers_developer_id_seq'::regclass);


--
-- TOC entry 4723 (class 2604 OID 17058)
-- Name: developerstats stat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.developerstats ALTER COLUMN stat_id SET DEFAULT nextval('public.developerstats_stat_id_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 17038)
-- Name: maturityratings maturity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maturityratings ALTER COLUMN maturity_id SET DEFAULT nextval('public.maturityratings_maturity_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 17096)
-- Name: rankings ranking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rankings ALTER COLUMN ranking_id SET DEFAULT nextval('public.rankings_ranking_id_seq'::regclass);


--
-- TOC entry 4905 (class 0 OID 17067)
-- Dependencies: 226
-- Data for Name: apps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apps (app_id, app_name, category_id, developer_id, maturity_id, price_numeric, apk_size_mb, source_url, price_text) FROM stdin;
1	ChatGPT	20	1	2	0.00	43.6	https://www.appbrain.com/app/chatgpt/com.openai.chatgpt	Free
2	TikTok - Videos, Shop & LIVE	14	2	2	0.00	158.7	https://www.appbrain.com/app/tiktok-videos-shop-live/com.zhiliaoapp.musically	Free
3	Threads	14	3	2	0.00	79.3	https://www.appbrain.com/app/threads/com.instagram.barcelona	Free
4	WhatsApp Messenger	16	4	\N	0.00	71.7	https://www.appbrain.com/app/whatsapp-messenger/com.whatsapp	Free
5	Temu: Shop Like a Billionaire	2	5	2	0.00	44.6	https://www.appbrain.com/app/temu-shop-like-a-billionaire/com.einnovation.temu	Free
6	Instagram	14	3	2	0.00	113.5	https://www.appbrain.com/app/instagram/com.instagram.android	Free
7	TikTok Lite - Faster TikTok	14	2	2	0.00	18.6	https://www.appbrain.com/app/tiktok-lite-faster-tiktok/com.tiktok.lite.go	Free
8	DramaBox - Stream Drama Shorts	4	6	2	0.00	59.7	https://www.appbrain.com/app/dramabox-stream-drama-shorts/com.storymatrix.drama	Free
9	Cash App	11	7	\N	0.00	43.6	https://www.appbrain.com/app/cash-app/com.squareup.cash	Free
10	Snapchat	16	8	2	0.00	128.3	https://www.appbrain.com/app/snapchat/com.snapchat.android	Free
11	Telegram	16	9	1	0.00	56.5	https://www.appbrain.com/app/telegram/org.telegram.messenger	Free
12	SHEIN-Shopping Online	2	10	2	0.00	100.7	https://www.appbrain.com/app/shein-shopping-online/com.zzkko	Free
13	ReelShort - Stream Drama & TV	4	11	2	0.00	52.2	https://www.appbrain.com/app/reelshort-stream-drama-tv/com.newleaf.app.android.victor	Free
14	Messenger	16	12	\N	0.00	85.2	https://www.appbrain.com/app/messenger/com.facebook.orca	Free
15	Pick Drama	4	13	2	0.00	39.7	https://www.appbrain.com/app/pick-drama/com.shortego.dramareels	Free
16	Whatnot: Shop, Sell, Connect	2	14	1	0.00	67.3	https://www.appbrain.com/app/whatnot-shop-sell-connect/com.whatnot_mobile	Free
17	Facebook	14	12	2	0.00	88.8	https://www.appbrain.com/app/facebook/com.facebook.katana	Free
18	Grok - AI Assistant	20	15	2	0.00	24.1	https://www.appbrain.com/app/grok-ai-assistant/ai.x.grok	Free
19	Tea Dating Advice	21	16	1	0.00	\N	https://www.appbrain.com/app/tea-dating-advice/com.tea.tea	Free
20	Walmart: Shopping & Savings	2	17	\N	0.00	110.6	https://www.appbrain.com/app/walmart-shopping-savings/com.walmart.android	Free
21	Easy Homescreen	22	18	\N	0.00	68.5	https://www.appbrain.com/app/easy-homescreen/easy.launcher	Free
22	CapCut - Video Editor	7	19	2	0.00	193.5	https://www.appbrain.com/app/capcut-video-editor/com.lemon.lvoverseas	Free
23	Netflix	4	20	2	0.00	36.6	https://www.appbrain.com/app/netflix/com.netflix.mediaclient	Free
24	PayPal - Pay, Send, Save	11	21	\N	0.00	118.5	https://www.appbrain.com/app/paypal-pay-send-save/com.paypal.android.p2pmobile	Free
25	Discord - Talk, Play, Hang Out	16	22	2	0.00	164.6	https://www.appbrain.com/app/discord-talk-play-hang-out/com.discord	Free
26	Tubi: Free Movies & Live TV	4	23	2	0.00	33	https://www.appbrain.com/app/tubi-free-movies-live-tv/com.tubitv	Free
27	Indeed Job Search	26	24	\N	0.00	82.3	https://www.appbrain.com/app/indeed-job-search/com.indeed.android.jobsearch	Free
28	Life360: Stay Connected & Safe	23	25	\N	0.00	\N	https://www.appbrain.com/app/life360-stay-connected-safe/com.life360.android.safetymapd	Free
29	TextNow: Call + Text Unlimited	16	26	\N	0.00	119.4	https://www.appbrain.com/app/textnow-call-text-unlimited/com.enflick.android.TextNow	Free
30	Pop Drama	4	27	1	0.00	32.2	https://www.appbrain.com/app/pop-drama/com.popdramas.top	Free
31	McDonald's	24	28	\N	0.00	105.7	https://www.appbrain.com/app/mcdonalds/com.mcdonalds.app	Free
32	Chime – Mobile Banking	11	29	\N	0.00	\N	https://www.appbrain.com/app/chime-mobile-banking/com.onedebit.chime	Free
33	HBO Max: Stream TV & Movies	4	30	2	0.00	63.2	https://www.appbrain.com/app/hbo-max-stream-tv-movies/com.wbd.stream	Free
34	PDF Reader and Photo to PDF	20	31	\N	0.00	39.4	https://www.appbrain.com/app/pdf-reader-and-photo-to-pdf/com.pdf.editor.viewer.pdfreader.pdfviewer	Free
35	Prime Video	4	32	2	0.00	62	https://www.appbrain.com/app/prime-video/com.amazon.avod.thirdpartyclient	Free
36	Duolingo: Language Lessons	17	33	\N	0.00	44.9	https://www.appbrain.com/app/duolingo-language-lessons/com.duolingo	Free
37	Amazon Shopping	2	32	2	0.00	101.3	https://www.appbrain.com/app/amazon-shopping/com.amazon.mShop.android.shopping	Free
38	NetShort - Popular Dramas & TV	4	34	2	0.00	78.7	https://www.appbrain.com/app/netshort-popular-dramas-tv/com.netshort.abroad	Free
39	AliExpress - Shopping App	2	35	2	0.00	39.5	https://www.appbrain.com/app/aliexpress-shopping-app/com.alibaba.aliexpresshd	Free
40	Pinterest	23	36	2	0.00	47.7	https://www.appbrain.com/app/pinterest/com.pinterest	Free
41	DoorDash: Food, Grocery, More	24	37	\N	0.00	121.5	https://www.appbrain.com/app/doordash-food-grocery-more/com.dd.doordash	Free
42	Venmo	11	38	\N	0.00	94.8	https://www.appbrain.com/app/venmo/com.venmo	Free
43	Zoom Workplace	26	39	\N	0.00	195.1	https://www.appbrain.com/app/zoom-workplace/us.zoom.videomeetings	Free
44	The Roku App (Official)	4	40	2	0.00	30.6	https://www.appbrain.com/app/the-roku-app-official/com.roku.remote	Free
45	Spotify: Music and Podcasts	10	41	2	0.00	55.5	https://www.appbrain.com/app/spotify-music-and-podcasts/com.spotify.music	Free
46	Google Gemini	20	42	2	0.00	2.88	https://www.appbrain.com/app/google-gemini/com.google.android.apps.bard	Free
47	Uber - Request a ride	1	43	\N	0.00	130.7	https://www.appbrain.com/app/uber-request-a-ride/com.ubercab	Free
48	Chick-fil-A®	24	44	\N	0.00	61.1	https://www.appbrain.com/app/chick-fil-a%C2%AE/com.chickfila.cfaflagship	Free
49	Peacock TV: Stream TV & Movies	4	45	2	0.00	44.9	https://www.appbrain.com/app/peacock-tv-stream-tv-movies/com.peacocktv.peacockandroid	Free
50	Alibaba.com - B2B marketplace	2	35	2	0.00	72.3	https://www.appbrain.com/app/alibaba-com-b2b-marketplace/com.alibaba.intl.android.apps.poseidon	Free
51	PlutoTV: Live TV & Free Movies	4	46	2	0.00	25.7	https://www.appbrain.com/app/plutotv-live-tv-free-movies/tv.pluto.android	Free
52	PictureThis - Plant Identifier	17	47	\N	0.00	54.9	https://www.appbrain.com/app/picturethis-plant-identifier/cn.danatech.xingseus	Free
53	Shop: All your favorite brands	2	48	\N	0.00	85.3	https://www.appbrain.com/app/shop-all-your-favorite-brands/com.shopify.arrive	Free
54	Brightest Flashlight Launcher	18	49	\N	0.00	\N	https://www.appbrain.com/app/brightest-flashlight-launcher/com.flashlight.bright.led.light	Free
55	Microsoft Teams	26	50	\N	0.00	187.5	https://www.appbrain.com/app/microsoft-teams/com.microsoft.teams	Free
56	KFC US - Ordering App	24	51	\N	0.00	39.9	https://www.appbrain.com/app/kfc-us-ordering-app/com.kfc.us.mobile	Free
57	T-Life	23	52	\N	0.00	152.3	https://www.appbrain.com/app/t-life/com.tmobile.tuesdays	Free
58	The Roku Channel	4	40	2	0.00	\N	https://www.appbrain.com/app/the-roku-channel/com.roku.web.trc	Free
59	Disney+	4	53	2	0.00	23.2	https://www.appbrain.com/app/disney/com.disney.disneyplus	Free
60	PhotoRescue-Recover Files	18	54	\N	0.00	32.7	https://www.appbrain.com/app/photorescue-recover-files/com.rescue.psoeprs.solf	Free
61	Microsoft Authenticator	26	50	\N	0.00	113.8	https://www.appbrain.com/app/microsoft-authenticator/com.azure.authenticator	Free
62	Canva: AI Photo & Video Editor	12	55	3	0.00	15.7	https://www.appbrain.com/app/canva-ai-photo-video-editor/com.canva.editor	Free
63	AntiVirus Toolkit	18	56	\N	0.00	33.7	https://www.appbrain.com/app/antivirus-toolkit/com.utils.antivirustoolkit	Free
64	Lyft	1	57	\N	0.00	68.6	https://www.appbrain.com/app/lyft/me.lyft.android	Free
65	NewsBreak: Local News & Alerts	5	58	2	0.00	32.6	https://www.appbrain.com/app/newsbreak-local-news-alerts/com.particlenews.newsbreak	Free
66	Microsoft Edge: AI browser	16	50	\N	0.00	189.3	https://www.appbrain.com/app/microsoft-edge-ai-browser/com.microsoft.emmx	Free
67	X (Formerly Twitter)	5	59	1	0.00	85.7	https://www.appbrain.com/app/x-formerly-twitter/com.twitter.android	Free
68	Photo Recover-File Recovery	18	60	\N	0.00	35.9	https://www.appbrain.com/app/photo-recover-file-recovery/com.pvoercase.recover	Free
69	PolyBuzz: Chat with AI Friends	4	61	2	0.00	75.7	https://www.appbrain.com/app/polybuzz-chat-with-ai-friends/ai.socialapps.speakmaster	Free
70	DoorDash - Dasher	26	37	\N	0.00	233.5	https://www.appbrain.com/app/doordash-dasher/com.doordash.driverapp	Free
71	Crunchyroll	4	62	2	0.00	55.9	https://www.appbrain.com/app/crunchyroll/com.crunchyroll.crunchyroid	Free
72	Uber Eats: Food Delivery	24	43	\N	0.00	101.3	https://www.appbrain.com/app/uber-eats-food-delivery/com.ubercab.eats	Free
73	Facebook Lite	14	12	2	0.00	2.82	https://www.appbrain.com/app/facebook-lite/com.facebook.lite	Free
74	KashKick: Get paid to have fun	23	63	1	0.00	\N	https://www.appbrain.com/app/kashkick-get-paid-to-have-fun/com.kashkick.kashkickapp	Free
75	testerup - earn money	11	64	\N	0.00	56	https://www.appbrain.com/app/testerup-earn-money/de.empfohlen	Free
76	Paramount+	4	65	2	0.00	43.9	https://www.appbrain.com/app/paramount/com.cbs.app	Free
77	Capital One Mobile	11	66	\N	0.00	\N	https://www.appbrain.com/app/capital-one-mobile/com.konylabs.capitalone	Free
78	Intuit Credit Karma	11	67	\N	0.00	42.2	https://www.appbrain.com/app/intuit-credit-karma/com.creditkarma.mobile	Free
79	Lemon8 - Lifestyle Community	23	2	2	0.00	83	https://www.appbrain.com/app/lemon8-lifestyle-community/com.bd.nproject	Free
80	BESTPLAY Play to earn & donate	4	68	1	0.00	44.5	https://www.appbrain.com/app/bestplay-play-to-earn-donate/com.bestplay.app	Free
81	Twitch: Live Streaming	4	69	2	0.00	91.9	https://www.appbrain.com/app/twitch-live-streaming/tv.twitch.android.app	Free
82	eBay online shopping & selling	2	70	2	0.00	69	https://www.appbrain.com/app/ebay-online-shopping-selling/com.ebay.mobile	Free
83	Freecash: Earn Money & Rewards	11	71	1	0.00	12	https://www.appbrain.com/app/freecash-earn-money-rewards/com.freecash.app2	Free
84	QR & Barcode Scanner Launcher	18	49	\N	0.00	\N	https://www.appbrain.com/app/qr-barcode-scanner-launcher/com.qr.code.reader.scanner.qrscan.android	Free
85	Move to iOS	18	72	\N	0.00	9.96	https://www.appbrain.com/app/move-to-ios/com.apple.movetoios	Free
86	Hizen VPN - Fast & Secure VPN	18	73	\N	0.00	26.7	https://www.appbrain.com/app/hizen-vpn-fast-secure-vpn/com.hizen.vpn	Free
87	Apple TV	4	72	2	0.00	\N	https://www.appbrain.com/app/apple-tv/com.apple.atve.androidtv.appletv	Free
88	FlickReels - Short Drama & TV	4	74	2	0.00	63	https://www.appbrain.com/app/flickreels-short-drama-tv/com.zyhwplatform.shortplay	Free
89	Plex: Stream Movies & TV	4	75	2	0.00	35.3	https://www.appbrain.com/app/plex-stream-movies-tv/com.plexapp.android	Free
90	Pandora - Music & Podcasts	10	76	2	0.00	69.6	https://www.appbrain.com/app/pandora-music-podcasts/com.pandora.android	Free
91	Upside: Cash Back - Gas & Food	9	77	\N	0.00	24.2	https://www.appbrain.com/app/upside-cash-back-gas-food/com.upside.consumer.android	Free
92	Google Authenticator	18	42	\N	0.00	6	https://www.appbrain.com/app/google-authenticator/com.google.android.apps.authenticator2	Free
93	Waze Navigation & Live Traffic	1	78	\N	0.00	79.7	https://www.appbrain.com/app/waze-navigation-live-traffic/com.waze	Free
94	QR & Barcode Scanner	18	79	\N	0.00	14.9	https://www.appbrain.com/app/qr-barcode-scanner/com.gamma.scan	Free
95	Samsung Smart Switch Mobile	18	80	\N	0.00	39.1	https://www.appbrain.com/app/samsung-smart-switch-mobile/com.sec.android.easyMover	Free
96	Expedia: Hotels, Flights, Cars	9	81	\N	0.00	\N	https://www.appbrain.com/app/expedia-hotels-flights-cars/com.expedia.bookings	Free
97	Google Translate	18	42	\N	0.00	43.7	https://www.appbrain.com/app/google-translate/com.google.android.apps.translate	Free
98	Malwarebytes Mobile Security	18	82	\N	0.00	33	https://www.appbrain.com/app/malwarebytes-mobile-security/org.malwarebytes.antimalware	Free
99	Picsart AI Photo Editor, Video	8	83	2	0.00	62.7	https://www.appbrain.com/app/picsart-ai-photo-editor-video/com.picsart.studio	Free
100	MyChart	15	84	\N	0.00	44.6	https://www.appbrain.com/app/mychart/epic.mychart.android	Free
101	Airbnb	9	85	\N	0.00	51.7	https://www.appbrain.com/app/airbnb/com.airbnb.android	Free
102	Blood Pressure Tracker	3	86	\N	0.00	64	https://www.appbrain.com/app/blood-pressure-tracker/com.cactus.tracker.bloodpressure	Free
103	Google Wallet	11	42	\N	0.00	19.7	https://www.appbrain.com/app/google-wallet/com.google.android.apps.walletnfcrel	Free
104	Geotag Photo: Camera Location	8	87	\N	0.00	23.2	https://www.appbrain.com/app/geotag-photo-camera-location/com.cameratag.geotagphoto.gpscamera	Free
105	AI Cleaner - Phone Cleaner	18	88	\N	0.00	\N	https://www.appbrain.com/app/ai-cleaner-phone-cleaner/ai.storage.cleaner.app	Free
106	Audible: Audio Entertainment	19	89	2	0.00	160.2	https://www.appbrain.com/app/audible-audio-entertainment/com.audible.application	Free
107	CoinSnap - Coin Identifier	18	90	\N	0.00	67.6	https://www.appbrain.com/app/coinsnap-coin-identifier/com.coinidentifyer.ai	Free
108	Sam’s Club: Pickup & Delivery	2	91	\N	0.00	92.1	https://www.appbrain.com/app/sam%E2%80%99s-club-pickup-delivery/com.rfi.sams.android	Free
109	ZEPETO: Avatar, Connect & Live	4	92	2	0.00	192.4	https://www.appbrain.com/app/zepeto-avatar-connect-live/me.zepeto.main	Free
110	Cash Giraffe: Games & Rewards	23	93	\N	0.00	82.5	https://www.appbrain.com/app/cash-giraffe-games-rewards/cashgiraffe.app	Free
111	Open Browser - Smart & Safe	18	94	2	0.00	45.1	https://www.appbrain.com/app/open-browser-smart-safe/com.open.web.ai.browser	Free
112	RapidTV - Short Dramas	4	95	2	0.00	28.4	https://www.appbrain.com/app/rapidtv-short-dramas/com.rapid.short.tv	Free
113	Bigo Live - Live Streaming App	14	96	2	0.00	61.7	https://www.appbrain.com/app/bigo-live-live-streaming-app/sg.bigo.live	Free
114	BURGER KING® App	24	97	\N	0.00	56.1	https://www.appbrain.com/app/burger-king%C2%AE-app/com.emn8.mobilem8.nativeapp.bk	Free
115	Scoopz: Real Life, Real Video	4	98	1	0.00	69	https://www.appbrain.com/app/scoopz-real-life-real-video/com.localaiapp.scoops	Free
116	YouTube Kids	4	42	\N	0.00	33.8	https://www.appbrain.com/app/youtube-kids/com.google.android.apps.youtube.kids	Free
117	Pocket FM: Audio Series	10	99	2	0.00	83.7	https://www.appbrain.com/app/pocket-fm-audio-series/com.radio.pocketfm	Free
118	Reddit	14	100	1	0.00	54	https://www.appbrain.com/app/reddit/com.reddit.frontpage	Free
119	Ring - Always Home	23	101	\N	0.00	177.4	https://www.appbrain.com/app/ring-always-home/com.ringapp	Free
120	Fetch: America’s Rewards App	2	102	\N	0.00	207	https://www.appbrain.com/app/fetch-america%E2%80%99s-rewards-app/com.fetchrewards.fetchrewards.hop	Free
121	PDF Reader – Reader & Editor	18	103	\N	0.00	64.8	https://www.appbrain.com/app/pdf-reader-reader-editor/pdf.reader.editor.office.ora	Free
122	WEBTOON: Manga, Comics, Manhwa	6	104	2	0.00	64.2	https://www.appbrain.com/app/webtoon-manga-comics-manhwa/com.naver.linewebtoon	Free
123	PDF Reader - PDF Viewer	20	105	\N	0.00	60.8	https://www.appbrain.com/app/pdf-reader-pdf-viewer/pdf.pdfreader.viewer.editor.free	Free
124	FlareFlow: 1-Minute Dramas!	4	106	2	0.00	76.2	https://www.appbrain.com/app/flareflow-1-minute-dramas/tv.flareflow.drama	Free
125	Signal Private Messenger	16	107	\N	0.00	82.9	https://www.appbrain.com/app/signal-private-messenger/org.thoughtcrime.securesms	Free
126	Progressive	11	108	\N	0.00	153.9	https://www.appbrain.com/app/progressive/com.phonevalley.progressive	Free
127	WhatsApp Business	16	4	\N	0.00	78	https://www.appbrain.com/app/whatsapp-business/com.whatsapp.w4b	Free
128	Vrbo Vacation Rentals	9	109	\N	0.00	\N	https://www.appbrain.com/app/vrbo-vacation-rentals/com.vrbo.android	Free
129	Weather Now Launcher - Radar	25	18	\N	0.00	56.4	https://www.appbrain.com/app/weather-now-launcher-radar/com.eet.weather.launcher	Free
130	Affirm: Buy now, pay over time	2	110	\N	0.00	56.9	https://www.appbrain.com/app/affirm-buy-now-pay-over-time/com.affirm.central	Free
131	Instacart: Get Food Delivery	24	111	\N	0.00	53.6	https://www.appbrain.com/app/instacart-get-food-delivery/com.instacart.client	Free
132	Simple Bible Daily Verse Alarm	17	112	\N	0.00	65.1	https://www.appbrain.com/app/simple-bible-daily-verse-alarm/com.holy.bible.study	Free
133	Video&Drama Player All Format	7	113	\N	0.00	52.2	https://www.appbrain.com/app/video-drama-player-all-format/com.deep.useful.video	Free
134	Domino's Pizza USA	24	114	\N	0.00	80.4	https://www.appbrain.com/app/dominos-pizza-usa/com.dominospizza	Free
135	PlayWell: Play to Earn	4	115	2	0.00	31.2	https://www.appbrain.com/app/playwell-play-to-earn/com.play.lucky.real.earn.money.free.fun.games.play.reward.income	Free
136	Chase Mobile	11	116	\N	0.00	\N	https://www.appbrain.com/app/chase-mobile/com.chase.sig.android	Free
137	Adobe Acrobat Reader: Edit PDF	20	117	\N	0.00	118.4	https://www.appbrain.com/app/adobe-acrobat-reader-edit-pdf/com.adobe.reader	Free
138	CVS Health	15	118	\N	0.00	\N	https://www.appbrain.com/app/cvs-health/com.cvs.launchers.cvs	Free
139	Zelle®	11	119	\N	0.00	\N	https://www.appbrain.com/app/zelle%C2%AE/com.zellepay.zelle	Free
140	Hulu: Stream TV shows & movies	4	53	2	0.00	17.9	https://www.appbrain.com/app/hulu-stream-tv-shows-movies/com.hulu.plus	Free
141	Perplexity - Ask Anything	20	120	2	0.00	64.3	https://www.appbrain.com/app/perplexity-ask-anything/ai.perplexity.app.android	Free
142	Chai: Chat AI Platform	4	121	1	0.00	69	https://www.appbrain.com/app/chai-chat-ai-platform/com.Beauchamp.Messenger.external	Free
143	Pizza Hut - Delivery & Takeout	24	122	\N	0.00	150	https://www.appbrain.com/app/pizza-hut-delivery-takeout/com.yum.pizzahut	Free
144	Zillow: Homes For Sale & Rent	13	123	\N	0.00	\N	https://www.appbrain.com/app/zillow-homes-for-sale-rent/com.zillow.android.zillowmap	Free
145	Linky AI: Chat, Play, Connect	14	124	1	0.00	245.8	https://www.appbrain.com/app/linky-ai-chat-play-connect/com.aigc.ushow.ichat	Free
146	Smart Remote - Easy TV Control	18	125	\N	0.00	\N	https://www.appbrain.com/app/smart-remote-easy-tv-control/com.rokutv.remote.app	Free
147	OfferUp: Buy. Sell. Simple.	2	126	\N	0.00	\N	https://www.appbrain.com/app/offerup-buy-sell-simple/com.offerup	Free
148	Norton360 Antivirus & Security	18	127	\N	0.00	\N	https://www.appbrain.com/app/norton360-antivirus-security/com.symantec.mobilesecurity	Free
149	1Weather Forecasts & Radar	25	128	\N	0.00	59	https://www.appbrain.com/app/1weather-forecasts-radar/com.handmark.expressweather	Free
150	JustPlay: Earn Money or Donate	4	129	1	0.00	58.2	https://www.appbrain.com/app/justplay-earn-money-or-donate/com.justplay.app	Free
151	Booking.com: Hotels & Travel	9	130	\N	0.00	99.9	https://www.appbrain.com/app/booking-com-hotels-travel/com.booking	Free
152	Too Good To Go: End Food Waste	24	131	\N	0.00	39.1	https://www.appbrain.com/app/too-good-to-go-end-food-waste/com.app.tgtg	Free
153	Planet Fitness	3	132	\N	0.00	\N	https://www.appbrain.com/app/planet-fitness/com.planetfitness	Free
154	OnePay – Mobile Banking	11	133	\N	0.00	109	https://www.appbrain.com/app/onepay-mobile-banking/com.onefinance.one	Free
155	VPN Proton: Fast & Secure VPN	18	134	\N	0.00	35.9	https://www.appbrain.com/app/vpn-proton-fast-secure-vpn/ch.protonvpn.android	Free
156	Coinbase: Buy BTC, ETH, SOL	11	135	\N	0.00	164.5	https://www.appbrain.com/app/coinbase-buy-btc-eth-sol/com.coinbase.android	Free
157	Authenticator App - SafeAuth	18	136	\N	0.00	31.5	https://www.appbrain.com/app/authenticator-app-safeauth/authenticator.two.factor.authentication.otp	Free
158	NordVPN – fast VPN for privacy	18	137	\N	0.00	37.4	https://www.appbrain.com/app/nordvpn-fast-vpn-for-privacy/com.nordvpn.android	Free
159	Instabridge: WiFi Hotspot Map	9	138	2	0.00	73.1	https://www.appbrain.com/app/instabridge-wifi-hotspot-map/com.instabridge.android	Free
160	Costco Wholesale	2	139	\N	0.00	\N	https://www.appbrain.com/app/costco-wholesale/com.costco.app.android	Free
161	Uber - Driver: Drive & Deliver	26	43	\N	0.00	175.5	https://www.appbrain.com/app/uber-driver-drive-deliver/com.ubercab.driver	Free
162	AllTrails: Hike, Bike & Run	3	140	\N	0.00	115	https://www.appbrain.com/app/alltrails-hike-bike-run/com.alltrails.alltrails	Free
163	Zangi Private Messenger	16	141	\N	0.00	71.9	https://www.appbrain.com/app/zangi-private-messenger/com.beint.zangi	Free
164	MISTPLAY: Play to Earn Money	4	142	2	0.00	52.7	https://www.appbrain.com/app/mistplay-play-to-earn-money/com.mistplay.mistplay	Free
165	Warm Weather	25	143	\N	0.00	30.2	https://www.appbrain.com/app/warm-weather/com.warmweather.forecast.reporter	Free
166	Etsy: A Special Marketplace	2	144	2	0.00	27.6	https://www.appbrain.com/app/etsy-a-special-marketplace/com.etsy.android	Free
167	Xfinity	20	145	\N	0.00	\N	https://www.appbrain.com/app/xfinity/com.xfinity.digitalhome	Free
168	State Farm®	11	146	\N	0.00	60.1	https://www.appbrain.com/app/state-farm%C2%AE/com.statefarm.pocketagent	Free
169	Zedge™ Wallpapers & Ringtones	22	147	2	0.00	73.6	https://www.appbrain.com/app/zedge%E2%84%A2-wallpapers-ringtones/net.zedge.android	Free
170	GoodShort - Movies & Dramas	4	148	2	0.00	34.2	https://www.appbrain.com/app/goodshort-movies-dramas/com.newreading.goodreels	Free
171	Impulse - Brain Training Games	3	149	\N	0.00	\N	https://www.appbrain.com/app/impulse-brain-training-games/gen.tech.impulse.android	Free
172	Photo Recovery & File Recovery	18	150	\N	0.00	24.3	https://www.appbrain.com/app/photo-recovery-file-recovery/wiac.gpak.nvqe.allrecovery	Free
173	ShotShort-Dramas&Shorts	4	151	1	0.00	66.9	https://www.appbrain.com/app/shotshort-dramas-shorts/com.mediaradiance.shotshort	Free
174	Claude by Anthropic	20	152	2	0.00	12.3	https://www.appbrain.com/app/claude-by-anthropic/com.anthropic.claude	Free
175	CoinIn – Coin Scan Identifier	18	153	\N	0.00	6.67	https://www.appbrain.com/app/coinin-coin-scan-identifier/com.coinin.app	Free
176	Google Earth	9	42	\N	0.00	87.7	https://www.appbrain.com/app/google-earth/com.google.earth	Free
177	Brave Private Web Browser, VPN	16	154	\N	0.00	194.6	https://www.appbrain.com/app/brave-private-web-browser-vpn/com.brave.browser	Free
178	Robinhood: Trading & Investing	11	155	\N	0.00	116.8	https://www.appbrain.com/app/robinhood-trading-investing/com.robinhood.android	Free
179	My Spectrum	18	156	\N	0.00	\N	https://www.appbrain.com/app/my-spectrum/com.brighthouse.mybhn	Free
180	KJV Bible: Audio+Verse	19	157	\N	0.00	35.8	https://www.appbrain.com/app/kjv-bible-audio-verse/com.liotek.lannbible	Free
181	Suno - AI Music & Songs	10	158	2	0.00	26	https://www.appbrain.com/app/suno-ai-music-songs/com.suno.android	Free
182	Little Caesars	24	159	\N	0.00	37.9	https://www.appbrain.com/app/little-caesars/com.littlecaesars	Free
183	Deepsearch AI Search Assistant	23	160	2	0.00	101	https://www.appbrain.com/app/deepsearch-ai-search-assistant/hubx.whois.ai.search	Free
184	ReciMe: Recipes & Meal Planner	24	161	2	0.00	\N	https://www.appbrain.com/app/recime-recipes-meal-planner/com.recime.app	Free
185	The CW	4	162	2	0.00	26.9	https://www.appbrain.com/app/the-cw/com.cw.fullepisodes.android	Free
186	GroupMe	16	163	2	0.00	141.4	https://www.appbrain.com/app/groupme/com.groupme.android	Free
187	DuckDuckGo Browser, Search, AI	20	164	\N	0.00	47.9	https://www.appbrain.com/app/duckduckgo-browser-search-ai/com.duckduckgo.mobile.android	Free
188	Rocket Money - Bills & Budgets	11	165	\N	0.00	82.6	https://www.appbrain.com/app/rocket-money-bills-budgets/com.truebill	Free
189	Brigit: Cash Advance & Credit	11	166	\N	0.00	54.7	https://www.appbrain.com/app/brigit-cash-advance-credit/com.hellobrigit.Brigit	Free
190	Amazon Alexa	23	32	\N	0.00	\N	https://www.appbrain.com/app/amazon-alexa/com.amazon.dee.app	Free
191	UKG Pro	26	167	\N	0.00	78.9	https://www.appbrain.com/app/ukg-pro/com.ukg.oneapp	Free
192	Tinder Dating App: Chat & Date	21	168	1	0.00	83.3	https://www.appbrain.com/app/tinder-dating-app-chat-date/com.tinder	Free
193	Universal TV Remote for All TV	18	169	\N	0.00	80.4	https://www.appbrain.com/app/universal-tv-remote-for-all-tv/com.boost.universal.remote	Free
194	Wayfair - Shop All Things Home	2	170	\N	0.00	\N	https://www.appbrain.com/app/wayfair-shop-all-things-home/com.wayfair.wayfair	Free
195	Finch: Self-Care Pet	3	171	\N	0.00	85.1	https://www.appbrain.com/app/finch-self-care-pet/com.finch.finch	Free
196	BandLab – Music Making Studio	10	172	2	0.00	51.8	https://www.appbrain.com/app/bandlab-music-making-studio/com.bandlab.bandlab	Free
197	TV Remote: Roku Remote Control	18	173	\N	0.00	23	https://www.appbrain.com/app/tv-remote-roku-remote-control/com.roku.remote.control.tv.cast	Free
198	Cleo AI: Cash advance & Credit	11	174	2	0.00	\N	https://www.appbrain.com/app/cleo-ai-cash-advance-credit/com.meetcleo.cleo	Free
199	ADP Mobile Solutions	26	175	\N	0.00	92.7	https://www.appbrain.com/app/adp-mobile-solutions/com.adpmobile.android	Free
200	The Home Depot	2	176	\N	0.00	78	https://www.appbrain.com/app/the-home-depot/com.thehomedepot	Free
\.


--
-- TOC entry 4897 (class 0 OID 17026)
-- Dependencies: 218
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
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
-- TOC entry 4901 (class 0 OID 17044)
-- Dependencies: 222
-- Data for Name: developers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.developers (developer_id, developer_name, active_year, active_month, source_url) FROM stdin;
1	OpenAI	2023	7	https://www.appbrain.com/dev/OpenAI/
2	TikTok Pte. Ltd.	2015	7	https://www.appbrain.com/dev/TikTok+Pte.+Ltd./
3	Instagram	2012	4	https://www.appbrain.com/dev/Instagram/
4	WhatsApp LLC	2010	10	https://www.appbrain.com/dev/WhatsApp+LLC/
5	Temu	2022	8	https://www.appbrain.com/dev/Temu/
6	STORYMATRIX	2022	2	https://www.appbrain.com/dev/STORYMATRIX/
7	Block, Inc.	2010	5	https://www.appbrain.com/dev/Block%2C+Inc./
8	Snap Inc	2012	10	https://www.appbrain.com/dev/Snap+Inc/
9	Telegram FZ-LLC	2013	10	https://www.appbrain.com/dev/Telegram+FZ-LLC/
10	Roadget Business PTE. LTD.	2014	3	https://www.appbrain.com/dev/Roadget+Business+PTE.+LTD./
11	NewLeaf Publishing	2022	8	https://www.appbrain.com/dev/NewLeaf+Publishing/
12	Meta Platforms, Inc.	\N	\N	https://www.appbrain.com/dev/Meta+Platforms%2C+Inc./
13	createwonderful	2025	4	https://www.appbrain.com/dev/createwonderful/
14	Whatnot Inc.	2019	12	https://www.appbrain.com/dev/Whatnot+Inc./
15	xAI	2025	2	https://www.appbrain.com/dev/xAI/
16	Tea Dating Advice Inc.	2024	3	https://www.appbrain.com/dev/Tea+Dating+Advice+Inc./
17	Walmart	2011	5	https://www.appbrain.com/dev/Walmart/
18	Homescreen Apps	2023	1	https://www.appbrain.com/dev/Homescreen+Apps/
19	Bytedance Pte. Ltd.	2014	1	https://www.appbrain.com/dev/Bytedance+Pte.+Ltd./
20	Netflix, Inc.	2011	5	https://www.appbrain.com/dev/Netflix%2C+Inc./
21	PayPal Mobile	\N	\N	https://www.appbrain.com/dev/PayPal+Mobile/
22	Discord Inc.	2015	5	https://www.appbrain.com/dev/Discord+Inc./
23	Tubi TV	2012	3	https://www.appbrain.com/dev/Tubi+TV/
24	Indeed Jobs	2010	1	https://www.appbrain.com/dev/Indeed+Jobs/
25	Life360	2010	2	https://www.appbrain.com/dev/Life360/
26	TextNow, Inc.	2012	9	https://www.appbrain.com/dev/TextNow%2C+Inc./
27	zhidalingtong	2024	9	https://www.appbrain.com/dev/zhidalingtong/
28	McDonalds USA, LLC	2014	10	https://www.appbrain.com/dev/McDonalds+USA%2C+LLC/
29	Chime	2014	3	https://www.appbrain.com/dev/Chime/
30	WarnerMedia Global Digital Services, LLC	2015	7	https://www.appbrain.com/dev/WarnerMedia+Global+Digital+Services%2C+LLC/
31	LG apps	2023	10	https://www.appbrain.com/dev/LG+apps/
32	Amazon Mobile LLC	\N	\N	https://www.appbrain.com/dev/Amazon+Mobile+LLC/
33	Duolingo	2013	5	https://www.appbrain.com/dev/Duolingo/
34	NETSTORY PTE. LTD.	2024	7	https://www.appbrain.com/dev/NETSTORY+PTE.+LTD./
35	Alibaba Mobile	2012	9	https://www.appbrain.com/dev/Alibaba+Mobile/
36	Pinterest	2012	8	https://www.appbrain.com/dev/Pinterest/
37	DoorDash	2013	12	https://www.appbrain.com/dev/DoorDash/
38	Venmo	2010	5	https://www.appbrain.com/dev/Venmo/
39	zoom.com	2013	1	https://www.appbrain.com/dev/zoom.com/
40	Roku, Inc. & its affiliates	2012	3	https://www.appbrain.com/dev/Roku%2C+Inc.+%26+its+affiliates/
41	Spotify AB	2014	5	https://www.appbrain.com/dev/Spotify+AB/
42	Google LLC	\N	\N	https://www.appbrain.com/dev/Google+LLC/
43	Uber Technologies, Inc.	2010	10	https://www.appbrain.com/dev/Uber+Technologies%2C+Inc./
44	Chick-fil-A, Inc.	2013	5	https://www.appbrain.com/dev/Chick-fil-A%2C+Inc./
45	Peacock TV LLC	2020	7	https://www.appbrain.com/dev/Peacock+TV+LLC/
46	Pluto, Inc.	2014	3	https://www.appbrain.com/dev/Pluto%2C+Inc./
47	Glority Global Group Ltd.	2017	7	https://www.appbrain.com/dev/Glority+Global+Group+Ltd./
48	Shopify Inc.	2014	9	https://www.appbrain.com/dev/Shopify+Inc./
49	AtomApplications	2023	2	https://www.appbrain.com/dev/AtomApplications/
50	Microsoft Corporation	2011	4	https://www.appbrain.com/dev/Microsoft+Corporation/
51	KFC US	2021	2	https://www.appbrain.com/dev/KFC+US/
52	T-Mobile USA	\N	\N	https://www.appbrain.com/dev/T-Mobile+USA/
53	Disney	2010	6	https://www.appbrain.com/dev/Disney/
54	SunnyTech Limited	2021	8	https://www.appbrain.com/dev/SunnyTech+Limited/
55	Canva	2017	11	https://www.appbrain.com/dev/Canva/
56	ApplineDev	2023	8	https://www.appbrain.com/dev/ApplineDev/
57	Lyft, Inc.	2012	8	https://www.appbrain.com/dev/Lyft%2C+Inc./
58	Particle Media Inc.	2016	6	https://www.appbrain.com/dev/Particle+Media+Inc./
59	X Corp.	2010	4	https://www.appbrain.com/dev/X+Corp./
60	NetConnect	2023	9	https://www.appbrain.com/dev/NetConnect/
61	CLOUD WHALE INTERACTIVE TECHNOLOGY LLC.	2023	4	https://www.appbrain.com/dev/CLOUD+WHALE+INTERACTIVE+TECHNOLOGY+LLC./
62	Crunchyroll, LLC	2010	12	https://www.appbrain.com/dev/Crunchyroll%2C+LLC/
63	Besitos Corporation LLC	2021	2	https://www.appbrain.com/dev/Besitos+Corporation+LLC/
64	aestimium GmbH	2017	6	https://www.appbrain.com/dev/aestimium+GmbH/
65	CBS Interactive, Inc.	\N	\N	https://www.appbrain.com/dev/CBS+Interactive%2C+Inc./
66	Capital One Services, LLC	2011	7	https://www.appbrain.com/dev/Capital+One+Services%2C+LLC/
67	Credit Karma, LLC	2013	2	https://www.appbrain.com/dev/Credit+Karma%2C+LLC/
68	Bestplay	2023	4	https://www.appbrain.com/dev/Bestplay/
69	Twitch Interactive, Inc.	2012	4	https://www.appbrain.com/dev/Twitch+Interactive%2C+Inc./
70	eBay Mobile	2010	2	https://www.appbrain.com/dev/eBay+Mobile/
71	Freecash	2021	8	https://www.appbrain.com/dev/Freecash/
72	Apple	2015	9	https://www.appbrain.com/dev/Apple/
73	Appfusion	2025	1	https://www.appbrain.com/dev/Appfusion/
74	FARSUNPTE.LTD.	2024	9	https://www.appbrain.com/dev/FARSUNPTE.LTD./
75	Plex, Inc.	2011	2	https://www.appbrain.com/dev/Plex%2C+Inc./
76	Pandora	\N	\N	https://www.appbrain.com/dev/Pandora/
77	Upside Inc.	2016	4	https://www.appbrain.com/dev/Upside+Inc./
78	Waze	\N	\N	https://www.appbrain.com/dev/Waze/
79	Gamma Play	2014	12	https://www.appbrain.com/dev/Gamma+Play/
80	Samsung Electronics Co.,  Ltd.	2011	2	https://www.appbrain.com/dev/Samsung+Electronics+Co.%2C++Ltd./
81	Expedia	2011	5	https://www.appbrain.com/dev/Expedia/
82	Malwarebytes	2013	5	https://www.appbrain.com/dev/Malwarebytes/
83	PicsArt, Inc.	2011	11	https://www.appbrain.com/dev/PicsArt%2C+Inc./
84	Epic Systems Corporation	2011	9	https://www.appbrain.com/dev/Epic+Systems+Corporation/
85	Airbnb	2012	1	https://www.appbrain.com/dev/Airbnb/
86	AT Technologyy	2022	6	https://www.appbrain.com/dev/AT+Technologyy/
87	MIA Studio Inc	2020	11	https://www.appbrain.com/dev/MIA+Studio+Inc/
88	GRIMLAX TRADE, S.L.	2024	12	https://www.appbrain.com/dev/GRIMLAX+TRADE%2C+S.L./
89	Audible, Inc.	2010	8	https://www.appbrain.com/dev/Audible%2C+Inc./
90	Next Vision Limited	2019	10	https://www.appbrain.com/dev/Next+Vision+Limited/
91	Sam's Club	2010	9	https://www.appbrain.com/dev/Sam%27s+Club/
92	Naver Z Corporation	2018	9	https://www.appbrain.com/dev/Naver+Z+Corporation/
93	Cash Giraffe	2022	7	https://www.appbrain.com/dev/Cash+Giraffe/
94	AdPulse INC	2025	4	https://www.appbrain.com/dev/AdPulse+INC/
95	Kennedyy	2023	9	https://www.appbrain.com/dev/Kennedyy/
96	Bigo Technology Pte. Ltd.	2016	3	https://www.appbrain.com/dev/Bigo+Technology+Pte.+Ltd./
97	Burger King, Inc.	2012	7	https://www.appbrain.com/dev/Burger+King%2C+Inc./
98	Local AI, Inc.	2023	7	https://www.appbrain.com/dev/Local+AI%2C+Inc./
99	Pocket FM Corp.	2018	9	https://www.appbrain.com/dev/Pocket+FM+Corp./
100	reddit Inc.	2014	9	https://www.appbrain.com/dev/reddit+Inc./
101	Ring.com	2014	11	https://www.appbrain.com/dev/Ring.com/
102	Fetch Rewards	2013	11	https://www.appbrain.com/dev/Fetch+Rewards/
103	Ora Tools	2023	1	https://www.appbrain.com/dev/Ora+Tools/
104	NAVER WEBTOON	2010	12	https://www.appbrain.com/dev/NAVER+WEBTOON/
105	QR Code Scanner.	2021	7	https://www.appbrain.com/dev/QR+Code+Scanner./
106	FlareFlow Pte. Ltd.	2025	3	https://www.appbrain.com/dev/FlareFlow+Pte.+Ltd./
107	Signal Foundation	2010	5	https://www.appbrain.com/dev/Signal+Foundation/
108	Progressive Insurance	2010	4	https://www.appbrain.com/dev/Progressive+Insurance/
109	Vrbo	2011	6	https://www.appbrain.com/dev/Vrbo/
110	Affirm, Inc	2016	6	https://www.appbrain.com/dev/Affirm%2C+Inc/
111	Instacart	2014	5	https://www.appbrain.com/dev/Instacart/
112	Reminders & Alarms	2023	5	https://www.appbrain.com/dev/Reminders+%26+Alarms/
113	Griffin Atlas USA	2024	11	https://www.appbrain.com/dev/Griffin+Atlas+USA/
114	Domino's Pizza LLC	2012	2	https://www.appbrain.com/dev/Domino%27s+Pizza+LLC/
115	PlayWell Team	2022	2	https://www.appbrain.com/dev/PlayWell+Team/
116	JPMorgan Chase	2010	11	https://www.appbrain.com/dev/JPMorgan+Chase/
117	Adobe	\N	\N	https://www.appbrain.com/dev/Adobe/
118	CVS Pharmacy	2011	6	https://www.appbrain.com/dev/CVS+Pharmacy/
119	Early Warning Services, LLC	2017	9	https://www.appbrain.com/dev/Early+Warning+Services%2C+LLC/
120	PerplexityAI	2023	5	https://www.appbrain.com/dev/PerplexityAI/
121	Chai Research Corp.	2021	12	https://www.appbrain.com/dev/Chai+Research+Corp./
122	Pizza Hut Inc	2011	5	https://www.appbrain.com/dev/Pizza+Hut+Inc/
123	Zillow	2010	3	https://www.appbrain.com/dev/Zillow/
124	Skywork AI Pte. Ltd.	2023	7	https://www.appbrain.com/dev/Skywork+AI+Pte.+Ltd./
125	Figuredin	2024	9	https://www.appbrain.com/dev/Figuredin/
126	OfferUp Inc.	2013	10	https://www.appbrain.com/dev/OfferUp+Inc./
127	NortonMobile	\N	\N	https://www.appbrain.com/dev/NortonMobile/
128	OneLouder Apps	\N	\N	https://www.appbrain.com/dev/OneLouder+Apps/
129	JustPlay GmbH	2020	11	https://www.appbrain.com/dev/JustPlay+GmbH/
130	Booking.com Hotels & Vacation Rentals	2011	2	https://www.appbrain.com/dev/Booking.com+Hotels+%26+Vacation+Rentals/
131	Too Good To Go Aps	2016	1	https://www.appbrain.com/dev/Too+Good+To+Go+Aps/
132	Planet Fitness	2015	2	https://www.appbrain.com/dev/Planet+Fitness/
133	ONE Finance, Inc.	2016	9	https://www.appbrain.com/dev/ONE+Finance%2C+Inc./
134	Proton AG	2016	3	https://www.appbrain.com/dev/Proton+AG/
135	Coinbase Inc	2013	3	https://www.appbrain.com/dev/Coinbase+Inc/
136	SafeAuth Services.	2023	6	https://www.appbrain.com/dev/SafeAuth+Services./
137	Nord Security	2016	5	https://www.appbrain.com/dev/Nord+Security/
138	Degoo Backup AB - Cloud	2012	11	https://www.appbrain.com/dev/Degoo+Backup+AB+-+Cloud/
139	Costco Wholesale	2012	6	https://www.appbrain.com/dev/Costco+Wholesale/
140	AllTrails, LLC	\N	\N	https://www.appbrain.com/dev/AllTrails%2C+LLC/
141	Secret Phone, Inc	2014	11	https://www.appbrain.com/dev/Secret+Phone%2C+Inc/
142	MISTPLAY	2016	7	https://www.appbrain.com/dev/MISTPLAY/
143	LKW ELE	2024	12	https://www.appbrain.com/dev/LKW+ELE/
144	Etsy, Inc	2012	12	https://www.appbrain.com/dev/Etsy%2C+Inc/
145	Comcast	2011	2	https://www.appbrain.com/dev/Comcast/
146	State Farm Insurance	2010	4	https://www.appbrain.com/dev/State+Farm+Insurance/
147	Zedge	\N	\N	https://www.appbrain.com/dev/Zedge/
148	GoodNovel	2020	4	https://www.appbrain.com/dev/GoodNovel/
149	GMRD Apps Limited	2024	3	https://www.appbrain.com/dev/GMRD+Apps+Limited/
150	PixelArmor	2023	10	https://www.appbrain.com/dev/PixelArmor/
151	SUNSHINING NETWORK LIMITED	2023	12	https://www.appbrain.com/dev/SUNSHINING+NETWORK+LIMITED/
152	Anthropic PBC	2024	7	https://www.appbrain.com/dev/Anthropic+PBC/
153	PlantIn	2021	3	https://www.appbrain.com/dev/PlantIn/
154	Brave Software	2014	3	https://www.appbrain.com/dev/Brave+Software/
155	Robinhood	2015	8	https://www.appbrain.com/dev/Robinhood/
156	Charter/Spectrum	2011	12	https://www.appbrain.com/dev/Charter%2FSpectrum/
157	JSK Developer	2020	2	https://www.appbrain.com/dev/JSK+Developer/
158	Suno, Inc	2024	12	https://www.appbrain.com/dev/Suno%2C+Inc/
159	Little Caesar Enterprises, Inc.	2016	9	https://www.appbrain.com/dev/Little+Caesar+Enterprises%2C+Inc./
160	xStudios	2021	7	https://www.appbrain.com/dev/xStudios/
161	ReciMe	2023	6	https://www.appbrain.com/dev/ReciMe/
162	The CW Network	2012	3	https://www.appbrain.com/dev/The+CW+Network/
163	GroupMe	2010	11	https://www.appbrain.com/dev/GroupMe/
164	DuckDuckGo	2011	4	https://www.appbrain.com/dev/DuckDuckGo/
165	Rocket Money - Bills & Budgets	2016	7	https://www.appbrain.com/dev/Rocket+Money+-+Bills+%26+Budgets/
166	Brigit	2018	4	https://www.appbrain.com/dev/Brigit/
167	UKG, Inc.	2011	1	https://www.appbrain.com/dev/UKG%2C+Inc./
168	Tinder LLC	2013	7	https://www.appbrain.com/dev/Tinder+LLC/
169	BoostVision	2022	1	https://www.appbrain.com/dev/BoostVision/
170	Wayfair, LLC	2013	11	https://www.appbrain.com/dev/Wayfair%2C+LLC/
171	Finch Care Public Benefit Corporation	2021	5	https://www.appbrain.com/dev/Finch+Care+Public+Benefit+Corporation/
172	BandLab Technologies	2011	4	https://www.appbrain.com/dev/BandLab+Technologies/
173	TV Master - Smart TV Remote Control	2020	6	https://www.appbrain.com/dev/TV+Master+-+Smart+TV+Remote+Control/
174	Cleo AI	2019	2	https://www.appbrain.com/dev/Cleo+AI/
175	ADP, INC.	2011	5	https://www.appbrain.com/dev/ADP%2C+INC./
176	The Home Depot, Inc	2011	3	https://www.appbrain.com/dev/The+Home+Depot%2C+Inc/
\.


--
-- TOC entry 4903 (class 0 OID 17055)
-- Dependencies: 224
-- Data for Name: developerstats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.developerstats (stat_id, developer_id, app_count, total_downloads, average_rating, total_rating_count) FROM stdin;
1	1	1	600000000	4.78	23000000
2	2	10	7000000000	4.24	98000000
3	3	4	8000000000	3.94	160000000
4	4	2	10000000000	4.41	220000000
5	5	2	800000000	4.62	8700000
6	6	1	100000000	4.64	2800000
7	7	15	100000000	4.66	3900000
8	8	2	4000000000	4.13	36000000
9	9	2	3000000000	4.11	16000000
10	10	2	900000000	3.95	6700000
11	11	1	100000000	4.58	1000000
12	12	12	20000000000	4.49	300000000
13	13	1	6000000	3.68	1200
14	14	1	7000000	4.65	150000
15	15	1	50000000	4.84	1000000
16	16	1	500000	3.98	11000
17	17	21	100000000	4.71	6100000
18	18	7	20000000	3.97	200000
19	19	3	2000000000	3.57	12000000
20	20	96	4000000000	3.93	15000000
21	21	4	500000000	4.23	3600000
22	22	1	600000000	4.27	6000000
23	23	1	200000000	4.86	1900000
24	24	3	200000000	4.69	10000000
25	25	1	200000000	4.48	2100000
26	26	2	100000000	4.49	1500000
27	27	3	400000	4.79	960
28	28	1	70000000	4.36	2100000
29	29	2	30000000	4.69	850000
30	30	3	100000000	4.79	3700000
31	31	1	20000000	4.22	53000
32	32	54	4000000000	4.3	33000000
33	33	2	800000000	4.45	33000000
34	34	1	20000000	4.14	910000
35	35	3	1000000000	4.46	18000000
36	36	3	1000000000	4.38	11000000
37	37	4	100000000	4.63	5800000
38	38	1	60000000	4.15	840000
39	39	6	1000000000	4.11	4200000
40	40	3	90000000	4.69	3500000
41	41	6	3000000000	4.31	32000000
42	42	159	400000000000	4.16	610000000
43	43	8	2000000000	4.51	28000000
44	44	3	20000000	4.55	200000
45	45	1	50000000	4.6	450000
46	46	1	200000000	4.03	630000
47	47	4	100000000	4.6	850000
48	48	7	80000000	4.46	670000
49	49	12	20000000	4.26	100000
50	50	75	20000000000	4.64	71000000
51	51	2	7000000	3.39	24000
52	52	20	200000000	4.48	1300000
53	53	70	800000000	4.43	7300000
54	54	2	3000000	4.06	3100
55	55	1	600000000	4.8	21000000
56	56	1	6000000	4.54	51000
57	57	17	80000000	4.43	710000
58	58	2	90000000	4.63	570000
59	59	2	2000000000	3.73	22000000
60	60	2	4000000	3.53	3800
61	61	1	30000000	3.83	560000
62	62	70	200000000	4.72	3000000
63	63	1	3000000	4.5	61000
64	64	1	10000000	4.13	160000
65	65	9	90000000	4.1	760000
66	66	6	60000000	4.54	1900000
67	67	2	60000000	4.68	3100000
68	68	1	9000000	4.69	140000
69	69	2	300000000	4.01	5200000
70	70	3	400000000	4.66	4700000
71	71	1	20000000	4.35	180000
72	72	7	500000000	4.33	890000
73	73	1	5000000	4.8	46000
74	74	1	10000000	4.63	260000
75	75	5	90000000	4.07	400000
76	76	2	300000000	3.95	3200000
77	77	1	20000000	4.57	410000
78	78	1	600000000	4.14	8600000
79	79	17	900000000	4.79	4300000
80	80	124	60000000000	4.26	35000000
81	81	2	70000000	4.8	1200000
82	82	3	40000000	4.48	500000
83	83	5	1000000000	4.07	12000000
84	84	7	30000000	4.55	230000
85	85	2	200000000	4.44	1700000
86	86	4	10000000	4.02	8300
87	87	32	200000000	4.32	590000
88	88	1	2000000	4.38	32000
89	89	1	200000000	4.6	1600000
90	90	12	40000000	4.44	260000
91	91	2	40000000	4.86	510000
92	92	2	500000000	4.57	4800000
93	93	1	20000000	4.3	450000
94	94	3	2000000	4.82	37000
95	95	4	50000000	4.56	79000
96	96	2	800000000	4.46	6300000
97	97	29	80000000	4.07	670000
98	98	2	8000000	4.71	65000
99	99	4	200000000	4.56	4099999
100	100	1	200000000	4.63	4000000
101	101	2	40000000	4.21	440000
102	102	1	20000000	4.69	1400000
103	103	7	10000000	4.72	99000
104	104	3	200000000	4.53	4300000
105	105	11	900000000	4.53	4099999
106	106	1	5000000	4.71	55000
107	107	1	200000000	4.55	2700000
108	108	2	20000000	4.64	200000
109	109	3	40000000	4.72	310000
110	110	1	10000000	4.83	470000
111	111	6	30000000	4.16	450000
112	112	5	2000000	4.72	47000
113	113	4	1000000	3.42	300
114	114	15	40000000	4.64	2300000
115	115	1	3000000	4.52	310000
116	116	7	60000000	4.49	2000000
117	117	22	2000000000	4.56	16000000
118	118	4	20000000	3.4	390000
119	119	1	30000000	4.09	160000
120	120	1	30000000	4.66	890000
121	121	1	10000000	4.29	400000
122	122	2	30000000	3.99	960000
123	123	6	60000000	4.77	1500000
124	124	2	10000000	4.08	87000
125	125	2	2000000	4.6	8100
126	126	1	80000000	4.38	1200000
127	127	10	100000000	4.56	2300000
128	128	1	100000000	4.39	1100000
129	129	1	30000000	4.45	1200000
130	130	3	700000000	4.79	5000000
131	131	1	60000000	4.85	1700000
132	132	3	20000000	4.65	70000
133	133	2	7000000	4.77	160000
134	134	6	70000000	4.64	580000
135	135	1	50000000	4.45	890000
136	136	1	20000000	4.3	100000
137	137	5	100000000	4.56	1100000
138	138	4	300000000	4.2	4600000
139	139	11	30000000	4.7	300000
140	140	1	40000000	4.7	370000
141	141	1	40000000	4.3	180000
142	142	1	50000000	4.52	820000
143	143	2	2000000	4.32	2400
144	144	2	70000000	4.83	1900000
145	145	6	40000000	3.18	390000
146	146	5	20000000	4.46	500000
147	147	4	600000000	4.66	16000000
148	148	5	70000000	4.77	3300000
149	149	1	20000000	4.52	460000
150	150	2	4000000	3.68	3000
151	151	1	7000000	4.72	38000
152	152	1	6000000	4.66	96000
153	153	2	10000000	4.02	130000
154	154	3	200000000	4.73	2600000
155	155	5	20000000	4.22	530000
156	156	8	40000000	4.72	1300000
157	157	3	3000000	4.67	13000
158	158	1	20000000	4.8	500000
159	159	2	20000000	4.74	520000
160	160	3	1000000	4.33	60000
161	161	1	300000	4.68	5200
162	162	1	20000000	3.81	320000
163	163	1	30000000	4.6	590000
164	164	1	70000000	4.7	2100000
165	165	1	10000000	4.65	100000
166	166	1	8000000	4.73	270000
167	167	14	20000000	4.03	170000
168	168	1	500000000	3.79	8199999
169	169	9	80000000	4.3	620000
170	170	7	40000000	4.8	380000
171	171	1	10000000	4.91	430000
172	172	2	100000000	4.67	700000
173	173	8	90000000	4.42	780000
174	174	1	4000000	3.98	85000
175	175	9	40000000	4.58	720000
176	176	3	30000000	4.41	810000
\.


--
-- TOC entry 4899 (class 0 OID 17035)
-- Dependencies: 220
-- Data for Name: maturityratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maturityratings (maturity_id, maturity_level) FROM stdin;
1	High
2	Medium
3	Low
\.


--
-- TOC entry 4907 (class 0 OID 17093)
-- Dependencies: 228
-- Data for Name: rankings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rankings (ranking_id, app_id, rank, rating, total_installs, recent_installs) FROM stdin;
1	1	1	4.8	630000000	66000000
2	2	2	4.1	3800000000	52000000
3	3	3	4	450000000	18000000
4	4	4	4.4	11000000000	110000000
5	5	5	4.6	820000000	37000000
6	6	6	3.9	6500000000	58000000
7	7	7	4.3	5100000	950000
8	8	8	4.6	140000000	15000000
9	9	9	4.7	120000000	1100000
10	10	10	4.1	3600000000	43000000
11	11	11	4.1	2400000000	32000000
12	12	12	3.9	830000000	14000000
13	13	13	4.6	100000000	13000000
14	14	14	4.7	7200000000	37000000
15	15	15	3.7	5700000	5500000
16	16	16	4.6	6900000	700000
17	17	17	4.4	11000000000	74000000
18	18	18	4.8	53000000	3900000
19	19	19	4	470000	330000
20	20	20	4.7	120000000	970000
21	21	21	3.9	11000000	670000
22	22	22	3.5	1400000000	30000000
23	23	23	3.9	3100000000	29000000
24	24	24	4.3	420000000	4300000
25	25	25	4.3	550000000	7300000
26	26	26	4.9	200000000	1800000
27	27	27	4.7	230000000	2400000
28	28	28	4.5	180000000	2600000
29	29	29	4.5	120000000	830000
30	30	30	4.8	400000	380000
31	31	31	4.4	71000000	680000
32	32	32	4.7	33000000	590000
33	33	33	4.8	130000000	5000000
34	34	34	4.2	20000000	5900000
35	35	35	4	760000000	8900000
36	36	36	4.5	750000000	12000000
37	37	37	4.4	930000000	9900000
38	38	38	4.1	23000000	4400000
39	39	39	4.5	770000000	6200000
40	40	40	4.4	1300000000	18000000
41	41	41	4.7	75000000	750000
42	42	42	4.2	62000000	600000
43	43	43	4.1	1300000000	10000000
44	44	44	4.7	86000000	1100000
45	45	45	4.3	2500000000	33000000
46	46	46	4.5	550000000	94000000
47	47	47	4.4	990000000	9900000
48	48	48	4.6	24000000	420000
49	49	49	4.6	47000000	660000
50	50	50	4.4	560000000	7100000
51	51	51	4	250000000	2000000
52	52	52	4.6	62000000	1200000
53	53	53	4.5	51000000	800000
54	54	54	4.3	3100000	330000
55	55	55	4.6	520000000	5800000
56	56	56	3.4	7400000	250000
57	57	57	4.7	28000000	560000
58	58	58	4	2700000	280000
59	59	59	4.4	470000000	6200000
60	60	60	4	2500000	1200000
61	61	61	4.6	170000000	3000000
62	62	62	4.8	570000000	12000000
63	63	63	4.5	6500000	760000
64	64	64	4.4	71000000	610000
65	65	65	4.6	85000000	630000
66	66	66	4.7	130000000	2800000
67	67	67	3.7	1700000000	9700000
68	68	68	3.5	4200000	1100000
69	69	69	3.8	31000000	1600000
70	70	70	4.3	25000000	390000
71	71	71	4.7	180000000	5600000
72	72	72	4.6	260000000	1700000
73	73	73	4.5	3700000000	35000000
74	74	74	4.5	3400000	330000
75	75	75	4.1	11000000	440000
76	76	76	4	40000000	440000
77	77	77	4.5	48000000	420000
78	78	78	4.7	54000000	440000
79	79	79	4.7	30000000	1000000
80	80	80	4.7	8700000	1000000
81	81	81	4	310000000	4600000
82	82	82	4.7	390000000	1700000
83	83	83	4.3	16000000	820000
84	84	84	4.2	4300000	230000
85	85	85	3.7	210000000	2900000
86	86	86	4.8	5200000	2500000
87	87	87	3.7	80000000	3400000
88	88	88	4.6	12000000	2800000
89	89	89	4	83000000	1800000
90	90	90	4	310000000	630000
91	91	91	4.6	17000000	280000
92	92	92	3.7	250000000	4300000
93	93	93	4.1	590000000	5100000
94	94	94	4.8	700000000	8100000
95	95	95	3.9	1500000000	53000000
96	96	96	4.8	68000000	680000
97	97	97	4.3	1500000000	9000000
98	98	98	4.5	42000000	850000
99	99	99	4.1	1300000000	8700000
100	100	100	4.6	27000000	350000
101	101	101	4.4	230000000	2600000
102	102	102	4	9700000	1300000
103	103	103	4.5	1400000000	45000000
104	104	104	0	18000000	2700000
105	105	105	4.4	1700000	700000
106	106	106	4.6	250000000	1300000
107	107	107	4.4	10000000	350000
108	108	108	4.9	36000000	360000
109	109	109	4.6	210000000	2000000
110	110	110	4.3	18000000	430000
111	111	111	4.8	2300000	1300000
112	112	112	4.6	45000000	5900000
113	113	113	4.5	740000000	5200000
114	114	114	4.5	25000000	270000
115	115	115	4.7	7900000	280000
116	116	116	4.2	780000000	9800000
117	117	117	4.6	190000000	3100000
118	118	118	4.6	200000000	1900000
119	119	119	4.1	33000000	500000
120	120	120	4.7	24000000	310000
121	121	121	3.9	130000	130000
122	122	122	4.5	150000000	1500000
123	123	123	4.6	260000000	9600000
124	124	124	4.7	4700000	1700000
125	125	125	4.6	170000000	1700000
126	126	126	4.6	22000000	280000
127	127	127	4.4	1800000000	31000000
128	128	128	4.8	23000000	310000
129	129	129	4.1	4600000	230000
130	130	130	4.8	14000000	270000
131	131	131	4.1	24000000	270000
132	132	132	4.8	810000	160000
133	133	133	3.5	1000000	720000
134	134	134	4.7	33000000	280000
135	135	135	4.5	3200000	160000
136	136	136	4.5	55000000	350000
137	137	137	4.5	840000000	6500000
138	138	138	3.4	23000000	250000
139	139	139	4.1	31000000	270000
140	140	140	4.5	100000000	390000
141	141	141	4.7	26000000	6600000
142	142	142	4.3	15000000	820000
143	143	143	4	25000000	220000
144	144	144	4.8	54000000	290000
145	145	145	4.1	13000000	1100000
146	146	146	4.6	1700000	430000
147	147	147	4.4	78000000	290000
148	148	148	4.6	85000000	1200000
149	149	149	4.4	150000000	3600000
150	150	150	4.4	28000000	450000
151	151	151	4.8	740000000	7800000
152	152	152	4.9	64000000	910000
153	153	153	4.6	17000000	250000
154	154	154	4.7	4700000	200000
155	155	155	4.7	62000000	4200000
156	156	156	4.5	51000000	450000
157	157	157	4.3	25000000	1500000
158	158	158	4.6	100000000	1800000
159	159	159	4.2	280000000	3800000
160	160	160	4.7	19000000	270000
161	161	161	4.6	190000000	2100000
162	162	162	4.7	39000000	850000
163	163	163	4.3	39000000	1700000
164	164	164	4.5	46000000	450000
165	165	165	4.3	2100000	1100000
166	166	166	4.8	62000000	670000
167	167	167	3.2	19000000	260000
168	168	168	4.6	15000000	210000
169	169	169	4.7	610000000	3000000
170	170	170	4.9	37000000	3200000
171	171	171	4.5	18000000	1400000
172	172	172	3.6	3100000	780000
173	173	173	4.7	6700000	2300000
174	174	174	4.7	6300000	580000
175	175	175	4.4	390000	230000
176	176	176	3.9	560000000	2700000
177	177	177	4.7	210000000	3400000
178	178	178	4.2	24000000	190000
179	179	179	4.7	20000000	250000
180	180	180	4.6	2000000	170000
181	181	181	4.8	15000000	1400000
182	182	182	4.7	21000000	240000
183	183	183	4.3	1100000	680000
184	184	184	4.7	270000	160000
185	185	185	3.8	21000000	130000
186	186	186	4.6	33000000	210000
187	187	187	4.7	73000000	1100000
188	188	188	4.7	12000000	180000
189	189	189	4.7	7600000	170000
190	190	190	4.2	180000000	1900000
191	191	191	4.5	3200000	210000
192	192	192	3.8	450000000	3400000
193	193	193	4.3	21000000	980000
194	194	194	4.8	37000000	290000
195	195	195	4.9	11000000	330000
196	196	196	4.7	110000000	1600000
197	197	197	4.7	14000000	480000
198	198	198	4	4200000	160000
199	199	199	4.6	32000000	280000
200	200	200	4.5	29000000	250000
\.


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 225
-- Name: apps_app_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apps_app_id_seq', 200, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 26, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 221
-- Name: developers_developer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.developers_developer_id_seq', 176, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 223
-- Name: developerstats_stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.developerstats_stat_id_seq', 176, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 219
-- Name: maturityratings_maturity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maturityratings_maturity_id_seq', 3, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 227
-- Name: rankings_ranking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rankings_ranking_id_seq', 200, true);


--
-- TOC entry 4741 (class 2606 OID 17074)
-- Name: apps apps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT apps_pkey PRIMARY KEY (app_id);


--
-- TOC entry 4743 (class 2606 OID 17076)
-- Name: apps apps_source_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT apps_source_url_key UNIQUE (source_url);


--
-- TOC entry 4727 (class 2606 OID 17033)
-- Name: categories categories_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_category_name_key UNIQUE (category_name);


--
-- TOC entry 4729 (class 2606 OID 17031)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 4735 (class 2606 OID 17053)
-- Name: developers developers_developer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.developers
    ADD CONSTRAINT developers_developer_name_key UNIQUE (developer_name);


--
-- TOC entry 4737 (class 2606 OID 17051)
-- Name: developers developers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.developers
    ADD CONSTRAINT developers_pkey PRIMARY KEY (developer_id);


--
-- TOC entry 4739 (class 2606 OID 17060)
-- Name: developerstats developerstats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.developerstats
    ADD CONSTRAINT developerstats_pkey PRIMARY KEY (stat_id);


--
-- TOC entry 4731 (class 2606 OID 17042)
-- Name: maturityratings maturityratings_maturity_level_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maturityratings
    ADD CONSTRAINT maturityratings_maturity_level_key UNIQUE (maturity_level);


--
-- TOC entry 4733 (class 2606 OID 17040)
-- Name: maturityratings maturityratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maturityratings
    ADD CONSTRAINT maturityratings_pkey PRIMARY KEY (maturity_id);


--
-- TOC entry 4745 (class 2606 OID 17098)
-- Name: rankings rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rankings
    ADD CONSTRAINT rankings_pkey PRIMARY KEY (ranking_id);


--
-- TOC entry 4747 (class 2606 OID 17077)
-- Name: apps apps_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT apps_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- TOC entry 4748 (class 2606 OID 17082)
-- Name: apps apps_developer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT apps_developer_id_fkey FOREIGN KEY (developer_id) REFERENCES public.developers(developer_id);


--
-- TOC entry 4749 (class 2606 OID 17087)
-- Name: apps apps_maturity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT apps_maturity_id_fkey FOREIGN KEY (maturity_id) REFERENCES public.maturityratings(maturity_id);


--
-- TOC entry 4746 (class 2606 OID 17061)
-- Name: developerstats developerstats_developer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.developerstats
    ADD CONSTRAINT developerstats_developer_id_fkey FOREIGN KEY (developer_id) REFERENCES public.developers(developer_id) ON DELETE CASCADE;


--
-- TOC entry 4750 (class 2606 OID 17099)
-- Name: rankings rankings_app_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rankings
    ADD CONSTRAINT rankings_app_id_fkey FOREIGN KEY (app_id) REFERENCES public.apps(app_id) ON DELETE CASCADE;


-- Completed on 2025-08-08 19:31:10

--
-- PostgreSQL database dump complete
--


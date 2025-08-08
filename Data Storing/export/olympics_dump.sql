--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Name: atlet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atlet (
    id integer NOT NULL,
    nama_negara character varying(255) NOT NULL,
    nama character varying(255) NOT NULL,
    cabang_olahraga character varying(255),
    jumlah_partisipasi_olimpiade integer,
    olimpiade_pertama character varying(255),
    tahun_lahir integer
);


ALTER TABLE public.atlet OWNER TO postgres;

--
-- Name: negara; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.negara (
    nama_negara character varying(255) NOT NULL,
    benua character varying(255)
);


ALTER TABLE public.negara OWNER TO postgres;

--
-- Name: olahraga; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.olahraga (
    nama_olahraga character varying(255) NOT NULL
);


ALTER TABLE public.olahraga OWNER TO postgres;

--
-- Name: partisipasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partisipasi (
    id_pertandingan integer NOT NULL,
    id_atlet integer NOT NULL,
    medali character varying(50),
    CONSTRAINT partisipasi_medali_check CHECK ((((medali)::text = ANY ((ARRAY['emas'::character varying, 'perak'::character varying, 'perunggu'::character varying])::text[])) OR ((medali)::text ~~ '#%'::text)))
);


ALTER TABLE public.partisipasi OWNER TO postgres;

--
-- Name: pertandingan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pertandingan (
    id integer NOT NULL,
    nama_olahraga character varying(255) NOT NULL,
    nama_pertandingan character varying(255) NOT NULL,
    jenis_pertandingan character varying(255),
    CONSTRAINT pertandingan_jenis_pertandingan_check CHECK (((jenis_pertandingan)::text = ANY ((ARRAY['team'::character varying, 'individual'::character varying])::text[])))
);


ALTER TABLE public.pertandingan OWNER TO postgres;

--
-- Name: pertandingan_venue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pertandingan_venue (
    id_pertandingan integer NOT NULL,
    id_venue integer NOT NULL
);


ALTER TABLE public.pertandingan_venue OWNER TO postgres;

--
-- Name: venue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venue (
    id integer NOT NULL,
    nama_tempat character varying(255),
    kapasitas_penonton integer,
    CONSTRAINT venue_kapasitas_penonton_check CHECK ((kapasitas_penonton >= 0))
);


ALTER TABLE public.venue OWNER TO postgres;

--
-- Data for Name: atlet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atlet (id, nama_negara, nama, cabang_olahraga, jumlah_partisipasi_olimpiade, olimpiade_pertama, tahun_lahir) FROM stdin;
1	united states of america	a'ja wilson	basketball	2	tokyo 2020	1996
2	canada	aaliyah edwards	basketball	2	tokyo 2020	2002
3	canada	aaron brown	athletics	4	london 2012	1992
4	united states of america	aaron cummings	rugby sevens	1	paris 2024	1997
5	austria	aaron fara	judo	1	paris 2024	1997
6	new zealand	aaron gate	cycling track	4	london 2012	1990
7	france	aaron grandidier	rugby sevens	1	paris 2024	2000
8	united states of america	aaron russell	volleyball	2	rio 2016	1993
9	japan	aaron wolf	judo	2	tokyo 2020	1996
10	great britain	abbie wood	swimming	2	tokyo 2020	1999
11	uzbekistan	abbosbek fayzullaev	football	1	paris 2024	2003
12	australia	abby andrews	water polo	2	tokyo 2020	2000
13	morocco	abde ezzalzouli	football	1	paris 2024	2001
14	egypt	abdelrahman abdou	handball	1	paris 2024	1996
15	egypt	abdelrahman elhossiny eissa	volleyball	1	paris 2024	2001
16	egypt	abdelrahman hussein tolba	fencing	1	paris 2024	2007
17	egypt	abdelrahman seoudy	volleyball	1	paris 2024	1997
18	guinea	abdoulaye toure	football	1	paris 2024	1994
19	south africa	abdud dayaan cassiem	hockey	2	tokyo 2020	1998
20	uzbekistan	abdukodir khusanov	football	1	paris 2024	2004
21	japan	abdul hakim sani brown	athletics	2	tokyo 2020	1999
22	ghana	abdul-rasheed saminu	athletics	1	paris 2024	1997
23	united arab emirates	abdullah mohd al marri	equestrian	1	paris 2024	1984
24	saudi arabia	abdullah waleed sharbatly	equestrian	2	london 2012	1982
25	türkiye	abdullah yildirmis	archery	1	paris 2024	2003
26	saudi arabia	abdulrahman alrajhi	equestrian	1	paris 2024	1995
27	uzbekistan	abdurauf buriev	football	1	paris 2024	2002
28	uzbekistan	abduvohid nematov	football	1	paris 2024	2001
29	egypt	abeer ramadan	rhythmic gymnastics	1	paris 2024	2007
30	spain	abel ruiz	football	1	paris 2024	2000
31	spain	abel serdio	handball	1	paris 2024	1994
32	india	abhishek abhishek	hockey	1	paris 2024	1999
33	great britain	abi burton	rugby sevens	2	tokyo 2020	2000
34	kazakhstan	abiba abuzhakynova	judo	1	paris 2024	1997
35	canada	abigail dent	rowing	1	paris 2024	2002
36	ireland	abigail lyle	equestrian	1	paris 2024	1985
37	great britain	abigail martin	artistic gymnastics	1	paris 2024	2008
38	belgium	abigail raye	hockey	1	paris 2024	1991
39	united states of america	abigail tamer	hockey	1	paris 2024	2003
40	kazakhstan	abylaikhan zhubanazar	judo	1	paris 2024	2000
41	morocco	achraf hakimi	football	1	paris 2024	1998
42	jamaica	ackeem blake	athletics	1	paris 2024	2002
43	united states of america	adam channel	rugby sevens	1	paris 2024	1997
44	poland	adam grzegorzewski	equestrian	1	paris 2024	1998
45	hungary	adam jaszo	swimming	1	paris 2024	2002
46	hungary	adam nagy	water polo	1	paris 2024	1998
47	great britain	adam peaty	swimming	3	rio 2016	1994
48	japan	adamyuki baig	handball	2	tokyo 2020	1999
49	israel	adar friedmann	rhythmic gymnastics	1	paris 2024	2006
50	nigeria	adebola adeyeye	basketball	1	paris 2024	1999
51	poland	adela piskorska	swimming	1	paris 2024	2003
52	türkiye	adem asil	artistic gymnastics	2	tokyo 2020	1999
53	egypt	adham moataz	fencing	1	paris 2024	2003
54	fiji	adi vani buleki	rugby sevens	1	paris 2024	2000
55	israel	adi yona	football	1	paris 2024	2004
56	morocco	adil tahif	football	1	paris 2024	2001
57	romania	adina diaconu	table tennis	1	paris 2024	1999
58	mexico	adirem tejeda	rhythmic gymnastics	1	paris 2024	2002
59	mongolia	adiyasuren amarsaikhan	judo	1	paris 2024	2000
60	refugee olympic team	adnan khankan	judo	1	paris 2024	1994
61	spain	adrian bernabe	football	1	paris 2024	2001
62	poland	adrian bogucki	3x3 basketball	1	paris 2024	1999
63	spain	adrian figueras trejo	handball	2	tokyo 2020	1988
64	poland	adrian jaskiewicz	swimming	1	paris 2024	2002
65	romania	adrian munteanu	rowing	2	tokyo 2020	1997
66	hungary	adrian sipos	handball	1	paris 2024	1990
67	united states of america	adrian weinberg	water polo	1	paris 2024	2001
68	poland	adrian wojtkowiak	fencing	1	paris 2024	1998
69	brazil	adriana	football	1	paris 2024	1996
70	romania	adriana adam	rowing	1	paris 2024	1999
71	brazil	adriana cardoso	handball	2	tokyo 2020	1990
72	canada	adriana leon	football	2	tokyo 2020	1992
73	poland	adrianna kakol	canoe sprint	1	paris 2024	2001
74	brazil	adriano fernandes p.x.cavalcante	volleyball	1	paris 2024	2002
75	france	adrien truffert	football	1	paris 2024	2001
76	united states of america	adrienne lyle	equestrian	3	london 2012	1985
77	italy	agnese cocchiere	water polo	1	paris 2024	1999
78	italy	agnese duranti	rhythmic gymnastics	2	tokyo 2020	2000
79	poland	agnieszka korneluk	volleyball	1	paris 2024	1994
80	argentina	agostina alonso	hockey	2	tokyo 2020	1995
81	kenya	agripina kundu	volleyball	2	tokyo 2020	1993
82	argentina	agustin bugallo	hockey	2	tokyo 2020	1995
83	spain	agustin casado	handball	1	paris 2024	1996
84	chile	agustin covarrubias	equestrian	1	paris 2024	1982
85	argentina	agustin fraga	rugby sevens	1	paris 2024	2002
86	argentina	agustin loser	volleyball	2	tokyo 2020	1997
87	argentina	agustin mazzilli	hockey	4	london 2012	1989
88	argentina	agustina albertario	hockey	2	rio 2016	1993
89	argentina	agustina gorzelany	hockey	2	tokyo 2020	1996
90	egypt	ahmed atef	football	1	paris 2024	2002
91	egypt	ahmed azab abdelrahman	volleyball	1	paris 2024	2000
92	mali	ahmed diomande	football	1	paris 2024	2002
93	egypt	ahmed eid	football	1	paris 2024	2001
94	iraq	ahmed hasan	football	1	paris 2024	2001
95	egypt	ahmed koka	football	1	paris 2024	2001
96	egypt	ahmed mesilhy	handball	2	tokyo 2020	1994
97	egypt	ahmed mohamed	handball	2	tokyo 2020	2000
98	türkiye	ahmet onder	artistic gymnastics	2	tokyo 2020	1996
99	spain	ai tsunoda roustant	judo	1	paris 2024	2002
100	spain	aimar oroz	football	1	paris 2024	2001
101	spain	ainhoa campabadal amezcua	swimming	1	paris 2024	2003
102	france	ainhoa dot	rhythmic gymnastics	1	paris 2024	2005
103	new zealand	ainsley thorpe	triathlon	2	tokyo 2020	1998
104	japan	airi miyabe	volleyball	1	paris 2024	1998
105	italy	aisha rocek	rowing	2	tokyo 2020	1998
106	belgium	aisling dhooghe	hockey	2	london 2012	1994
107	spain	aitana bonmati	football	1	paris 2024	1998
108	hungary	ajna kesely	swimming	3	rio 2016	2001
109	south africa	akani simbine	athletics	3	rio 2016	1993
110	liberia	akeem sirleaf	athletics	1	paris 2024	1997
111	japan	akihiro fukatsu	volleyball	1	paris 2024	1987
112	japan	akihiro yamauchi	volleyball	2	tokyo 2020	1993
113	trinidad and tobago	akilah lewis	athletics	1	paris 2024	2000
114	japan	akira komata	fencing	1	paris 2024	1998
115	japan	akira sone	judo	2	tokyo 2020	2000
116	morocco	akram nakach	football	1	paris 2024	2002
117	egypt	akram yousri	handball	1	paris 2024	1994
118	new zealand	akuila rokolisoa	rugby sevens	1	paris 2024	1995
119	egypt	alaaeldin abouelkassem	fencing	4	london 2012	1990
120	nigeria	alaba olukunle akintola	athletics	1	paris 2024	2001
121	samoa	alamanda motuga	rugby sevens	1	paris 2024	1994
122	paraguay	alan nunez	football	1	paris 2024	2004
123	brazil	alan souza	volleyball	2	tokyo 2020	1994
124	jamaica	alana reid	athletics	1	paris 2024	2005
125	ireland	alanna fitzpatrick	rugby sevens	1	paris 2024	2004
126	australia	alanna kennedy	football	3	rio 2016	1995
127	australia	alanna smith	basketball	2	tokyo 2020	1996
128	spain	alba herrero lazaro	swimming	1	paris 2024	2002
129	spain	alba torrens	basketball	4	beijing 2008	1989
130	france	albane garot	hockey	1	paris 2024	1998
131	italy	alberta santuccio	fencing	2	tokyo 2020	1994
132	angola	albertina cruz kassoma	handball	3	rio 2016	1996
133	spain	alberto diaz	basketball	1	paris 2024	1994
134	spain	alberto gonzalez garcia	triathlon	1	paris 2024	1998
135	spain	alberto munarriz egana	water polo	3	rio 2016	1994
136	sweden	albin lagergren	handball	3	rio 2016	1992
137	hungary	alda magyari	water polo	2	tokyo 2020	2000
138	puerto rico	aleem ford	basketball	1	paris 2024	1997
139	mexico	alegna gonzalez	athletics	2	tokyo 2020	1999
140	spain	aleix gomez abello	handball	2	tokyo 2020	1997
141	spain	alejandra torres-quevedo oliver	hockey	2	tokyo 2020	1999
142	mexico	alejandra valencia	archery	4	london 2012	1994
143	spain	alejandro alonso	hockey	2	tokyo 2020	1999
144	spain	alejandro bustos sanchez	water polo	2	tokyo 2020	1997
145	slovenia	aleks vlah	handball	1	paris 2024	1997
146	serbia	aleksa avramovic	basketball	1	paris 2024	1994
147	serbia	aleksandar atanasijevic	volleyball	2	london 2012	1991
148	serbia	aleksandar kukolj	judo	3	rio 2016	1991
149	serbia	aleksandar nedeljkovic	volleyball	1	paris 2024	1997
150	poland	aleksander sliwka	volleyball	2	tokyo 2020	1995
151	poland	aleksandra formella	athletics	1	paris 2024	2001
152	poland	aleksandra jarecka	fencing	2	tokyo 2020	1995
153	australia	aleksandra stoilova	athletics	1	paris 2024	2005
154	poland	aleksandra szczyglowska	volleyball	1	paris 2024	1998
155	poland	aleksandra szulc	equestrian	1	paris 2024	1987
156	serbia	aleksandra uzelac	volleyball	1	paris 2024	2004
157	slovenia	alen pajenk	volleyball	1	paris 2024	1986
158	united states of america	alena olsen	rugby sevens	1	paris 2024	1995
159	new zealand	alena saili	rugby sevens	2	tokyo 2020	1998
160	italy	alessandra bonora	athletics	1	paris 2024	2000
161	italy	alessandra faella	rowing	1	paris 2024	2000
162	italy	alessandro alberto bovolenta	volleyball	1	paris 2024	2004
163	italy	alessandro michieletto	volleyball	2	tokyo 2020	2001
164	italy	alessandro miressi	swimming	2	tokyo 2020	1998
165	italy	alessandro paoli	archery	1	paris 2024	1999
166	italy	alessandro ragaini	swimming	1	paris 2024	2006
167	italy	alessandro sibilio	athletics	2	tokyo 2020	1999
168	italy	alessandro velotto	water polo	3	rio 2016	1995
169	italy	alessia maurelli	rhythmic gymnastics	3	rio 2016	1996
170	italy	alessia orro	volleyball	3	rio 2016	1998
171	italy	alessia pavese	athletics	1	paris 2024	1998
172	italy	alessio crociani	triathlon	1	paris 2024	2001
173	italy	alessio foconi	fencing	2	tokyo 2020	1989
174	united states of america	alev kelter	rugby sevens	2	rio 2016	1991
175	canada	alex axon	swimming	1	paris 2024	2003
176	spain	alex baena	football	1	paris 2024	2001
177	united states of america	alex bowen	water polo	3	rio 2016	1992
178	spain	alex dujshebaev dovichebaeva	handball	2	tokyo 2020	1992
179	great britain	alex haydock-wilson	athletics	1	paris 2024	1999
180	people's republic of china	alex hua tian	equestrian	2	tokyo 2020	1989
181	united states of america	alex obert	water polo	3	rio 2016	1991
182	new zealand	alex paulsen	football	2	tokyo 2020	2002
183	united states of america	alex sedrick	rugby sevens	1	paris 2024	1998
184	united states of america	alex shackell	swimming	1	paris 2024	2006
185	australia	alex wilson	3x3 basketball	1	paris 2024	1994
186	great britain	alex wise	archery	1	paris 2024	2000
187	great britain	alex yee	triathlon	2	tokyo 2020	1998
188	belgium	alexander doom	athletics	2	tokyo 2020	1997
189	belgium	alexander hendrickx	hockey	3	rio 2016	1993
190	australia	alexander hill	rowing	3	rio 2016	1993
191	united states of america	alexander massialas	fencing	4	london 2012	1994
192	south africa	alexander peternell	equestrian	2	london 2012	1981
193	australia	alexander purnell	rowing	2	tokyo 2020	1995
194	kazakhstan	alexandr yeremenko	archery	1	paris 2024	2004
195	greece	alexandra asimaki	water polo	2	beijing 2008	1988
196	germany	alexandra burghardt	athletics	2	tokyo 2020	1994
197	australia	alexandra clarke	canoe sprint	1	paris 2024	1999
198	united states of america	alexandra hammel	hockey	1	paris 2024	1996
199	france	alexandra louis-marie	fencing	1	paris 2024	1996
200	australia	alexandra manly	cycling track	2	tokyo 2020	1996
201	azerbaijan	alexandra mollenhauer	3x3 basketball	1	paris 2024	1998
202	germany	alexandra popp	football	2	rio 2016	1991
203	romania	alexandra ungureanu	rowing	1	paris 2024	2001
204	germany	alexandra wilke	basketball	1	paris 2024	1996
205	france	alexandre ayache	equestrian	2	tokyo 2020	1982
206	france	alexandre bouet	water polo	1	paris 2024	2000
207	norway	alexandre christoffersen blonz	handball	1	paris 2024	2000
208	france	alexandre lacazette	football	1	paris 2024	1991
209	australia	alexandria perkins	swimming	1	paris 2024	2000
210	spain	alexandrina cabral	handball	3	rio 2016	1986
211	greece	alexandros papanastasiou	water polo	2	tokyo 2020	1999
212	israel	alexey glivinskiy	swimming	1	paris 2024	2004
213	france	alexia chartereau	basketball	2	tokyo 2020	1998
214	spain	alexia putellas	football	1	paris 2024	1994
215	paraguay	alexis cantero	football	1	paris 2024	2003
216	united states of america	alexis holmes	athletics	1	paris 2024	2000
217	france	alexis lebrun	table tennis	1	paris 2024	2003
218	germany	alexis peterson	3x3 basketball	1	paris 2024	1995
219	guinea	algassime bah	football	1	paris 2024	2002
220	egypt	ali el gabry	football	1	paris 2024	2001
221	puerto rico	ali gibson	basketball	2	tokyo 2020	1993
222	united arab emirates	ali hamad al kirbi	equestrian	1	paris 2024	2001
223	iraq	ali jasim	football	1	paris 2024	2004
224	islamic republic of iran	ali pakdaman	fencing	3	rio 2016	1990
225	egypt	ali mohamed	handball	3	rio 2016	1990
226	germany	alica schmidt	athletics	2	tokyo 2020	1998
227	australia	alice arnott	hockey	1	paris 2024	1998
228	italy	alice bellandi	judo	2	tokyo 2020	1998
229	italy	alice betto	triathlon	2	tokyo 2020	1987
230	italy	alice codato	rowing	1	paris 2024	2003
231	italy	alice d'amato	artistic gymnastics	2	tokyo 2020	2003
232	italy	alice gnatta	rowing	1	paris 2024	2003
233	great britain	alice kinsella	artistic gymnastics	2	tokyo 2020	2001
234	italy	alice mangione	athletics	2	tokyo 2020	1997
235	italy	alice volpi	fencing	2	tokyo 2020	1992
236	australia	alice williams	water polo	1	paris 2024	1998
237	spain	alicia fernandez fraga	handball	2	tokyo 2020	1992
238	new zealand	alicia hoskin	canoe sprint	2	tokyo 2020	2000
239	france	alicia toublanc	handball	1	paris 2024	1996
240	poland	alicja klasik	fencing	1	paris 2024	2004
241	poland	alicja wrona-kutrzepa	athletics	1	paris 2024	1996
242	hungary	alida dora gazso	canoe sprint	1	paris 2024	2000
243	germany	alina grijseels	handball	1	paris 2024	1996
244	germany	alina hartmann	basketball	1	paris 2024	1995
245	ukraine	alina komashchuk	fencing	2	rio 2016	1993
246	ukraine	alina melnyk	rhythmic gymnastics	1	paris 2024	2005
247	germany	alina oganesyan	rhythmic gymnastics	1	paris 2024	2004
248	guinea	aliou balde	football	1	paris 2024	2002
249	republic of moldova	alisa glinka	equestrian	1	paris 2024	1987
250	spain	alisa ozhogina ozhogin	artistic swimming	2	tokyo 2020	2000
251	uzbekistan	alisher yusupov	judo	1	paris 2024	1998
252	belgium	alix gerniers	hockey	2	london 2012	1993
253	slovenia	alja varagic	handball	1	paris 2024	1990
254	montenegro	aljosa macic	water polo	1	paris 2024	2000
255	estonia	allar raja	rowing	5	beijing 2008	1983
256	new zealand	ally green	football	1	paris 2024	1998
257	new zealand	ally wollaston	cycling track	1	paris 2024	2001
258	austria	alois knabl	triathlon	2	tokyo 2020	1992
259	dominican republic	alondra denis tapia cruz	volleyball	1	paris 2024	2004
260	bahamas	alonzo russell	athletics	3	rio 2016	1992
261	fiji	alowesi nakoci	rugby sevens	2	tokyo 2020	1991
262	france	alpha oumar djalo	judo	1	paris 2024	1996
263	denmark	althea reinhardt	handball	1	paris 2024	1996
264	spain	alvaro granados ortega	water polo	2	tokyo 2020	1998
265	spain	alvaro iglesias	hockey	3	rio 2016	1993
266	spain	alvaro martin	athletics	4	london 2012	1994
267	canada	alysha corrigan	rugby sevens	1	paris 2024	1997
268	australia	alyssa bull	canoe	3	rio 2016	1995
269	united states of america	alyssa naeher	football	3	rio 2016	1988
270	united states of america	alyssa thomas	basketball	1	paris 2024	1992
271	guinea	amadou diallo	football	1	paris 2024	2001
272	guinea	amadou diawara	football	1	paris 2024	1997
273	romania	amalia beres	rowing	2	tokyo 2020	1997
274	romania	amalia ghigoarta	artistic gymnastics	1	paris 2024	2007
275	norway	amalie iuel	athletics	3	rio 2016	1994
276	uzbekistan	amaliya mamedova	rhythmic gymnastics	1	paris 2024	2008
277	united states of america	amanda golini	hockey	1	paris 2024	1995
278	united states of america	amanda longan	water polo	2	tokyo 2020	1997
279	france	amandha sylves	volleyball	1	paris 2024	2000
280	france	amandine brossier	athletics	2	tokyo 2020	1995
281	france	amandine buchard	judo	2	tokyo 2020	1995
282	france	amandine giardino	volleyball	1	paris 2024	1995
283	france	amandine henry	football	2	rio 2016	1989
284	france	amaury bellenger	hockey	1	paris 2024	1998
285	great britain	amber anning	athletics	1	paris 2024	2000
286	australia	amber fuller	equestrian	1	paris 2024	1976
287	belgium	ambre ballenghien	hockey	1	paris 2024	2000
288	france	ambre esnault	artistic swimming	1	paris 2024	2002
289	ireland	amee leigh murphy crowe	rugby sevens	1	paris 2024	1995
290	france	amelie cordeau	archery	1	paris 2024	2005
291	france	amelie rotar	volleyball	1	paris 2024	2000
292	germany	amelie wortmann	hockey	2	tokyo 2020	1996
293	japan	ami wada	artistic swimming	1	paris 2024	2003
294	egypt	amina elfeky	artistic swimming	1	paris 2024	2005
295	egypt	amina sobeih	rhythmic gymnastics	1	paris 2024	2006
296	morocco	amir richardson	football	1	paris 2024	2002
297	japan	amiru shimada	hockey	1	paris 2024	1998
298	india	amit rohidas	hockey	2	tokyo 2020	1993
299	india	amoj jacob	athletics	2	tokyo 2020	1998
300	slovenia	amra pandzic	handball	1	paris 2024	1989
301	syrian arab republic	amre hamcho	equestrian	1	paris 2024	1995
302	great britain	amy ewart costello	hockey	2	tokyo 2020	1998
303	great britain	amy hunt	athletics	1	paris 2024	2002
304	canada	amy millar	equestrian	2	rio 2016	1977
305	nigeria	amy okonkwo	basketball	2	tokyo 2020	1996
306	australia	amy rose lawton	hockey	2	tokyo 2020	2002
307	united states of america	amy wang	table tennis	1	paris 2024	2002
308	great britain	amy wilson hardy	rugby sevens	2	rio 2016	1991
309	slovenia	ana abina	handball	1	paris 2024	1997
310	spain	ana arnau camarena	rhythmic gymnastics	1	paris 2024	2005
311	romania	ana barbosu	artistic gymnastics	1	paris 2024	2006
312	brazil	ana carolina da silva	volleyball	2	tokyo 2020	1991
313	brazil	ana carolina vieira	swimming	1	tokyo 2020	2001
314	brazil	ana claudia bolzan	handball	1	paris 2024	1996
315	brazil	ana cristina menezes oliveira de souza	volleyball	2	tokyo 2020	2004
316	slovenia	ana gros	handball	1	paris 2024	1991
317	canada	ana laura portuondo isasi	judo	1	paris 2024	1996
318	fiji	ana maria naimasi	rugby sevens	2	tokyo 2020	1994
319	mexico	ana paula vazquez flores	archery	2	tokyo 2020	2000
320	brazil	ana vitoria	football	1	paris 2024	2000
321	dominican republic	anabel medina ventura	athletics	2	tokyo 2020	1996
322	france	anastasia bayandina	artistic swimming	1	paris 2024	1996
323	australia	anastasia kusmawan	artistic swimming	1	paris 2024	2005
324	france	anastasiia kirpichnikova	marathon swimming	2	tokyo 2020	2000
325	ukraine	anastasiia kozhenkova	rowing	3	london 2012	1986
326	israel	anastasya gorbenko	swimming	2	tokyo 2020	2003
327	serbia	anastazija bajuk	canoe sprint	1	paris 2024	2002
328	poland	anastazja kus	athletics	1	paris 2024	2007
329	romania	ancuta bodnar	rowing	2	tokyo 2020	1998
330	denmark	anders lind	table tennis	1	paris 2024	1998
331	serbia	andjelo dzombeta	canoe sprint	1	paris 2024	1996
332	hungary	andras szatmari	fencing	2	tokyo 2020	1993
333	canada	andre de grasse	athletics	3	rio 2016	1994
334	italy	andrea carlino	judo	1	paris 2024	1997
335	united states of america	andrea drews	volleyball	2	tokyo 2020	1993
336	italy	andrea fondelli	water polo	2	rio 2016	1994
337	israel	andrea murez	swimming	2	rio 2016	1992
338	italy	andrea panizza	rowing	2	tokyo 2020	1998
339	italy	andrea santarelli	fencing	3	rio 2016	1993
340	spain	andrea vilaro	basketball	1	paris 2024	1993
341	germany	andreas obst	basketball	2	tokyo 2020	1996
342	sweden	andreas palicka	handball	2	tokyo 2020	1986
343	denmark	andreas schou	equestrian	2	tokyo 2020	1986
344	germany	andreas toba	artistic gymnastics	4	london 2012	1990
345	greece	andreas vazaios	swimming	3	london 2012	1994
346	germany	andreas wolff	handball	3	rio 2016	1991
347	romania	andreea preda	artistic gymnastics	1	paris 2024	2006
348	romania	andrei lungu	rowing	1	paris 2024	2000
349	romania	andrei mandrila	rowing	1	paris 2024	2002
350	romania	andrei neamtu	water polo	1	paris 2024	2004
351	romania	andrei prioteasa	water polo	1	paris 2024	1996
352	romania	andrei tepelus	water polo	1	paris 2024	2005
353	serbia	andrej barna	swimming	2	tokyo 2020	1998
354	croatia	andrej gacina	table tennis	5	beijing 2008	1986
355	jamaica	andrenette knight	athletics	1	paris 2024	1996
356	mexico	andres azcarraga	equestrian	1	paris 2024	1993
357	colombia	andres hernandez vera	archery	1	paris 2024	2007
358	argentina	andres moyano	handball	1	paris 2024	1996
359	france	andrew albicy	basketball	2	tokyo 2020	1990
360	australia	andrew charter	hockey	4	london 2012	1987
361	south africa	andrew hobson	hockey	1	paris 2024	1998
362	new zealand	andrew knewstubb	rugby sevens	2	tokyo 2020	1995
363	canada	andrew nembhard	basketball	1	paris 2024	2000
364	ireland	andrew smith	rugby sevens	1	paris 2024	2000
365	switzerland	andrina suter	equestrian	1	paris 2024	1992
366	lithuania	andrius petrovas	equestrian	1	paris 2024	1972
367	lithuania	andrius sidlauskas	swimming	3	rio 2016	1997
368	poland	andrzej rzadkowski	fencing	1	paris 2024	1997
369	france	andy timo	rugby sevens	1	paris 2024	2004
370	south africa	anelle van deventer	hockey	1	paris 2024	1993
371	dominican republic	angel montes de oca	football	1	paris 2024	2003
372	italy	angela andreoli	artistic gymnastics	1	paris 2024	2006
373	colombia	angela baron	football	1	paris 2024	2003
374	serbia	angela dugalic	basketball	2	tokyo 2020	2001
375	netherlands	angela malestein	handball	3	rio 2016	1993
376	mexico	angela ruiz	archery	1	paris 2024	2006
377	brazil	angelina	football	1	tokyo 2020	2000
378	germany	angelina kohler	swimming	1	paris 2024	2000
379	greece	angelos vlachopoulos	water polo	3	rio 2016	1991
380	great britain	angharad evans	swimming	1	paris 2024	2003
381	australia	angus dawson	rowing	2	tokyo 2020	2000
382	australia	angus lambie	water polo	1	paris 2024	1996
383	australia	angus widdicombe	rowing	2	tokyo 2020	1994
384	people's republic of china	anhui yu	hockey	1	paris 2024	2001
385	united states of america	anita alvarez	artistic swimming	3	rio 2016	1996
386	france	anita blaze	fencing	3	london 2012	1991
387	germany	anja kosan	rhythmic gymnastics	1	paris 2024	2002
388	india	ankita bhakat	archery	1	paris 2024	1998
389	germany	ann-katrin berger	football	1	paris 2024	1990
390	hungary	anna albek	handball	1	paris 2024	2001
391	germany	anna charlott darcel elendt	swimming	2	tokyo 2020	2001
392	italy	anna danesi	volleyball	3	rio 2016	1996
393	great britain	anna-frances toman	hockey	2	tokyo 2020	1993
394	spain	anna godoy	triathlon	2	tokyo 2020	1992
395	great britain	anna hopkin	swimming	2	tokyo 2020	1996
396	new zealand	anna leat	football	2	tokyo 2020	2001
397	norway	anna margrete sletsjoee	canoe sprint	1	paris 2024	1997
398	germany	anna-maria wagner	judo	2	tokyo 2020	1996
399	hungary	anna marton	fencing	3	rio 2016	1995
400	great britain	anna morris	cycling track	1	paris 2024	1995
401	greece	anna ntountounaki	swimming	3	rio 2016	1995
402	italy	anna polinari	athletics	2	tokyo 2020	1999
403	poland	anna pulawska	canoe sprint	2	tokyo 2020	1996
404	new zealand	annalie longo	football	3	london 2012	1991
405	netherlands	anne buijs	volleyball	2	rio 2016	1991
406	united states of america	anne cebula	fencing	1	paris 2024	1998
407	france	anne-cecile ciofani	rugby sevens	2	tokyo 2020	1993
408	denmark	anne mette hansen	handball	1	paris 2024	1994
409	germany	anne schroder	hockey	3	rio 2016	1994
410	france	anne sophie serre	equestrian	1	paris 2024	1977
411	netherlands	anne veenendaal	hockey	1	paris 2024	1995
412	australia	anneli maley	3x3 basketball	1	paris 2024	1998
413	germany	annett kaufmann	table tennis	1	paris 2024	2006
414	spain	anni espar llaquet	water polo	2	tokyo 2020	1993
415	great britain	annie campbell-orde	rowing	1	paris 2024	1995
416	germany	annika lott	handball	1	paris 2024	1999
417	switzerland	annina fahr	athletics	2	tokyo 2020	1993
418	croatia	ante vukicevic	water polo	2	tokyo 2020	1993
419	united states of america	anthony davis	basketball	2	london 2012	1993
420	united states of america	anthony edwards	basketball	1	paris 2024	2001
421	botswana	anthony pasela	athletics	1	tokyo 2020	2002
422	germany	antje doell	handball	1	paris 2024	1988
423	france	antoine brizard	volleyball	2	tokyo 2020	1994
424	france	antoine dupont	rugby sevens	1	paris 2024	1996
425	belgium	antoine sylvain t kina	hockey	2	tokyo 2020	1996
426	france	antoine zeghdar	rugby sevens	1	paris 2024	1999
427	germany	anton brehme	volleyball	1	paris 2024	1999
428	germany	anton finger	rowing	1	paris 2024	1998
429	sweden	anton kaellberg	table tennis	2	tokyo 2020	1997
430	italy	antonella palmisano	athletics	3	rio 2016	1991
431	brazil	antonia	football	1	paris 2024	1994
432	belgium	antonia delaere	basketball	2	tokyo 2020	1994
433	south africa	antonie matthys nortje	athletics	1	paris 2024	2002
434	switzerland	antonio djakovic	swimming	2	tokyo 2020	2002
435	italy	antonio esposito	judo	1	paris 2024	1994
436	spain	antonio serrat seoane	triathlon	1	paris 2024	1995
437	portugal	antonio vale	equestrian	1	paris 2024	1982
438	kenya	antony mboya	rugby sevens	1	paris 2024	1995
439	south sudan	anunwa omot	basketball	1	paris 2024	1994
440	india	anush agarwalla	equestrian	1	paris 2024	1999
441	south sudan	anyiarbany makoi	basketball	1	paris 2024	2000
442	japan	aoba fujino	football	1	paris 2024	2004
443	ireland	aoife clark	equestrian	2	london 2012	1981
444	greece	apostolos christou	swimming	3	rio 2016	1996
445	refugee olympic team	sibghatullah arab	judo	1	paris 2024	0
446	mexico	aram michell penaflor moysen	triathlon	1	paris 2024	1999
447	australia	aran zalewski	hockey	3	rio 2016	1991
448	india	archana girish kamath	table tennis	1	paris 2024	2000
449	puerto rico	arella guirantes	basketball	1	paris 2024	1997
450	malaysia	ariana nur dania mohamad zairi	archery	1	paris 2024	2005
451	united states of america	ariana ramsey	rugby sevens	2	tokyo 2020	2000
452	dominican republic	ariana rodriguez fung	volleyball	1	paris 2024	2005
453	canada	ariane bonhomme	cycling track	2	tokyo 2020	1995
454	spain	ariane toro soler	judo	1	paris 2024	2003
455	italy	arianna de masi	athletics	1	paris 2024	1999
456	italy	arianna errigo	fencing	4	london 2012	1988
457	australia	ariarne titmus	swimming	2	tokyo 2020	2000
458	japan	arisa inoue	volleyball	1	paris 2024	1995
459	japan	arisa nishi	rugby sevens	1	paris 2024	2004
460	mongolia	ariunbold enkhtaivan	judo	1	paris 2024	1995
461	spain	armando trapote	equestrian	1	paris 2024	1981
462	puerto rico	arnaldo toro	basketball	1	paris 2024	1997
463	spain	arnau tenas	football	1	paris 2024	2001
464	france	arnaud kalimuendo	football	1	paris 2024	2002
465	belgium	arno van dessel	hockey	1	paris 2024	2003
466	hungary	aron szilagyi	fencing	5	beijing 2008	1990
467	ukraine	arsenii batahov	football	1	paris 2024	2002
468	belgium	arthur anne-marie thierry de sloover	hockey	2	tokyo 2020	1997
469	canada	arthur margelidon	judo	2	tokyo 2020	1993
470	canada	arthur szwarc	volleyball	2	tokyo 2020	1995
471	france	arthur thieffry	hockey	1	paris 2024	1989
472	belgium	arthur van doren	hockey	3	rio 2016	1994
473	lithuania	arturas seja	canoe sprint	1	paris 2024	1996
474	netherlands	arvin slagter	3x3 basketball	2	tokyo 2020	1985
475	uzbekistan	asadbek rakhimjonov	football	1	paris 2024	2004
476	japan	asami yoshida	basketball	2	rio 2016	1987
477	united states of america	asher hong	artistic gymnastics	1	paris 2024	2004
478	israel	ashlee bond	equestrian	2	tokyo 2020	1985
479	ireland	ashleigh baxter	rugby sevens	1	paris 2024	1991
480	united states of america	ashleigh johnson	water polo	3	rio 2016	1994
481	united states of america	ashley hoffman	hockey	1	paris 2024	1996
482	canada	ashley lawrence	football	3	rio 2016	1995
483	united states of america	ashley sessa	hockey	1	paris 2024	2004
484	canada	asia hogan-rochester	rugby sevens	1	paris 2024	1999
485	türkiye	asli kalac	volleyball	1	paris 2024	1995
486	france	assia touati	swimming	1	tokyo 2020	1995
487	italy	assunta scutto	judo	1	paris 2024	2002
488	norway	astri ertzgaard	athletics	1	paris 2024	2002
489	denmark	astrid steensberg	rowing	1	paris 2024	1996
490	italy	asya tavano	judo	1	paris 2024	2002
491	spain	athenea del castillo	football	1	paris 2024	2000
492	greece	athina dimitra giannopoulou	water polo	1	paris 2024	2001
493	hungary	attila ungvari	judo	2	tokyo 2020	1988
494	france	audrey daule	water polo	1	paris 2024	1993
495	united states of america	audrey kwon	artistic swimming	1	paris 2024	2006
496	canada	audrey lamothe	artistic swimming	1	paris 2024	2005
497	canada	audrey leduc	athletics	1	paris 2024	1999
498	france	aurelie battu	water polo	1	paris 2024	1997
499	canada	aurelie tran	artistic gymnastics	1	paris 2024	2006
500	france	aurelien diesse	judo	1	paris 2024	1997
501	france	aurelien quinion	athletics	1	paris 2024	1993
502	lithuania	aurelijus pukelis	3x3 basketball	1	paris 2024	1994
503	france	auriane mallo	fencing	2	rio 2016	1993
504	ireland	austin o'connor	equestrian	4	sydney 2000	1974
505	canada	ava stewart	artistic gymnastics	2	tokyo 2020	2005
506	canada	avalon wasteneys	rowing	2	tokyo 2020	1997
507	zambia	avell chitundu	football	2	tokyo 2020	1997
508	united states of america	avery skinner	volleyball	1	paris 2024	1999
509	canada	axelle crevier	water polo	2	tokyo 2020	1997
510	egypt	aya hussein	fencing	1	paris 2024	2003
511	japan	ayaka araki	volleyball	1	paris 2024	2001
512	japan	ayaka yamashita	football	2	tokyo 2020	1995
513	israel	ayanaw ferede	football	1	paris 2024	2002
514	south africa	ayanda malinga	rugby sevens	1	paris 2024	1998
515	japan	ayane yanai	athletics	1	paris 2024	2003
516	japan	ayano shimada	artistic swimming	1	paris 2024	2006
517	israel	ayla spitz	swimming	1	paris 2024	2001
518	iraq	aymen hussein	football	1	paris 2024	1996
519	france	aymeric minne	handball	1	paris 2024	1997
520	türkiye	ayse tekdal	athletics	2	tokyo 2020	1999
521	japan	ayumu ohata	football	1	paris 2024	2001
522	angola	azenaide carlos	handball	5	beijing 2008	1990
523	mongolia	baasankhuu bavuudorj	judo	1	paris 2024	1999
524	hungary	balazs harai	water polo	4	london 2012	1987
525	hungary	balazs kaizinger	equestrian	1	paris 2024	1979
526	uruguay	baltazar amaya	rugby sevens	1	paris 2024	1999
527	united states of america	bam adebayo	basketball	2	tokyo 2020	1997
528	guinea	bangaly cisse	football	1	paris 2024	2002
529	france	baptiste addis	archery	1	paris 2024	2006
530	israel	bar soloveychik	swimming	1	paris 2024	2000
531	spain	barbara camblor	athletics	1	paris 2024	1994
532	slovenia	barbara lazovic	handball	1	paris 2024	1988
533	belgium	barbara nelen	hockey	2	london 2012	1991
534	zambia	barbra banda	football	1	paris 2024	2000
535	france	barthelemy chinenyeze	volleyball	2	tokyo 2020	1998
536	poland	bartlomiej boladz	volleyball	1	paris 2024	0
537	poland	bartosz kurek	volleyball	4	london 2012	1988
538	poland	bartosz piszczorowicz	swimming	1	paris 2024	1999
539	israel	baruch shmailov	judo	2	tokyo 2020	1994
540	mongolia	baskhuu yondonperenlei	judo	2	tokyo 2020	1993
541	republic of korea	baul an	judo	3	rio 2016	1994
542	uruguay	bautista basso	rugby sevens	1	paris 2024	2001
543	argentina	bautista capurro zubeldia	hockey	1	paris 2024	2003
544	south africa	bayanda walaza	athletics	1	paris 2024	2006
545	botswana	bayapo ndori	athletics	2	tokyo 2020	1999
546	spain	beatriz ortiz munoz	water polo	3	rio 2016	1995
547	spain	beatriz perez	hockey	3	rio 2016	1991
548	brazil	beatriz souza	judo	1	paris 2024	1998
549	great britain	becky downie	artistic gymnastics	3	beijing 2008	1992
550	belgium	becky massey	basketball	1	paris 2024	2000
551	great britain	becky moody	equestrian	1	paris 2024	1980
552	spain	begona garcia	hockey	3	rio 2016	1995
553	ireland	beibhinn parsons	rugby sevens	1	paris 2024	2001
554	spain	belen iglesias marcos	hockey	2	tokyo 2020	1996
555	kenya	belinda nanjala barasa	volleyball	1	paris 2024	2001
556	australia	ben armbruster	swimming	1	paris 2024	2002
557	australia	ben canham	rowing	1	paris 2024	1997
558	australia	ben dowling	rugby sevens	1	paris 2024	2002
559	ireland	ben johnson	hockey	1	paris 2024	2000
560	great britain	ben maher	equestrian	5	beijing 2008	1983
561	new zealand	ben old	football	2	tokyo 2020	2002
562	new zealand	ben waine	football	2	tokyo 2020	2001
563	spain	benat turrientes	football	1	paris 2024	2002
564	hungary	bence banhidi	handball	1	paris 2024	1995
565	hungary	bence imre	handball	1	paris 2024	2002
566	hungary	bence nadas	canoe sprint	2	tokyo 2020	1996
567	hungary	bence pongracz	judo	1	paris 2024	1999
568	hungary	bence venyercsan	athletics	2	tokyo 2020	1996
569	hungary	bendeguz boka	handball	1	paris 2024	1993
570	italy	benedetta pilato	swimming	2	tokyo 2020	2005
571	germany	benedetta wenzel	hockey	1	paris 2024	1997
572	germany	benedict eggeling	rowing	1	paris 2024	1999
573	ghana	benjamin azamati-kwaku	athletics	2	tokyo 2020	1998
574	morocco	benjamin bouchouari	football	1	paris 2024	2001
575	united states of america	benjamin cremaschi	football	1	paris 2024	2005
576	united states of america	benjamin hallock	water polo	3	rio 2016	1997
577	france	benjamin thomas	cycling track	2	tokyo 2020	1995
578	france	benjamin toniutti	volleyball	3	rio 2016	1989
579	ireland	benjamin walker	hockey	1	paris 2024	1999
580	france	benoit brunet	rowing	1	paris 2024	1991
581	netherlands	bente paulis	rowing	1	paris 2024	1997
582	netherlands	bente rogge	water polo	1	paris 2024	1997
583	netherlands	benthe boonstra	rowing	1	paris 2024	2000
584	türkiye	berkim tumer	archery	1	paris 2024	2002
585	romania	bernadette szocs	table tennis	3	rio 2016	1995
586	spain	bernat sanahuja	water polo	2	tokyo 2020	2000
587	austria	bernhard reitshammer	swimming	2	tokyo 2020	1994
588	spain	berta segura	athletics	1	paris 2024	2003
589	france	beryl gastaldello	swimming	3	rio 2016	1995
590	great britain	beth potter	athletics	2	rio 2016	1991
591	dominican republic	bethania de la cruz de pena	volleyball	3	london 2012	1987
592	belgium	bethy mununga	basketball	1	paris 2024	1997
593	türkiye	beyza arici	volleyball	1	paris 2024	0
594	india	bhajan kaur	archery	1	paris 2024	2005
595	brazil	bianca silva	rugby sevens	2	tokyo 2020	1998
596	serbia	bianka busa	volleyball	3	rio 2016	1994
597	germany	bibiane schulze solano	football	1	paris 2024	1998
598	australia	bienne terita	rugby sevens	1	paris 2024	2003
599	france	bilal coulibaly	basketball	1	paris 2024	2004
600	morocco	bilal el khannouss	football	1	paris 2024	2004
601	egypt	bilal mazhar	football	1	paris 2024	2003
602	belgium	billie massey	basketball	2	tokyo 2020	2000
603	people's republic of china	bin wu	fencing	1	paris 2024	1998
604	people's republic of china	bingfeng gu	hockey	2	tokyo 2020	1994
605	people's republic of china	bingjie li	swimming	2	tokyo 2020	2002
606	people's republic of china	binxuan xiang	artistic swimming	1	paris 2024	2001
607	republic of korea	bitna woo	handball	1	paris 2024	2001
608	samoa	bj lima	rugby sevens	1	paris 2024	1999
609	sweden	bjoern seeliger	swimming	2	tokyo 2020	2000
610	new zealand	blair tarrant	hockey	3	rio 2016	1990
611	canada	blaire mcdowell	water polo	1	paris 2024	2000
612	france	blaise rogeau	hockey	1	paris 2024	1994
613	canada	blake broszus	fencing	2	tokyo 2020	2000
614	australia	blake edwards	water polo	2	tokyo 2020	1992
615	australia	blake govers	hockey	3	rio 2016	1996
616	canada	blake tierney	swimming	1	paris 2024	2002
617	spain	blanca hervas	athletics	1	paris 2024	2002
618	spain	blanca perez	hockey	1	paris 2024	2003
619	spain	blanca toledano laut	artistic swimming	2	tokyo 2020	2000
620	hungary	blanka biro	handball	2	tokyo 2020	1994
621	slovenia	blaz blagotinsek	handball	2	rio 2016	1994
622	slovenia	blaz janc	handball	2	rio 2016	1996
623	nigeria	blessing demehin	football	1	paris 2024	2002
624	nigeria	blessing ejiofor	basketball	1	paris 2024	1998
625	netherlands	bo van wetering	handball	2	tokyo 2020	1999
626	republic of korea	boeun gim	handball	2	tokyo 2020	1997
627	romania	bogdan baitoc	rowing	1	paris 2024	1998
628	serbia	bogdan bogdanovic	basketball	2	rio 2016	1992
629	montenegro	bogdan durdic	water polo	1	paris 2024	1996
630	canada	bogdan hamilton	fencing	1	paris 2024	2004
631	hungary	boglarka neszmely	water polo	1	paris 2024	2003
632	people's republic of china	boheng zhang	artistic gymnastics	1	paris 2024	2000
633	serbia	bojana milenkovic	volleyball	2	tokyo 2020	1997
634	serbia	bojana zivkovic	volleyball	3	london 2012	1988
635	france	bolade apithy	fencing	3	london 2012	1985
636	republic of korea	bongil gu	fencing	4	london 2012	1989
637	kenya	boniface ontuga mweresa	athletics	2	london 2012	1993
638	spain	borja carrascosa	equestrian	1	paris 2024	1982
639	spain	borja lacalle	hockey	1	paris 2024	2001
640	slovenia	borut mackovsek	handball	1	paris 2024	1992
641	mali	boubacar traore	football	1	paris 2024	2001
642	united states of america	boyd martin	equestrian	4	london 2012	1979
643	new zealand	brad read	hockey	1	paris 2024	1995
644	france	bradley locko	football	1	paris 2024	2002
645	south africa	bradley nkoana	athletics	1	paris 2024	2005
646	south africa	bradley sherwood	hockey	1	paris 2024	1999
647	new zealand	brady rush	rugby sevens	1	paris 2024	1999
648	mali	brahima diarra	football	1	paris 2024	2003
649	dominican republic	brayelin elizabeth martinez	volleyball	2	tokyo 2020	1996
650	australia	breanna scott	artistic gymnastics	1	paris 2024	2001
651	united states of america	breanna stewart	basketball	3	rio 2016	1994
652	australia	bree masters	athletics	1	paris 2024	1995
653	dominican republic	brenda castillo	volleyball	3	london 2012	1992
654	canada	brendon rodney	athletics	3	rio 2016	1992
655	brazil	breno correia	swimming	1	tokyo 2020	1999
656	canada	brett james walsh	volleyball	1	paris 2024	1994
657	ecuador	brian daniel pintado	athletics	3	rio 2016	1995
658	kenya	brian tanga	rugby sevens	1	paris 2024	1995
659	puerto rico	brianna jones	basketball	1	paris 2024	1997
660	australia	brianna throssell	swimming	2	rio 2016	1996
661	canada	bridget carleton	basketball	2	tokyo 2020	1997
662	australia	bridget clark	rugby sevens	1	paris 2024	2003
663	france	brieuc delemazure	hockey	1	paris 2024	2002
664	hungary	brigitta horvath	water polo	1	paris 2024	1996
665	netherlands	brigitte sleeking	water polo	2	tokyo 2020	1998
666	netherlands	britt bongaerts	volleyball	1	paris 2024	1996
667	united states of america	brittney griner	basketball	3	rio 2016	1990
668	canada	brodie hofer	volleyball	1	paris 2024	2000
669	united states of america	brody malone	artistic gymnastics	2	tokyo 2020	2000
670	australia	bronte halligan	water polo	2	tokyo 2020	1996
671	australia	bronwyn cox	rowing	2	tokyo 2020	1997
672	united states of america	brooke deberdine	hockey	1	paris 2024	1999
673	australia	brooke peris	hockey	3	rio 2016	1993
674	brazil	bruna alexandre	table tennis	1	paris 2024	1995
675	brazil	bruna aparecida almeida de paula	handball	2	tokyo 2020	1996
676	brazil	bruna takahashi	table tennis	3	rio 2016	2000
677	argentina	bruno amione	football	1	paris 2024	2002
678	brazil	bruno caboclo	basketball	1	paris 2024	1995
679	spain	bruno font	hockey	1	paris 2024	2004
680	argentina	bruno lima	volleyball	3	rio 2016	1996
681	mexico	bruno martinez wing	archery	1	paris 2024	1998
682	brazil	bruno rezende	volleyball	2	tokyo 2020	1986
683	unknown	unknown	rugby sevens	1	tokyo 2020	1995
684	united states of america	bryce deadmon	athletics	2	tokyo 2020	1997
685	new zealand	bryony botha	cycling track	2	tokyo 2020	1997
686	great britain	bryony pitman	archery	2	tokyo 2020	1997
687	south sudan	bul kuol	basketball	1	paris 2024	1997
688	botswana	busang collen kebinatshipi	athletics	1	paris 2024	2004
689	south africa	byrhandre dolf	rugby sevens	1	paris 2024	2003
690	united states of america	caeleb dressel	swimming	3	rio 2016	1996
691	canada	caileigh filmer	rowing	3	rio 2016	1996
692	brazil	caio bonfim	athletics	4	london 2012	1991
693	australia	caitlin cronin	rowing	2	tokyo 2020	1995
694	new zealand	caitlin deans	swimming	1	paris 2024	1999
695	australia	caitlin foord	football	3	rio 2016	1994
696	australia	calab law	athletics	1	paris 2024	2003
697	united states of america	caleb wiley	football	1	paris 2024	2004
698	great britain	callum dixon	rowing	1	paris 2024	2000
699	south africa	calvin davis	hockey	1	paris 2024	2003
700	france	camelia bouloukbachi	water polo	1	paris 2024	2003
701	norway	camilla herrem	handball	4	london 2012	1986
702	belgium	camille belis	hockey	1	paris 2024	2004
703	canada	camille carier bergeron	equestrian	1	paris 2024	2000
704	hong kong	camille cheng	swimming	2	rio 2016	1993
705	france	camille grassineau	rugby sevens	3	rio 2016	1990
706	france	camille radosavljevic	water polo	1	paris 2024	2002
707	new zealand	campbell stewart	cycling track	2	tokyo 2020	1998
708	dominican republic	candida estefany arias perez	volleyball	2	london 2012	1992
709	türkiye	cansu ozbay	volleyball	2	tokyo 2020	1996
710	united states of america	canyon barry	3x3 basketball	1	paris 2024	1994
711	sweden	carin stromberg	handball	3	rio 2016	1993
712	canada	carissa norsten	rugby sevens	1	paris 2024	2003
713	denmark	carl-frederik bevort	cycling track	1	paris 2024	2003
714	great britain	carl hester	equestrian	7	barcelona 1992	1967
715	france	carla neisen	rugby sevens	2	tokyo 2020	1996
716	spain	carles coll marti	swimming	1	paris 2024	2001
717	south sudan	carlik jones	basketball	1	paris 2024	1997
718	italy	carlo macchini	artistic gymnastics	1	paris 2024	1996
719	spain	carlos arevalo lopez	canoe sprint	2	tokyo 2020	1993
720	italy	carlos d'ambrosio	swimming	1	paris 2024	2007
721	spain	carlos diaz fernandez	equestrian	2	seoul 1988	1983
722	spain	carlos garach benito	marathon swimming	1	paris 2024	2004
723	mexico	carlos hank guerreiro	equestrian	1	paris 2024	2000
724	brazil	carlos parro	equestrian	4	sydney 2000	1979
725	mexico	carlos rojas	archery	1	paris 2024	2000
726	italy	carlotta cambi	volleyball	1	paris 2024	1996
727	spain	carmen aviles	athletics	1	paris 2024	2002
728	spain	carmen campos	handball	1	paris 2024	1995
729	colombia	carolina arias	football	2	rio 2016	1990
730	spain	carolina garcia otero	canoe sprint	1	paris 2024	1999
731	canada	caroline crossley	rugby sevens	1	paris 2024	1998
732	france	caroline drouin	rugby sevens	2	tokyo 2020	1996
733	france	caroline lopez	archery	1	paris 2024	2004
734	denmark	caroline munch	rowing	1	paris 2024	2002
735	united states of america	caroline pamukcu	equestrian	1	paris 2024	1994
736	australia	carolyn buckle	artistic swimming	2	tokyo 2020	2000
737	united states of america	carson foster	swimming	1	paris 2024	2001
738	canada	carson mattern	cycling track	1	paris 2024	2004
739	united states of america	casey kaufhold	archery	2	tokyo 2020	2004
740	united states of america	casey krueger	football	2	tokyo 2020	1990
741	united states of america	casey murphy	football	1	paris 2024	1996
742	netherlands	casimir schmidt	artistic gymnastics	1	paris 2024	1995
743	netherlands	caspar corbeau	swimming	2	tokyo 2020	2001
744	canada	cassandra lee	artistic gymnastics	1	paris 2024	2005
745	france	cassandre beaugrand	triathlon	3	rio 2016	1997
746	canada	cassandre prosper	basketball	1	paris 2024	2005
747	france	castello lukeba	football	1	paris 2024	2002
748	spain	cata coll	football	1	paris 2024	2001
749	united states of america	catalina gnoriega	archery	1	paris 2024	2003
750	colombia	catalina perez	football	3	london 2012	1994
751	colombia	catalina usme	football	3	london 2012	1989
752	italy	caterina banchelli	water polo	1	paris 2024	2000
753	italy	caterina bosetti	volleyball	3	london 2012	1994
754	netherlands	cathelijn peeters	athletics	1	paris 2024	1996
755	canada	catherine beauchemin-pinard	judo	3	rio 2016	1994
756	france	catherine clot	hockey	1	paris 2024	1997
757	zambia	catherine musonda	football	2	tokyo 2020	1998
758	switzerland	cathia schar	triathlon	1	paris 2024	2001
759	denmark	cathrine dufour	equestrian	3	rio 2016	1992
760	switzerland	catia gubelmann	athletics	1	paris 2024	2001
761	australia	cayla george	basketball	3	rio 2016	1989
762	germany	cecile pieper	hockey	3	rio 2016	1994
763	france	cecilia berder	fencing	3	rio 2016	1989
764	belgium	cedric charlier	hockey	5	beijing 2008	1987
765	netherlands	celeste plak	volleyball	2	rio 2016	1995
766	south africa	celia beatrice seerane	hockey	2	tokyo 2020	1990
767	switzerland	celia dupre	rowing	1	paris 2024	2001
768	france	celia joseph-noel	rhythmic gymnastics	1	paris 2024	2003
769	spain	cesar castro	swimming	1	paris 2024	1999
770	colombia	cesar herrera	athletics	1	paris 2024	1999
771	peru	cesar rodriguez	athletics	2	tokyo 2020	1997
772	algeria	chaima benadouda	fencing	1	paris 2024	2003
773	zambia	chanda mulenga	athletics	1	paris 2024	2002
774	people's republic of china	changhao wang	swimming	1	paris 2024	2002
775	people's republic of china	changning zhang	volleyball	3	rio 2016	1995
776	canada	charity williams	rugby sevens	3	rio 2016	1996
777	switzerland	charles devantay	athletics	1	paris 2024	1998
778	great britain	charles dobson	athletics	1	paris 2024	1999
779	great britain	charles elwes	rowing	2	tokyo 2020	1997
780	france	charles masson	hockey	1	paris 2024	1992
781	new zealand	charlie morrison	hockey	1	paris 2024	2003
782	australia	charlie negus	water polo	1	paris 2024	1999
783	united states of america	charlie swanson	swimming	1	paris 2024	1998
784	great britain	charlie tanfield	cycling track	2	tokyo 2020	1996
785	germany	charline schwarz	archery	2	tokyo 2020	2001
786	australia	charlize andrews	water polo	1	paris 2024	2001
787	france	charlotte bonnet	swimming	4	london 2012	1995
788	united states of america	charlotte buck	rowing	2	tokyo 2020	1995
789	australia	charlotte caslick	rugby sevens	3	rio 2016	1995
790	belgium	charlotte defalque	equestrian	1	paris 2024	1995
791	belgium	charlotte englebert	hockey	1	paris 2024	2001
792	great britain	charlotte fry	equestrian	2	tokyo 2020	1996
793	france	charlotte lutz	table tennis	1	paris 2024	2005
794	germany	charlotte stapenhorst	hockey	3	rio 2016	1995
795	france	charlotte tremble	artistic swimming	2	tokyo 2020	1999
796	great britain	charlotte watson	hockey	1	paris 2024	1998
797	united states of america	chase william dodd	water polo	1	paris 2024	2003
798	ireland	chay mullins	rugby sevens	1	paris 2024	2002
799	australia	chaz poot	water polo	1	paris 2024	1998
800	mali	cheickna doumbia	football	1	paris 2024	2003
801	united states of america	chelsea gray	basketball	2	tokyo 2020	1992
802	angola	chelsia gabriel	handball	1	paris 2024	2000
803	people's republic of china	chen qingyuan	fencing	2	tokyo 2020	1997
804	chinese taipei	cheng-jui kao	table tennis	1	paris 2024	2004
805	hong kong	chengzhu zhu	table tennis	2	tokyo 2020	1997
806	guinea	cherif camara	football	1	paris 2024	2002
807	hong kong	cheuk tung natalie kan	swimming	1	paris 2024	2002
808	united states of america	chiaka ogbogu	volleyball	2	tokyo 2020	1995
809	japan	chiaki saegusa	rugby sevens	1	paris 2024	1997
810	nigeria	chiamaka nnadozie	football	1	paris 2024	2000
811	italy	chiara consonni	cycling track	1	paris 2024	1999
812	italy	chiara mormile	fencing	1	paris 2024	1995
813	italy	chiara tabani	water polo	2	rio 2016	1994
814	italy	chiara tarantino	swimming	1	paris 2024	2003
815	nigeria	chidi okezie	athletics	2	tokyo 2020	1993
816	nigeria	chidinma okeke	football	1	paris 2024	2000
817	chinese taipei	chien-ying le	archery	4	london 2012	1990
818	chinese taipei	chih-chun tang	archery	2	tokyo 2020	2001
819	chinese taipei	chih-yuan chuang	table tennis	6	athens 2004	1981
820	japan	chiharu nakamura	rugby sevens	2	rio 2016	1988
821	japan	chika hirao	football	2	tokyo 2020	1996
822	singapore	ching hwee gan	swimming	2	tokyo 2020	2003
823	nigeria	chinonyerem macleans	football	1	paris 2024	1999
824	nigeria	chinwendu ihezuo	football	1	paris 2024	1997
825	canada	chloe daniels	rugby sevens	1	paris 2024	2003
826	united states of america	chloe dygert	cycling road	3	rio 2016	1997
827	france	chloe galet	athletics	1	paris 2024	2001
828	france	chloe jacquet	rugby sevens	2	tokyo 2020	2002
829	australia	chloe moran	cycling track	1	paris 2024	1998
830	france	chloe pelle	rugby sevens	2	tokyo 2020	1989
831	france	chloe valentini	handball	2	tokyo 2020	1995
832	united states of america	chris carlson	rowing	1	paris 2024	1997
833	united states of america	chris guiliano	swimming	1	paris 2024	2003
834	canada	chris von martels	equestrian	2	tokyo 2020	1982
835	kenya	chrisant ojwang	rugby sevens	1	paris 2024	1998
836	canada	christa deguchi	judo	1	paris 2024	1995
837	united states of america	christian coleman	athletics	2	rio 2016	1996
838	germany	christian fromm	volleyball	1	paris 2024	1990
839	germany	christian kukuk	equestrian	2	tokyo 2020	1990
840	norway	christian o'sullivan	handball	2	tokyo 2020	1991
841	italy	christian parlati	judo	2	tokyo 2020	1998
842	austria	christian schumach	equestrian	2	tokyo 2020	1981
843	united states of america	christian tabash	rowing	1	paris 2024	1999
844	south africa	christie grobbelaar	rugby sevens	1	paris 2024	2000
845	france	christina bauer	volleyball	1	paris 2024	1988
846	sweden	christina kaellberg	table tennis	2	tokyo 2020	2000
847	austria	christoph obernauer	equestrian	1	paris 2024	1987
848	germany	christoph steinert	handball	1	paris 2024	1990
849	germany	christoph wahler	equestrian	1	paris 2024	1994
850	united states of america	christopher bailey	athletics	1	paris 2024	2000
851	australia	christopher burton	equestrian	3	london 2012	1981
852	germany	christopher linke	athletics	4	london 2012	1988
853	ireland	christopher o'donnell	athletics	2	tokyo 2020	1998
854	puerto rico	christopher ortiz	basketball	1	paris 2024	1993
855	germany	christopher ruhr	hockey	3	rio 2016	1993
856	nigeria	christy ucheibe	football	1	paris 2024	2000
857	greece	chrysoula diamantopoulou	water polo	1	paris 2024	1995
858	people's republic of china	chuqin wang	table tennis	2	tokyo 2020	2000
859	people's republic of china	chutong ge	swimming	1	paris 2024	2003
860	ireland	cian o'connor	equestrian	4	athens 2004	1979
861	united states of america	cierra burdick	3x3 basketball	1	paris 2024	1993
862	romania	ciprian tudosa	rowing	2	tokyo 2020	1997
863	people's republic of china	ciyue wang	artistic swimming	1	paris 2024	1999
864	new zealand	cj bott	football	2	tokyo 2020	1995
865	united states of america	claire collins	rowing	2	tokyo 2020	1996
866	australia	claire colwill	hockey	1	paris 2024	2003
867	canada	claire scheffel	artistic swimming	1	paris 2024	2003
868	united states of america	claire weinstein	swimming	1	paris 2024	2007
869	france	clara copponi	cycling track	2	tokyo 2020	1999
870	denmark	clara hornnaess	rowing	1	paris 2024	2003
871	spain	clara perez	hockey	1	paris 2024	2001
872	canada	clara vulpisi	water polo	2	tokyo 2020	1998
873	australia	clare hunt	football	1	paris 2024	1999
874	australia	clare polkinghorne	football	3	rio 2016	1989
875	australia	clare wheeler	football	1	paris 2024	1998
876	france	clarisse agbegnenou	judo	3	rio 2016	1992
877	united states of america	clark dean	rowing	2	tokyo 2020	2000
878	new zealand	clarke johnstone	equestrian	2	rio 2016	1987
879	italy	claudia roberta marletta	water polo	1	paris 2024	1995
880	spain	claudio castilla ruiz	equestrian	3	rio 2016	1983
881	argentina	claudio echeverri	football	1	paris 2024	2006
882	france	clemence beretta	athletics	1	paris 2024	1997
883	france	clement dubois	water polo	1	paris 2024	1995
884	france	clement secchi	swimming	1	paris 2024	2000
885	france	cleopatre darleux	handball	3	london 2012	1989
886	canada	cloe lacasse	football	1	paris 2024	1993
887	mali	coli saco	football	1	paris 2024	2002
888	united states of america	colin heathcock	fencing	1	paris 2024	2005
889	france	coline devillard	artistic gymnastics	1	paris 2024	2000
890	people's republic of china	congkang wang	canoe sprint	2	tokyo 2020	1996
891	ireland	conor ferguson	swimming	1	paris 2024	1999
892	great britain	conor hall	archery	1	paris 2024	1995
893	australia	conor leahy	cycling track	2	tokyo 2020	1999
894	great britain	conor williamson	hockey	1	paris 2024	2001
895	france	constance picaud	football	1	paris 2024	1998
896	romania	constantin adam	rowing	3	rio 2016	1996
897	spain	constanza amundson	hockey	1	paris 2024	1998
898	france	coralie lassource	handball	2	tokyo 2020	1992
899	france	coraline vitalis	fencing	2	tokyo 2020	1995
900	france	corentin pottier	equestrian	1	paris 2024	1993
901	australia	corey toole	rugby sevens	1	paris 2024	2000
902	australia	corey weyer	hockey	1	paris 2024	1996
903	australia	cortnee vine	football	1	paris 2024	1998
904	italy	costanza cocconcelli	swimming	1	paris 2024	2002
905	canada	courtney stott	canoe sprint	1	paris 2024	1992
906	mexico	crisanto grajales	triathlon	4	london 2012	1987
907	argentina	cristian medina	football	1	paris 2024	2002
908	brazil	cristiano felicio	basketball	2	rio 2016	1992
909	spain	cristina cabana perez	judo	2	tokyo 2020	1993
910	argentina	cristina cosentino	hockey	1	paris 2024	1997
911	spain	cristina montesinos	athletics	1	paris 2024	1994
912	france	cristoforo peters-deutz	hockey	1	paris 2024	1995
913	united states of america	croix bethune	football	1	paris 2024	2001
914	united states of america	crystal dunn	football	3	rio 2016	1992
915	hungary	csanad gemesi	fencing	2	tokyo 2020	1986
916	hungary	csenge kuczora	handball	1	paris 2024	2000
917	republic of korea	daeseong cho	table tennis	1	paris 2024	2002
918	italy	dafne bettini	water polo	1	paris 2024	2003
919	japan	daichi ogihara	water polo	1	paris 2024	2003
920	japan	daiki hashimoto	artistic gymnastics	2	tokyo 2020	2001
921	cuba	daily cooper gaspar	athletics	1	paris 2024	2002
922	japan	daisuke okamoto	handball	1	paris 2024	1995
923	united states of america	daisy mazzio-manson	rowing	1	paris 2024	1998
924	mexico	dalia alcocer	rhythmic gymnastics	1	paris 2024	2004
925	italy	dalia kaddari	athletics	2	tokyo 2020	2001
926	united states of america	dana rettke	volleyball	1	paris 2024	1999
927	lithuania	danas rapsys	swimming	3	rio 2016	1995
928	new zealand	dane lett	hockey	2	tokyo 2020	1990
929	germany	dang qiu	table tennis	1	paris 2024	1996
930	hungary	daniel angyal	water polo	2	tokyo 2020	1992
931	denmark	daniel bachmann andersen	equestrian	1	paris 2024	1990
932	south africa	daniel bell	hockey	2	tokyo 2020	1994
933	great britain	daniel bigham	cycling track	1	paris 2024	1991
934	unknown	daniel bluman	equestrian	3	london 2012	1990
935	brazil	daniel cargnin	judo	2	tokyo 2020	1997
936	ireland	daniel coyle	equestrian	1	paris 2024	1994
937	spain	daniel dujshebaev	handball	1	paris 2024	1997
938	spain	daniel fernandez	handball	1	paris 2024	2001
939	canada	daniel gu	fencing	1	paris 2024	1998
940	sweden	daniel pettersson	handball	2	tokyo 2020	1992
941	paraguay	daniel rivas	football	1	paris 2024	2001
942	poland	daniel soltysiak	athletics	1	paris 2024	2001
943	germany	daniel theis	basketball	1	paris 2024	1992
944	colombia	daniela arias	football	1	paris 2024	1994
945	colombia	daniela caracas	football	1	paris 2024	1997
946	italy	daniela mogurean	rhythmic gymnastics	2	tokyo 2020	2001
947	colombia	daniela montoya	football	2	london 2012	1990
948	italy	daniele lavia	volleyball	2	tokyo 2020	1999
949	germany	daniella kromm	rhythmic gymnastics	1	paris 2024	2004
950	united states of america	daniella ramirez	artistic swimming	1	paris 2024	2001
951	ireland	danielle hill	swimming	2	tokyo 2020	1999
952	australia	danijela jackovich	water polo	1	paris 2024	1994
953	kazakhstan	daniyar shamshayev	judo	1	paris 2024	2001
954	canada	danny demyanenko	volleyball	1	paris 2024	1994
955	australia	dante exum	basketball	2	tokyo 2020	1995
956	uruguay	dante soto	rugby sevens	1	paris 2024	2003
957	ukraine	danylo danylenko	athletics	2	tokyo 2020	1994
958	ukraine	danylo sikan	football	1	paris 2024	2001
959	ireland	daragh walsh	hockey	1	paris 2024	1997
960	israel	daria golovaty	swimming	1	paris 2024	2005
961	spain	dario brizuela	basketball	1	paris 2024	1994
962	ukraine	darja varfolomyeyeva	fencing	1	paris 2024	1999
963	slovenia	darko jorgic	table tennis	2	tokyo 2020	1998
964	brazil	darlan ferreira souza	volleyball	1	paris 2024	2002
965	ireland	darragh greene	swimming	1	tokyo 2020	1995
966	azerbaijan	darya sorokina	rhythmic gymnastics	2	tokyo 2020	2002
967	great britain	daryll neita	athletics	3	rio 2016	1996
968	ukraine	daryna verkhogliad	rowing	2	rio 2016	1992
969	kazakhstan	dauletkeldi zhangbyrbay	archery	1	paris 2024	2004
970	great britain	david ambler	rowing	1	paris 2024	1997
971	great britain	david ames	hockey	3	rio 2016	1989
972	spain	david garcia	athletics	1	paris 2024	2005
973	spain	david garcia torne	judo	1	paris 2024	1997
974	great britain	david goodfield	hockey	1	paris 2024	1993
975	ireland	david harte	hockey	2	rio 2016	1988
976	hungary	david nagy	fencing	1	paris 2024	1999
977	kenya	david sanayek kapirante	athletics	1	paris 2024	2000
978	united states of america	david smith	volleyball	4	london 2012	1985
979	germany	david spaeth	handball	1	paris 2024	2002
980	italy	davide di veroli	fencing	1	paris 2024	2001
981	italy	davide verita'	rowing	1	paris 2024	2000
982	new zealand	davina waddy	rowing	1	paris 2024	1996
983	uzbekistan	davlat bobonov	judo	2	tokyo 2020	1997
984	puerto rico	davon reed	basketball	1	paris 2024	1995
985	poland	dawid kubiak	equestrian	1	paris 2024	1987
986	republic of korea	dayeong lee	artistic gymnastics	1	paris 2024	2004
987	republic of korea	dayoung kim	handball	1	paris 2024	1996
988	slovenia	dean bombac	handball	2	rio 2016	1989
989	united states of america	dearica hamby	3x3 basketball	1	paris 2024	1993
990	nigeria	deborah abiodun	football	1	paris 2024	2003
991	brazil	deborah medrado	rhythmic gymnastics	2	tokyo 2020	2002
992	australia	declan tingay	athletics	2	tokyo 2020	1999
993	india	deepika kumari	archery	4	london 2012	1994
994	serbia	dejan davidovac	basketball	1	paris 2024	1995
995	montenegro	dejan lazovic	water polo	1	paris 2024	1990
996	serbia	dejan majstorovic	3x3 basketball	2	tokyo 2020	1988
997	slovenia	dejan vincic	volleyball	1	paris 2024	1986
998	france	delfina gaspari	hockey	1	paris 2024	1998
999	france	delphine cascarino	football	1	paris 2024	1997
1000	belgium	delphine-daphne marien	hockey	1	paris 2024	2002
1001	belgium	delphine nkansa	athletics	1	paris 2024	2001
1002	mali	demba diallo	football	1	paris 2024	2000
1003	hungary	denes varga	water polo	5	beijing 2008	1987
1004	slovenia	deni kozul	table tennis	2	tokyo 2020	1997
1005	kenya	denis abukuse	rugby sevens	1	paris 2024	1999
1006	israel	denis loktev	swimming	2	tokyo 2020	2000
1007	germany	deniz almas	athletics	2	tokyo 2020	1997
1008	germany	dennis schröder	basketball	1	paris 2024	1993
1009	netherlands	derck de vilder	hockey	1	paris 2024	1998
1010	united states of america	derrick white	basketball	1	paris 2024	1994
1011	türkiye	derya cebecioglu	volleyball	1	paris 2024	2000
1012	france	desire doue	football	1	paris 2024	2005
1013	united states of america	devin booker	basketball	2	tokyo 2020	1996
1014	india	dhiraj bommadevara	archery	1	paris 2024	2001
1015	ukraine	diana baieva	rhythmic gymnastics	1	paris 2024	2004
1016	zambia	diana banda	football	1	paris 2024	2002
1017	brazil	diana duarte alecrim	volleyball	1	paris 2024	1999
1018	israel	diana svertsov	rhythmic gymnastics	1	paris 2024	2004
1019	united states of america	diana taurasi	basketball	6	athens 2004	1982
1020	indonesia	diananda choirunisa	archery	2	tokyo 2020	1997
1021	brazil	didi louzada	basketball	1	paris 2024	1999
1022	uruguay	diego ardao	rugby sevens	1	paris 2024	1995
1023	argentina	diego esteban simonet	handball	3	london 2012	1989
1024	paraguay	diego gomez	football	1	paris 2024	2003
1025	spain	diego lopez	football	1	paris 2024	2002
1026	australia	dietrich peter roache	rugby sevens	2	tokyo 2020	2001
1027	netherlands	dieuwke fetter	rowing	1	paris 2024	1991
1028	france	dika mem	handball	2	tokyo 2020	1997
1029	canada	dillon brooks	basketball	1	paris 2024	1996
1030	netherlands	dimeo van der horst	3x3 basketball	2	tokyo 2020	1991
1031	germany	dimitrij ovtcharov	table tennis	5	beijing 2008	1988
1032	greece	dimitrios markos	swimming	2	tokyo 2020	2001
1033	greece	dimitrios nikolaidis	water polo	1	paris 2024	1999
1034	greece	dimitrios skoumpakis	water polo	2	tokyo 2020	1998
1035	greece	dimitris moraitis	basketball	1	paris 2024	1999
1036	great britain	dina asher-smith	athletics	3	rio 2016	1995
1037	egypt	dina meshref	table tennis	4	london 2012	1994
1038	azerbaijan	dina ulyanova	3x3 basketball	1	paris 2024	1989
1039	netherlands	dinja van liere	equestrian	2	tokyo 2020	1990
1040	netherlands	dione housheer	handball	2	tokyo 2020	1999
1041	south africa	dirkie chamberlain	hockey	2	london 2012	1986
1042	uzbekistan	diyor kholmatov	football	1	paris 2024	2002
1043	uzbekistan	diyora keldiyorova	judo	2	tokyo 2020	1998
1044	brazil	djenyfer arnold	triathlon	1	paris 2024	1993
1045	united states of america	djordje mihailovic	football	1	paris 2024	1998
1046	ukraine	dmytro danylenko	canoe sprint	1	paris 2024	1999
1047	ukraine	dmytro kryskiv	football	1	paris 2024	2000
1048	republic of korea	dohyun eom	artistic gymnastics	1	paris 2024	2003
1049	angola	dolores rosario	handball	1	paris 2024	2003
1050	croatia	domagoj duvnjak	handball	4	beijing 2008	1988
1051	slovenia	domen novak	handball	1	paris 2024	1998
1052	belgium	domien michiels	equestrian	2	tokyo 2020	1983
1053	new zealand	dominic dixon	hockey	1	paris 2024	1996
1054	switzerland	dominic-remo condrau	rowing	1	paris 2024	1999
1055	slovakia	dominik cerny	athletics	1	paris 2024	1997
1056	poland	dominik czaja	rowing	2	tokyo 2020	1995
1057	poland	dominik dudys	swimming	1	paris 2024	2002
1058	croatia	dominik kuzmanovic	handball	1	paris 2024	2002
1059	poland	dominika putto	canoe sprint	1	paris 2024	1995
1060	poland	dominika sztandera	swimming	1	paris 2024	1997
1061	australia	dominique du toit	rugby sevens	2	tokyo 2020	1997
1062	france	dominique malonga	basketball	1	paris 2024	2005
1063	italy	domitilla picozzi	water polo	1	paris 2024	1998
1064	people's republic of china	dong zhang	canoe sprint	2	tokyo 2020	1996
1065	republic of korea	dongyeol choi	swimming	1	paris 2024	1999
1066	people's republic of china	dongyin li	canoe sprint	2	tokyo 2020	1995
1067	israel	dor turgeman	football	1	paris 2024	2003
1068	hungary	dora leimeter	water polo	2	tokyo 2020	1996
1069	hungary	dorottya szilagyi	water polo	2	tokyo 2020	1996
1070	uzbekistan	doston ruziev	judo	1	paris 2024	1996
1071	brazil	douglas hernandes mendes	athletics	1	paris 2024	2001
1072	serbia	dragana stankovic	basketball	3	rio 2016	1995
1073	serbia	drazen luburic	volleyball	1	paris 2024	1993
1074	united states of america	drew holland	water polo	2	tokyo 2020	1995
1075	united states of america	drew kibler	swimming	1	tokyo 2020	2000
1076	portugal	duarte seabra	equestrian	1	paris 2024	1985
1077	nigeria	dubem amene	athletics	1	paris 2024	2002
1078	netherlands	duco telgenkamp	hockey	1	paris 2024	2002
1079	brazil	duda sampaio	football	1	paris 2024	2001
1080	united states of america	duncan mcguire	football	1	paris 2024	2001
1081	great britain	duncan scott	swimming	3	rio 2016	1997
1082	people's republic of china	dunhan xiong	water polo	3	rio 2016	1998
1083	serbia	dunja stanojev	canoe sprint	1	paris 2024	2004
1084	australia	duop thomas reath	basketball	2	tokyo 2020	1996
1085	montenegro	duro radovic	water polo	1	paris 2024	1999
1086	serbia	dusan mandic	water polo	4	london 2012	1994
1087	montenegro	dusan matkovic	water polo	2	tokyo 2020	1999
1088	canada	dwight powell	basketball	1	paris 2024	1991
1089	canada	dylan bibic	cycling track	1	paris 2024	2003
1090	belgium	dylan borlee	athletics	3	rio 2016	1992
1091	new zealand	dylan collier	rugby sevens	2	tokyo 2020	1991
1092	new zealand	dylan mccullough	triathlon	1	paris 2024	2001
1093	france	dylan nahi	handball	1	paris 2024	1999
1094	united states of america	dylan travis	3x3 basketball	1	paris 2024	1993
1095	united states of america	dylan woodhead	water polo	2	tokyo 2020	1998
1096	australia	dyson daniels	basketball	1	paris 2024	2003
1097	ukraine	dzhoan feybi bezhura	fencing	1	paris 2024	1991
1098	france	earvin ngapeth	volleyball	3	rio 2016	1991
1099	australia	ebony lane	athletics	1	paris 2024	1998
1100	türkiye	ebrar karakurt	volleyball	2	tokyo 2020	2000
1101	türkiye	ecem donmez	swimming	1	paris 2024	1998
1102	great britain	ed owen lowe	cycling track	1	paris 2024	2003
1103	türkiye	eda erdem dundar	volleyball	3	london 2012	1987
1104	australia	eddie ockenden	hockey	5	beijing 2008	1987
1105	dominican republic	edgar pujol	football	1	paris 2024	2004
1106	dominican republic	edison azcona	football	1	paris 2024	2003
1107	south africa	edith molikoe	hockey	2	tokyo 2020	2000
1108	kenya	edith mukuvilani	volleyball	2	tokyo 2020	1994
1109	italy	edoardo di somma	water polo	1	paris 2024	1996
1110	italy	edoardo scotti	athletics	2	tokyo 2020	2000
1111	switzerland	edouard schmitz	equestrian	1	paris 2024	1999
1112	spain	eduard de ignacio-simo	hockey	1	paris 2024	2000
1113	germany	eduard trippel	judo	2	tokyo 2020	1997
1114	spain	eduardo alvarez aznar	equestrian	3	rio 2016	1984
1115	spain	eduardo lorrio	water polo	1	paris 2024	1993
1116	brazil	eduardo oliveira de moraes	swimming	1	paris 2024	2001
1117	netherlands	edward gal	equestrian	4	london 2012	1970
1118	canada	edward ly	table tennis	1	paris 2024	2003
1119	australia	edwina tops-alexander	equestrian	5	beijing 2008	1974
1120	greece	efstathios kalogeropoulos	water polo	1	paris 2024	2001
1121	hungary	egon hanusz	handball	1	paris 2024	1997
1122	japan	eika nakamura	hockey	1	paris 2024	1996
1123	japan	eiken sato	equestrian	3	beijing 2008	1986
1124	germany	eileen demes	athletics	1	paris 2024	1997
1125	ireland	eimear lambe	rowing	2	tokyo 2020	1997
1126	greece	eirini ninou	water polo	1	paris 2024	2002
1127	japan	eiya hashimoto	cycling track	2	tokyo 2020	1993
1128	italy	ekaterina antropova	volleyball	1	paris 2024	2003
1129	türkiye	ela naz ozdemir	swimming	1	paris 2024	2006
1130	israel	elad madmon	football	1	paris 2024	2004
1131	uzbekistan	eldor shomurodov	football	1	paris 2024	1995
1132	canada	eleanor harvey	fencing	3	rio 2016	1995
1133	greece	eleftheria plevritou	water polo	1	paris 2024	1997
1134	spain	elena ruiz	water polo	2	tokyo 2020	2004
1135	greece	eleni xenaki	water polo	1	paris 2024	1997
1136	netherlands	eli brouwer	rowing	1	paris 2024	2000
1137	united states of america	eli dershwitz	fencing	3	rio 2016	1995
1138	angola	eliane paulo	handball	1	paris 2024	1999
1139	sweden	elias persson	swimming	1	paris 2024	2002
1140	morocco	eliesse ben seghir	football	1	paris 2024	2005
1141	türkiye	elif sahin	volleyball	1	paris 2024	2001
1142	trinidad and tobago	elijah joseph	athletics	1	paris 2024	2001
1143	australia	elijah winnington	swimming	2	tokyo 2020	2000
1144	sweden	elin hansson	handball	2	tokyo 2020	1996
1145	netherlands	eline timmerman	volleyball	1	paris 2024	1998
1146	great britain	elinor barker	cycling road	3	rio 2016	1994
1147	france	eliot curty	hockey	1	paris 2024	1998
1148	italy	elisa balsamo	cycling road	2	tokyo 2020	1998
1149	france	elisa de almeida	football	1	paris 2024	1998
1150	italy	elisa iorio	artistic gymnastics	1	paris 2024	2003
1151	germany	elisa mevius	3x3 basketball	1	paris 2024	2004
1152	italy	elisa mondelli	rowing	1	paris 2024	1998
1153	germany	elisa senss	football	1	paris 2024	1997
1154	finland	elisabet ehrnrooth	equestrian	2	sydney 2000	1967
1155	denmark	elisabeth ebbesen	swimming	1	paris 2024	2002
1156	united states of america	elisabeth halliday	equestrian	1	paris 2024	1978
1157	norway	elisabeth slettum	athletics	1	paris 2024	1986
1158	belgium	elise mehuys	athletics	1	paris 2024	1995
1159	belgium	elise ramette	basketball	1	paris 2024	1998
1160	czechia	eliska martinkova	athletics	1	paris 2024	2002
1161	romania	elizabeta samara	table tennis	5	beijing 2008	1989
1162	nigeria	elizabeth balogun	basketball	2	tokyo 2020	2000
1163	slovenia	elizabeth omoregie	handball	1	paris 2024	1996
1164	united states of america	elizabeth tartakovsky	fencing	1	paris 2024	2000
1165	united states of america	elizabeth yeager	hockey	1	paris 2024	2003
1166	australia	ella beere	canoe sprint	1	paris 2024	1998
1167	australia	ella connolly	athletics	1	paris 2024	2000
1168	canada	ella jansen	swimming	1	paris 2024	2005
1169	nigeria	ella onojuvwevwo	athletics	1	paris 2024	2005
1170	australia	ella ramsay	swimming	1	paris 2024	2004
1171	australia	elle armit	water polo	2	tokyo 2020	1991
1172	ireland	ellen walshe	swimming	2	tokyo 2020	2001
1173	netherlands	elles dambrink	volleyball	1	paris 2024	2003
1174	new zealand	ellesse andrews	cycling track	2	tokyo 2020	1999
1175	great britain	ellie boatman	rugby sevens	1	paris 2024	1997
1176	australia	ellie carpenter	football	3	rio 2016	2000
1177	great britain	ellie kildunne	rugby sevens	1	paris 2024	1999
1178	kazakhstan	elmir alimzhanov	fencing	2	london 2012	1986
1179	belgium	elodie picard	hockey	1	paris 2024	1997
1180	france	elohim prandi	handball	1	paris 2024	1998
1181	canada	elsabeth black	artistic gymnastics	4	london 2012	1995
1182	netherlands	elvis afrifa	athletics	1	paris 2024	1997
1183	canada	elyse lemay-lavoie	water polo	2	tokyo 2020	1994
1184	slovenia	ema abina	handball	1	paris 2024	1999
1185	slovenia	ema hrvatin	handball	1	paris 2024	2000
1186	france	ema vernoux	water polo	1	paris 2024	2004
1187	romania	emanuela ioana ciotau	rowing	1	paris 2024	2002
1188	italy	emanuele camilli	equestrian	1	paris 2024	1982
1189	italy	emanuele capponi	rowing	1	paris 2024	2001
1190	italy	emanuele gaetani liseo	rowing	1	paris 2024	1996
1191	japan	emii tanaka	rugby sevens	1	paris 2024	1999
1192	germany	emil agyekum	athletics	1	paris 2024	1999
1193	france	emil bjorch	water polo	1	paris 2024	1987
1194	denmark	emil jakobsen	handball	2	tokyo 2020	1998
1195	denmark	emil nielsen	handball	1	paris 2024	1997
1196	germany	emilia wickert	rhythmic gymnastics	1	paris 2024	2007
1197	italy	emiliano portale	equestrian	1	paris 2024	1984
1198	france	emilie respaut	volleyball	1	paris 2024	2003
1199	germany	emily bessoir	basketball	1	paris 2024	2001
1200	germany	emily boelk	handball	1	paris 2024	1998
1201	united states of america	emily delleman	rowing	1	paris 2024	1998
1202	great britain	emily ford	rowing	2	tokyo 2020	1994
1203	united states of america	emily fox	football	1	paris 2024	1998
1204	ireland	emily hegarty	rowing	2	tokyo 2020	1998
1205	united states of america	emily kallfelz	rowing	1	paris 2024	0
1206	ireland	emily lane	rugby sevens	1	paris 2024	1999
1207	united states of america	emily mary ausmus	water polo	1	paris 2024	2005
1208	new zealand	emily shearman	cycling track	1	paris 2024	1999
1209	united states of america	emily sonnett	football	2	tokyo 2020	1993
1210	australia	emily van egmond	football	3	rio 2016	1993
1211	belgium	emily white	hockey	1	paris 2024	2004
1212	australia	emily whitehead	artistic gymnastics	2	tokyo 2020	2000
1213	germany	emma davidsmeyer	hockey	1	paris 2024	1999
1214	united states of america	emma deberdine	hockey	1	paris 2024	2001
1215	great britain	emma finucane	cycling track	1	paris 2024	2002
1216	denmark	emma friis	handball	1	paris 2024	1999
1217	germany	emma hinze	cycling track	2	tokyo 2020	1997
1218	finland	emma kanerva	equestrian	2	london 2012	1985
1219	france	emma lombardi	athletics	1	paris 2024	2001
1220	australia	emma mckeon	swimming	3	rio 2016	1994
1221	belgium	emma meesseman	basketball	2	tokyo 2020	1993
1222	australia	emma nedov	artistic gymnastics	1	paris 2024	1996
1223	france	emma ponthieu	hockey	1	paris 2024	1996
1224	belgium	emma puvrez	hockey	1	paris 2024	1997
1225	france	emma terebo	swimming	1	paris 2024	1998
1226	great britain	emma uren	rugby sevens	2	tokyo 2020	1997
1227	italy	emma virginia menicucci	swimming	1	paris 2024	2002
1228	united states of america	emma weber	swimming	1	paris 2024	2004
1229	canada	emma wright	water polo	2	tokyo 2020	1996
1230	kenya	emmaculate nekesa misoki	volleyball	1	paris 2024	2003
1231	australia	emmanouela frroku	rhythmic gymnastics	1	paris 2024	2007
1232	greece	emmanouil zerdevas	water polo	2	tokyo 2020	1997
1233	liberia	emmanuel matadi	athletics	3	rio 2016	1991
1234	netherlands	emmelie scholtens	equestrian	1	paris 2024	1985
1235	türkiye	emre dodanli	artistic gymnastics	1	paris 2024	2002
1236	singapore	en yi letitia sim	swimming	1	paris 2024	2003
1237	united states of america	endel ots	equestrian	1	paris 2024	1985
1238	mongolia	enkhriilen lkhagvatogoo	judo	1	paris 2024	1998
1239	people's republic of china	enqi jiao	fencing	1	paris 2024	2006
1240	italy	enrica piccoli	artistic swimming	2	tokyo 2020	1999
1241	dominican republic	enrique boesl	football	1	paris 2024	2004
1242	paraguay	enso gonzalez	football	1	paris 2024	2005
1243	france	enzo khasz	water polo	2	rio 2016	1993
1244	france	enzo lefort	fencing	4	london 2012	1991
1245	france	enzo millot	football	1	paris 2024	2002
1246	france	enzo nardon	water polo	1	paris 2024	2003
1247	mongolia	erdenebayar batzaya	judo	1	paris 2024	2000
1248	spain	eric garcia	football	2	tokyo 2020	2001
1249	canada	eric loeppky	volleyball	1	paris 2024	1998
1250	unknown	erick joel sanchez guzman	athletics	4	seoul 1988	1997
1251	germany	erik abramov	judo	1	paris 2024	1999
1252	norway	erik andre solbakken	rowing	2	tokyo 2020	1994
1253	brazil	erik cardoso	athletics	1	paris 2024	2000
1254	hungary	erik molnar	water polo	1	paris 2024	2003
1255	sweden	erik persson	swimming	3	rio 2016	1994
1256	united states of america	erik shoji	volleyball	3	rio 2016	1989
1257	new zealand	erika fairweather	swimming	2	tokyo 2020	2003
1258	canada	erin attwell	cycling track	1	paris 2024	1999
1259	south africa	erin christie	hockey	1	paris 2024	1992
1260	united states of america	erin gemmell	swimming	1	paris 2024	2004
1261	ireland	erin king	rugby sevens	1	paris 2024	2003
1262	ireland	erin riordan	swimming	1	paris 2024	1999
1263	canada	erynn ballard	equestrian	1	paris 2024	1980
1264	great britain	esme booth	rowing	1	paris 2024	1998
1265	kazakhstan	esmigul kuyulova	judo	1	paris 2024	2002
1266	netherlands	estavana polman	handball	2	rio 2016	1992
1267	spain	esteban benitez valle	equestrian	1	paris 2024	1991
1268	spain	estefania fernandez	canoe sprint	1	paris 2024	1996
1269	france	estelle cascarino	football	1	paris 2024	1997
1270	france	estelle nze-minko	handball	3	rio 2016	1991
1271	kenya	esther kemene mutinda	volleyball	1	paris 2024	1999
1272	zambia	esther muchinga	football	1	paris 2024	2000
1273	spain	esther navero	athletics	1	paris 2024	2000
1274	nigeria	esther okoronkwo	football	1	paris 2024	1997
1275	zambia	esther siamfuko	football	2	tokyo 2020	2004
1276	georgia	eter askilashvili	judo	1	paris 2024	2003
1277	georgia	eteri liparteliani	judo	2	tokyo 2020	1999
1278	great britain	ethan hayter	cycling road	2	tokyo 2020	1998
1279	great britain	ethan vernon	cycling track	2	tokyo 2020	2000
1280	israel	ethane azoulay	football	1	paris 2024	2002
1281	france	etienne tynevez	hockey	1	paris 2024	1999
1282	netherlands	eugene omalla	athletics	1	paris 2024	2000
1283	argentina	eugenia trinchinetti	hockey	2	tokyo 2020	1997
1284	france	eugenie le sommer	football	3	london 2012	1989
1285	mexico	eugenio garza perez	equestrian	2	tokyo 2020	1996
1286	republic of korea	eun hee ryu	handball	2	tokyo 2020	1990
1287	republic of korea	eunhye jeon	fencing	1	paris 2024	1997
1288	republic of korea	eunhye kang	handball	2	tokyo 2020	1996
1289	republic of korea	eunhye lee	table tennis	1	paris 2024	1995
1290	republic of korea	eunji lee	swimming	2	tokyo 2020	2006
1291	republic of korea	eunjoo shin	handball	1	paris 2024	1993
1292	republic of korea	eunseo kang	handball	1	paris 2024	1999
1293	france	eva lacheray	fencing	1	paris 2024	2000
1294	spain	eva navarro	football	1	paris 2024	2001
1295	great britain	eva okaro	swimming	1	paris 2024	2006
1296	spain	eva santidrian	athletics	1	paris 2024	2000
1297	lithuania	evaldas dziaugys	3x3 basketball	1	paris 2024	1996
1298	canada	evan dunfee	athletics	3	rio 2016	1990
1299	france	evan fournier	basketball	2	tokyo 2020	1992
1300	south africa	evan jones	hockey	1	paris 2024	1989
1301	united states of america	evan olson	rowing	1	paris 2024	1997
1302	greece	evangelos efraim ntoumas	swimming	1	paris 2024	2008
1303	ireland	eve higgins	rugby sevens	1	paris 2024	1999
1304	france	eve perisset	football	1	paris 2024	1994
1305	france	eve planeix	artistic swimming	1	paris 2024	2000
1306	great britain	eve stewart	rowing	1	paris 2024	1998
1307	new zealand	eve thomas	swimming	2	tokyo 2020	2001
1308	france	eve verzura	hockey	1	paris 2024	2002
1309	uzbekistan	evelina atalyants	rhythmic gymnastics	1	paris 2024	2007
1310	italy	evelina bertoli	equestrian	1	paris 2024	1986
1311	sweden	evelina eriksson	handball	1	paris 2024	1996
1312	japan	evelyn mawuli	basketball	2	tokyo 2020	1995
1313	canada	evelyne viens	football	2	tokyo 2020	1997
1314	mexico	ever palma	athletics	3	london 2012	1992
1315	poland	ewa swoboda	athletics	3	rio 2016	1997
1316	nigeria	ezekiel nathaniel	athletics	1	paris 2024	2003
1317	argentina	ezequiel fernandez	football	1	paris 2024	2002
1318	australia	ezi magbegor	basketball	2	tokyo 2020	1999
1319	nigeria	ezinne kalu	basketball	2	tokyo 2020	1992
1320	samoa	faafoi falaniko	rugby sevens	1	paris 2024	2002
1321	paraguay	fabian balbuena	football	1	paris 2024	1991
1322	poland	fabian baranski	rowing	2	tokyo 2020	1999
1323	germany	fabian dammermann	athletics	1	paris 2024	1997
1324	dominican republic	fabian messina	football	1	paris 2024	2002
1325	switzerland	fabienne schweizer	rowing	1	paris 2024	1997
1326	italy	fabio balaso	volleyball	1	paris 2024	1995
1327	belgium	fabio van den bossche	cycling track	1	paris 2024	2000
1328	france	fabrisio saidy	athletics	1	paris 2024	1999
1329	argentina	facundo conte	volleyball	4	london 2012	1989
1330	australia	faith nathan	rugby sevens	2	tokyo 2020	2000
1331	canada	fancy bermudez	rugby sevens	1	paris 2024	2002
1332	canada	fares arfa	fencing	1	paris 2024	1994
1333	egypt	farida abdelbary	artistic swimming	1	paris 2024	2006
1334	egypt	farida hussein	rhythmic gymnastics	1	paris 2024	2006
1335	islamic republic of iran	farzad baher arasbaran	fencing	1	paris 2024	1993
1336	italy	fatoumata kabo	athletics	1	paris 2024	2001
1337	nigeria	favour ofili	athletics	2	tokyo 2020	2002
1338	nigeria	favour oghene tejiri ashe	athletics	1	paris 2024	2002
1339	argentina	federico gaston fernandez	handball	4	london 2012	1989
1340	argentina	federico monja	hockey	1	paris 2024	1993
1341	italy	federico musolesi	archery	1	paris 2024	1998
1342	argentina	federico pizarro	handball	4	london 2012	1986
1343	italy	federico vismara	fencing	1	paris 2024	1997
1344	new zealand	fehi fineanganofo	rugby sevens	1	paris 2024	2002
1345	people's republic of china	feifei yang	rugby sevens	2	tokyo 2020	1997
1346	netherlands	felice albers	hockey	2	tokyo 2020	1999
1347	germany	felicia wiedermann	hockey	1	paris 2024	2002
1348	uruguay	felipe arcos perez	rugby sevens	1	paris 2024	2000
1349	brazil	felipe bardi	athletics	2	tokyo 2020	1998
1350	unknown	felipe perrone rocha	water polo	5	beijing 2008	1986
1351	sweden	felix claar	handball	2	tokyo 2020	1997
1352	belgium	felix denayer	hockey	5	beijing 2008	1990
1353	canada	felix dolci	artistic gymnastics	1	paris 2024	2002
1354	france	felix lebrun	table tennis	1	paris 2024	2006
1355	sweden	felix moeller	handball	1	paris 2024	2002
1356	switzerland	felix vogg	equestrian	3	rio 2016	1990
1357	netherlands	femke bol	athletics	2	tokyo 2020	2000
1358	australia	fergus hamilton	rowing	1	paris 2024	2000
1359	türkiye	ferhat arican	artistic gymnastics	3	rio 2016	1993
1360	spain	fermin lopez	football	1	paris 2024	2003
1361	brazil	fernando gil kreling	volleyball	2	tokyo 2020	1996
1362	paraguay	fernando roman	football	1	paris 2024	2001
1363	brazil	fernando scheffer	swimming	1	tokyo 2020	1998
1364	spain	ferran julia tous	swimming	1	paris 2024	2000
1365	türkiye	fidan ogel	judo	1	paris 2024	2002
1366	united states of america	filip dolegiewicz	fencing	1	paris 2024	2000
1367	poland	filip matczak	3x3 basketball	1	paris 2024	1993
1368	serbia	filip petrusev	basketball	1	paris 2024	2000
1369	croatia	filip zeljko	table tennis	2	tokyo 2020	1996
1370	fiji	filipe sauturaga	rugby sevens	1	paris 2024	1994
1371	sweden	filippa bergand	table tennis	1	paris 2024	1999
1372	italy	filippo ganna	cycling road	3	rio 2016	1996
1373	italy	filippo macchi	fencing	1	paris 2024	2001
1374	italy	filippo megli	swimming	2	tokyo 2020	1997
1375	italy	filippo tortu	athletics	2	tokyo 2020	1998
1376	new zealand	fin conchie	football	1	paris 2024	2003
1377	canada	finlay knox	swimming	2	tokyo 2020	2001
1378	netherlands	finn florijn	rowing	2	tokyo 2020	1999
1379	australia	finn luu	table tennis	1	paris 2024	2004
1380	new zealand	finn surman	football	1	paris 2024	2003
1381	great britain	fiona anne crackles	hockey	2	tokyo 2020	2000
1382	brazil	flavia saraiva	artistic gymnastics	3	rio 2016	1999
1383	brazil	flavio resende gualberto	volleyball	1	paris 2024	1993
1384	great britain	flora peel	hockey	1	paris 2024	1996
1385	belgium	flore de winne	equestrian	1	paris 2024	1995
1386	canada	florence symonds	rugby sevens	1	paris 2024	2002
1387	canada	florence tremblay	artistic swimming	1	paris 2024	2004
1388	belgium	florent mabille	athletics	1	paris 2024	1996
1389	france	florent manaudou	swimming	4	london 2012	1990
1390	belgium	florent van aubel	hockey	4	london 2012	1991
1391	austria	florian bacher	equestrian	2	tokyo 2020	1985
1392	france	florian grengbo	cycling track	2	tokyo 2020	2000
1393	switzerland	florian langenegger	artistic gymnastics	1	paris 2024	2003
1394	netherlands	florien reesink	volleyball	1	paris 2024	1998
1395	romania	florin arteni	rowing	2	tokyo 2020	2001
1396	romania	florin bogdan horodisteanu	rowing	1	paris 2024	1999
1397	romania	florin lehaci	rowing	2	tokyo 2020	1999
1398	netherlands	floris middendorp	hockey	1	paris 2024	2001
1399	netherlands	floris wortelboer	hockey	1	paris 2024	1996
1400	australia	flynn ogilvie	hockey	2	tokyo 2020	1993
1401	australia	flynn southam	swimming	1	paris 2024	2005
1402	mali	fode doucoure	football	1	paris 2024	2001
1403	italy	francesca palumbo	fencing	1	paris 2024	1994
1404	italy	francesca zunino	artistic swimming	1	paris 2024	2000
1405	italy	francesco condemi	water polo	1	paris 2024	2003
1406	italy	francesco di fulvio	water polo	3	rio 2016	1993
1407	romania	francesco iudean	water polo	1	paris 2024	2001
1408	italy	francesco lamon	cycling track	3	rio 2016	1994
1409	latvia	francis lacis	3x3 basketball	1	paris 2024	1999
1410	venezuela	francisco limardo	fencing	3	beijing 2008	1987
1411	unknown	francisco reyes	football	2	london 2012	1990
1412	france	franck seguela	3x3 basketball	1	paris 2024	1997
1413	canada	francois cauchon	fencing	1	paris 2024	2000
1414	canada	francois gauthier drapeau	judo	1	paris 2024	1998
1415	france	francois goyet	hockey	1	paris 2024	1994
1416	netherlands	frank de wit	judo	3	rio 2016	1996
1417	france	frank ntilikina	basketball	2	tokyo 2020	1998
1418	unknown	unknown	artistic gymnastics	1	rio 2016	1996
1419	germany	franz wagner	basketball	1	paris 2024	2001
1420	germany	franziska brausse	cycling track	2	tokyo 2020	1998
1421	united states of america	fred kerley	athletics	2	tokyo 2020	1995
1422	great britain	freddie davidson	rowing	1	paris 2024	1998
1423	germany	frederic wandres	equestrian	1	paris 2024	1987
1424	united states of america	frederick richard	artistic gymnastics	1	paris 2024	2004
1425	germany	frederik breuer	rowing	1	paris 2024	2002
1426	netherlands	frederique matla	hockey	2	tokyo 2020	1996
1427	netherlands	freeke moes	hockey	2	tokyo 2020	1998
1428	great britain	freya anderson	swimming	1	tokyo 2020	2001
1429	great britain	freya constance colbert	swimming	1	paris 2024	2004
1430	sweden	frida andersen	equestrian	2	rio 2016	1990
1431	denmark	frida sanggaard nielsen	rowing	2	tokyo 2020	1998
1432	denmark	frida werner foldager	rowing	1	paris 2024	2005
1433	germany	frieda buhner	basketball	1	paris 2024	2004
1434	japan	fuga sato	athletics	1	paris 2024	1996
1435	japan	fuka nagano	football	1	paris 2024	1999
1436	japan	fumiya saito	archery	1	paris 2024	2004
1437	canada	fynnian lionel mccarthy	volleyball	1	paris 2024	1999
1438	france	gabby williams	basketball	2	tokyo 2020	1996
1439	brazil	gabi nunes	football	1	paris 2024	1997
1440	brazil	gabi portilho	football	1	paris 2024	1995
1441	new zealand	gabi rennie	football	1	tokyo 2020	2001
1442	hungary	gabor ancsin	handball	1	paris 2024	1990
1443	norway	gabriel ask setterblom	handball	1	paris 2024	1997
1444	brazil	gabriel dos santos	athletics	1	paris 2024	1997
1445	brazil	gabriel santos	swimming	2	rio 2016	1996
1446	united states of america	gabriel slonina	football	1	paris 2024	2004
1447	unknown	gabriela bayardo	archery	3	rio 2016	1994
1448	brazil	gabriela bitolo	handball	2	tokyo 2020	1999
1449	brazil	gabriela braga guimaraes	volleyball	3	rio 2016	1994
1450	brazil	gabriela lima	rugby sevens	1	paris 2024	1994
1451	brazil	gabriela moreschi	handball	1	paris 2024	1994
1452	italy	gabriele cimini	fencing	2	tokyo 2020	1994
1453	australia	gabriella palm	water polo	2	tokyo 2020	1998
1454	canada	gabrielle carle	football	2	tokyo 2020	1998
1455	brazil	gabrielle roncatto	swimming	3	rio 2016	1998
1456	united states of america	gabrielle thomas	athletics	2	tokyo 2020	1996
1457	france	gabrielle verrier	hockey	1	paris 2024	1997
1458	italy	gaia giovannini	volleyball	1	paris 2024	2001
1459	dominican republic	gaila ceneida gonzalez lopez	volleyball	2	tokyo 2020	1997
1460	israel	gal cohen groumi	swimming	2	tokyo 2020	2002
1461	south africa	gardeo isaacs	athletics	1	paris 2024	1998
1462	great britain	gareth furlong	hockey	1	paris 2024	1992
1463	united states of america	garrett muagututia	volleyball	2	tokyo 2020	1988
1464	france	gaspard baumgarten	hockey	1	paris 2024	1992
1465	france	gaspard xavier	hockey	1	paris 2024	2002
1466	argentina	gaston alberto mourino	handball	2	tokyo 2020	1994
1467	argentina	gaston revol	rugby sevens	3	rio 2016	1986
1468	paraguay	gatito fernandez	football	1	paris 2024	1988
1469	belgium	gauthier boccard	hockey	4	london 2012	1991
1470	ireland	gavin mullin	rugby sevens	2	tokyo 2020	1997
1471	israel	gefen primo	judo	1	paris 2024	2000
1472	france	gemima joseph	athletics	2	tokyo 2020	2001
1473	australia	genevieve longman	water polo	1	paris 2024	1995
1474	italy	gennaro alberto di mauro	rowing	2	tokyo 2020	2001
1475	italy	gennaro pirelli	judo	1	paris 2024	2000
1476	puerto rico	george conditt	basketball	1	paris 2024	2000
1477	kenya	george ooro angeyo	rugby sevens	1	paris 2024	2000
1478	australia	georgia baker	cycling track	3	rio 2016	1994
1479	australia	georgia courage-gardiner	artistic swimming	1	paris 2024	2003
1480	great britain	georgia-mae fenton	artistic gymnastics	1	paris 2024	2000
1481	great britain	georgia taylor-brown	triathlon	2	tokyo 2020	1994
1482	great britain	georgina brayshaw	rowing	1	paris 2024	1993
1483	australia	georgina rowe	rowing	2	tokyo 2020	1992
1484	brazil	georginho de paula	basketball	1	paris 2024	1996
1485	greece	georgios papagiannis	basketball	1	paris 2024	1997
1486	ukraine	georgiy yermakov	football	1	paris 2024	2002
1487	dominican republic	geraldine gonzalez	volleyball	1	paris 2024	0
1488	hungary	geraldine mahieu	water polo	1	paris 2024	1993
1489	spain	gerard clapes	hockey	1	paris 2024	2000
1490	united states of america	gerek meinhardt	fencing	5	beijing 2008	1990
1491	austria	gerfried puck	equestrian	1	paris 2024	1973
1492	hungary	gergely siklosi	fencing	2	tokyo 2020	1997
1493	hungary	gergo fazekas	handball	1	paris 2024	2003
1494	hungary	gergo janos fekete	water polo	1	paris 2024	2000
1495	hungary	gergo zalanki	water polo	3	rio 2016	1995
1496	argentina	german schulz	rugby sevens	3	rio 2016	1994
1497	argentina	geronimo rulli	football	2	rio 2016	1992
1498	netherlands	gert-jan van doorn	rowing	1	paris 2024	1999
1499	italy	giacomo carini	swimming	2	tokyo 2020	1997
1500	italy	giacomo gentili	rowing	2	tokyo 2020	1997
1501	puerto rico	gian clavell	basketball	1	paris 2024	1993
1502	italy	giancarla trevisan	athletics	2	tokyo 2020	1993
1503	united states of america	gianluca busio	football	1	paris 2024	2002
1504	italy	gianluca galassi	volleyball	2	tokyo 2020	1997
1505	italy	gianluca pozzatti	triathlon	2	tokyo 2020	1993
1506	italy	gianmarco nicosia	water polo	2	tokyo 2020	1998
1507	greece	giannis antetokounmpo	basketball	1	paris 2024	1994
1508	greece	giannoulis larentzakis	basketball	1	paris 2024	1993
1509	paraguay	gilberto flores	football	1	paris 2024	2003
1510	israel	gili sharir	judo	2	tokyo 2020	1999
1511	france	gilles biron	athletics	2	tokyo 2020	1995
1512	belgium	gilles thomas	equestrian	1	paris 2024	1998
1513	germany	gina luckenkemper	athletics	3	rio 2016	1996
1514	lithuania	gintautas matulis	3x3 basketball	1	paris 2024	1986
1515	georgia	giorgi sardalashvili	judo	1	paris 2024	2003
1516	australia	giorgia patten	rowing	2	tokyo 2020	1998
1517	italy	giorgia pelacchi	rowing	1	paris 2024	1998
1518	italy	giorgia villa	artistic gymnastics	1	paris 2024	2003
1519	brazil	giovana medeiros	swimming	1	paris 2024	2004
1520	italy	giovanni abagnale	rowing	3	rio 2016	1995
1521	italy	giovanni caserta	swimming	1	paris 2024	2002
1522	italy	giovanni sanguinetti	volleyball	1	paris 2024	2000
1523	italy	giovanni ugolotti	equestrian	1	paris 2024	1982
1524	brazil	gisele gomes dos santos	rugby sevens	1	paris 2024	2003
1525	great britain	giselle ansley	hockey	3	rio 2016	1992
1526	italy	giuditta galardi	water polo	1	paris 2024	1995
1527	italy	giulia d'innocenzo	swimming	1	paris 2024	2002
1528	brazil	giulia guarieiro	handball	2	tokyo 2020	1995
1529	germany	giulia gwinn	football	1	paris 2024	1999
1530	italy	giulia ramatelli	swimming	1	paris 2024	2000
1531	italy	giulia rizzi	fencing	1	\N	1989
1532	switzerland	giulia senn	athletics	1	paris 2024	2001
1533	brazil	giulia takahashi	table tennis	2	tokyo 2020	2005
1534	italy	giulia vernice	artistic swimming	1	paris 2024	2005
1535	italy	giulia viacava	water polo	1	paris 2024	1994
1536	argentina	giuliano simeone	football	1	paris 2024	2002
1537	italy	giuseppe vicino	rowing	3	rio 2016	1993
1538	italy	giuseppina aurora condorelli	water polo	1	paris 2024	2001
1539	türkiye	gizem guvenc	swimming	1	paris 2024	2002
1540	türkiye	gizem orge	volleyball	1	paris 2024	1993
1541	ecuador	glenda morejon	athletics	2	tokyo 2020	2000
1542	italy	gloria hooper	athletics	4	london 2012	1992
1543	nigeria	godson oke oghenebrume	athletics	1	paris 2024	2003
1544	mongolia	gonchigsuren batkhuyag	judo	1	paris 2024	1999
1545	argentina	gondou	football	1	paris 2024	2001
1546	unknown	gonzalo echenique saglietti	water polo	3	rio 2016	1990
1547	argentina	gonzalo lujan	football	1	paris 2024	2001
1548	unknown	gonzalo peillat	hockey	3	london 2012	1992
1549	spain	gonzalo perez de vargas moreno	handball	2	tokyo 2020	1991
1550	venezuela	grabiel lugo	fencing	1	paris 2024	1996
1551	zambia	grace chanda	football	2	tokyo 2020	1997
1552	great britain	grace crompton	rugby sevens	1	paris 2024	2001
1553	ireland	grace davison	swimming	1	paris 2024	2007
1554	france	grace geyoro	football	1	paris 2024	1997
1555	new zealand	grace jale	football	1	paris 2024	1999
1556	united states of america	grace joyce	rowing	1	paris 2024	1998
1557	australia	grace stewart	hockey	3	rio 2016	1997
1558	australia	grace young	hockey	1	paris 2024	2002
1559	france	grace zaadi deuna	handball	3	rio 2016	1993
1560	spain	gracia alonso	3x3 basketball	1	paris 2024	1992
1561	great britain	graeme thomas	rowing	2	tokyo 2020	1988
1562	new zealand	grant clancy	canoe sprint	1	paris 2024	2001
1563	slovenia	gregor ropret	volleyball	1	paris 2024	1989
1564	belgium	gregory wathelet	equestrian	3	london 2012	1980
1565	hungary	greta gurisatti	water polo	2	tokyo 2020	1996
1566	hungary	greta kacsor	handball	1	paris 2024	2000
1567	hungary	greta marton	handball	2	tokyo 2020	1999
1568	united states of america	gretchen walsh	swimming	1	paris 2024	2003
1569	france	griedge mbock bathy	football	2	rio 2016	1995
1570	united states of america	griffin yow	football	1	paris 2024	2002
1571	poland	grzegorz lomacz	volleyball	3	rio 2016	1987
1572	france	guerschon yabusele	basketball	2	tokyo 2020	1995
1573	brazil	gui santos	basketball	1	paris 2024	2002
1574	brazil	guilherme basseto	swimming	1	tokyo 2020	1997
1575	brazil	guilherme costa	marathon swimming	2	tokyo 2020	1998
1576	brazil	guilherme santos	swimming	1	paris 2024	2003
1577	brazil	guilherme schimidt	judo	1	paris 2024	2000
1578	brazil	guilherme teodoro	table tennis	1	paris 2024	2001
1579	italy	guillaume bianchi	fencing	1	paris 2024	1997
1580	france	guillaume guth	swimming	1	paris 2024	2000
1581	france	guillaume restes	football	1	paris 2024	2005
1582	france	guillaume turlan	rowing	2	tokyo 2020	1996
1583	argentina	guillermo fischer	handball	1	paris 2024	1996
1584	uruguay	guillermo lijtenstein	rugby sevens	1	paris 2024	1990
1585	azerbaijan	gullu aghalarzade	rhythmic gymnastics	1	paris 2024	2003
1586	uzbekistan	gulnoza matniyazova	judo	3	rio 2016	1994
1587	india	gurjant singh	hockey	2	tokyo 2020	1995
1588	kazakhstan	gusman kyrgyzbayev	judo	1	paris 2024	1992
1589	paraguay	gustavo caballero	football	1	paris 2024	2001
1590	netherlands	guus mollee	rowing	1	paris 2024	2002
1591	netherlands	guusje steenhuis	judo	2	tokyo 2020	1992
1592	france	guusje van bolhuis	hockey	1	paris 2024	2001
1593	republic of korea	gyeongdong do	fencing	1	paris 2024	1999
1594	germany	gyorgy grozer	volleyball	2	london 2012	1984
1595	united states of america	hadley husisian	fencing	1	paris 2024	2003
1596	france	hadrien salvan	swimming	1	tokyo 2020	1997
1597	people's republic of china	haibin yan	athletics	2	tokyo 2020	2003
1598	united states of america	hailey van lith	3x3 basketball	1	paris 2024	2001
1599	people's republic of china	haiwei chen	fencing	2	rio 2016	1994
1600	people's republic of china	haiyang qin	swimming	2	tokyo 2020	1999
1601	united states of america	haleigh washington	volleyball	2	tokyo 2020	1995
1602	france	halimatou bah	volleyball	1	paris 2024	2003
1603	mali	hamidou diallo	football	1	paris 2024	2002
1604	new zealand	hamish legarth	canoe sprint	1	paris 2024	1999
1605	great britain	hamish turnbull	cycling track	1	paris 2024	1999
1606	sweden	hampus wanne	handball	2	tokyo 2020	1993
1607	egypt	hamza alaa	football	1	paris 2024	2001
1608	slovakia	hana burzalova	athletics	1	paris 2024	2000
1609	egypt	hana goda	table tennis	2	tokyo 2020	2007
1610	japan	hana takahashi	football	1	paris 2024	2000
1611	japan	hanako utsumi	rugby sevens	1	paris 2024	2000
1612	türkiye	hande baladin	volleyball	2	tokyo 2020	1997
1613	egypt	hanna hiekal	artistic swimming	2	tokyo 2020	2002
1614	poland	hanna lyczbinska	fencing	2	rio 2016	1990
1615	sweden	hanna rosvall	swimming	1	paris 2024	2000
1616	great britain	hannah french	hockey	1	paris 2024	1994
1617	south africa	hannah pearce	hockey	1	paris 2024	1998
1618	great britain	hannah scott	rowing	2	tokyo 2020	1999
1619	germany	hannah vester	rhythmic gymnastics	1	paris 2024	2006
1620	belgium	hanne claes	athletics	2	tokyo 2020	1991
1621	united states of america	hannes daube	water polo	2	tokyo 2020	2000
1622	germany	hannes mueller	hockey	1	paris 2024	2000
1623	denmark	hans ottar lindberg	handball	3	beijing 2008	1981
1624	netherlands	hans peter minderhoud	equestrian	4	beijing 2008	1973
1625	people's republic of china	hao chang	artistic swimming	1	paris 2024	1997
1626	people's republic of china	haoyu wang	swimming	1	paris 2024	2005
1627	austria	harald ambros	equestrian	4	athens 2004	1980
1628	norway	harald reinkind	handball	2	tokyo 2020	1992
1629	india	hardik singh	hockey	2	tokyo 2020	1998
1630	india	harmanpreet singh	hockey	3	rio 2016	1996
1631	india	harmeet desai	table tennis	1	paris 2024	1993
1632	netherlands	harrie lavreysen	cycling track	2	tokyo 2020	1997
1633	netherlands	harrie smolders	equestrian	3	rio 2016	1980
1634	great britain	harriet taylor	rowing	2	tokyo 2020	1994
1635	great britain	harry brightmore	rowing	1	paris 2024	1994
1636	great britain	harry charles	equestrian	2	tokyo 2020	1999
1637	great britain	harry hepworth	artistic gymnastics	1	paris 2024	2003
1638	ireland	harry mcnulty	rugby sevens	2	tokyo 2020	1993
1639	japan	haruka funakubo	judo	1	paris 2024	1998
1640	japan	haruka nakamura	artistic gymnastics	1	paris 2024	2008
1641	france	hatadou sako	handball	1	paris 2024	1995
1642	australia	hattie shand	hockey	1	paris 2024	2000
1643	new zealand	hayden phillips	hockey	2	rio 2016	1998
1644	australia	hayden sargeant	rugby sevens	1	paris 2024	1998
1645	new zealand	hayden wilde	triathlon	2	tokyo 2020	1997
1646	canada	hayley mckelvey	water polo	2	tokyo 2020	1996
1647	australia	hayley raso	football	2	tokyo 2020	1994
1648	australia	hayley verbunt	rowing	1	paris 2024	2002
1649	republic of korea	hayoung jeon	fencing	1	paris 2024	2001
1650	republic of korea	hayun kim	judo	1	paris 2024	2000
1651	japan	hazuki nagai	hockey	3	rio 2016	1994
1652	great britain	heather cowell	rugby sevens	1	paris 2024	1996
1653	norway	hedda oritsland	canoe sprint	1	paris 2024	1999
1654	great britain	heidi long	rowing	1	paris 2024	1996
1655	austria	heiko gigler	swimming	1	tokyo 2020	1996
1656	dominican republic	heinz morschel	football	1	paris 2024	1997
1657	great britain	helen glover	rowing	4	london 2012	1986
1658	france	helena cazaute	volleyball	1	paris 2024	1997
1659	denmark	helena elver	handball	1	paris 2024	1998
1660	angola	helena paulo	handball	2	tokyo 2020	1998
1661	belgium	helena ponette	athletics	1	paris 2024	2000
1662	belgium	helene brasseur	hockey	1	paris 2024	2002
1663	france	helene parisot	athletics	1	paris 2024	1992
1664	zambia	hellen chanda	football	2	tokyo 2020	1998
1665	norway	henny reistad	handball	2	tokyo 2020	1999
1666	finland	henri ruoste	equestrian	2	tokyo 2020	1982
1667	norway	henriette jaeger	athletics	1	paris 2024	2003
1668	denmark	henrik mollgaard jensen	handball	3	rio 2016	1985
1669	sweden	henrik von eckermann	equestrian	4	london 2012	1981
1670	guinea	henry camara	football	1	paris 2024	2006
1671	great britain	henry fieldman	rowing	2	tokyo 2020	1988
1672	united states of america	henry hollingsworth	rowing	1	paris 2024	1997
1673	australia	henry hutchison	rugby sevens	3	rio 2016	1997
1674	australia	henry paterson	rugby sevens	1	paris 2024	1997
1675	kenya	herman humwa	rugby sevens	2	tokyo 2020	1995
1676	netherlands	hermine drenth	rowing	1	paris 2024	1994
1677	netherlands	hetty van de wouw	cycling track	1	paris 2024	1998
1678	united states of america	hezly rivera	artistic gymnastics	1	paris 2024	2008
1679	japan	hidenari mano	swimming	1	paris 2024	2000
1680	japan	hifumi abe	judo	2	tokyo 2020	1997
1681	japan	hikaru kitagawa	football	1	paris 2024	1997
1682	australia	hilary scott	equestrian	1	paris 2024	1988
1683	japan	himawari akaho	basketball	2	tokyo 2020	1998
1684	japan	hina hayata	table tennis	2	tokyo 2020	2000
1685	japan	hinata miyazawa	football	1	paris 2024	1999
1686	japan	hiroki motoki	handball	2	tokyo 2020	1992
1687	japan	hiroki sekine	football	1	paris 2024	2002
1688	japan	hiroko makino	swimming	1	paris 2024	1999
1689	japan	hirotaka yoshii	basketball	1	paris 2024	1998
1690	japan	hiroto shinozuka	table tennis	1	paris 2024	2003
1691	japan	hiroyasu tamakawa	handball	1	paris 2024	1995
1692	hong kong	ho ching lee	table tennis	4	london 2012	1992
1693	hong kong	hoi kem doo	table tennis	3	rio 2016	1996
1694	hong kong	hoi lam tam	swimming	1	tokyo 2020	1998
1695	republic of korea	hojoon lee	swimming	1	tokyo 2020	2001
1696	great britain	hollie webb	hockey	3	rio 2016	1990
1697	great britain	holly dunford	rowing	1	paris 2024	1999
1698	people's republic of china	hong li	hockey	2	tokyo 2020	1999
1699	people's republic of china	hongting ruan	rugby sevens	2	tokyo 2020	1995
1700	japan	honoka hayashi	football	2	tokyo 2020	1998
1701	japan	honoka tsutsumi	rugby sevens	2	tokyo 2020	1997
1702	france	hortense limouzin	3x3 basketball	1	paris 2024	1998
1703	egypt	hossam abdalla	volleyball	2	rio 2016	1988
1704	egypt	hossam abdelmaguid	football	1	paris 2024	2001
1705	people's republic of china	huadong sun	equestrian	2	tokyo 2020	1991
1706	people's republic of china	huan luo	artistic gymnastics	1	paris 2024	2000
1707	people's republic of china	huan wang	water polo	2	tokyo 2020	1997
1708	hungary	hubert kos	swimming	2	tokyo 2020	2003
1709	japan	hugh watanabe	basketball	2	tokyo 2020	1998
1710	brazil	hugo calderano	table tennis	3	rio 2016	1996
1711	france	hugo descat	handball	2	tokyo 2020	1992
1712	france	hugo fontani	water polo	1	paris 2024	1994
1713	spain	hugo gonzalez de oliveira	swimming	3	rio 2016	1999
1714	new zealand	hugo inglis	hockey	4	london 2012	1991
1715	ireland	hugo keenan	rugby sevens	1	paris 2024	1996
1716	ireland	hugo lennox	rugby sevens	2	tokyo 2020	1999
1717	united states of america	hunter armstrong	swimming	2	tokyo 2020	2001
1718	republic of korea	hunyoung jeon	archery	1	paris 2024	1994
1719	iraq	hussein ali	football	1	paris 2024	2002
1720	iraq	hussein amer	football	1	paris 2024	2002
1721	iraq	hussein hasan	football	1	paris 2024	2003
1722	iraq	hussein lawend	football	1	paris 2024	2001
1723	australia	hwan bae	table tennis	1	paris 2024	2005
1724	republic of korea	hyein lee	fencing	2	tokyo 2020	1995
1725	republic of korea	hyekyeong lee	judo	1	paris 2024	1996
1726	republic of korea	hyunji yoon	judo	2	tokyo 2020	1994
1727	chinese taipei	i-ching cheng	table tennis	3	rio 2016	1992
1728	france	ian jason	rugby sevens	1	paris 2024	1997
1729	spain	ian tarrafeta	handball	1	paris 2024	1999
1730	egypt	ibrahim adel	football	2	tokyo 2020	2001
1731	iraq	ibrahim bayesh	football	1	paris 2024	2000
1732	türkiye	ibrahim colak	artistic gymnastics	2	tokyo 2020	1995
1733	egypt	ibrahim elmasry	handball	3	rio 2016	1989
1734	ghana	ibrahim fuseini	athletics	1	paris 2024	2002
1735	türkiye	ibrahim tataroglu	judo	1	paris 2024	2006
1736	mali	ibrahima cisse	football	1	paris 2024	2001
1737	uzbekistan	ibrokhim ibragimov	football	1	paris 2024	2001
1738	uzbekistan	ibrokhimkhalil yuldoshev	football	1	paris 2024	2001
1739	israel	ido shahar	football	1	paris 2024	2001
1740	ukraine	ievgeniia nimchenko	rowing	2	rio 2016	1992
1741	nigeria	ifeanyi emmanuel ojeli	athletics	2	tokyo 2020	1998
1742	nigeria	ifeoma onumonu	football	1	paris 2024	1994
1743	nigeria	ifunanya okoro	basketball	1	paris 2024	1999
1744	uruguay	ignacio facciolo	rugby sevens	1	paris 2024	2001
1745	argentina	ignacio pizarro	handball	2	tokyo 2020	1990
1746	spain	ignacio rodriguez	hockey	1	paris 2024	1996
1747	lithuania	ignas navakauskas	canoe	2	rio 2016	1989
1748	ukraine	igor radivilov	artistic gymnastics	4	london 2012	1992
1749	germany	igor wandtke	judo	3	rio 2016	1990
1750	ukraine	ihor krasnopir	football	1	paris 2024	2002
1751	ukraine	ihor trunov	canoe sprint	1	paris 2024	1992
1752	japan	ikkei nitta	water polo	1	paris 2024	1998
1753	colombia	ilana izquierdo	football	1	paris 2024	2002
1754	italy	ilaria elvira accame	athletics	1	paris 2024	2001
1755	italy	ilaria spirito	volleyball	1	paris 2024	0
1756	israel	ilay feingold	football	1	paris 2024	2004
1757	kazakhstan	ilfat abdullin	archery	2	tokyo 2020	1998
1758	georgia	ilia sulamanidze	judo	1	paris 2024	2001
1759	france	iliana rupert	basketball	2	tokyo 2020	2001
1760	morocco	ilias akhomach	football	1	paris 2024	2004
1761	fiji	ilisapeci delaiwau	rugby sevens	1	paris 2024	2000
1762	ukraine	illia kovtun	artistic gymnastics	2	tokyo 2020	2003
1763	ukraine	illia krupskyi	football	1	paris 2024	2004
1764	united states of america	ilona maher	rugby sevens	2	tokyo 2020	1996
1765	canada	ilya kharun	swimming	1	paris 2024	2005
1766	france	iman ndiaye	volleyball	1	paris 2024	2002
1767	netherlands	imani de jong	swimming	1	paris 2024	2002
1768	great britain	imani lansiquot	athletics	2	tokyo 2020	1997
1769	spain	imanol garciandia	handball	1	paris 2024	1995
1770	belgium	imke vervaet	athletics	2	tokyo 2020	1993
1771	ireland	imogen magner	rowing	1	paris 2024	1998
1772	south africa	impi visser	rugby sevens	2	tokyo 2020	1995
1773	spain	inaki canal	athletics	1	paris 2024	1997
1774	argentina	inaki minadeo	hockey	1	paris 2024	2003
1775	israel	inbar lanir	judo	2	tokyo 2020	2000
1776	puerto rico	india pagan	basketball	2	tokyo 2020	1999
1777	new zealand	indiah-paige riley	football	1	paris 2024	2001
1778	netherlands	indy baijens	volleyball	1	paris 2024	2001
1779	belgium	ine joris	basketball	1	paris 2024	2001
1780	spain	ines bergua navales	rhythmic gymnastics	1	paris 2024	2004
1781	france	ines lardeur	hockey	1	paris 2024	1996
1782	canada	ingrid wilm	swimming	1	paris 2024	1998
1783	republic of korea	injeong choi	fencing	4	london 2012	1990
1784	romania	ioan prundeanu	rowing	2	tokyo 2020	1993
1785	romania	ioana madalina morosan	rowing	1	paris 2024	1999
1786	romania	ioana vrinceanu	rowing	2	tokyo 2020	1994
1787	greece	ioanna chydirioti	water polo	1	paris 2024	1997
1788	greece	ioanna stamatopoulou	water polo	1	paris 2024	1998
1789	greece	ioannis fountoulis	water polo	4	london 2012	1988
1790	greece	ioli mytilineou	equestrian	1	paris 2024	1997
1791	australia	iona anderson	swimming	1	paris 2024	2005
1792	fiji	iosefo masi	rugby sevens	1	paris 2024	1998
1793	fiji	iowane teba	rugby sevens	1	paris 2024	1993
1794	spain	irene paredes	football	1	paris 2024	1991
1795	unknown	unknown	athletics	1	tokyo 2020	1993
1796	italy	irene vecchi	fencing	4	london 2012	1989
1797	spain	iris tio casas	artistic swimming	2	tokyo 2020	2002
1798	netherlands	iris wolves	water polo	2	tokyo 2020	1994
1799	uzbekistan	iriskhon kurbanbaeva	judo	1	paris 2024	2002
1800	uzbekistan	irodakhon sadykova	rhythmic gymnastics	1	paris 2024	2007
1801	germany	isaac bonga	basketball	2	tokyo 2020	1999
1802	ghana	isaac botsio	athletics	1	paris 2024	1999
1803	australia	isaac cooper	swimming	2	tokyo 2020	2004
1804	new zealand	isaac houlbrooke	hockey	1	paris 2024	2001
1805	new zealand	isaac hughes	football	1	paris 2024	2004
1806	norway	isabel freese	equestrian	1	paris 2024	1979
1807	germany	isabel gose	swimming	2	tokyo 2020	2002
1808	spain	isabel piralkova coello	water polo	1	paris 2024	2005
1809	netherlands	isabel van den berg	athletics	1	paris 2024	2005
1810	germany	isabell werth	equestrian	7	barcelona 1992	1969
1811	australia	isabella nasser	rugby sevens	1	paris 2024	2002
1812	israel	isabella russekoff	equestrian	1	paris 2024	2000
1813	great britain	isabelle petter	hockey	2	tokyo 2020	2000
1814	brazil	isac santos	volleyball	2	tokyo 2020	1990
1815	france	isaia cordinier	basketball	1	paris 2024	1996
1816	puerto rico	isaiah pineiro	basketball	1	paris 2024	1995
1817	sweden	isak eliasson	swimming	1	paris 2024	1996
1818	puerto rico	isalys quinones	basketball	2	tokyo 2020	1997
1819	netherlands	isaya klein ikkink	athletics	1	paris 2024	2003
1820	great britain	isla norman-bell	rugby sevens	1	paris 2024	2000
1821	spain	ismael garcia roque	equestrian	1	paris 2024	1981
1822	puerto rico	ismael romero	basketball	1	paris 2024	1991
1823	australia	isobel borlase	basketball	1	paris 2024	2004
1824	italy	isotta sportelli	artistic swimming	1	paris 2024	2000
1825	nigeria	israel okon sunday	athletics	1	paris 2024	2006
1826	guinea	issiaga camara	football	1	paris 2024	2002
1827	mali	issouf sissokho	football	1	paris 2024	2002
1828	hungary	istvan kuli	canoe sprint	1	paris 2024	1998
1829	mexico	itzamary gonzalez cuellar	artistic swimming	1	paris 2024	2003
1830	ukraine	ivan banzeruk	athletics	3	rio 2016	1990
1831	croatia	ivan martinovic	handball	1	paris 2024	1998
1832	ukraine	ivan semykin	canoe sprint	1	paris 2024	1997
1833	serbia	ivana raca	basketball	1	paris 2024	1999
1834	liberia	jabez reeves	athletics	1	paris 2024	2002
1835	united states of america	jack alexy	swimming	1	paris 2024	2003
1836	great britain	jack carlin	cycling track	2	tokyo 2020	1997
1837	australia	jack cartwright	swimming	1	paris 2024	1998
1838	australia	jack hargreaves	rowing	2	tokyo 2020	1993
1839	ireland	jack kelly	rugby sevens	2	tokyo 2020	1997
1840	united states of america	jack mcglynn	football	1	paris 2024	2003
1841	australia	jack mcveigh	basketball	1	paris 2024	1996
1842	australia	jack o'brien	rowing	1	paris 2024	1998
1843	australia	jack robertson	rowing	1	paris 2024	1998
1844	great britain	jack waller	hockey	2	tokyo 2020	1997
1845	puerto rico	jackie benitez	basketball	1	tokyo 2020	1997
1846	new zealand	jackie gowler	rowing	2	tokyo 2020	1996
1847	united states of america	jacklyn luu	artistic swimming	1	paris 2024	1999
1848	australia	jackson collins	canoe sprint	1	paris 2024	1998
1849	great britain	jacob benjamin draper	hockey	2	tokyo 2020	1998
1850	great britain	jacob dawson	rowing	2	tokyo 2020	1993
1851	australia	jacob despard	athletics	1	paris 2024	1996
1852	australia	jacob mercep	water polo	1	paris 2024	1998
1853	germany	jacob schopf	canoe sprint	2	tokyo 2020	1999
1854	netherlands	jacob van de kerkhof	rowing	1	paris 2024	1995
1855	australia	jacob whetton	hockey	3	rio 2016	1991
1856	great britain	jacob whittle	swimming	2	tokyo 2020	2004
1857	italy	jacopo frigerio	rowing	1	paris 2024	1998
1858	south africa	jacque van tonder	hockey	1	paris 2024	2000
1859	united states of america	jacqueline dubrovich	fencing	2	tokyo 2020	1994
1860	canada	jacqueline madogo	athletics	1	paris 2024	2000
1861	canada	jacqueline simoneau	artistic swimming	3	rio 2016	1996
1862	united states of america	jacquelyn young	3x3 basketball	1	tokyo 2020	1997
1863	new zealand	jacqui hand	football	1	paris 2024	1999
1864	australia	jacqui swick	rowing	1	paris 2024	2002
1865	brazil	jade barbosa	artistic gymnastics	3	beijing 2008	1991
1866	united states of america	jade carey	artistic gymnastics	2	tokyo 2020	2000
1867	australia	jade melbourne	basketball	1	paris 2024	2002
1868	canada	jade rose	football	1	paris 2024	2003
1869	great britain	jade shekells	rugby sevens	1	paris 2024	1996
1870	trinidad and tobago	jaden marchan	athletics	1	paris 2024	2006
1871	brazil	jadson erick soares lima	athletics	1	paris 2024	2003
1872	united states of america	jaedyn shaw	football	1	paris 2024	2004
1873	republic of korea	jaehoon yang	swimming	1	paris 2024	1998
1874	spain	jael bestue	athletics	2	tokyo 2020	2000
1875	united states of america	jaime czarkowski	artistic swimming	1	paris 2024	2003
1876	spain	jaime pradilla	basketball	1	paris 2024	2001
1877	australia	jake harvie	hockey	1	paris 2024	1998
1878	great britain	jake jarman	artistic gymnastics	1	paris 2024	2001
1879	new zealand	jake smith	hockey	2	tokyo 2020	1991
1880	czechia	jakub jurka	fencing	2	tokyo 2020	1999
1881	poland	jakub kochanowski	volleyball	2	tokyo 2020	1997
1882	poland	jakub majerski	swimming	2	tokyo 2020	2000
1883	canada	jamal murray	basketball	1	paris 2024	1997
1884	great britain	james albery	hockey	1	paris 2024	1995
1885	great britain	james guy	swimming	3	rio 2016	1995
1886	canada	james hedgcock	cycling track	1	paris 2024	2001
1887	uruguay	james mc cubbin	rugby sevens	1	paris 2024	1998
1888	argentina	james parker	handball	1	paris 2024	1994
1889	great britain	james rudkin	rowing	2	tokyo 2020	1994
1890	australia	james turner	rugby sevens	1	paris 2024	1998
1891	great britain	james wilby	swimming	2	tokyo 2020	1993
1892	sweden	jamina roberts	handball	4	london 2012	1990
1893	netherlands	jan driessen	3x3 basketball	1	paris 2024	1996
1894	switzerland	jan jonah plock	rowing	1	paris 2024	1998
1895	poland	jan jurkiewicz	fencing	1	paris 2024	2000
1896	poland	jan kalusowski	swimming	1	paris 2024	2000
1897	poland	jan kaminski	equestrian	1	tokyo 2020	1992
1898	slovenia	jan kozamernik	volleyball	1	paris 2024	1995
1899	argentina	jan martinez franchi	volleyball	1	paris 2024	1998
1900	norway	jan oscar stabe helvig	rowing	2	tokyo 2020	1995
1901	netherlands	jan van der bij	rowing	2	tokyo 2020	1991
1902	germany	jana wargers	equestrian	1	paris 2024	1991
1903	thailand	janakabhorn karunayadhaj	equestrian	1	paris 2024	1997
1904	australia	jane claxton	hockey	3	rio 2016	1992
1905	france	janelle salaun	basketball	1	paris 2024	2001
1906	slovenia	jani kovacic	volleyball	1	paris 2024	1992
1907	belgium	janie de naeyer	athletics	1	paris 2024	2001
1908	germany	janina minge	football	1	paris 2024	1999
1909	canada	janine beckie	football	3	rio 2016	1994
1910	slovenia	janja segel	swimming	2	rio 2016	2001
1911	netherlands	janna van kooten	swimming	1	paris 2024	2004
1912	netherlands	janneke boonzaaijer	equestrian	2	tokyo 2020	1996
1913	germany	jannik kohlbacher	handball	2	tokyo 2020	1995
1914	great britain	jasmine joyce	rugby sevens	3	rio 2016	1995
1915	uzbekistan	jasurbek jaloliddinov	football	1	paris 2024	2002
1916	canada	javier acevedo	swimming	3	rio 2016	1998
1917	spain	javier rodriguez	handball	1	paris 2024	2002
1918	bahamas	javonya valcourt	athletics	1	paris 2024	2004
1919	new zealand	jay herdman	football	1	paris 2024	2004
1920	canada	jayde riviere	football	2	tokyo 2020	2001
1921	australia	jayden brown	equestrian	1	paris 2024	1988
1922	united states of america	jayson tatum	basketball	2	tokyo 2020	1998
1923	new zealand	jazmin felix-hotham	rugby sevens	1	paris 2024	2000
1924	republic of korea	je deok kim	archery	2	tokyo 2020	2004
1925	france	jean-charles valladont	archery	4	beijing 2008	1989
1926	australia	jean mitchell	rowing	1	paris 2024	1999
1927	france	jean pascal barraque	rugby sevens	1	paris 2024	1991
1928	france	jean patry	volleyball	2	tokyo 2020	1996
1929	germany	jean paul bredau	athletics	2	tokyo 2020	1999
1930	germany	jean-paul danneberg	hockey	1	paris 2024	2002
1931	france	jean-philippe mateta	football	1	paris 2024	1997
1932	france	jean-philippe patrice	fencing	1	paris 2024	1997
1933	france	jeff erius	athletics	1	paris 2024	2004
1934	france	jefferson-lee joseph	rugby sevens	1	paris 2024	2002
1935	netherlands	jeffrey hoogland	cycling track	3	rio 2016	1993
1936	united states of america	jeffrey jendryk ii	volleyball	1	paris 2024	1995
1937	jamaica	jehlani gordon	athletics	1	paris 2024	2003
1938	jamaica	jelani walker	athletics	1	paris 2024	1998
1939	netherlands	jelle snippe	judo	1	paris 2024	1998
1940	australia	jemima montag	athletics	2	tokyo 2020	1998
1941	france	jenia grebennikov	volleyball	3	rio 2016	1990
1942	united states of america	jenna michelle flynn	water polo	1	paris 2024	2004
1943	united states of america	jenna nighswonger	football	1	paris 2024	2000
1944	australia	jenna strauch	swimming	2	tokyo 2020	1997
1945	nigeria	jennifer echegini	football	1	paris 2024	2001
1946	spain	jennifer hermoso	football	1	paris 2024	1990
1947	spain	jennifer maria gutierrez bermejo	handball	2	tokyo 2020	1995
1948	united states of america	jennifer mucino-fernandez	archery	2	tokyo 2020	2002
1949	united states of america	jennifer valente	cycling track	3	rio 2016	1994
1950	germany	jenny behrend	handball	1	paris 2024	1996
1951	sweden	jenny carlson	handball	2	tokyo 2020	1995
1952	trinidad and tobago	jereem richards	athletics	2	tokyo 2020	1994
1953	fiji	jeremaia matana	rugby sevens	1	paris 2024	1998
1954	great britain	jeremiah azu	athletics	1	paris 2024	2001
1955	canada	jeremy bagshaw	swimming	1	paris 2024	1992
1956	switzerland	jeremy desplanches	swimming	3	rio 2016	1994
1957	ireland	jeremy duncan	hockey	1	paris 2024	1994
1958	australia	jeremy hayward	hockey	3	rio 2016	1993
1959	canada	jeremy hazin	table tennis	2	tokyo 2020	2000
1960	croatia	jerko marinic kragic	water polo	1	paris 2024	1991
1961	netherlands	jermain gruenberg	artistic gymnastics	1	paris 2024	2000
1962	canada	jerome blake	athletics	2	tokyo 2020	1995
1963	belgium	jerome guery	equestrian	3	rio 2016	1980
1964	fiji	jerry tuwai	rugby sevens	3	rio 2016	1989
1965	new zealand	jesse randall	football	1	paris 2024	2002
1966	canada	jessica gaudreault	water polo	1	paris 2024	1994
1967	canada	jessica phoenix	equestrian	4	london 2012	1983
1968	brazil	jessica quintino	handball	3	london 2012	1991
1969	great britain	jessica roberts	cycling track	1	paris 2024	1999
1970	mexico	jessica salazar valles	cycling track	1	paris 2024	1995
1971	canada	jessica sevick	rowing	2	tokyo 2020	1989
1972	mexico	jessica sobrino mizrahi	artistic swimming	1	paris 2024	1994
1973	germany	jessica von bredow-werndl	equestrian	2	tokyo 2020	1986
1974	australia	jessica weintraub	rhythmic gymnastics	1	paris 2024	2007
1975	canada	jessica zi jia guo	fencing	2	tokyo 2020	2005
1976	canada	jessie fleming	football	3	rio 2016	1998
1977	côte d'ivoire	jessika gbai	athletics	1	paris 2024	1998
1978	venezuela	jesus limardo	fencing	1	paris 2024	1996
1979	germany	jette louisa fleschutz	hockey	2	tokyo 2020	2002
1980	united states of america	jewel roemer	water polo	1	paris 2024	2002
1981	united states of america	jewell loyd	basketball	2	tokyo 2020	1993
1982	brazil	jheniffer	football	1	paris 2024	2001
1983	brazil	jhennifer lopes	handball	1	paris 2024	2000
1984	france	jia nan yuan	table tennis	2	tokyo 2020	1985
1985	people's republic of china	jiajun sun	swimming	2	tokyo 2020	2000
1986	people's republic of china	jiaman li	archery	1	paris 2024	1997
1987	people's republic of china	jiangxin he	hockey	1	paris 2024	1997
1988	people's republic of china	jiao ye	hockey	1	paris 2024	1994
1989	people's republic of china	jiapeng chen	athletics	1	paris 2024	2002
1990	people's republic of china	jiaqi zhong	hockey	2	tokyo 2020	1999
1991	people's republic of china	jiaren zhao	3x3 basketball	1	paris 2024	1999
1992	people's republic of china	jiayu xu	swimming	4	london 2012	1995
1993	people's republic of china	jiayu yang	athletics	2	tokyo 2020	1996
1994	people's republic of china	jie xu	fencing	1	paris 2024	2002
1995	republic of korea	jihee jeon	table tennis	3	rio 2016	1992
1996	republic of korea	jihun kim	swimming	1	paris 2024	2000
1997	canada	jill irving	equestrian	1	paris 2024	1963
1998	sweden	jim gottfridsson	handball	3	rio 2016	1992
1999	united states of america	jimmer fredette	3x3 basketball	1	paris 2024	1989
2000	japan	jin watanabe	handball	2	tokyo 2020	1990
2001	dominican republic	jineiry martinez	volleyball	2	tokyo 2020	1997
2002	singapore	jing wen quah	swimming	1	paris 2024	2000
2003	people's republic of china	jing yan	water polo	1	paris 2024	1997
2004	people's republic of china	jing zhang	water polo	3	rio 2016	1996
2005	people's republic of china	jingyuan zou	artistic gymnastics	2	tokyo 2020	1998
2006	republic of korea	jinhui jeong	handball	2	tokyo 2020	1999
2007	republic of korea	jinmi shin	handball	1	paris 2024	1998
2008	thailand	jinnipa sawettabut	table tennis	1	paris 2024	2000
2009	people's republic of china	jinzhuang tan	hockey	1	paris 2024	2003
2010	netherlands	jip janssen	hockey	2	tokyo 2020	1997
2011	czechia	jiri beran	fencing	2	rio 2016	1982
2012	republic of korea	jisu kim	judo	2	tokyo 2020	2000
2013	republic of korea	jisu yoon	fencing	3	rio 2016	1993
2014	republic of korea	jiyeon jeon	handball	1	paris 2024	2003
2015	republic of korea	jiyoung song	handball	1	paris 2024	1996
2016	people's republic of china	jiyuan wan	3x3 basketball	2	tokyo 2020	2002
2017	france	joan-benjamin gaba	judo	1	paris 2024	2001
2018	spain	joan garcia	football	1	paris 2024	2001
2019	mexico	joana betzabe jimenez garcia	artistic swimming	2	tokyo 2020	1993
2020	france	joanna grisez	rugby sevens	1	paris 2024	1996
2021	finland	joanna robinson	equestrian	1	paris 2024	1989
2022	poland	joanna wolosz	volleyball	1	paris 2024	1990
2023	netherlands	joanne van lieshout	judo	1	paris 2024	2002
2024	brazil	joao cardoso	basketball	1	paris 2024	2000
2025	portugal	joao geraldo	table tennis	2	tokyo 2020	1995
2026	portugal	joao pedro moreira	equestrian	1	paris 2024	1985
2027	dominican republic	joao urbaez	football	1	paris 2024	2002
2028	brazil	joao victor marcari oliva	equestrian	3	rio 2016	1996
2029	argentina	joaquin garcia	football	1	paris 2024	2001
2030	unknown	joaquin menini	hockey	2	rio 2016	1991
2031	argentina	joaquin pellandini	rugby sevens	1	paris 2024	1999
2032	australia	jocelyn bartram	hockey	1	paris 2024	1993
2033	australia	jock landale	basketball	2	tokyo 2020	1995
2034	new zealand	joe bell	football	2	tokyo 2020	1999
2035	great britain	joe fraser	artistic gymnastics	2	tokyo 2020	1998
2036	australia	joe ingles	basketball	5	beijing 2008	1987
2037	great britain	joe litchfield	swimming	1	tokyo 2020	1998
2038	new zealand	joe webber	rugby sevens	3	rio 2016	1993
2039	japan	joel chima fujita	football	1	paris 2024	2002
2040	united states of america	joel embiid	basketball	1	paris 2024	1994
2041	spain	joel plata	artistic gymnastics	2	tokyo 2020	1998
2042	switzerland	joel schuerch	rowing	2	tokyo 2020	1994
2043	netherlands	joep paul eric de mol	hockey	2	tokyo 2020	1995
2044	estonia	johann poolak	rowing	1	paris 2024	1997
2045	sweden	johanna bundsen	handball	3	rio 2016	1991
2046	germany	johanna maria stockschlaeder	handball	1	paris 2024	1995
2047	germany	johannes golla	handball	2	tokyo 2020	1997
2048	germany	johannes grosse	hockey	2	tokyo 2020	1997
2049	germany	johannes thiemann	basketball	2	tokyo 2020	1994
2050	germany	johannes tille	volleyball	1	paris 2024	1997
2051	germany	johannes voigtmann	basketball	2	tokyo 2020	1992
2052	egypt	johara eldeeb	rhythmic gymnastics	1	paris 2024	2007
2053	australia	john hedges	water polo	1	paris 2024	1999
2054	belgium	john-john dohmen	hockey	5	beijing 2008	1988
2055	ireland	john mckee	hockey	1	paris 2024	1996
2056	kenya	john okeyo	rugby sevens	1	paris 2024	2000
2057	liberia	john sherman	athletics	1	paris 2024	2004
2058	united states of america	john tolkin	football	1	paris 2024	2002
2059	united states of america	johnny hooper	water polo	2	tokyo 2020	1997
2060	fiji	joji nasova	rugby sevens	1	paris 2024	2000
2061	netherlands	jolien knollema	volleyball	1	paris 2024	2003
2062	spain	jon pacheco	football	1	paris 2024	2001
2063	netherlands	jonas de geus	hockey	2	tokyo 2020	1998
2064	norway	jonas slettemark juel	rowing	1	paris 2024	1999
2065	germany	jonas wiesen	rowing	1	paris 2024	1996
2066	sweden	jonathan carlsbogard	handball	2	tokyo 2020	1995
2067	sweden	jonathan edvardsson	handball	1	paris 2024	1997
2068	denmark	jonathan groth	table tennis	3	rio 2016	1992
2069	ireland	jonathan lynch	hockey	1	paris 2024	2001
2070	italy	jonathan milan	cycling track	2	tokyo 2020	2000
2071	belgium	jonathan sacoor	athletics	2	tokyo 2020	1999
2072	new zealand	jonelle price	equestrian	4	london 2012	1980
2073	republic of korea	jonghoon lim	table tennis	1	paris 2024	1997
2074	canada	jonnie newman	artistic swimming	1	paris 2024	2006
2075	republic of korea	joonhwan lee	judo	1	paris 2024	2002
2076	netherlands	joosje burg	hockey	1	paris 2024	1997
2077	united states of america	jordan chiles	artistic gymnastics	2	tokyo 2020	2001
2078	ireland	jordan conroy	rugby sevens	2	tokyo 2020	1994
2079	puerto rico	jordan howard	basketball	1	paris 2024	1996
2080	united states of america	jordan larson	volleyball	4	london 2012	1986
2081	united states of america	jordan raney	water polo	1	paris 2024	1996
2082	france	jordan sepho	rugby sevens	1	paris 2024	1998
2083	united states of america	jordan thompson	volleyball	2	tokyo 2020	1997
2084	spain	jordi bonastre	hockey	1	paris 2024	2000
2085	canada	jordyn huitema	football	2	tokyo 2020	2001
2086	united states of america	jordyn poulter	volleyball	2	tokyo 2020	1997
2087	colombia	jorelyn carabali	football	1	paris 2024	1997
2088	colombia	jorge enriquez	archery	1	paris 2024	1999
2089	spain	jorge maqueda peno	handball	3	london 2012	1988
2090	france	joris chotard	football	1	paris 2024	2001
2091	new zealand	jorja miller	rugby sevens	1	paris 2024	2004
2092	netherlands	jorrit croon	hockey	3	rio 2016	1998
2093	puerto rico	jose alvarado	basketball	1	paris 2024	1998
2094	dominican republic	jose de leon	football	1	paris 2024	2004
2095	spain	jose maria basterra	hockey	2	tokyo 2020	1997
2096	argentina	jose maria larocca	equestrian	5	beijing 2008	1969
2097	iraq	josef al imam	football	1	paris 2024	2004
2098	norway	josefine tomine eriksen	athletics	1	paris 2024	2000
2099	liberia	joseph fahnbulleh	athletics	2	tokyo 2020	2001
2100	new zealand	joseph morrison	hockey	1	paris 2024	2001
2101	ghana	joseph paul amoah	athletics	2	tokyo 2020	1997
2102	great britain	joseph stockdale	equestrian	1	paris 2024	1999
2103	fiji	joseva talacolo	rugby sevens	1	paris 2024	1997
2104	australia	josh giddey	basketball	1	paris 2024	2002
2105	australia	josh green	basketball	2	tokyo 2020	2000
2106	germany	josha salchow	swimming	1	paris 2024	1999
2107	australia	joshua azzopardi	athletics	1	paris 2024	1999
2108	australia	joshua beltz	hockey	2	tokyo 2020	1995
2109	germany	joshua hartmann	athletics	2	tokyo 2020	1999
2110	japan	joshua hawkinson	basketball	1	paris 2024	1995
2111	canada	joshua liendo edwards	swimming	2	tokyo 2020	2002
2112	australia	joshua yong	swimming	1	paris 2024	2001
2113	great britain	josie knight	cycling track	2	tokyo 2020	1997
2114	croatia	josip sarac	handball	1	paris 2024	1998
2115	unknown	josip vrlic	water polo	3	rio 2016	1986
2116	japan	josua kerevi	rugby sevens	1	paris 2024	1992
2117	dominican republic	josue baez	football	1	paris 2024	2002
2118	montenegro	jovan vujovic	water polo	1	paris 2024	2003
2119	serbia	jovana nogic	basketball	1	\N	1997
2120	united states of america	jovana sekulic	water polo	1	paris 2024	2002
2121	serbia	jovana stevanovic	volleyball	2	rio 2016	1992
2122	united states of america	jrue holiday	basketball	2	tokyo 2020	1990
2123	south sudan	jt thor	basketball	1	paris 2024	2002
2124	spain	juan antonio jimenez cobo	equestrian	3	sydney 2000	1959
2125	argentina	juan catan	hockey	1	paris 2024	1995
2126	uruguay	juan gonzalez	rugby sevens	1	paris 2024	2003
2127	argentina	juan manuel bar	handball	2	tokyo 2020	1987
2128	uruguay	juan manuel tafernaberry	rugby sevens	1	paris 2024	2002
2129	spain	juan miranda	football	2	tokyo 2020	2000
2130	spain	juana camilion	3x3 basketball	1	paris 2024	1999
2131	argentina	juana castellaro morello	hockey	1	paris 2024	2005
2132	spain	juancho hernangomez	basketball	1	paris 2024	1995
2133	spain	judith forca ariza	water polo	3	rio 2016	1996
2134	netherlands	judith van der helm	handball	1	paris 2024	2005
2135	belgium	judith vandermeiren	hockey	2	london 2012	1994
2136	republic of korea	juho lee	swimming	2	tokyo 2020	1995
2137	germany	jule brand	football	1	paris 2024	2002
2138	germany	jule hake	canoe sprint	2	tokyo 2020	1999
2139	france	jules rambaut	3x3 basketball	1	paris 2024	1998
2140	germany	julia behnke	handball	1	paris 2024	1993
2141	brazil	júlia bergmann	volleyball	1	paris 2024	2001
2142	canada	julia grosso	football	2	tokyo 2020	2000
2143	mexico	julia gutierrez	rhythmic gymnastics	1	paris 2024	2007
2144	austria	julia hauser	triathlon	3	rio 2016	1994
2145	germany	julia krajewski	equestrian	3	rio 2016	1988
2146	germany	julia maidhof	handball	1	paris 2024	1998
2147	poland	julia maik	swimming	1	paris 2024	2003
2148	germany	julia mrozinski	swimming	1	paris 2024	2000
2149	switzerland	julia niederberger	athletics	1	paris 2024	2000
2150	brazil	julia soares	artistic gymnastics	1	paris 2024	2005
2151	spain	julia strappato	hockey	1	paris 2024	2000
2152	poland	julia walczyk-klimaszyk	fencing	1	paris 2024	1997
2153	argentina	julian alvarez	football	1	paris 2024	2000
2154	germany	julian koester	handball	1	paris 2024	2000
2155	germany	julian wagner	athletics	1	paris 2024	1998
2156	germany	julian zenger	volleyball	1	paris 2024	1997
2157	angola	juliana jose machado	handball	3	rio 2016	1994
2158	kenya	juliana namutira	volleyball	1	paris 2024	1999
2159	netherlands	julie beurskens	judo	1	paris 2024	2004
2160	canada	julie brousseau	swimming	1	paris 2024	2006
2161	switzerland	julie derron	triathlon	1	paris 2024	1996
2162	denmark	julie kepp jensen	swimming	3	rio 2016	2000
2163	denmark	julie poulsen	rowing	1	paris 2024	1996
2164	belgium	julie vanloo	basketball	2	tokyo 2020	1993
2165	france	julien epaillard	equestrian	1	paris 2024	1977
2166	france	julien mertine	fencing	2	tokyo 2020	1988
2167	netherlands	juliet lohuis	volleyball	1	paris 2024	1996
2168	argentina	julieta jankunas	hockey	2	tokyo 2020	1999
2169	france	juliette dhalluin	water polo	1	paris 2024	2004
2170	france	juliette gelin	volleyball	1	paris 2024	2001
2171	sweden	juliette ramel	equestrian	3	rio 2016	1987
2172	spain	julio arenas	athletics	2	tokyo 2020	1993
2173	paraguay	julio enciso	football	1	paris 2024	2004
2174	ecuador	julio mendoza loor	equestrian	1	paris 2024	1979
2175	argentina	julio soler	football	1	paris 2024	2005
2176	people's republic of china	jun zhang	athletics	2	tokyo 2020	1998
2177	jamaica	junelle bromfield	athletics	2	tokyo 2020	1998
2178	people's republic of china	juner chen	swimming	1	paris 2024	2004
2179	people's republic of china	junxuan yang	swimming	2	tokyo 2020	2002
2180	japan	junya matsumoto	rugby sevens	1	paris 2024	2000
2181	japan	junya nakanishi	archery	1	paris 2024	1999
2182	people's republic of china	junyao tang	fencing	1	paris 2024	2003
2183	slovenia	jure dolenec	handball	2	rio 2016	1988
2184	germany	juri knorr	handball	2	tokyo 2020	2000
2185	netherlands	justen blok	hockey	2	tokyo 2020	2000
2186	united states of america	justin best	rowing	2	tokyo 2020	1997
2187	serbia	justin cvetkov	swimming	1	paris 2024	2007
2188	canada	justin lui	volleyball	1	paris 2024	2000
2189	nigeria	justina tiana eyakpobeyan	athletics	1	paris 2024	2006
2190	lithuania	justina vanagaite	equestrian	1	paris 2024	1990
2191	france	justine lavit	rhythmic gymnastics	1	paris 2024	2006
2192	belgium	justine rasir	hockey	1	paris 2024	2001
2193	united states of america	justine wong-orantes	volleyball	2	tokyo 2020	1995
2194	germany	justus fischer	handball	1	paris 2024	2003
2195	germany	justus weigand	hockey	2	tokyo 2020	2000
2196	poland	justyna swiety	athletics	4	london 2012	1992
2197	republic of korea	juyeop han	judo	1	paris 2024	1999
2198	india	jyothika sri dandi	athletics	1	paris 2024	2000
2199	spain	kaba gassama	handball	1	paris 2024	1997
2200	zambia	kabange mupopo	athletics	2	rio 2016	1992
2201	canada	kacie bosch	3x3 basketball	1	paris 2024	1996
2202	poland	kacper stokowski	swimming	1	tokyo 2020	1999
2203	canada	kadeisha buchanan	football	3	rio 2016	1995
2204	france	kadidiatou diani	football	2	rio 2016	1995
2205	united states of america	kahleah copper	basketball	1	paris 2024	1994
2206	germany	kai hafner	handball	2	rio 2016	1989
2207	switzerland	kai schaetzle	rowing	1	paris 2024	2000
2208	japan	kai takeshi inoue	water polo	1	paris 2024	2006
2209	australia	kai taylor	swimming	1	paris 2024	2003
2210	japan	kai toews	basketball	1	paris 2024	1998
2211	netherlands	kai van westering	swimming	1	paris 2024	2003
2212	canada	kailen sheridan	football	2	tokyo 2020	1995
2213	australia	kaitlin nobbs	hockey	2	tokyo 2020	1997
2214	australia	kaitlin shave	rugby sevens	1	paris 2024	2001
2215	australia	kaitlyn torpey	football	1	paris 2024	2000
2216	japan	kaito kawabata	athletics	2	tokyo 2020	1998
2217	japan	kaito suzuki	football	1	paris 2024	2002
2218	japan	kaiya ota	cycling track	1	paris 2024	1999
2219	poland	kajetan duszynski	athletics	2	tokyo 2020	1995
2220	united states of america	kaleigh gilchrist	water polo	3	rio 2016	1992
2221	bulgaria	kamelia petrova	rhythmic gymnastics	1	paris 2024	2006
2222	poland	kamil semeniuk	volleyball	2	tokyo 2020	1996
2223	poland	kamil sieradzki	swimming	1	tokyo 2020	2002
2224	kazakhstan	kamila berlikash	judo	1	paris 2024	1999
2225	hungary	kamilla farago	water polo	1	paris 2024	2000
2226	fiji	kaminieli rasaku	rugby sevens	1	paris 2024	1999
2227	japan	kana urata	hockey	1	paris 2024	1998
2228	new zealand	kane russell	hockey	2	rio 2016	1992
2229	japan	kanon mori	hockey	2	tokyo 2020	1996
2230	algeria	kaouther mohamed belkebir	fencing	2	tokyo 2020	2003
2231	denmark	karen mortensen	rowing	1	paris 2024	2001
2232	norway	kari brattset dale	handball	2	tokyo 2020	1991
2233	egypt	karim el debes	football	1	paris 2024	2003
2234	france	karim-florent laghouag	equestrian	3	rio 2016	1975
2235	egypt	karim hendawy	handball	3	rio 2016	1988
2236	belgium	karin donckers	equestrian	7	barcelona 1992	1971
2237	japan	karin miyawaki	fencing	1	paris 2024	1997
2238	united states of america	karl cook	equestrian	1	paris 2024	1990
2239	france	karl konan	handball	1	paris 2024	1995
2240	canada	karl slezak	equestrian	1	paris 2024	1981
2241	sweden	karl wallinius	handball	1	paris 2024	1999
2242	united states of america	karlie kisha	hockey	1	paris 2024	1995
2243	latvia	karlis lasmanis	3x3 basketball	2	tokyo 2020	1994
2244	poland	karol zalewski	athletics	3	rio 2016	1993
2245	poland	karolina naja	canoe	4	london 2012	1990
2246	iraq	karrar mohammed	football	1	paris 2024	2001
2247	iraq	karrar saad	football	1	paris 2024	2001
2248	australia	karri somerville	hockey	2	tokyo 2020	1999
2249	canada	kasia gruchalla-wesierski	rowing	2	tokyo 2020	1991
2250	serbia	katarina lazovic	volleyball	1	paris 2024	1999
2251	poland	katarzyna milczarek	equestrian	2	london 2012	1965
2252	poland	katarzyna wasick	swimming	2	tokyo 2020	1992
2253	poland	katarzyna wegrzyn	table tennis	1	paris 2024	2001
2254	poland	katarzyna wenerska	volleyball	1	paris 2024	1993
2255	united states of america	kate douglass	swimming	2	tokyo 2020	2001
2256	united states of america	kate knifton	rowing	1	paris 2024	2000
2257	australia	kate mcdonald	artistic gymnastics	1	paris 2024	2000
2258	new zealand	kate taylor	football	1	paris 2024	2003
2259	ukraine	kateryna dudchenko	rowing	1	paris 2024	1996
2260	germany	katharina bauer	archery	1	paris 2024	1995
2261	germany	katharina filter	handball	1	paris 2024	1999
2262	germany	katharina menz	judo	2	tokyo 2020	1990
2263	austria	katharina rhomberg	equestrian	1	paris 2024	1992
2264	austria	katharina tanzer	judo	1	paris 2024	1995
2265	united states of america	katharine berkoff	swimming	1	paris 2024	2001
2266	united states of america	katharine holmes	fencing	3	rio 2016	1993
2267	canada	katherine plouffe	3x3 basketball	2	rio 2016	1992
2268	colombia	katherine tapia	football	1	paris 2024	1992
2269	great britain	kathleen dawson	swimming	2	tokyo 2020	1997
2270	germany	kathrin hendrich	football	1	paris 2024	1992
2271	denmark	kathrine heindahl	handball	1	paris 2024	1992
2272	united states of america	kathryn plummer	volleyball	1	paris 2024	1998
2273	ireland	kathy baker	rugby sevens	1	paris 2024	1998
2274	new zealand	katie bowen	football	4	london 2012	1994
2275	new zealand	katie kitching	football	1	paris 2024	1998
2276	united states of america	katie ledecky	swimming	4	london 2012	1997
2277	slovenia	katja fain	swimming	1	tokyo 2020	2001
2278	hungary	katrin gitta klujber	handball	2	tokyo 2020	1999
2279	australia	katrina gorry	football	2	rio 2016	1992
2280	australia	katrina werry	rowing	2	tokyo 2020	1993
2281	norway	katrine lunde	handball	2	tokyo 2020	1980
2282	japan	katsuhiro matsumoto	swimming	2	tokyo 2020	1997
2283	japan	katsuyuki tanamura	water polo	3	rio 2016	1989
2284	great britain	katy marchant	cycling track	3	rio 2016	1993
2285	spain	kauldi odriozola	handball	1	paris 2024	1997
2286	nigeria	kayinsola ajayi	athletics	1	paris 2024	2004
2287	canada	kayla alexander	basketball	2	tokyo 2020	1991
2288	united states of america	kayla canett	rugby sevens	2	tokyo 2020	1998
2289	south africa	kayla de waal	hockey	1	paris 2024	2000
2290	south africa	kayla swarts	hockey	1	paris 2024	2003
2291	australia	kaylee mckeown	swimming	2	tokyo 2020	2001
2292	united states of america	kaylyn brown	athletics	1	paris 2024	2004
2293	türkiye	kayra ozdemir	judo	1	paris 2024	1988
2294	japan	kazuki iimura	fencing	1	paris 2024	2003
2295	japan	kazuki takahashi	athletics	1	paris 2024	1996
2296	japan	kazuma kaya	artistic gymnastics	2	tokyo 2020	1996
2297	japan	kazuma tomoto	equestrian	2	tokyo 2020	1983
2298	japan	kazuma ueda	rugby sevens	1	paris 2024	2002
2299	japan	kazuyasu minobe	fencing	3	rio 2016	1987
2300	united states of america	keana hunter	artistic swimming	1	paris 2024	2004
2301	great britain	keanna louise macinnes	swimming	1	paris 2024	2001
2302	new zealand	keegan hornblow	cycling track	1	paris 2024	2001
2303	south africa	keenan craig horne	hockey	2	tokyo 2020	1992
2304	new zealand	kees sims	football	1	paris 2024	2003
2305	australia	keesja gofers	water polo	3	rio 2016	1990
2306	japan	keigo okawa	water polo	3	rio 2016	1990
2307	japan	kein sato	football	1	paris 2024	2001
2308	japan	keisei tominaga	3x3 basketball	2	tokyo 2020	2001
2309	united states of america	kelee lepage	hockey	1	paris 2024	1997
2310	australia	kelland o'brien	cycling track	2	tokyo 2020	1998
2311	canada	kelly deguchi	judo	1	paris 2024	1999
2312	netherlands	kelly dulfer	handball	3	rio 2016	1994
2313	ireland	kelly murphy	cycling track	1	paris 2024	1989
2314	canada	kelly olynyk	basketball	1	paris 2024	1991
2315	brazil	kelly rosa	handball	1	paris 2024	2004
2316	united states of america	kelsey bing	hockey	1	paris 2024	1997
2317	canada	kelsey mitchell	cycling track	2	tokyo 2020	1993
2318	united states of america	kelsey plum	3x3 basketball	2	tokyo 2020	1994
2319	united states of america	kelsey reelick	rowing	1	paris 2024	1991
2320	united states of america	kelsey robinson	volleyball	3	rio 2016	1992
2321	jamaica	kemba nelson	athletics	1	paris 2024	2000
2322	south africa	kemisetso baloyi	rugby sevens	1	paris 2024	1998
2323	australia	kendall brodie	rowing	1	paris 2024	1991
2324	zambia	kennedy luchembe	athletics	1	paris 2024	2001
2325	united states of america	kenneth bednarek	athletics	2	tokyo 2020	1998
2326	united states of america	kent farrington	equestrian	3	rio 2016	1980
2327	japan	kenta araki	water polo	2	tokyo 2020	1995
2328	japan	kentaro sato	athletics	2	tokyo 2020	1994
2329	japan	kentaro takahashi	volleyball	1	paris 2024	1995
2330	japan	kento miyaura	volleyball	1	paris 2024	1999
2331	france	kenza dali	football	1	paris 2024	1991
2332	canada	kenzie priddell	artistic swimming	1	paris 2024	1997
2333	brazil	kerolin	football	1	paris 2024	1999
2334	new zealand	kerri williams	rowing	1	paris 2024	1993
2335	brazil	ketleyn quadros	judo	3	beijing 2008	1987
2336	belgium	kevin borlee	athletics	5	beijing 2008	1988
2337	united states of america	kevin durant	basketball	4	london 2012	1988
2338	germany	kevin kranz	athletics	1	paris 2024	1998
2339	australia	kevin mcnab	equestrian	2	tokyo 2020	1978
2340	united states of america	kevin paredes	football	1	paris 2024	2003
2341	paraguay	kevin parzajuk	football	1	paris 2024	2002
2342	france	kevin staut	equestrian	3	london 2012	1980
2343	france	kevin tillie	volleyball	3	rio 2016	1990
2344	kenya	kevin wekesa	rugby sevens	1	paris 2024	2000
2345	argentina	kevin zenon	football	1	paris 2024	2001
2346	united states of america	kevon williams	rugby sevens	2	tokyo 2020	1991
2347	canada	keyara wardley	rugby sevens	2	tokyo 2020	2000
2348	people's republic of china	keyi chen	rugby sevens	2	tokyo 2020	1995
2349	saudi arabia	khaled almobty	equestrian	1	paris 2024	1998
2350	egypt	khalid assar	table tennis	2	rio 2016	1992
2351	uzbekistan	khalimajon kurbonova	judo	1	paris 2024	2002
2352	south sudan	khaman madit maluach	basketball	1	paris 2024	2006
2353	canada	khem birch	basketball	1	paris 2024	1992
2354	uzbekistan	khusain norchaev	football	1	paris 2024	2002
2355	mongolia	khuslen otgonbayar	judo	1	paris 2024	2004
2356	uzbekistan	khusniddin alikulov	football	1	paris 2024	1999
2357	canada	kia nurse	basketball	3	rio 2016	1996
2358	australia	kiera gazzard	artistic swimming	2	tokyo 2020	2001
2359	united states of america	kieran smith	swimming	2	tokyo 2020	2000
2360	japan	kiko seike	football	1	paris 2024	1996
2361	france	kiliann sildillia	football	1	\N	2002
2362	netherlands	kim busch	swimming	2	tokyo 2020	1998
2363	netherlands	kim emmen	equestrian	1	paris 2024	1995
2364	netherlands	kim molenaar	handball	1	paris 2024	2002
2365	unknown	kim polling	judo	2	rio 2016	1991
2366	peru	kimberly garcia	athletics	3	rio 2016	1993
2367	mexico	kimberly salazar	rhythmic gymnastics	1	paris 2024	2004
2368	canada	kindred paul	water polo	2	tokyo 2020	1996
2369	hungary	kinga debreczeni-klivinyi	handball	1	paris 2024	1992
2370	hungary	kinga janurik	handball	2	tokyo 2020	1991
2371	japan	kippei ishida	rugby sevens	2	tokyo 2020	2000
2372	japan	kippei taninaka	rugby sevens	1	paris 2024	2000
2373	germany	kira horn	hockey	2	tokyo 2020	1995
2374	ukraine	kira shyrykina	rhythmic gymnastics	1	paris 2024	2008
2375	netherlands	kira toussaint	swimming	3	rio 2016	1994
2376	ukraine	kiril fesiun	football	1	paris 2024	2002
2377	jamaica	kishane thompson	athletics	1	paris 2024	2001
2378	netherlands	kitty lynn joustra	water polo	2	tokyo 2020	1998
2379	japan	kiyomu date	water polo	1	paris 2024	1997
2380	germany	klara buehl	football	1	paris 2024	2000
2381	poland	klaudia alagierska	volleyball	1	paris 2024	1996
2382	slovenia	klemen cebulj	volleyball	1	paris 2024	1992
2383	slovenia	klemen ferlin	handball	1	paris 2024	1989
2384	uruguay	koba brazionis	rugby sevens	1	paris 2024	1998
2385	netherlands	koen bijen	hockey	1	paris 2024	1998
2386	netherlands	koen metsemakers	rowing	2	tokyo 2020	1992
2387	japan	kohane ushioku	artistic gymnastics	1	paris 2024	2004
2388	japan	koki kano	fencing	2	tokyo 2020	1997
2389	japan	koki saito	football	1	paris 2024	2001
2390	japan	koki ueyama	athletics	1	paris 2024	1999
2391	fiji	kolora lomani	rugby sevens	1	paris 2024	1999
2392	hungary	kolos csizmadia	canoe sprint	2	tokyo 2020	1995
2393	japan	komaki kikuchi	fencing	1	paris 2024	1997
2394	japan	konosuke yanagimoto	swimming	1	tokyo 2020	2003
2395	croatia	konstantin kharkov	water polo	1	paris 2024	1997
2396	greece	konstantinos emmanouil stamou	swimming	1	paris 2024	2003
2397	greece	konstantinos englezakis	swimming	1	tokyo 2020	2001
2398	greece	konstantinos genidounias	water polo	3	rio 2016	1993
2399	greece	konstantinos kakaris	water polo	1	paris 2024	1999
2400	greece	konstantinos mitoglou	basketball	1	paris 2024	1996
2401	united states of america	korbin albert	football	1	paris 2024	2003
2402	poland	kornelia fiedkiewicz	swimming	2	tokyo 2020	2001
2403	greece	kostas papanikolaou	basketball	1	paris 2024	1990
2404	japan	kosuke yasuhira	handball	1	paris 2024	2000
2405	japan	kota takai	football	1	paris 2024	2004
2406	japan	kotona hayashi	volleyball	2	tokyo 2020	1999
2407	japan	koyomi iwasaki	volleyball	1	paris 2024	1989
2408	canada	krissy scurfield	rugby sevens	1	paris 2024	2003
2409	latvia	kristaps neretnieks	equestrian	2	tokyo 2020	1989
2410	united states of america	kristen faulkner	cycling road	1	paris 2024	1992
2411	canada	kristen kit	rowing	2	tokyo 2020	1988
2412	south africa	kristen paton	hockey	2	tokyo 2020	1996
2413	united states of america	kristi kirshe	rugby sevens	2	tokyo 2020	1994
2414	norway	kristian bjoernsen	handball	2	tokyo 2020	1989
2415	norway	kristian blummenfelt	triathlon	3	rio 2016	1994
2416	sweden	kristian karlsson	table tennis	3	rio 2016	1991
2417	norway	kristian saeveraas	handball	2	tokyo 2020	1996
2418	australia	kristie edwards	athletics	1	paris 2024	2000
2419	sweden	kristin thorleifsdottir	handball	2	tokyo 2020	1998
2420	denmark	kristina joergensen	handball	1	paris 2024	1998
2421	canada	kristina walker	rowing	2	tokyo 2020	1996
2422	norway	kristine breistoel	handball	2	tokyo 2020	1993
2423	norway	kristine strand amundsen	canoe sprint	1	paris 2024	1998
2424	slovenia	kristjan horzen	handball	1	paris 2024	1999
2425	hungary	kristof palasics	handball	1	paris 2024	2002
2426	norway	kristoffer brun	rowing	4	london 2012	1988
2427	australia	kristy wallace	basketball	1	paris 2024	1996
2428	hungary	krisztian manhercz	water polo	3	rio 2016	1997
2429	hungary	krisztian rabb	fencing	1	paris 2024	2001
2430	hungary	krisztian toth	judo	3	rio 2016	1994
2431	hungary	krisztina garda	water polo	3	rio 2016	1994
2432	unknown	krystsina tsimanouskaya	athletics	2	tokyo 2020	1996
2433	poland	ksawery masiuk	swimming	1	paris 2024	2004
2434	south sudan	kuany ngor kuany	basketball	1	paris 2024	1994
2435	iraq	kumel saadi	football	1	paris 2024	2004
2436	japan	kumiko okada	athletics	3	rio 2016	1991
2437	new zealand	kurtis imrie	canoe sprint	2	tokyo 2020	1996
2438	australia	ky willott	hockey	1	paris 2024	2001
2439	belgium	kyara linskens	basketball	2	tokyo 2020	1996
2440	australia	kyle chalmers	swimming	3	rio 2016	1998
2441	ireland	kyle marshall	hockey	1	paris 2024	1998
2442	canada	kylie masse	swimming	3	rio 2016	1996
2443	japan	kyosuke matsuyama	fencing	2	tokyo 2020	1996
2444	canada	kyra constantine	athletics	2	tokyo 2020	1998
2445	australia	kyra cooney-cross	football	2	tokyo 2020	2002
2446	netherlands	kyra lamberink	cycling track	1	paris 2024	1996
2447	united states of america	kyree king	athletics	1	paris 2024	1994
2448	republic of korea	kyungmin kang	handball	2	tokyo 2020	1996
2449	new zealand	lachlan bayliss	football	1	paris 2024	2002
2450	australia	lachlan kennedy	athletics	1	paris 2024	2003
2451	australia	lachlan robert edwards	water polo	2	tokyo 2020	1995
2452	australia	lachlan thomas sharp	hockey	2	tokyo 2020	1997
2453	france	laelys alavez	artistic swimming	1	paris 2024	2007
2454	canada	laeticia amihere	basketball	2	tokyo 2020	2001
2455	france	laetitia guapo	3x3 basketball	2	tokyo 2020	1995
2456	spain	laia aleixandri	football	1	paris 2024	2000
2457	spain	laia codina	football	1	paris 2024	2000
2458	netherlands	laila youssifou	rowing	2	tokyo 2020	1996
2459	fiji	laisana likuceva	rugby sevens	2	tokyo 2020	1999
2460	india	lalit kumar upadhyay	hockey	2	tokyo 2020	1993
2461	samoa	lalomilo lalomilo	rugby sevens	1	paris 2024	1999
2462	azerbaijan	laman alimuradova	rhythmic gymnastics	2	tokyo 2020	2004
2463	egypt	lamar behairy	rhythmic gymnastics	1	paris 2024	2007
2464	kenya	lamec ambetsa kokoyo	rugby sevens	1	paris 2024	2000
2465	italy	lamont marcell jacobs	athletics	2	tokyo 2020	1994
2466	australia	lani pallister	swimming	1	paris 2024	2002
2467	people's republic of china	lanjing wang	rhythmic gymnastics	1	paris 2024	2005
2468	france	lara andres	water polo	1	paris 2024	2006
2469	argentina	lara casas	hockey	1	paris 2024	2004
2470	belgium	lara de liederkerke-meier	equestrian	2	tokyo 2020	1988
2471	spain	lara gonzalez	handball	3	rio 2016	1992
2472	brazil	larissa araujo	handball	2	tokyo 2020	1992
2473	netherlands	larissa nusser	handball	2	tokyo 2020	2000
2474	belgium	larissa pauluis	equestrian	2	tokyo 2020	1980
2475	brazil	larissa pimenta	judo	2	tokyo 2020	1999
2476	netherlands	lars balk	hockey	2	tokyo 2020	1996
2477	georgia	lasha bekauri	judo	2	tokyo 2020	2000
2478	georgia	lasha shavdatuashvili	judo	4	london 2012	1992
2479	denmark	lasse andersson	handball	2	tokyo 2020	1994
2480	denmark	lasse bro madsen	canoe sprint	1	paris 2024	1994
2481	germany	lasse luehrs	triathlon	1	paris 2024	1996
2482	mali	lassine diarra	football	1	paris 2024	2002
2483	hungary	laszlo bartucz	handball	1	paris 2024	1991
2484	new zealand	laticia-leigh transom	swimming	1	paris 2024	2001
2485	netherlands	laura aarts	water polo	1	paris 2024	1996
2486	spain	laura barrios navarro	hockey	2	tokyo 2020	2000
2487	great britain	laura collett	equestrian	2	tokyo 2020	1989
2488	colombia	laura cristina mojica chalarca	athletics	1	paris 2024	2000
2489	spain	laura ester ramos	water polo	4	london 2012	1990
2490	france	laura flippes	handball	2	tokyo 2020	1994
2491	germany	laura freigang	football	1	paris 2024	1998
2492	spain	laura gil	basketball	3	rio 2016	1992
2493	france	laura glauser	handball	2	rio 2016	1993
2494	france	laura gonzalez	artistic swimming	1	paris 2024	2000
2495	australia	laura gourley	rowing	1	\N	2002
2496	united states of america	laura kraut	equestrian	4	sydney 2000	1965
2497	germany	laura lindemann	triathlon	3	rio 2016	1996
2498	netherlands	laura maria nunnink	hockey	2	tokyo 2020	1995
2499	spain	laura martinez abelenda	judo	1	paris 2024	1998
2500	italy	laura paris	rhythmic gymnastics	1	paris 2024	2002
2501	germany	laura riedemann	swimming	1	tokyo 2020	1998
2502	great britain	laura roper	hockey	1	paris 2024	1988
2503	germany	laura suessemilch	cycling track	2	tokyo 2020	1997
2504	france	laura tremble	artistic swimming	2	tokyo 2020	1999
2505	netherlands	laura van der heijden	handball	3	rio 2016	1990
2506	netherlands	laura van der winkel	archery	1	paris 2024	2001
2507	belgium	laure resimont	basketball	1	paris 2024	1998
2508	united states of america	lauren carlini	volleyball	1	paris 2024	1995
2509	united states of america	lauren doyle	rugby sevens	3	rio 2016	1991
2510	nigeria	lauren ebo	basketball	1	paris 2024	2000
2511	canada	lauren gale	athletics	2	tokyo 2020	2000
2512	great britain	lauren henry	rowing	1	paris 2024	2001
2513	great britain	lauren irwin	rowing	1	paris 2024	1998
2514	australia	lauren jackson	basketball	5	sydney 2000	1981
2515	australia	lauren mansfield	3x3 basketball	1	paris 2024	1989
2516	united states of america	lauren o'connor	rowing	1	paris 2024	1998
2517	united states of america	lauren scruggs	fencing	1	paris 2024	2003
2518	great britain	lauren torley	rugby sevens	1	paris 2024	1999
2519	canada	laurent lavigne	canoe sprint	1	paris 2024	2001
2520	romania	laurentiu danciu	rowing	1	paris 2024	2000
2521	canada	lauriane genest	cycling track	2	tokyo 2020	1998
2522	germany	laurits follert	rowing	2	tokyo 2020	1996
2523	fiji	lavena cavuru	rugby sevens	2	tokyo 2020	1994
2524	great britain	laviai nielsen	athletics	2	tokyo 2020	1996
2525	israel	lea polonsky	swimming	1	paris 2024	2002
2526	germany	lea schueller	football	1	paris 2024	1997
2527	germany	lea sophie friedrich	cycling track	2	tokyo 2020	2000
2528	trinidad and tobago	leah bertrand	athletics	1	paris 2024	2002
2529	united states of america	leah crouse	hockey	1	paris 2024	2000
2530	france	leandra olinga andela	volleyball	1	paris 2024	1997
2531	argentina	leandro brey	football	1	paris 2024	2002
2532	united states of america	lebron james	basketball	4	athens 2004	1984
2533	ireland	lee cole	hockey	1	paris 2024	1995
2534	united states of america	lee kiefer	fencing	4	london 2012	1994
2535	great britain	lee morton	hockey	1	paris 2024	1995
2536	colombia	leicy santos	football	2	rio 2016	1996
2537	australia	leigh hoffman	cycling track	2	tokyo 2020	2000
2538	brazil	leila dos santos silva	rugby sevens	1	tokyo 2020	1996
2539	france	leila lacan	basketball	1	paris 2024	2004
2540	germany	lena charlotte reissner	cycling track	1	paris 2024	2000
2541	france	lena grandveau	handball	1	paris 2024	2003
2542	germany	lena micheel	hockey	2	tokyo 2020	1998
2543	switzerland	lena wernli	athletics	1	paris 2024	2001
2544	netherlands	lennart van lierop	rowing	1	paris 2024	1994
2545	france	leo bergere	triathlon	2	tokyo 2020	1996
2546	japan	leobrian kokubo	football	1	paris 2024	2001
2547	new zealand	leon hayward	hockey	2	tokyo 2020	1990
2548	france	leon marchand	swimming	2	tokyo 2020	2002
2549	brazil	leonardo goncalves	judo	1	paris 2024	1996
2550	brazil	leonardo meindl	basketball	1	paris 2024	1993
2551	italy	leonardo pietra caprina	rowing	1	paris 2024	1997
2552	argentina	leonel maciel	handball	2	tokyo 2020	1989
2553	kenya	leonida kasaya	volleyball	2	tokyo 2020	1993
2554	germany	leonie fiebich	basketball	1	paris 2024	2000
2555	germany	leonie menzel	rowing	2	tokyo 2020	1999
2556	switzerland	leonie pointet	athletics	1	paris 2024	2001
2557	spain	leonor rodriguez	basketball	3	rio 2016	1991
2558	romania	leontin nutescu	rowing	1	paris 2024	2004
2559	new zealand	leroy carter	rugby sevens	1	paris 2024	1999
2560	people's republic of china	letian wan	swimming	1	paris 2024	2004
2561	spain	leticia romero	basketball	2	rio 2016	1995
2562	italy	letizia paternoster	cycling track	2	tokyo 2020	1999
2563	botswana	letsile tebogo	athletics	1	paris 2024	2003
2564	singapore	levenia sim	swimming	1	paris 2024	2006
2565	romania	levente vancsik	water polo	1	paris 2024	1994
2566	great britain	lewis davey	athletics	1	paris 2024	2000
2567	united states of america	liam corrigan	rowing	2	tokyo 2020	1997
2568	new zealand	liam gillion	football	1	paris 2024	2002
2569	great britain	liam sanford	hockey	2	tokyo 2020	1996
2570	colombia	liana salazar	football	3	london 2012	1992
2571	south africa	libbie janse van rensberg	rugby sevens	1	paris 2024	1994
2572	australia	lidiia iakovleva	rhythmic gymnastics	2	tokyo 2020	2003
2573	netherlands	lieke klaver	athletics	2	tokyo 2020	1998
2574	netherlands	lieke rogge	water polo	1	paris 2024	2000
2575	netherlands	lieke wevers	artistic gymnastics	3	rio 2016	1991
2576	israel	liel abada	football	1	paris 2024	2001
2577	belgium	lien hillewaert	hockey	1	paris 2024	1997
2578	france	lili dezou	rugby sevens	1	paris 2024	2004
2579	people's republic of china	lili wang	3x3 basketball	2	tokyo 2020	1992
2580	romania	lilia cosman	artistic gymnastics	1	paris 2024	2007
2581	angola	liliane mario	handball	1	paris 2024	2004
2582	hungary	lilla minna abraham	swimming	1	paris 2024	2006
2583	united states of america	lilly king	swimming	3	rio 2016	1997
2584	spain	lilou lluis valette	artistic swimming	1	paris 2024	2006
2585	australia	lily alton	rowing	1	paris 2024	1998
2586	great britain	lily owsley	hockey	3	rio 2016	1994
2587	united states of america	lily williams	cycling track	2	tokyo 2020	1994
2588	united states of america	lily zhang	table tennis	4	london 2012	1996
2589	germany	lina sontag	basketball	1	paris 2024	2003
2590	sweden	linda bergstroem	table tennis	2	tokyo 2020	1995
2591	colombia	linda caicedo	football	1	paris 2024	2005
2592	italy	linda cerruti	artistic swimming	3	rio 2016	1993
2593	italy	linda de filippis	rowing	1	paris 2024	1999
2594	belgium	lindsay de vylder	cycling track	2	tokyo 2020	1995
2595	united states of america	lindsey horan	football	3	rio 2016	1994
2596	denmark	line haugsted	handball	1	paris 2024	1994
2597	norway	line kloster	athletics	2	tokyo 2020	1990
2598	people's republic of china	ling zhang	rowing	3	rio 2016	1997
2599	sweden	linn blohm	handball	3	rio 2016	1992
2600	germany	linnea weidemann	hockey	1	paris 2024	2003
2601	people's republic of china	linyu diao	volleyball	1	paris 2024	1994
2602	switzerland	lionel spitz	athletics	1	paris 2024	2001
2603	germany	lisa antl	handball	1	paris 2024	2000
2604	france	lisa barbelin	archery	2	tokyo 2020	2000
2605	new zealand	lisa carrington	canoe	4	london 2012	1989
2606	germany	lisa klein	cycling track	2	tokyo 2020	1996
2607	switzerland	lisa loetscher	rowing	1	paris 2024	2000
2608	germany	lisa marie kwayie	athletics	2	tokyo 2020	1996
2609	germany	lisa mayer	athletics	3	rio 2016	1996
2610	germany	lisa nolte	hockey	1	paris 2024	2001
2611	austria	lisa perterer	triathlon	3	london 2012	1991
2612	netherlands	lisa post	hockey	1	paris 2024	1999
2613	germany	lisa tertsch	triathlon	1	paris 2024	1998
2614	great britain	lisa thomson	rugby sevens	2	tokyo 2020	1997
2615	netherlands	lisanne de witte	athletics	3	rio 2016	1992
2616	south africa	liske lategan	rugby sevens	1	paris 2024	1998
2617	cuba	lisneidy veitia	athletics	3	rio 2016	1994
2618	people's republic of china	liu yang	hockey	1	paris 2024	1998
2619	people's republic of china	liuyi wang	artistic swimming	1	paris 2024	1997
2620	people's republic of china	liwei fei	swimming	1	paris 2024	2003
2621	people's republic of china	liwei yang	basketball	2	tokyo 2020	1995
2622	people's republic of china	liying yuan	cycling track	1	paris 2024	2005
2623	hungary	liza pusztai	fencing	2	tokyo 2020	2001
2624	mexico	lizeth rueda	swimming	2	london 2012	1994
2625	new zealand	logan ullrich	rowing	1	paris 2024	2000
2626	france	loic bade	football	1	paris 2024	2000
2627	belgium	loic van doren	hockey	1	paris 2024	1996
2628	kenya	loice masitsa simiyu	volleyball	1	paris 2024	2001
2629	belgium	loick luypaert	hockey	3	rio 2016	1991
2630	netherlands	lois abbingh	handball	3	rio 2016	1992
2631	great britain	lola anderson	rowing	1	paris 2024	1998
2632	netherlands	lola moolhuijzen	water polo	1	paris 2024	2004
2633	spain	lola riera	hockey	3	rio 2016	1991
2634	people's republic of china	ma long	table tennis	4	london 2012	1988
2635	netherlands	loran de munck	artistic gymnastics	1	paris 2024	1999
2636	croatia	loren fatovic	water polo	2	tokyo 2020	1996
2637	brazil	lorena	football	1	paris 2024	1997
2638	brazil	lorenne geraldo teixeira	volleyball	1	paris 2024	1996
2639	spain	lorenzo brown	basketball	1	paris 2024	1990
2640	italy	lorenzo bruni	water polo	1	paris 2024	1994
2641	italy	lorenzo minh casali	artistic gymnastics	1	paris 2024	2002
2642	italy	lorenzo patta	athletics	2	tokyo 2020	2000
2643	kenya	lorine chebet kaei	volleyball	2	tokyo 2020	1999
2644	canada	lorne wigginton	swimming	1	paris 2024	2005
2645	brazil	lorrane oliveira	artistic gymnastics	2	rio 2016	1998
2646	norway	lotte miller	triathlon	2	tokyo 2020	1996
2647	france	lou noel	rugby sevens	1	paris 2024	2000
2648	great britain	louie hinchliffe	athletics	1	paris 2024	2002
2649	denmark	louise burgaard	handball	2	london 2012	1992
2650	france	louise guillet	water polo	1	paris 2024	1986
2651	sweden	louise hansson	swimming	3	rio 2016	1996
2652	france	louise maraval	athletics	1	paris 2024	2001
2653	sweden	louise romeike	equestrian	2	tokyo 2020	1990
2654	egypt	loulwa soliman	fencing	1	paris 2024	2007
2655	croatia	lovro mihic	handball	1	paris 2024	1994
2656	france	lozea vilarino	rhythmic gymnastics	1	paris 2024	2003
2657	austria	lubjana piovesana	judo	1	paris 2024	1997
2658	germany	luca armbruster	swimming	1	paris 2024	2001
2659	italy	luca chiumento	rowing	1	paris 2024	1997
2660	united states of america	luca cupido	water polo	3	rio 2016	1995
2661	italy	luca curatoli	fencing	2	tokyo 2020	1994
2662	switzerland	luca giubellini	artistic gymnastics	1	paris 2024	2003
2663	italy	luca porro	volleyball	1	paris 2024	2004
2664	italy	luca rambaldi	rowing	2	tokyo 2020	1994
2665	italy	luca sito	athletics	1	paris 2024	2003
2666	germany	luca spiegel	cycling track	1	paris 2024	2004
2667	hungary	luca virag szucs	fencing	1	paris 2024	2002
2668	germany	luca witzke	handball	1	paris 2024	1999
2669	germany	lucas ansah-peprah	athletics	2	tokyo 2020	2000
2670	argentina	lucas beltran	football	1	paris 2024	2001
2671	brazil	lucas carvalho	athletics	2	tokyo 2020	1993
2672	brazil	lucas dias	basketball	1	paris 2024	1995
2673	france	lucas dussoulier	3x3 basketball	1	paris 2024	1996
2674	germany	lucas joachim matzerath	swimming	2	tokyo 2020	2000
2675	united states of america	lucas lacamp	rugby sevens	1	paris 2024	2001
2676	argentina	lucas martinez	hockey	2	tokyo 2020	1993
2677	france	lucas montecot	hockey	1	paris 2024	2001
2678	argentina	lucas moscariello	handball	2	tokyo 2020	1992
2679	sweden	lucas pellas	handball	2	tokyo 2020	1995
2680	brazil	lucas saatkamp	volleyball	4	london 2012	1986
2681	argentina	lucas toscani	hockey	1	paris 2024	1999
2682	canada	lucas van berkel	volleyball	2	tokyo 2020	1991
2683	brazil	lucas vilar	athletics	2	tokyo 2020	2001
2684	spain	lucia garcia	football	1	paris 2024	1998
2685	spain	lucia jimenez	hockey	3	rio 2016	1997
2686	argentina	luciano de cecco	volleyball	4	london 2012	1988
2687	argentina	luciano gonzalez	rugby sevens	2	tokyo 2020	1997
2688	argentina	luciano palonsky	volleyball	1	paris 2024	1999
2689	argentina	luciano vicentin	volleyball	1	paris 2024	2000
2690	belgium	lucie breyne	hockey	1	paris 2024	2000
2691	france	lucie ehrmann	hockey	1	paris 2024	1998
2692	france	lucie granier	handball	1	paris 2024	1999
2693	france	lucile tessariol	swimming	1	tokyo 2020	2004
2694	france	lucille gicquel	volleyball	1	paris 2024	1997
2695	italy	lucrezia ruggiero	artistic swimming	1	paris 2024	2000
2696	great britain	lucy hope	swimming	1	tokyo 2020	1997
2697	ireland	lucy rock	rugby sevens	1	paris 2024	1993
2698	brazil	ludmila	football	2	tokyo 2020	1994
2699	france	ludovic fabregas	handball	3	rio 2016	1996
2700	canada	luguentz dort	basketball	1	paris 2024	1999
2701	france	luidgi midelton	fencing	1	paris 2024	1998
2702	italy	luigi samele	fencing	3	london 2012	1987
2703	spain	luis calzado	hockey	1	paris 2024	2000
2704	spain	luis dominguez	swimming	1	paris 2024	2003
2705	venezuela	luis fernando larrazabal	equestrian	1	paris 2024	1992
2706	germany	luisa geiselsoder	basketball	1	paris 2024	2000
2707	mexico	luisa rodriguez rubio	artistic swimming	1	paris 2024	1994
2708	dominican republic	luiyi de lucas	football	1	paris 2024	1994
2709	brazil	luiza campos	rugby sevens	3	rio 2016	1990
2710	croatia	luka bukic	water polo	3	rio 2016	1994
2711	croatia	luka cindric	handball	1	paris 2024	1993
2712	france	luka karabatic	handball	3	rio 2016	1988
2713	croatia	luka loncar	water polo	3	rio 2016	1987
2714	croatia	luka lovre klarica	handball	1	paris 2024	2001
2715	france	luka mkheidze	judo	2	tokyo 2020	1996
2716	germany	lukas dauser	artistic gymnastics	3	rio 2016	1993
2717	brazil	lukas felipe bergmann	volleyball	1	paris 2024	2004
2718	denmark	lukas joergensen	handball	1	paris 2024	1999
2719	germany	lukas kampa	volleyball	2	london 2012	1986
2720	new zealand	lukas kelly-heald	football	1	paris 2024	2005
2721	germany	lukas maase	volleyball	1	paris 2024	1998
2722	germany	lukas martens	swimming	2	tokyo 2020	2001
2723	germany	lukas mertens	handball	1	paris 2024	1996
2724	sweden	lukas sandell	handball	2	tokyo 2020	1997
2725	germany	lukas windfeder	hockey	2	tokyo 2020	1995
2726	poland	lukasz kaczmarek	volleyball	2	tokyo 2020	1994
2727	canada	luke herr	volleyball	1	paris 2024	1994
2728	united states of america	luke hobson	swimming	1	paris 2024	2003
2729	australia	luke pavillard	water polo	1	paris 2024	1996
2730	great britain	luke whitehouse	artistic gymnastics	1	paris 2024	2002
2731	australia	luke willian	triathlon	1	paris 2024	1996
2732	germany	luna bulmahn	athletics	1	paris 2024	1999
2733	netherlands	luna noa fokke	hockey	1	paris 2024	2001
2734	zambia	lushomo mweemba	football	2	tokyo 2020	2001
2735	mexico	luz daniela gaxiola gonzalez	cycling track	2	tokyo 2020	1992
2736	united states of america	lynn williams	football	2	tokyo 2020	1993
2737	spain	lysa tchaptchet	handball	1	paris 2024	2001
2738	south africa	lythe pillay	athletics	2	tokyo 2020	2003
2739	ukraine	lyudmila olyanovska	athletics	2	tokyo 2020	1993
2740	netherlands	maaike de waard	swimming	2	tokyo 2020	1996
2741	netherlands	maartje keuning	water polo	2	tokyo 2020	1998
2742	côte d'ivoire	maboundou kone	athletics	1	paris 2024	1997
2743	new zealand	macey fraser	football	1	paris 2024	2002
2744	australia	mackenzie arnold	football	3	rio 2016	1994
2745	new zealand	mackenzie barry	football	1	paris 2024	2001
2746	brazil	macris fernanda silva carneiro	volleyball	2	tokyo 2020	1989
2747	australia	maddison brooks	hockey	1	paris 2024	2004
2748	australia	maddison levi	rugby sevens	2	tokyo 2020	2002
2749	france	madeleine malonga	judo	2	tokyo 2020	1993
2750	united states of america	madeleine wanamaker	rowing	2	tokyo 2020	1995
2751	united states of america	madeleine zimmer	hockey	1	paris 2024	2001
2752	dominican republic	madeline jazmin guillen paredes	volleyball	1	paris 2024	2001
2753	united states of america	madeline musselman	water polo	3	rio 2016	1998
2754	guinea	madiou keita	football	1	paris 2024	2003
2755	united states of america	madison hughes	rugby sevens	3	rio 2016	1992
2756	france	maelle lakrar	football	1	paris 2024	2000
2757	australia	maeve plouffe	cycling track	2	tokyo 2020	1999
2758	united states of america	magda skarbonkiewicz	fencing	1	paris 2024	2005
2759	poland	magdalena jurczyk	volleyball	1	paris 2024	1995
2760	poland	magdalena niemczyk	athletics	1	paris 2024	2003
2761	romania	magdalena rusu	rowing	2	tokyo 2020	1999
2762	poland	magdalena stefanowicz	athletics	1	paris 2024	2000
2763	poland	magdalena stysiak	volleyball	1	paris 2024	2000
2764	bulgaria	magdalina minevska	rhythmic gymnastics	1	paris 2024	2005
2765	canada	maggie coles-lyster	cycling track	1	paris 2024	1999
2766	united states of america	maggie steffens	water polo	4	london 2012	1993
2767	france	maghnes akliouche	football	1	paris 2024	2002
2768	norway	magnus gullerud	handball	2	tokyo 2020	1991
2769	denmark	magnus jacobsen	handball	2	tokyo 2020	1995
2770	denmark	magnus saugstrup	handball	2	tokyo 2020	1996
2771	denmark	magnus sibbersen	canoe sprint	1	paris 2024	2001
2772	refugee olympic team	mahboubeh barbari yharfi	judo	1	paris 2024	0
2773	poland	maher ben hlima	athletics	1	paris 2024	1989
2774	new zealand	mahina paul	rugby sevens	1	paris 2024	2001
2775	egypt	mahmoud elsayed	fencing	1	paris 2024	2005
2776	egypt	mahmoud nashat mohsen	fencing	1	paris 2024	1995
2777	egypt	mahmoud saber	football	1	paris 2024	2001
2778	japan	mai toriyama	hockey	2	tokyo 2020	1995
2779	japan	mai yamamoto	3x3 basketball	2	tokyo 2020	1999
2780	united states of america	maia chamberlain	fencing	1	paris 2024	1998
2781	united states of america	maia mei weintraub	fencing	1	paris 2024	2002
2782	spain	maica garcia godoy	water polo	4	london 2012	1990
2783	argentina	maico casella	hockey	2	tokyo 2020	1997
2784	japan	maika hamano	football	1	paris 2024	2004
2785	netherlands	maikel van der vleuten	equestrian	4	london 2012	1988
2786	spain	maitane echeverria	handball	1	paris 2024	1997
2787	serbia	maja aleksic	volleyball	2	tokyo 2020	1997
2788	serbia	maja ognjenovic	volleyball	5	beijing 2008	1984
2789	slovenia	maja svetik	handball	1	paris 2024	1996
2790	slovenia	maja vojnovic	handball	1	paris 2024	1998
2791	south sudan	majok deng	basketball	1	paris 2024	1993
2792	united states of america	maka unufe	rugby sevens	2	rio 2016	1991
2793	japan	maki takada	basketball	3	rio 2016	1989
2794	japan	makoto hiejima	basketball	2	tokyo 2020	1990
2795	ukraine	maksym braharu	football	1	paris 2024	2002
2796	ukraine	maksym khlan	football	1	paris 2024	2003
2797	ukraine	maksym talovierov	football	1	paris 2024	2000
2798	poland	maksymilian szwed	athletics	1	paris 2024	2004
2799	poland	maksymilian wechta	equestrian	1	paris 2024	1993
2800	united states of america	malacchi esdale	rugby sevens	1	paris 2024	1995
2801	new zealand	malachi buschl	hockey	1	paris 2024	1999
2802	egypt	malak hamza	fencing	1	paris 2024	2006
2803	poland	malgorzata korycka	equestrian	1	paris 2024	1992
2804	new zealand	malia steinmetz	football	1	paris 2024	1999
2805	sweden	malin baryard-johnsson	equestrian	6	atlanta 1996	1975
2806	united states of america	mallory swanson	football	1	paris 2024	1998
2807	germany	malte hellwig	hockey	1	paris 2024	1997
2808	poland	malwina smarzek	volleyball	1	paris 2024	1996
2809	mali	mamadou tounkara	football	1	paris 2024	2001
2810	japan	mana okamura	artistic gymnastics	1	paris 2024	2005
2811	new zealand	manaia nuku	rugby sevens	1	paris 2024	2002
2812	japan	manami kojima	volleyball	1	paris 2024	1994
2813	india	manav vikash thakkar	table tennis	1	paris 2024	2000
2814	india	mandeep singh	hockey	2	tokyo 2020	1995
2815	france	manelle inaho	rhythmic gymnastics	1	paris 2024	2003
2816	india	manika batra	table tennis	3	rio 2016	1995
2817	italy	manila esposito	artistic gymnastics	1	paris 2024	2006
2818	brazil	manoel messias	triathlon	2	tokyo 2020	1996
2819	france	manon brunet	fencing	3	rio 2016	1996
2820	india	manpreet singh	hockey	4	london 2012	1992
2821	france	manu kone	football	1	paris 2024	2001
2822	italy	manuel frigo	swimming	1	tokyo 2020	1997
2823	portugal	manuel grave	equestrian	1	paris 2024	1989
2824	spain	manuel guijarro	athletics	1	paris 2024	1998
2825	italy	manuel lombardo	judo	2	tokyo 2020	1998
2826	germany	manuel sanders	athletics	2	tokyo 2020	1998
2827	colombia	manuela pavi	football	1	paris 2024	2000
2828	colombia	manuela vanegas	football	1	paris 2024	2000
2829	people's republic of china	manyu wang	table tennis	2	tokyo 2020	1999
2830	japan	mao hosoya	football	1	paris 2024	2001
2831	germany	maodo lo	basketball	2	tokyo 2020	1992
2832	italy	mara navarria	fencing	3	london 2012	1985
2833	germany	marc koch	athletics	2	tokyo 2020	1994
2834	spain	marc larumbe gonfaus	water polo	2	tokyo 2020	1994
2835	spain	marc miralles	hockey	1	paris 2024	1997
2836	spain	marc pubill	football	1	paris 2024	2003
2837	spain	marc recasens llobet	hockey	2	tokyo 2020	1999
2838	spain	marc reyne	hockey	1	paris 2024	1999
2839	spain	marc vizcaino	hockey	1	paris 2024	1999
2840	azerbaijan	marcedes walker	3x3 basketball	1	paris 2024	1986
2841	brazil	marcela arounian	handball	1	paris 2024	2000
2842	colombia	marcela restrepo	football	1	paris 2024	1995
2843	brazil	marcelinho huertas	basketball	3	london 2012	1983
2844	brazil	marcelle souza	rugby sevens	1	paris 2024	1996
2845	brazil	marcelo chierighini	swimming	4	london 2012	1991
2846	paraguay	marcelo fernandez	football	1	paris 2024	2001
2847	paraguay	marcelo perez	football	1	paris 2024	2001
2848	poland	marcin janusz	volleyball	1	paris 2024	1994
2849	poland	marcin karolewski	athletics	1	paris 2024	2002
2850	brazil	marcio carvalho jorge	equestrian	3	london 2012	1975
2851	italy	marco del lungo	water polo	3	rio 2016	1990
2852	argentina	marco di cesare	football	1	paris 2024	2002
2853	germany	marco miltkau	hockey	1	paris 2024	1990
2854	portugal	marcos freitas	table tennis	5	beijing 2008	1988
2855	paraguay	marcos gomez	football	1	paris 2024	2001
2856	argentina	marcos moneta	rugby sevens	2	tokyo 2020	2000
2857	australia	marcus berehulak	water polo	1	paris 2024	2003
2858	united states of america	marcus orlob	equestrian	1	paris 2024	1982
2859	united states of america	marcus tupuola	rugby sevens	1	paris 2024	1995
2860	spain	marcus cooper	canoe	2	rio 2016	1994
2861	norway	maren aardahl	handball	1	paris 2024	1994
2862	germany	maren voelz	rowing	1	paris 2024	1999
2863	australia	marena whittle	3x3 basketball	1	paris 2024	1994
2864	united states of america	margaret hedeman	rowing	1	paris 2024	2000
2865	canada	margaret mac neil	swimming	2	tokyo 2020	2000
2866	greece	margarita plevritou	water polo	1	paris 2024	1994
2867	bulgaria	margarita vasileva	rhythmic gymnastics	1	paris 2024	2005
2868	united states of america	margherita guzzi vincenti	fencing	1	paris 2024	1990
2869	italy	margherita panziera	swimming	3	rio 2016	1995
2870	australia	margo joseph-kuo	artistic swimming	1	paris 2024	2004
2871	spain	maria araujo	basketball	1	paris 2024	1997
2872	portugal	maria caetano	equestrian	2	tokyo 2020	1986
2873	argentina	maria campoy	hockey	2	rio 2016	1990
2874	spain	maria cazorla medina	basketball	2	tokyo 2020	1997
2875	spain	maria conde alcolado	basketball	2	tokyo 2020	1997
2876	spain	maria daza garcia	swimming	1	paris 2024	2007
2877	brazil	maria eduarda arakaki	rhythmic gymnastics	2	tokyo 2020	2003
2878	brazil	maria fernanda costa	swimming	1	paris 2024	2002
2879	argentina	maria granatto	hockey	3	rio 2016	1995
2880	spain	maria isabel perez	athletics	2	tokyo 2020	1993
2881	romania	maria lehaci	rowing	1	paris 2024	1999
2882	spain	maria lopez	hockey	3	rio 2016	1990
2883	greece	maria myriokefalitaki	water polo	1	paris 2024	2001
2884	greece	maria patra	water polo	1	paris 2024	1998
2885	brazil	maria paula heitmann	swimming	1	paris 2024	1999
2886	spain	maria perez garcia	athletics	2	tokyo 2020	1996
2887	spain	maria prieto	handball	1	paris 2024	1997
2888	fiji	maria rokotuisiga	rugby sevens	1	paris 2024	2001
2889	poland	maria stenzel	volleyball	1	paris 2024	1998
2890	portugal	maria tome	triathlon	1	paris 2024	2001
2891	south africa	maria tshiremba	rugby sevens	1	paris 2024	1995
2892	netherlands	maria verschoor	hockey	3	rio 2016	1994
2893	norway	maria virik	canoe sprint	1	paris 2024	1999
2894	sweden	maria von essen	equestrian	1	paris 2024	1980
2895	puerto rico	mariah perez	basketball	1	paris 2024	2000
2896	australia	mariah williams	hockey	3	rio 2016	1995
2897	south sudan	marial shayok	basketball	1	paris 2024	1995
2898	egypt	mariam ahmed	artistic swimming	1	paris 2024	2005
2899	egypt	mariam alhodaby	table tennis	1	paris 2024	2000
2900	brazil	mariana nicolau	rugby sevens	2	tokyo 2020	1997
2901	brazil	mariane fernandes	handball	1	paris 2024	1996
2902	australia	marianna tolo	basketball	3	rio 2016	1989
2903	serbia	marica perisic	judo	2	tokyo 2020	2000
2904	france	marie-antoinette katoto	football	1	paris 2024	1998
2905	canada	marie-eloise leclair	athletics	1	paris 2024	2002
2906	france	marie eve gahie	judo	1	paris 2024	1996
2907	france	marie-eve paget	3x3 basketball	2	tokyo 2020	1994
2908	france	marie-florence candassamy	fencing	2	rio 2016	1991
2909	germany	marie guelich	basketball	1	paris 2024	1994
2910	côte d'ivoire	marie-josee ta lou	athletics	3	rio 2016	1988
2911	france	marie le net	cycling track	2	tokyo 2020	2000
2912	south africa	marie louw	hockey	1	paris 2024	1996
2913	germany	marie reichert	3x3 basketball	1	paris 2024	2001
2914	denmark	marie skytte hauberg johannesen	rowing	1	paris 2024	1997
2915	france	marie wattel	swimming	3	rio 2016	1997
2916	france	marieme badiane	basketball	1	paris 2024	1994
2917	ukraine	mariia vysochanska	rhythmic gymnastics	2	tokyo 2020	2002
2918	serbia	marija dostanic	canoe sprint	1	paris 2024	1999
2919	netherlands	marije van hunenstijn	athletics	2	tokyo 2020	1995
2920	netherlands	marijn veen	hockey	1	paris 2024	1996
2921	poland	marika popowicz-drapala	athletics	4	london 2012	1988
2922	canada	marilia mimides	water polo	1	paris 2024	1997
2923	angola	marilia quizelete	handball	2	tokyo 2020	1997
2924	japan	marin kajiki	rugby sevens	2	tokyo 2020	1999
2925	croatia	marin sipic	handball	1	paris 2024	1996
2926	brazil	marina fioravanti	rugby sevens	2	tokyo 2020	1993
2927	spain	marina garcia polo	artistic swimming	1	paris 2024	2004
2928	germany	marina hegering	football	1	paris 2024	1990
2929	france	marina jehl	swimming	1	paris 2024	2001
2930	italy	marina lubian	volleyball	1	paris 2024	2000
2931	france	marine boyer	artistic gymnastics	3	rio 2016	2000
2932	france	marine fauthoux	basketball	2	tokyo 2020	2001
2933	belgium	marine jehaes	athletics	1	paris 2024	2003
2934	france	marine johannes	basketball	3	rio 2016	1995
2935	canada	mario deslauriers	equestrian	4	los angeles 1984	1965
2936	italy	mario macchiati	artistic gymnastics	1	paris 2024	1999
2937	spain	mario molla yanes	swimming	1	paris 2024	2002
2938	croatia	mario sostaric	handball	1	paris 2024	1992
2939	france	marion borras	cycling track	2	tokyo 2020	1997
2940	spain	mariona caldentey	football	1	paris 2024	1996
2941	spain	mariona ortiz	basketball	1	paris 2024	1992
2942	norway	marit jacobsen	handball	2	tokyo 2020	1994
2943	netherlands	marit kamps	judo	1	paris 2024	2001
2944	romania	marius cozmiuc	rowing	4	london 2012	1992
2945	romania	marius-florin tic	water polo	1	paris 2024	1996
2946	hungary	mark attila banyai	water polo	1	paris 2024	1999
2947	australia	mark nawaqanitawase	rugby sevens	1	paris 2024	2000
2948	ireland	mark roche	rugby sevens	2	tokyo 2020	1993
2949	croatia	marko bijac	water polo	3	rio 2016	1991
2950	serbia	marko brankovic	3x3 basketball	1	paris 2024	1994
2951	serbia	marko dragosavljevic	canoe sprint	1	paris 2024	1994
2952	germany	marko grgic	handball	1	paris 2024	2003
2953	serbia	marko guduric	basketball	1	paris 2024	1995
2954	serbia	marko ivovic	volleyball	1	paris 2024	1990
2955	montenegro	marko mrsic	water polo	1	paris 2024	2003
2956	serbia	marko novakovic	canoe	3	london 2012	1989
2957	serbia	marko podrascanin	volleyball	3	beijing 2008	1987
2958	united states of america	marko vavic	water polo	2	tokyo 2020	1999
2959	croatia	marko zuvela	water polo	1	paris 2024	2001
2960	mexico	marla fernanda arellano germes	artistic swimming	1	paris 2024	2002
2961	netherlands	marleen jochems	hockey	1	paris 2024	2000
2962	poland	marlena karwacka	cycling track	2	tokyo 2020	1997
2963	south africa	marlize de bruin	rugby sevens	1	paris 2024	1994
2964	netherlands	marloes oldenburg	rowing	1	paris 2024	1988
2965	croatia	maro jokovic	water polo	5	beijing 2008	1987
2966	netherlands	marrit jasper	volleyball	1	paris 2024	1996
2967	netherlands	marrit steenbergen	swimming	3	rio 2016	2000
2968	angola	marta alberto	handball	1	paris 2024	1995
2969	italy	marta iacoacci	artistic swimming	1	paris 2024	2000
2970	spain	marta lopez	handball	4	london 2012	1990
2971	spain	marta segu	hockey	1	paris 2024	1995
2972	zambia	martha tembo	football	2	tokyo 2020	1998
2973	netherlands	martijn de veer	artistic gymnastics	1	paris 2024	2002
2974	denmark	martin buch andersen	table tennis	1	paris 2024	2000
2975	spain	martin famera	water polo	2	tokyo 2020	1988
2976	switzerland	martin fuchs	equestrian	3	rio 2016	1992
2977	argentina	martin ramos	volleyball	3	rio 2016	1991
2978	czechia	martin rubes	fencing	1	paris 2024	1996
2979	germany	martin zwicker	hockey	3	rio 2016	1987
2980	italy	martina centofanti	rhythmic gymnastics	3	rio 2016	1998
2981	italy	martina criscio	fencing	2	tokyo 2020	1994
2982	italy	martina favaretto	fencing	1	paris 2024	2001
2983	italy	martina fidanza	cycling track	2	tokyo 2020	1999
2984	spain	martina terre	water polo	1	paris 2024	2002
2985	denmark	martine damborg	swimming	1	paris 2024	2007
2986	hungary	marton vamos	water polo	3	rio 2016	1992
2987	poland	martyna czyrnianska	volleyball	1	paris 2024	2003
2988	poland	martyna jelinska	fencing	2	tokyo 2020	1992
2989	poland	martyna lukasik	volleyball	1	paris 2024	1999
2990	poland	martyna swatowska-wenglarczyk	fencing	1	paris 2024	1994
2991	poland	martyna synoradzka	fencing	2	london 2012	1988
2992	france	mary-ambre moluh	swimming	1	paris 2024	2005
2993	australia	mary fowler	football	2	tokyo 2020	2003
2994	australia	mary hanna	equestrian	7	atlanta 1996	1954
2995	canada	mary-sophie harvey	swimming	2	tokyo 2020	1999
2996	zambia	mary wilombe	football	1	tokyo 2020	1997
2997	ukraine	maryana shostak	athletics	1	paris 2024	2000
2998	serbia	masa jankovic	basketball	1	paris 2024	2000
2999	japan	masahiro sekita	volleyball	2	tokyo 2020	1993
3000	japan	masaru yamada	fencing	2	tokyo 2020	1994
3001	japan	masato kai	volleyball	1	paris 2024	2003
3002	japan	masatora kawano	athletics	2	tokyo 2020	1998
3003	germany	mascha ballhaus	judo	1	paris 2024	2000
3004	japan	mashiro yasunaga	artistic swimming	2	tokyo 2020	1999
3005	italy	massimo stano	athletics	2	tokyo 2020	1992
3006	united states of america	matai leuta	rugby sevens	2	tokyo 2020	1990
3007	hungary	mate lekai	handball	2	london 2012	1988
3008	hungary	mate tamas koch	fencing	1	paris 2024	1999
3009	romania	matei lutescu	water polo	1	paris 2024	2002
3010	slovenia	matej gaber	handball	2	rio 2016	1991
3011	croatia	matej mandic	handball	1	paris 2024	2002
3012	colombia	mateo romero	athletics	1	paris 2024	2003
3013	uruguay	mateo vinals	rugby sevens	1	paris 2024	1998
3014	poland	mateusz bieniek	volleyball	3	rio 2016	1994
3015	poland	mateusz biskup	rowing	3	rio 2016	1994
3016	poland	mateusz chowaniec	swimming	1	paris 2024	2003
3017	brazil	matheus lima	athletics	1	paris 2024	2003
3018	denmark	mathias gidsel	handball	2	tokyo 2020	1999
3019	canada	mathias guillemette	cycling track	1	paris 2024	2002
3020	france	mathias lessort	basketball	1	paris 2024	1995
3021	germany	mathias muller	hockey	2	rio 2016	1992
3022	sweden	mathilda lundstrom	handball	2	tokyo 2020	1996
3023	france	mathilde duffrene	hockey	1	paris 2024	2005
3024	france	mathilde petriaux	hockey	1	paris 2024	1997
3025	south africa	mathrin simmers	rugby sevens	1	paris 2024	1988
3026	croatia	matias biljaka	water polo	1	paris 2024	1999
3027	mexico	matias grande	archery	1	paris 2024	2004
3028	argentina	matias osadczuk	rugby sevens	2	tokyo 2020	1997
3029	argentina	matias rey	hockey	3	rio 2016	1984
3030	argentina	matias sanchez	volleyball	2	tokyo 2020	1996
3031	australia	matilda kearns	water polo	2	tokyo 2020	2000
3032	italy	matilde biagiotti	swimming	1	paris 2024	2005
3033	germany	mats grambusch	hockey	3	rio 2016	1992
3034	great britain	matt aldridge	rowing	1	paris 2024	1996
3035	new zealand	matt macdonald	rowing	2	tokyo 2020	1999
3036	italy	matteo della valle	rowing	1	paris 2024	1998
3037	france	matteo desgouillons	hockey	1	paris 2024	2000
3038	switzerland	matteo giubellini	artistic gymnastics	1	paris 2024	2004
3039	argentina	matteo graziano	rugby sevens	1	paris 2024	2001
3040	italy	matteo iocchi gratta	water polo	1	paris 2024	2002
3041	italy	matteo lodo	rowing	3	rio 2016	1994
3042	italy	matteo melluzzo	athletics	1	paris 2024	2002
3043	italy	matteo piras	judo	1	paris 2024	1993
3044	germany	mattes schoenherr	rowing	1	paris 2024	2000
3045	united states of america	matthew anderson	volleyball	4	london 2012	1987
3046	australia	matthew byrnes	water polo	1	paris 2024	2001
3047	australia	matthew dawson	hockey	3	rio 2016	1994
3048	australia	matthew dellavedova	basketball	4	london 2012	1990
3049	new zealand	matthew garbett	football	2	tokyo 2020	2002
3050	australia	matthew glaetzer	cycling track	4	london 2012	1992
3051	australia	matthew gonzalez	rugby sevens	1	paris 2024	1994
3052	south africa	matthew guise-brown	hockey	2	tokyo 2020	1991
3053	australia	matthew hauser	triathlon	2	tokyo 2020	1998
3054	great britain	matthew haywood	rowing	1	paris 2024	1998
3055	great britain	matthew hudson-smith	athletics	3	rio 2016	1994
3056	ireland	matthew nelson	hockey	1	paris 2024	1998
3057	great britain	matthew richards	swimming	2	tokyo 2020	2002
3058	australia	matthew richardson	cycling track	2	tokyo 2020	1999
3059	new zealand	matthew sheridan	football	1	paris 2024	2004
3060	france	matthew strazel	basketball	1	paris 2024	2002
3061	australia	matthew temple	swimming	2	tokyo 2020	1999
3062	italy	mattia bottolo	volleyball	1	paris 2024	2000
3063	australia	maurice longbottom	rugby sevens	2	tokyo 2020	1995
3064	switzerland	maurin lange	rowing	1	paris 2024	2000
3065	italy	mauro nespoli	archery	5	beijing 2008	1987
3066	germany	max appel	rowing	2	tokyo 2020	1996
3067	new zealand	max brown	canoe sprint	2	tokyo 2020	1995
3068	sweden	max darj	handball	2	tokyo 2020	1991
3069	united states of america	max irving	water polo	2	tokyo 2020	1995
3070	germany	max john	rowing	1	paris 2024	1997
3071	austria	max kuehner	equestrian	1	paris 2024	1974
3072	germany	max lemke	canoe sprint	2	tokyo 2020	1996
3073	ireland	max mc cusker	swimming	1	paris 2024	1999
3074	germany	max rendschmidt	canoe	3	rio 2016	1993
3075	switzerland	max studer	triathlon	2	tokyo 2020	1996
3076	great britain	max whitlock	artistic gymnastics	4	london 2012	1993
3077	france	maxime-gael ngayap hambou	judo	1	paris 2024	2001
3078	france	maxime grousset	swimming	2	tokyo 2020	1999
3079	france	maxime pauty	fencing	2	tokyo 2020	1993
3080	france	maxime pianfetti	fencing	1	paris 2024	1999
3081	belgium	maxime van oost	hockey	1	paris 2024	1999
3082	united states of america	maximilian dietz	football	1	paris 2024	2002
3083	germany	maximilian doernbach	cycling track	2	tokyo 2020	1995
3084	france	maximilien chastanet	fencing	1	paris 2024	1996
3085	canada	maximilien van haaster	fencing	3	rio 2016	1992
3086	australia	maximillian giuliani	swimming	1	paris 2024	2003
3087	belgium	maxuella lisowa mbaka	basketball	1	paris 2024	2001
3088	united states of america	maxwell holt	volleyball	3	rio 2016	1987
3089	israel	maya goshen	judo	1	paris 2024	2000
3090	netherlands	maya kingma	triathlon	2	tokyo 2020	1995
3091	canada	maya meschkuleit	rowing	1	paris 2024	2001
3092	colombia	mayra ramirez	football	1	paris 2024	1999
3093	japan	mayu ishikawa	volleyball	2	tokyo 2020	2000
3094	türkiye	mazlum demir	athletics	1	paris 2024	2003
3095	united states of america	mclain ward	equestrian	6	athens 2004	1975
3096	australia	meg harris	swimming	2	tokyo 2020	2002
3097	ireland	megan burns	rugby sevens	1	paris 2024	2000
3098	spain	megan gustafson	basketball	1	paris 2024	1996
3099	great britain	megan havers	archery	1	paris 2024	2007
3100	great britain	megan jones	rugby sevens	2	tokyo 2020	1996
3101	united states of america	megan rogers	hockey	1	paris 2024	1999
3102	united states of america	meghan musnicki	rowing	4	london 2012	1983
3103	united states of america	megumi field	artistic swimming	1	paris 2024	2005
3104	japan	megumu yoshida	artistic swimming	2	tokyo 2020	1995
3105	morocco	mehdi boukamir	football	1	paris 2024	2004
3106	morocco	mehdi maouhoub	football	1	paris 2024	2003
3107	france	mehdi marzouki	water polo	2	rio 2016	1987
3108	japan	mei otani	rugby sevens	2	tokyo 2020	2000
3109	new zealand	meikayla moore	football	3	rio 2016	1996
3110	germany	meike schmelzer	handball	1	paris 2024	1993
3111	people's republic of china	meiling yan	rugby sevens	2	tokyo 2020	1997
3112	people's republic of china	meirong zou	hockey	1	paris 2024	2000
3113	france	melanie de jesus dos santos	artistic gymnastics	2	tokyo 2020	2000
3114	portugal	melanie santos	triathlon	2	tokyo 2020	1995
3115	türkiye	meliha ismailoglu	volleyball	2	tokyo 2020	1993
3116	france	meline nocandy	handball	2	tokyo 2020	1998
3117	new zealand	melissa galloway	equestrian	1	paris 2024	1993
3118	united states of america	melissa jefferson	athletics	1	paris 2024	2001
3119	cuba	melissa padron	athletics	1	paris 2024	2003
3120	australia	melissa tapper	table tennis	3	rio 2016	1990
3121	türkiye	melissa teresa vargas	volleyball	1	paris 2024	1999
3122	switzerland	melody johner	equestrian	2	tokyo 2020	1984
3123	canada	melvin ejim	basketball	1	paris 2024	1991
3124	germany	melvin imoudu	swimming	1	paris 2024	1999
3125	france	melvyn richardson	handball	2	tokyo 2020	1997
3126	people's republic of china	chen meng	table tennis	2	tokyo 2020	1994
3127	people's republic of china	meng li	basketball	2	tokyo 2020	1995
3128	people's republic of china	mengdie yin	canoe sprint	2	tokyo 2020	1997
3129	people's republic of china	mengjie wang	volleyball	2	tokyo 2020	1995
3130	people's republic of china	mengjie wu	volleyball	1	paris 2024	2002
3131	people's republic of china	mengran sun	basketball	3	rio 2016	1992
3132	spain	mercedes castellanos soanez	handball	2	tokyo 2020	1988
3133	kenya	mercy chebet	athletics	1	paris 2024	2002
3134	united states of america	meredith sholder	hockey	1	paris 2024	1999
3135	spain	meritxell mas pujadas	artistic swimming	2	tokyo 2020	1994
3136	germany	merle frohms	football	1	paris 2024	1995
3137	türkiye	mete gazoz	archery	3	rio 2016	1999
3138	denmark	mette tranborg	handball	1	paris 2024	1996
3139	ireland	mia griffin	cycling track	1	paris 2024	1998
3140	france	mia rycraw	water polo	1	paris 2024	1995
3141	united states of america	micah christenson	volleyball	3	rio 2016	1993
3142	united states of america	micah ma'a	volleyball	1	paris 2024	1997
3143	unknown	unknown	volleyball	1	tokyo 2020	1992
3144	unknown	michael alexandre bodegas	water polo	3	rio 2016	1987
3145	new zealand	michael boxall	football	3	beijing 2008	1988
3146	canada	michael foley	cycling track	2	tokyo 2020	1999
3147	united states of america	michael grady	rowing	2	tokyo 2020	1996
3148	germany	michael jung	equestrian	4	london 2012	1982
3149	netherlands	michael korrel	judo	2	tokyo 2020	1994
3150	france	michael olise	football	1	paris 2024	2001
3151	ireland	michael robson	hockey	2	rio 2016	1995
3152	new zealand	michaela brake	rugby sevens	2	tokyo 2020	1995
3153	new zealand	michaela foster	football	1	paris 2024	1999
3154	austria	michaela polleres	judo	2	tokyo 2020	1997
3155	czechia	michal cupr	fencing	1	paris 2024	1991
3156	poland	michal siess	fencing	1	paris 2024	1994
3157	poland	michal sokolowski	3x3 basketball	1	paris 2024	1992
3158	denmark	michala moeller	handball	1	paris 2024	2000
3159	italy	michela battiston	fencing	2	tokyo 2020	1997
3160	italy	michele gallo	fencing	1	paris 2024	2001
3161	italy	michele lamberti	swimming	1	paris 2024	2000
3162	nigeria	michelle alozie	football	1	paris 2024	1997
3163	australia	michelle bromley	table tennis	2	tokyo 2020	1987
3164	sweden	michelle coleman	swimming	4	london 2012	1993
3165	australia	michelle heyman	football	2	rio 2016	1988
3166	germany	michelle kroppen	archery	2	tokyo 2020	1996
3167	trinidad and tobago	michelle-lee ahye	athletics	4	london 2012	1992
3168	canada	michelle plouffe	3x3 basketball	3	london 2012	1992
3169	belgium	michelle struijk	hockey	1	paris 2024	1998
3170	netherlands	mick makker	rowing	1	paris 2024	1993
3171	france	mickael-meba zeze	athletics	3	rio 2016	1994
3172	france	mickaela lahlah	hockey	1	paris 2024	2001
3173	denmark	mie hoejlund	handball	1	paris 2024	1997
3174	germany	mieke kroger	cycling road	3	rio 2016	1993
3175	spain	miguel angel lopez	athletics	4	london 2012	1988
3176	spain	miguel de toro dominguez	water polo	2	tokyo 2020	1993
3177	spain	miguel gutierrez	football	1	paris 2024	2001
3178	brazil	miguel hidalgo	triathlon	1	paris 2024	2000
3179	spain	miguel sanchez-migallon naranjo	handball	2	tokyo 2020	1995
3180	slovenia	miha zarabec	handball	2	rio 2016	1991
3181	unknown	mihael zgank	judo	3	rio 2016	1994
3182	romania	mihai dragusin	water polo	2	london 2012	1984
3183	serbia	mihailo vasic	3x3 basketball	2	tokyo 2020	1993
3184	romania	mihaita tiganescu	rowing	2	tokyo 2020	1998
3185	japan	mike kawai	equestrian	2	tokyo 2020	1998
3186	canada	mike winter	equestrian	3	athens 2004	1974
3187	estonia	mikhail kushteyn	rowing	1	paris 2024	1999
3188	japan	miki kozuka	hockey	2	tokyo 2020	1996
3189	denmark	mikkel hansen	handball	5	beijing 2008	1987
3190	hungary	miklos rosta	handball	1	paris 2024	1999
3191	japan	miku takaichi	judo	1	paris 2024	1994
3192	dominican republic	milagros duran	athletics	1	paris 2024	2000
3193	brazil	milena silva	rugby sevens	1	paris 2024	2000
3194	australia	milena waldmann	artistic swimming	1	paris 2024	2004
3195	united states of america	miles chamley-watson	fencing	3	london 2012	1989
3196	united states of america	miles robinson	football	1	paris 2024	1997
3197	serbia	milica nikolic	judo	2	tokyo 2020	1994
3198	serbia	milica starovic	canoe	3	rio 2016	1988
3199	serbia	milica zabic	judo	1	paris 2024	1994
3200	new zealand	milly clegg	football	1	paris 2024	2005
3201	serbia	milorad kapur	volleyball	1	paris 2024	1991
3202	serbia	milos cuk	water polo	2	rio 2016	1990
3203	australia	milos maksimovic	water polo	1	paris 2024	1994
3204	czechia	miloslav prihoda jr	equestrian	2	tokyo 2020	1990
3205	republic of korea	mimi huh	judo	1	paris 2024	2002
3206	serbia	mina djordjevic	basketball	1	paris 2024	1999
3207	serbia	mina popovic	volleyball	2	tokyo 2020	1994
3208	japan	mina tanaka	football	2	tokyo 2020	1994
3209	lithuania	mindaugas maldonis	canoe sprint	2	tokyo 2020	1991
3210	france	ming van eijken	artistic gymnastics	1	paris 2024	2008
3211	people's republic of china	mingling chen	3x3 basketball	1	paris 2024	2000
3212	australia	minhyung jee	table tennis	1	paris 2024	1987
3213	republic of korea	minjong kim	judo	2	tokyo 2020	2000
3214	netherlands	minke bisschops	athletics	1	paris 2024	2002
3215	serbia	miran kujundzic	volleyball	1	paris 2024	1997
3216	spain	mireia martinez	rhythmic gymnastics	1	paris 2024	2005
3217	spain	mireya gonzalez alvarez	handball	2	tokyo 2020	1991
3218	germany	miriam butkereit	judo	1	paris 2024	1994
3219	spain	miriam casillas garcia	triathlon	3	rio 2016	1992
3220	great britain	miriam pritchard	hockey	1	paris 2024	1998
3221	montenegro	miroslav perkovic	water polo	2	tokyo 2020	2001
3222	czechia	miroslav trunda	equestrian	2	tokyo 2020	1984
3223	poland	miroslaw zietarski	rowing	3	rio 2016	1993
3224	spain	misa rodriguez	football	1	paris 2024	1999
3225	japan	emura misaki	fencing	2	tokyo 2020	1998
3226	republic of korea	miseul han	handball	1	paris 2024	1993
3227	zambia	misozi zulu	football	1	paris 2024	1994
3228	netherlands	mitch kolkman	triathlon	1	paris 2024	2002
3229	united states of america	mitchell saron	fencing	1	paris 2024	2000
3230	japan	mitsuru takata	water polo	2	tokyo 2020	1995
3231	japan	miu hirano	table tennis	2	tokyo 2020	2000
3232	japan	miwa harimoto	table tennis	1	paris 2024	2008
3233	japan	miyabi moriya	football	1	paris 2024	1996
3234	japan	miyu hasegawa	hockey	1	paris 2024	2001
3235	japan	miyu suzuki	hockey	1	paris 2024	1999
3236	japan	mizuki hirai	swimming	1	paris 2024	2007
3237	japan	mizuki ikeda	cycling track	1	paris 2024	2004
3238	japan	moe higa	artistic swimming	1	paris 2024	2007
3239	japan	moeka kijima	artistic swimming	2	tokyo 2020	1999
3240	japan	moeka minami	football	2	tokyo 2020	1998
3241	japan	moeki fukushi	rugby sevens	1	paris 2024	1999
3242	egypt	mohab abdelhak	handball	1	paris 2024	2003
3243	egypt	mohamed aly	handball	1	paris 2024	1992
3244	egypt	mohamed amer	fencing	3	rio 2016	1997
3245	mali	mohamed cisset	football	1	paris 2024	2004
3246	egypt	mohamed el-beiali	table tennis	2	tokyo 2020	1988
3247	egypt	mohamed el neny	football	2	london 2012	1992
3248	egypt	mohamed elsayed	fencing	2	tokyo 2020	2003
3249	egypt	mohamed essam	fencing	2	rio 2016	1994
3250	egypt	mohamed hamdy	football	1	paris 2024	2003
3251	egypt	mohamed hamza	fencing	3	rio 2016	2000
3252	egypt	mohamed hassan	volleyball	1	paris 2024	1993
3253	egypt	mohamed masoud	volleyball	2	rio 2016	1994
3254	egypt	mohamed moustafa issa	volleyball	1	paris 2024	1988
3255	egypt	mohamed osman elhaddad	volleyball	1	paris 2024	2000
3256	egypt	mohamed sayedin	volleyball	1	paris 2024	1996
3257	egypt	mohamed shehata	football	1	paris 2024	2001
3258	guinea	mohamed soumah	football	1	paris 2024	2003
3259	egypt	mohamed tarek	football	1	paris 2024	2002
3260	egypt	mohamed tarek	handball	1	paris 2024	2002
3261	egypt	mohamed yasseen	fencing	1	paris 2024	2004
3262	islamic republic of iran	mohammad fotouhi	fencing	2	tokyo 2020	1990
3263	islamic republic of iran	mohammad rahbari	fencing	2	tokyo 2020	1991
3264	refugee olympic team	mohammad rashnonezhad	judo	1	paris 2024	1996
3265	egypt	mohammad sanad	handball	3	rio 2016	1991
3266	australia	mollie o'callaghan	swimming	2	tokyo 2020	2004
3267	united states of america	molly bruggeman	rowing	1	paris 2024	1992
3268	japan	momoko tanikawa	football	1	paris 2024	2005
3269	germany	mona mayer	athletics	1	paris 2024	2001
3270	ireland	mona mc sharry	swimming	2	tokyo 2020	2000
3271	italy	monica de gennaro	volleyball	4	london 2012	1987
3272	great britain	morgan bolding	rowing	1	paris 2024	1995
3273	united states of america	morgan pearson	triathlon	2	tokyo 2020	1993
3274	france	morgane osyssek-reimer	artistic gymnastics	1	paris 2024	2002
3275	guinea	moriba ilaix	football	1	paris 2024	2003
3276	germany	moritz karlitzek	volleyball	1	paris 2024	1996
3277	germany	moritz ludwig	hockey	1	paris 2024	2001
3278	germany	moritz reichert	volleyball	1	paris 2024	1995
3279	germany	moritz wagner	basketball	2	tokyo 2020	1997
3280	germany	moritz wolff	rowing	1	paris 2024	2000
3281	denmark	morten graversen	canoe sprint	1	paris 2024	1996
3282	guinea	mory keita	football	1	paris 2024	2005
3283	new zealand	moses leo	rugby sevens	1	paris 2024	1997
3284	egypt	mostafa gaber abdelsalam abdelmoaty	volleyball	1	paris 2024	1997
3285	egypt	mostafa saad	football	1	paris 2024	2001
3286	samoa	motu opetai	rugby sevens	1	paris 2024	2001
3287	mali	moussa diakite	football	1	paris 2024	2003
3288	romania	mugurel vasile semciuc	rowing	2	tokyo 2020	1998
3289	france	muhammad kounta	athletics	2	tokyo 2020	1994
3290	uzbekistan	muhammadkodir hamraliev	football	1	paris 2024	2001
3291	india	muhammed ajmal variyathodi	athletics	1	paris 2024	1998
3292	india	muhammed anas	athletics	3	rio 2016	1994
3293	türkiye	muhammed demirel	judo	1	paris 2024	2002
3294	switzerland	mujinga kambundji	athletics	4	london 2012	1992
3295	uzbekistan	mumtozabonu iskhokzoda	rhythmic gymnastics	1	paris 2024	2005
3296	refugee olympic team	muna dahouk	judo	2	tokyo 2020	1995
3297	morocco	munir el kajoui	football	1	paris 2024	1989
3298	iraq	muntadher abdulameer	football	1	paris 2024	2001
3299	iraq	muntadher mohammed	football	1	paris 2024	2001
3300	côte d'ivoire	murielle ahoure	athletics	4	london 2012	1987
3301	brazil	murilo setin sartori	swimming	1	tokyo 2020	2002
3302	nigeria	murjanatu musa	basketball	1	paris 2024	2000
3303	uzbekistan	murodjon yuldoshev	judo	1	paris 2024	1995
3304	iraq	mustafa saadoon	football	1	paris 2024	2001
3305	south africa	mustaphaa cassiem	hockey	2	tokyo 2020	2002
3306	uzbekistan	muzaffarbek turoboyev	judo	1	paris 2024	2000
3307	zambia	muzala samukonga	athletics	1	paris 2024	2002
3308	estonia	my relander	equestrian	1	paris 2024	1998
3309	puerto rico	mya hollingshed	basketball	1	paris 2024	1999
3310	ukraine	mykola mykhailenko	football	1	paris 2024	2001
3311	france	myriam djekoundade	3x3 basketball	1	paris 2024	1998
3312	italy	myriam fatime sylla	volleyball	3	rio 2016	1995
3313	guinea	naby keita	football	1	paris 2024	1995
3314	guinea	naby oulare	football	1	paris 2024	2002
3315	serbia	nadija smailbegovic	basketball	1	paris 2024	2001
3316	egypt	nadine barsoum	artistic swimming	1	paris 2024	2005
3317	south africa	nadine roos	rugby sevens	1	paris 2024	1996
3318	hungary	nadine schatzl	handball	2	tokyo 2020	1993
3319	denmark	nadja aaboe sloth	equestrian	1	paris 2024	1992
3320	japan	nagisa ikemoto	swimming	1	tokyo 2020	2002
3321	united states of america	naima fuala'au	rugby sevens	1	paris 2024	1998
3322	canada	naima moreira laliberte	equestrian	2	tokyo 2020	1996
3323	japan	nako motohashi	basketball	2	tokyo 2020	1993
3324	people's republic of china	nan wang	canoe sprint	2	tokyo 2020	2000
3325	japan	nanako todo	basketball	2	tokyo 2020	2000
3326	japan	nanami seki	volleyball	1	paris 2024	1999
3327	france	nando de colo	basketball	4	london 2012	1987
3328	hungary	nandor nemeth	swimming	2	tokyo 2020	1999
3329	denmark	nanna skodborg merrald	equestrian	2	tokyo 2020	1993
3330	denmark	nanna vigild	rowing	1	paris 2024	1994
3331	japan	naoki fujisaka	handball	1	paris 2024	2002
3332	japan	naoki mizunuma	swimming	2	tokyo 2020	1996
3333	japan	naoki sugioka	handball	2	tokyo 2020	1994
3334	united states of america	naomi girma	football	1	paris 2024	2000
3335	belgium	naomi van den broeck	athletics	2	tokyo 2020	1996
3336	netherlands	naomi visser	artistic gymnastics	1	paris 2024	2001
3337	united states of america	napheesa collier	basketball	2	tokyo 2020	1996
3338	egypt	nardin ehab	fencing	1	paris 2024	1996
3339	brazil	natalia araujo	volleyball	1	paris 2024	0
3340	angola	natalia fonseca	handball	2	tokyo 2020	1998
3341	poland	natalia kaczmarek	athletics	2	tokyo 2020	1998
3342	poland	natalia medrzyk	volleyball	1	paris 2024	1992
3343	poland	natalia olimpia bajor	table tennis	2	tokyo 2020	1997
3344	angola	natalia santos	handball	2	tokyo 2020	1986
3345	canada	natalie achonwa	basketball	4	london 2012	1992
3346	canada	natalie davison	canoe sprint	1	paris 2024	1992
3347	ireland	natalie long	rowing	1	paris 2024	1990
3348	australia	natalie van coevorden	triathlon	1	paris 2024	1992
3349	slovenia	natasa ljepoja	handball	1	paris 2024	1996
3350	hungary	natasa rybanska	water polo	2	tokyo 2020	2000
3351	sweden	nathalie hagman	handball	3	rio 2016	1991
3352	germany	nathalie kubalski	hockey	1	paris 2024	1993
3353	australia	nathan ephraums	hockey	1	paris 2024	1999
3354	united states of america	nathan harriel	football	1	paris 2024	2001
3355	australia	nathan lawson	rugby sevens	2	tokyo 2020	1999
3356	australia	nathan power	water polo	2	tokyo 2020	1993
3357	japan	natsumi tsunoda	judo	1	paris 2024	1992
3358	latvia	nauris miezis	3x3 basketball	2	tokyo 2020	1991
3359	united states of america	naya tapper	rugby sevens	2	tokyo 2020	1994
3360	ukraine	nazar chepurnyi	artistic gymnastics	1	paris 2024	2002
3361	france	nedim remili	handball	2	tokyo 2020	1995
3362	egypt	nehal saafan	artistic swimming	3	rio 2016	1996
3363	slovenia	nejc cehte	handball	1	paris 2024	1992
3364	germany	nele schulze	swimming	1	paris 2024	2004
3365	france	nelson epee	rugby sevens	1	paris 2024	2001
3366	dominican republic	nelson lemaire	football	1	paris 2024	2001
3367	belgium	nelson onana alima	hockey	1	paris 2024	2000
3368	netherlands	nelson ritsema	rowing	2	tokyo 2020	1994
3369	serbia	nemanja majdov	judo	2	tokyo 2020	1996
3370	serbia	nemanja ubovic	water polo	1	paris 2024	1991
3371	serbia	nemanja vico	water polo	1	paris 2024	1994
3372	spain	nestor abad	artistic gymnastics	3	rio 2016	1993
3373	great britain	nethaneel mitchell-blake	athletics	3	rio 2016	1994
3374	samoa	neueli leitufia	rugby sevens	1	paris 2024	2001
3375	serbia	nevena jovanovic	basketball	3	rio 2016	1990
3376	slovenia	neza klancar	swimming	1	paris 2024	2000
3377	zambia	ngambo musole	football	2	tokyo 2020	1998
3378	new zealand	ngarohi mcgarvey-black	rugby sevens	2	tokyo 2020	1996
3379	ireland	niall comerford	rugby sevens	1	paris 2024	2000
3380	united states of america	nic fink	swimming	2	tokyo 2020	1993
3381	australia	nic kay	basketball	2	tokyo 2020	1992
3382	australia	nic porter	water polo	1	paris 2024	1998
3383	new zealand	nic woods	hockey	3	rio 2016	1995
3384	canada	nichelle prince	football	3	rio 2016	1995
3385	japan	nichika yamada	volleyball	2	tokyo 2020	2000
3386	south africa	nicholas balfour spooner	hockey	2	tokyo 2020	1991
3387	canada	nicholas hoag	volleyball	3	rio 2016	1992
3388	italy	nicholas kohl	rowing	1	paris 2024	1998
3389	australia	nicholas lum	table tennis	1	paris 2024	2005
3390	canada	nicholas matveev	canoe sprint	2	tokyo 2020	1997
3391	united states of america	nicholas mead	rowing	2	tokyo 2020	1995
3392	ireland	nicholas page	hockey	1	paris 2024	1997
3393	great britain	nicholas park	hockey	1	paris 2024	1999
3394	italy	nicholas presciutti	water polo	3	rio 2016	1993
3395	greece	nick calathes	basketball	1	paris 2024	1989
3396	united states of america	nick itkin	fencing	2	tokyo 2020	1999
3397	australia	nick malouf	rugby sevens	3	rio 2016	1993
3398	united states of america	nick rusher	rowing	1	paris 2024	1999
3399	canada	nick wammes	cycling track	2	tokyo 2020	1999
3400	germany	nick weiler-babb	basketball	1	paris 2024	1995
3401	canada	nickeil alexander-walker	basketball	1	paris 2024	1998
3402	denmark	niclas kirkeloekke	handball	1	paris 2024	1994
3403	italy	nicola bartolini	artistic gymnastics	1	paris 2024	1996
3404	romania	nicolae oanta	water polo	1	paris 2024	1990
3405	brazil	nicolas albiero	swimming	1	paris 2024	1999
3406	france	nicolas batum	basketball	4	london 2012	1988
3407	argentina	nicolas bonanno	handball	2	tokyo 2020	1991
3408	argentina	nicolas bono	handball	1	paris 2024	1997
3409	belgium	nicolas de kerpel	hockey	2	tokyo 2020	1993
3410	argentina	nicolas della torre	hockey	1	paris 2024	1990
3411	argentina	nicolas keenan	hockey	2	tokyo 2020	1997
3412	france	nicolas le goff	volleyball	3	rio 2016	1992
3413	ecuador	nicolas lionel wettstein	equestrian	3	rio 2016	1981
3414	argentina	nicolas otamendi	football	1	paris 2024	1988
3415	france	nicolas tournat	handball	2	tokyo 2020	1994
3416	france	nicolas touzaint	equestrian	5	sydney 2000	1980
3417	luxembourg	nicolas wagner ehlinger	equestrian	2	tokyo 2020	1992
3418	argentina	nicolas zerba	volleyball	1	paris 2024	1999
3419	spain	nicolau mir	artistic gymnastics	2	tokyo 2020	2000
3420	nigeria	nicole enabosi	basketball	1	paris 2024	1997
3421	germany	nicole maier	swimming	1	paris 2024	2000
3422	nigeria	nicole payne	football	1	paris 2024	2001
3423	brazil	nicole pircio	rhythmic gymnastics	2	tokyo 2020	2002
3424	new zealand	nicole shields	cycling track	2	tokyo 2020	1999
3425	new zealand	nicole van der kaay	triathlon	2	tokyo 2020	1996
3426	spain	nicole wiggins	handball	1	paris 2024	2000
3427	great britain	nicole yeargin	athletics	2	tokyo 2020	1997
3428	italy	nicolo martinenghi	swimming	2	tokyo 2020	1999
3429	germany	niels giffey	basketball	2	tokyo 2020	1991
3430	refugee olympic team	nigara shaheen	judo	2	tokyo 2020	1998
3431	iraq	nihad mohammed	football	1	paris 2024	2001
3432	slovenia	nik henigman	handball	2	rio 2016	1995
3433	slovenia	nik mujanovic	volleyball	1	paris 2024	2004
3434	germany	nik schroeter	cycling track	1	paris 2024	1998
3435	netherlands	nika daalderop	volleyball	1	paris 2024	1998
3436	germany	nike lorenz	hockey	3	rio 2016	1997
3437	netherlands	nikita van der vliet	handball	1	paris 2024	2000
3438	denmark	niklas landin jacobsen	handball	4	london 2012	1988
3439	denmark	niklas larsen	cycling track	3	rio 2016	1997
3440	germany	niklas wellen	hockey	3	rio 2016	1994
3441	serbia	nikola acin	swimming	1	tokyo 2020	1999
3442	serbia	nikola dedovic	water polo	2	tokyo 2020	1992
3443	croatia	nikola grahovac	handball	1	paris 2024	1998
3444	serbia	nikola jaksic	water polo	3	rio 2016	1997
3445	serbia	nikola jokic	basketball	2	rio 2016	1995
3446	serbia	nikola jovic	basketball	1	paris 2024	2003
3447	serbia	nikola jovovic	volleyball	1	paris 2024	1992
3448	france	nikola karabatic	handball	6	athens 2004	1984
3449	serbia	nikola milutinov	basketball	1	paris 2024	1994
3450	poland	nikola sibiak	cycling track	1	paris 2024	2000
3451	greece	nikolaos gkillas	water polo	1	paris 2024	2003
3452	greece	nikolaos spyridon papanikolaou	water polo	1	paris 2024	2000
3453	greece	nikoleta eleftheriadou	water polo	1	paris 2024	1998
3454	hungary	nikolett padar	swimming	1	paris 2024	2006
3455	hungary	nikoletta papp	handball	1	paris 2024	1996
3456	denmark	nikoline laidlaw	rowing	1	paris 2024	1995
3457	spain	nikoloz sherazadishvili	judo	2	tokyo 2020	1996
3458	greece	nikos chougkaz	basketball	1	paris 2024	2000
3459	germany	nils dunkel	artistic gymnastics	2	tokyo 2020	1997
3460	switzerland	nils liess	swimming	1	tokyo 2020	1996
3461	united states of america	nina castagna	rowing	1	paris 2024	2000
3462	germany	nina holt	swimming	1	paris 2024	2003
3463	sweden	nina koppang	handball	1	paris 2024	2002
3464	germany	nina mittelham	table tennis	2	tokyo 2020	1996
3465	slovenia	nina spreitzer	handball	1	paris 2024	1998
3466	france	nina stojiljkovic	volleyball	1	paris 2024	1996
3467	netherlands	nina ten broek	water polo	1	paris 2024	2001
3468	people's republic of china	ning ma	hockey	1	paris 2024	2000
3469	people's republic of china	ning zhang	3x3 basketball	1	paris 2024	1997
3470	canada	nirra fields	basketball	3	rio 2016	1993
3471	israel	niv eliasi	football	1	paris 2024	2002
3472	dominican republic	niverka dharlenis marte frica	volleyball	3	london 2012	1990
3473	australia	noah havard	canoe sprint	1	paris 2024	2000
3474	belgium	noah vandenbranden	cycling track	1	paris 2024	2002
3475	israel	noam ben harosh	football	1	paris 2024	2005
3476	france	noe jouin	hockey	1	paris 2024	2002
3477	switzerland	noe seifert	artistic gymnastics	1	paris 2024	1998
3478	netherlands	noel van t end	judo	3	rio 2016	1991
3479	hungary	noemi pasztor	handball	1	paris 2024	1999
3480	hungary	noemi pupp	canoe sprint	1	paris 2024	1998
3481	egypt	noha hany	fencing	2	tokyo 2020	2001
3482	spain	nona perez vivas	water polo	1	paris 2024	2003
3483	morocco	noor slaoui	equestrian	1	paris 2024	1995
3484	norway	nora moerk	handball	2	tokyo 2020	1991
3485	poland	norbert huber	volleyball	1	paris 2024	1998
3486	dominican republic	nowend lorenzo	football	1	paris 2024	2002
3487	south africa	nqobile mansuet ntuli	hockey	2	tokyo 2020	1996
3488	netherlands	nsikak ekpo	athletics	1	paris 2024	2003
3489	south africa	ntsopa mokoena	hockey	1	paris 2024	2004
3490	people's republic of china	nuo xu	fencing	1	paris 2024	1998
3491	mexico	nuria diosdado garcia	artistic swimming	4	london 2012	1990
3492	kazakhstan	nurlykhan sharkhan	judo	1	paris 2024	2000
3493	malaysia	nurul azreena mohamad fazil	archery	1	paris 2024	2004
3494	germany	nyara sabally	basketball	1	paris 2024	2000
3495	brazil	nyeme alexandre costa nunes	volleyball	1	paris 2024	1998
3496	kenya	nygel pettersan amaitsa	rugby sevens	1	paris 2024	2002
3497	netherlands	nyls korstanje	swimming	2	tokyo 2020	1999
3498	france	obed nkambadio	football	1	paris 2024	2003
3499	jamaica	oblique seville	athletics	2	tokyo 2020	2001
3500	zambia	ochumba lubandji	football	2	tokyo 2020	2001
3501	italy	odette giuffrida	judo	3	rio 2016	1994
3502	greece	odyssefs meladinis	swimming	2	rio 2016	1990
3503	israel	ofir shaham	rhythmic gymnastics	1	paris 2024	2004
3504	italy	oghosasere loveth omoruyi	volleyball	1	paris 2024	2002
3505	serbia	ognjen dobric	basketball	1	paris 2024	1994
3506	spain	oihane hernandez	football	1	paris 2024	2000
3507	germany	olaf roggensack	rowing	2	tokyo 2020	1997
3508	nigeria	olaoluwatomi oluwayemisi taiwo	basketball	1	paris 2024	2000
3509	netherlands	olav molenaar	rowing	1	paris 2024	1999
3510	nigeria	olayinka olajide	athletics	1	paris 2024	2002
3511	germany	ole braunschweig	swimming	2	tokyo 2020	1997
3512	ukraine	oleg verniaiev	artistic gymnastics	3	london 2012	1993
3513	ukraine	oleh fedor	football	1	paris 2024	2004
3514	ukraine	oleh kukharyk	canoe sprint	1	paris 2024	1997
3515	ukraine	oleh ocheretko	football	1	paris 2024	2003
3516	ukraine	oleksandr martyniuk	football	1	paris 2024	2001
3517	ukraine	oleksandr pohorilko	athletics	2	tokyo 2020	2000
3518	ukraine	oleksii sych	football	1	paris 2024	2001
3519	ukraine	olena kravatska	fencing	2	rio 2016	1992
3520	ukraine	olena kryvytska	fencing	4	london 2012	1987
3521	spain	olga carmona	football	1	paris 2024	2000
3522	poland	olga chojecka	athletics	1	paris 2024	1997
3523	ukraine	olga kharlan	fencing	5	beijing 2008	1990
3524	australia	oliver bleddyn	cycling track	1	paris 2024	2002
3525	great britain	oliver morgan	swimming	1	paris 2024	2003
3526	great britain	oliver payne	hockey	2	tokyo 2020	1999
3527	great britain	oliver wilkes	rowing	1	paris 2024	1995
3528	great britain	oliver wood	cycling track	2	tokyo 2020	1995
3529	canada	olivia apps	rugby sevens	2	tokyo 2020	1998
3530	new zealand	olivia brett	canoe sprint	1	paris 2024	2001
3531	united states of america	olivia coffey	rowing	2	tokyo 2020	1989
3532	sweden	olivia loefqvist	handball	1	paris 2024	1998
3533	canada	olivia lundman	athletics	1	paris 2024	2003
3534	canada	olivier desrosiers	fencing	1	paris 2024	2004
3535	france	olivier perreau	equestrian	1	paris 2024	1986
3536	new zealand	ollie maclean	rowing	1	paris 2024	1998
3537	australia	olympia aldersey	rowing	3	rio 2016	1992
3538	united arab emirates	omar abdul aziz al marzooqi	equestrian	1	paris 2024	2003
3539	egypt	omar assar	table tennis	4	london 2012	1991
3540	dominican republic	omar de la cruz	football	1	paris 2024	2001
3541	egypt	omar elwakil	handball	1	tokyo 2020	1988
3542	egypt	omar fayed	football	1	paris 2024	2003
3543	israel	omer nir on	football	1	paris 2024	2001
3544	israel	omri gandelman	football	1	paris 2024	2000
3545	spain	ona batlle	football	1	paris 2024	1999
3546	france	onacia ondono	handball	1	paris 2024	1996
3547	south africa	ongeziwe mali	hockey	1	paris 2024	1999
3548	south africa	onthatile zulu	hockey	2	tokyo 2020	2000
3549	netherlands	onyema adigida	athletics	1	paris 2024	2000
3550	israel	or israelov	football	1	paris 2024	2004
3551	thailand	orawan paranang	table tennis	2	tokyo 2020	1997
3552	france	orlane kanor	handball	1	paris 2024	1997
3553	france	orlann oliere	athletics	1	paris 2024	1991
3554	united states of america	orrin bizer	rugby sevens	1	paris 2024	2000
3555	france	orsolya hertzka	water polo	1	paris 2024	1998
3556	egypt	osama faisal	football	1	paris 2024	2001
3557	sweden	oscar bergendahl	handball	1	paris 2024	1995
3558	germany	oscar da silva	basketball	1	paris 2024	1998
3559	israel	oscar gloukh	football	1	paris 2024	2004
3560	spain	oscar husillos	athletics	2	tokyo 2020	1993
3561	dominican republic	oscar urena	football	1	paris 2024	2003
3562	israel	osher davida	football	1	paris 2024	2001
3563	nigeria	osinachi ohale	football	1	paris 2024	1991
3564	new zealand	oskar van hattum	football	1	paris 2024	2002
3565	uzbekistan	oston urunov	football	1	paris 2024	2000
3566	mali	oumar coulibaly	football	1	paris 2024	2002
3567	guinea	ousmane camara	football	1	paris 2024	2001
3568	morocco	oussama el azzouzi	football	1	paris 2024	2001
3569	morocco	oussama targhalline	football	1	paris 2024	2002
3570	germany	owen ansah	athletics	2	tokyo 2020	2000
3571	spain	pablo barrios	football	1	paris 2024	2003
3572	france	pablo mateo	athletics	1	paris 2024	2001
3573	argentina	pablo sergio koukartsev	volleyball	1	paris 2024	1993
3574	argentina	pablo simonet	handball	3	rio 2016	1992
3575	india	pahal kiran	athletics	1	paris 2024	2000
3576	australia	paige barr	rowing	1	paris 2024	2001
3577	canada	paige crozon	3x3 basketball	1	paris 2024	1994
3578	united states of america	paige madden	swimming	2	tokyo 2020	1998
3579	nigeria	pallas kunaiyi-akpanah	basketball	2	tokyo 2020	1997
3580	mexico	pamela nuzhet toscano millan	artistic swimming	1	paris 2024	2000
3581	puerto rico	pamela rosado	basketball	2	tokyo 2020	1986
3582	kenya	pamella adhiambo owino	volleyball	1	paris 2024	2001
3583	greece	panagiotis bolanos	swimming	1	paris 2024	2000
3584	greece	panagiotis kalaitzakis	basketball	1	paris 2024	1999
3585	greece	panagiotis tzortzatos	water polo	1	paris 2024	1992
3586	hungary	panna ugrai	swimming	1	paris 2024	2004
3587	france	paola le nindre	hockey	1	paris 2024	2006
3588	italy	paola egonu	volleyball	3	rio 2016	1998
3589	italy	paolo conte bonin	swimming	1	paris 2024	2002
3590	south africa	paris-gail isaacs	hockey	1	paris 2024	2006
3591	germany	pascal brendel	artistic gymnastics	1	paris 2024	2003
3592	switzerland	pascale walker	rowing	1	paris 2024	1995
3593	france	pasiphae lalou martineaud peret	water polo	1	paris 2024	2005
3594	nigeria	patience okon george	athletics	3	rio 2016	1991
3595	spain	patri guijarro	football	1	paris 2024	1998
3596	spain	patricia alvarez	hockey	1	paris 2024	1998
3597	romania	patricia cires	rowing	1	paris 2024	2002
3598	venezuela	patricia ferrando	equestrian	1	paris 2024	1985
3599	brazil	patricia matieli	handball	2	tokyo 2020	1988
3600	spain	patricia perez fos	rhythmic gymnastics	1	paris 2024	2004
3601	switzerland	patrick brunner	rowing	1	paris 2024	2000
3602	canada	patrick hussey	swimming	1	paris 2024	2001
3603	zambia	patrick kakozi nyambe	athletics	1	paris 2024	2002
3604	kenya	patrick odongo okong'o	rugby sevens	1	paris 2024	2002
3605	united states of america	patrick schulte	football	1	paris 2024	2001
3606	sweden	patrik kittel	equestrian	5	beijing 2008	1976
3607	hungary	patrik ligetvari	handball	1	paris 2024	1996
3608	poland	patryk grzegorzewicz	athletics	2	tokyo 2020	2002
3609	australia	patty mills	basketball	5	beijing 2008	1988
3610	spain	pau cubarsi	football	1	paris 2024	2007
3611	france	paul allegre	fencing	1	paris 2024	1996
3612	united states of america	paul juda	artistic gymnastics	1	paris 2024	2001
3613	germany	paul-philipp kaufmann	hockey	2	tokyo 2020	1996
3614	samoa	paul scanlan	rugby sevens	1	paris 2024	1996
3615	spain	paula arcos poveda	handball	2	tokyo 2020	2001
3616	spain	paula camus	water polo	1	paris 2024	2002
3617	spain	paula crespi barriga	water polo	1	paris 2024	1998
3618	spain	paula garcia	athletics	1	paris 2024	1998
3619	spain	paula ginzo	basketball	1	paris 2024	1998
3620	spain	paula juste sanchez	swimming	1	paris 2024	2003
3621	spain	paula leiton arrones	water polo	3	rio 2016	2000
3622	spain	paula ramirez ibanez	artistic swimming	2	tokyo 2020	1996
3623	spain	paula sevilla	athletics	1	paris 2024	1997
3624	france	pauletta foppa	handball	2	tokyo 2020	2000
3625	france	paulin riva	rugby sevens	1	paris 2024	1994
3626	germany	paulina paszek	canoe sprint	1	paris 2024	1997
3627	poland	paulina peda	swimming	1	tokyo 2020	1998
3628	france	pauline basquin	equestrian	1	paris 2024	1978
3629	germany	pauline jagsch	canoe sprint	1	paris 2024	2003
3630	france	pauline peyraud-magnin	football	1	paris 2024	1992
3631	france	pauline ranvier	fencing	2	tokyo 2020	1994
3632	germany	pauline sophie grabosch	cycling track	2	tokyo 2020	1998
3633	germany	pauline starke	judo	1	paris 2024	1997
3634	zambia	pauline zulu	football	1	paris 2024	2004
3635	brazil	paulo andre camilo	athletics	2	tokyo 2020	1998
3636	serbia	pavle peric	volleyball	1	paris 2024	1998
3637	poland	pawel zatorski	volleyball	3	rio 2016	1990
3638	united states of america	paxten aaronson	football	1	paris 2024	2003
3639	sweden	peder fredricson	equestrian	5	barcelona 1992	1972
3640	argentina	pedro martinez cami	handball	2	tokyo 2020	1999
3641	hungary	pedro rodriguez	handball	1	paris 2024	1990
3642	brazil	pedro veniss	equestrian	4	beijing 2008	1983
3643	singapore	pei jia caroline chew	equestrian	2	tokyo 2020	1992
3644	great britain	penny healey	archery	1	paris 2024	2005
3645	canada	penny oleksiak	swimming	2	rio 2016	2000
3646	australia	penny squibb	hockey	1	paris 2024	1993
3647	spain	pepe cunill	hockey	1	paris 2024	2001
3648	united states of america	perry baker	rugby sevens	3	rio 2016	1986
3649	serbia	petar jaksic	water polo	1	paris 2024	2001
3650	serbia	petar krsmanovic	volleyball	1	paris 2024	1990
3651	montenegro	petar tesanovic	water polo	2	tokyo 2020	1998
3652	ireland	peter brown	hockey	1	paris 2024	1994
3653	united states of america	peter chatain	rowing	1	paris 2024	1999
3654	denmark	peter flarup	equestrian	3	beijing 2008	1976
3655	dominican republic	peter gonzalez	football	1	paris 2024	2002
3656	slovenia	peter hribar	table tennis	2	tokyo 2020	1999
3657	south sudan	peter jok	basketball	1	paris 2024	1994
3658	ireland	peter mckibbin	hockey	1	paris 2024	1997
3659	israel	peter paltchik	judo	2	tokyo 2020	1992
3660	germany	peter varjasi	swimming	1	paris 2024	2000
3661	hungary	petra anita fuezi tovizi	handball	1	paris 2024	1999
3662	hungary	petra senanszky	swimming	1	paris 2024	1994
3663	hungary	petra simon	handball	1	paris 2024	2004
3664	hungary	petra vamos	handball	2	tokyo 2020	2000
3665	norway	petter oeverby	handball	2	tokyo 2020	1992
3666	ireland	phil healy	athletics	2	tokyo 2020	1994
3667	germany	philipp weishaupt	equestrian	1	paris 2024	1985
3668	france	philippine delemazure	hockey	1	paris 2024	2005
3669	great britain	phillip roper	hockey	2	tokyo 2020	1992
3670	australia	phoebe learmont	rhythmic gymnastics	1	paris 2024	2005
3671	new zealand	phoebe spoors	rowing	2	tokyo 2020	1993
3672	germany	pia greiten	rowing	1	paris 2024	1997
3673	netherlands	pien dicke	hockey	1	paris 2024	1999
3674	netherlands	pien sanders	hockey	2	tokyo 2020	1998
3675	france	pierre-frederic vanpeperstraete	water polo	1	paris 2024	1992
3676	france	pierre le corre	triathlon	2	rio 2016	1990
3677	canada	pierre-luc poulin	canoe sprint	2	tokyo 2020	1995
3678	australia	pierre van der westhuyzen	canoe sprint	1	paris 2024	2003
3679	united states of america	pieter quinton	rowing	1	paris 2024	1998
3680	italy	pietro sandei	equestrian	1	paris 2024	1991
3681	italy	pietro torre	fencing	1	paris 2024	2002
3682	spain	pili pena	water polo	2	tokyo 2020	1986
3683	canada	piper logan	rugby sevens	1	paris 2024	2001
3684	netherlands	pirmin blaak	hockey	4	london 2012	1988
3685	united states of america	pita vi	rugby sevens	1	paris 2024	2002
3686	switzerland	pius schwizer	equestrian	3	beijing 2008	1962
3687	fiji	ponipate loganimasi	rugby sevens	1	paris 2024	1998
3688	india	poovamma raju machettira	athletics	1	paris 2024	1990
3689	new zealand	portia woodman	rugby sevens	3	rio 2016	1991
3690	india	pravin jadhav	archery	2	tokyo 2020	1996
3691	zambia	prisca chilufya	football	1	paris 2024	1999
3692	france	prithika pavade	table tennis	2	tokyo 2020	2004
3693	india	. priyanka	athletics	2	tokyo 2020	1996
3694	nigeria	promise amukamara	basketball	2	tokyo 2020	1993
3695	poland	przemyslaw zamojski	3x3 basketball	2	tokyo 2020	1986
3696	people's republic of china	qi liu	cycling track	1	paris 2024	2000
3697	people's republic of china	qi su	rugby sevens	1	paris 2024	2000
3698	people's republic of china	qianqian huang	fencing	1	paris 2024	2002
3699	people's republic of china	qianting tang	swimming	2	tokyo 2020	2004
3700	people's republic of china	qianyi wang	artistic swimming	2	tokyo 2020	1997
3701	people's republic of china	qingfeng wu	swimming	2	tokyo 2020	2003
3702	people's republic of china	qiqi guo	rhythmic gymnastics	2	tokyo 2020	1998
3703	people's republic of china	qixuan an	archery	1	paris 2024	2000
3704	people's republic of china	qiyuan qiu	artistic gymnastics	1	paris 2024	2007
3705	people's republic of china	qiyun zhong	water polo	1	paris 2024	2004
3706	south africa	quanita bobbs	hockey	2	tokyo 2020	1993
3707	france	quentin jouffroy	volleyball	1	paris 2024	1993
3708	spain	queralt casas carreras	basketball	2	tokyo 2020	1992
3709	south africa	quewin nortje	rugby sevens	1	paris 2024	2003
3710	bahamas	quincy penn	athletics	1	paris 2024	2005
3711	canada	quinn	football	3	rio 2016	1995
3712	netherlands	quinty roeffen	archery	1	paris 2024	2005
3713	united states of america	rachel fattal	water polo	3	rio 2016	1993
3714	netherlands	rachel klamer	triathlon	4	london 2012	1990
3715	bulgaria	rachel stoyanov	rhythmic gymnastics	1	paris 2024	2003
3716	united states of america	rachel sung	table tennis	1	paris 2024	2004
3717	morocco	rachid ghanimi	football	1	paris 2024	2001
3718	serbia	radomir drasovic	water polo	1	paris 2024	1997
3719	ukraine	radomyr stelmakh	artistic gymnastics	1	paris 2024	2005
3720	serbia	radoslav filipovic	water polo	1	paris 2024	1997
3721	canada	rae lekness	water polo	1	paris 2024	1994
3722	netherlands	raf kooremans	equestrian	1	paris 2024	1977
3723	france	rafael fente--damers	swimming	1	paris 2024	2006
3724	brazil	rafael macedo	judo	2	tokyo 2020	1994
3725	brazil	rafael mamprin losano	equestrian	2	tokyo 2020	1997
3726	germany	rafael miroslaw	swimming	1	paris 2024	2001
3727	dominican republic	rafael nunez	football	1	paris 2024	2002
3728	brazil	rafael silva	judo	4	london 2012	1987
3729	spain	rafael vilallonga	hockey	1	paris 2024	2001
3730	brazil	rafaela silva	judo	3	london 2012	1992
3731	brazil	rafaelle	football	3	rio 2016	1991
3732	united states of america	rai benjamin	athletics	2	tokyo 2020	1996
3733	fiji	raijieli daveua	rugby sevens	3	rio 2016	1992
3734	fiji	raisuqe josaia	rugby sevens	1	paris 2024	1994
3735	india	raj kumar pal	hockey	1	paris 2024	1998
3736	india	rajesh ramesh	athletics	1	paris 2024	1999
3737	netherlands	ralf rienks	rowing	1	paris 2024	1997
3738	saudi arabia	ramzy al duhami	equestrian	6	atlanta 1996	1972
3739	japan	ran takahashi	volleyball	2	tokyo 2020	2001
3740	belgium	rani rosius	athletics	1	paris 2024	2000
3741	belgium	rani vincke	athletics	1	paris 2024	2000
3742	australia	raphaelle gauthier	artistic swimming	1	paris 2024	2005
3743	canada	raphaelle plante	artistic swimming	1	paris 2024	2002
3744	brazil	raquel kochhann	rugby sevens	3	rio 2016	1992
3745	nigeria	rasheedat ajibade	football	1	paris 2024	1999
3746	denmark	rasmus lauge schmidt	handball	2	london 2012	1991
3747	denmark	rasmus pedersen	cycling track	2	tokyo 2020	1998
3748	brazil	raul neto togni	basketball	1	paris 2024	1992
3749	france	rayan cherki	football	1	paris 2024	2003
3750	france	rayan helal	cycling track	2	tokyo 2020	1999
3751	france	rayan rebbadj	rugby sevens	1	paris 2024	1999
3752	guinea	rayane doucoure	football	1	paris 2024	2001
3753	spain	rayderley miguel zapata	artistic gymnastics	3	rio 2016	1993
3754	israel	raz hershko	judo	2	tokyo 2020	1998
3755	fiji	reapi ulunisau	rugby sevens	2	tokyo 2020	1994
3756	brazil	rebeca andrade	artistic gymnastics	3	rio 2016	1999
3757	italy	rebecca borga	athletics	2	tokyo 2020	1998
3758	australia	rebecca greiner	hockey	1	paris 2024	1999
3759	australia	rebecca henderson	athletics	2	tokyo 2020	2001
3760	hungary	rebecca parkes	water polo	2	tokyo 2020	1994
3761	new zealand	rebecca petch	cycling bmx racing	2	tokyo 2020	1998
3762	great britain	rebecca shorten	rowing	2	tokyo 2020	1993
3763	new zealand	rebekah stott	football	3	london 2012	1993
3764	germany	rebekka haase	athletics	3	rio 2016	1993
3765	egypt	reda haikal	volleyball	1	paris 2024	1990
3766	united states of america	reem maddox	3x3 basketball	1	paris 2024	1989
3767	united states of america	regan smith	swimming	2	tokyo 2020	2002
3768	new zealand	regan ware	rugby sevens	3	rio 2016	1994
3769	mexico	regina alferez licea	artistic swimming	1	paris 2024	1997
3770	united states of america	regina salmons	rowing	2	tokyo 2020	1997
3771	jamaica	reheem hayles	athletics	1	paris 2024	2001
3772	hungary	reka bordas	handball	2	tokyo 2020	1997
3773	hungary	reka pupp	judo	2	tokyo 2020	1996
3774	france	remi desbonnet	handball	1	paris 2024	1992
3775	france	remi saudadier	water polo	2	rio 2016	1986
3776	japan	remina chiba	football	1	paris 2024	1999
3777	brazil	renan correa	athletics	1	paris 2024	2004
3778	germany	renars uscins	handball	1	paris 2024	2002
3779	brazil	renata de arruda	handball	2	tokyo 2020	1999
3780	poland	renata knapik-miazga	fencing	2	tokyo 2020	1988
3781	canada	rene cournoyer	artistic gymnastics	2	tokyo 2020	1997
3782	colombia	rene lopez	equestrian	2	rio 2016	1964
3783	germany	renee lucht	judo	1	paris 2024	1998
3784	australia	renee taylor	hockey	2	tokyo 2020	1996
3785	netherlands	renee van laarhoven	hockey	1	paris 2024	1997
3786	trinidad and tobago	renny quow	athletics	3	beijing 2008	1987
3787	indonesia	rezza octavia	archery	1	paris 2024	2000
3788	ireland	rhasidat adeleke	athletics	1	paris 2024	2002
3789	zambia	rhoda chileshe	football	1	paris 2024	1998
3790	australia	rhydian cowley	athletics	3	rio 2016	1991
3791	united states of america	rhyne howard	3x3 basketball	1	paris 2024	2000
3792	australia	ria thompson	rowing	2	tokyo 2020	1997
3793	portugal	ricardo batista	triathlon	1	paris 2024	2000
3794	brazil	ricardo lucarelli	volleyball	3	rio 2016	1992
3795	mexico	ricardo ortiz	athletics	1	paris 2024	1995
3796	italy	riccardo sbertoli	volleyball	2	tokyo 2020	1998
3797	hungary	richard bodo	handball	1	paris 2024	1993
3798	unknown	richard murray	triathlon	4	london 2012	1989
3799	germany	richard vogel	equestrian	1	paris 2024	1997
3800	united states of america	rielly milne	rowing	1	paris 2024	1996
3801	japan	rihito yamamoto	football	1	paris 2024	2001
3802	netherlands	rik rienks	rowing	1	paris 2024	1995
3803	japan	rika ogawa	hockey	1	paris 2024	1994
3804	japan	rika takayama	judo	1	paris 2024	1994
3805	japan	ikee rikako	swimming	3	rio 2016	2000
3806	denmark	rikke iversen	handball	1	paris 2024	1993
3807	japan	riko ueki	football	1	paris 2024	1999
3808	japan	riku matsuyama	swimming	1	paris 2024	2001
3809	australia	riley fitzsimmons	canoe	3	rio 2016	1996
3810	canada	riley melanson	canoe sprint	1	paris 2024	1999
3811	japan	rina kishi	artistic gymnastics	1	paris 2024	2007
3812	netherlands	rinka duijndam	handball	2	tokyo 2020	1997
3813	japan	rinka matsuda	rugby sevens	1	paris 2024	2001
3814	croatia	rino buric	water polo	1	paris 2024	1997
3815	japan	rio shirai	swimming	1	tokyo 2020	1999
3816	japan	risa shimizu	football	2	tokyo 2020	1996
3817	japan	risa takashima	fencing	1	paris 2024	1999
3818	new zealand	risi pouri-lane	rugby sevens	2	tokyo 2020	2000
3819	hungary	rita keszthelyi	water polo	4	london 2012	1991
3820	portugal	rita ralao duarte	equestrian	1	paris 2024	1993
3821	hungary	rita recsei	athletics	2	rio 2016	1996
3822	canada	rj barrett	basketball	1	paris 2024	2000
3823	dominican republic	robert king	athletics	1	paris 2024	1996
3824	poland	robert powala	equestrian	1	paris 2024	1971
3825	italy	roberta bianconi	water polo	3	london 2012	1989
3826	brazil	roberta ratzke	volleyball	2	tokyo 2020	1990
3827	italy	roberto russo	volleyball	1	paris 2024	1997
3828	switzerland	robin godel	equestrian	2	tokyo 2020	1998
3829	sweden	robin hanson	swimming	1	tokyo 2020	2001
3830	israel	robin muhr	equestrian	1	paris 2024	1995
3831	argentina	rocio sanchez moccia	hockey	4	london 2012	1988
3832	spain	rodrigo corrales rodal	handball	2	tokyo 2020	1991
3833	paraguay	rodrigo frutos	football	1	paris 2024	2003
3834	spain	rodrigo germade barreiro	canoe sprint	3	rio 2016	1990
3835	argentina	rodrigo isgro	rugby sevens	2	tokyo 2020	1999
3836	brazil	rodrigo pessoa	equestrian	8	barcelona 1992	1972
3837	spain	roger tahull compte	water polo	3	rio 2016	1997
3838	australia	rohan browning	athletics	2	tokyo 2020	1997
3839	slovenia	rok mozic	volleyball	1	paris 2024	2002
3840	hungary	roland mikler	handball	2	london 2012	1984
3841	sweden	rolf-goran bengtsson	equestrian	6	atlanta 1996	1962
3842	france	romain cannone	fencing	2	tokyo 2020	1997
3843	france	romain marion vernoux	water polo	1	paris 2024	2000
3844	france	roman fuchs	swimming	1	paris 2024	1998
3845	switzerland	roman mityukov	swimming	2	tokyo 2020	2000
3846	france	romane bernies	basketball	1	paris 2024	1993
3847	france	romane dicko	judo	2	tokyo 2020	1999
3848	france	romane lunel	artistic swimming	1	paris 2024	2004
3849	israel	romi paritzki	rhythmic gymnastics	1	paris 2024	2004
3850	germany	romy bar	basketball	1	paris 2024	1987
3851	israel	ron polonsky	swimming	2	tokyo 2020	2001
3852	south africa	ronald brown	rugby sevens	2	tokyo 2020	1995
3853	ecuador	ronald zabala-goetschel	equestrian	2	london 2012	1966
3854	paraguay	ronaldo de jesus	football	1	paris 2024	2001
3855	netherlands	roos de jong	rowing	2	tokyo 2020	1993
3856	great britain	rory gibbs	rowing	2	tokyo 2020	1994
3857	mexico	rosa maria tapia vidal	triathlon	1	paris 2024	1997
3858	great britain	rosalind canter	equestrian	1	paris 2024	1986
3859	brazil	rosamaria montibeller	volleyball	2	tokyo 2020	1994
3860	united states of america	rose lavelle	football	2	tokyo 2020	1995
3861	cuba	rose mary almanza	athletics	4	london 2012	1992
3862	nigeria	rosemary chukwuma	athletics	2	tokyo 2020	2001
3863	south africa	rosko specman	rugby sevens	2	rio 2016	1989
3864	italy	rossella fiamingo	fencing	4	london 2012	1991
3865	great britain	rowan mckellar	rowing	2	tokyo 2020	1994
3866	unknown	unknown	rowing	1	tokyo 2020	1995
3867	romania	roxana anghel	rowing	2	tokyo 2020	1998
3868	cuba	roxana gomez	athletics	3	rio 2016	1999
3869	israel	roy revivo	football	1	paris 2024	2003
3870	israel	roy sasoon	football	1	paris 2024	2001
3871	netherlands	roy van den berg	cycling track	2	tokyo 2020	1988
3872	people's republic of china	ru zhang	basketball	2	tokyo 2020	1999
3873	netherlands	ruben knab	rowing	3	london 2012	1988
3874	venezuela	ruben limardo gascon	fencing	5	beijing 2008	1985
3875	germany	ruben schott	volleyball	1	paris 2024	1994
3876	great britain	ruby evans	artistic gymnastics	1	paris 2024	2007
3877	australia	ruby pass	artistic gymnastics	1	paris 2024	2007
3878	united states of america	ruby remati	artistic swimming	1	paris 2024	2002
3879	spain	rudy fernandez	basketball	6	athens 2004	1985
3880	france	rudy gobert	basketball	3	rio 2016	1992
3881	japan	rui hachimura	basketball	2	tokyo 2020	1998
3882	japan	rui machida	basketball	3	rio 2016	1993
3883	germany	rune dahmke	handball	1	paris 2024	1993
3884	people's republic of china	ruoteng xiao	artistic gymnastics	2	tokyo 2020	1996
3885	great britain	rupert scott shipperley	hockey	2	tokyo 2020	1992
3886	kazakhstan	ruslan kurbanov	fencing	2	tokyo 2020	1991
3887	uzbekistan	ruslanbek jiyanov	football	1	paris 2024	2001
3888	brazil	ruy fonseca	equestrian	3	london 2012	1973
3889	south africa	ryan cowen julius	hockey	2	tokyo 2020	1995
3890	united states of america	ryan murphy	swimming	3	rio 2016	1995
3891	south africa	ryan oosthuizen	rugby sevens	1	paris 2024	1995
3892	france	ryan zeze	athletics	2	tokyo 2020	1998
3893	united states of america	ryann neushul	water polo	1	paris 2024	1999
3894	united states of america	ryder dodd	water polo	1	paris 2024	2006
3895	japan	ryotaro araki	football	1	paris 2024	2002
3896	japan	ryuichiro sakai	athletics	1	paris 2024	1998
3897	japan	ryuju nagayama	judo	1	paris 2024	1996
3898	japan	ryuya nishio	football	1	paris 2024	2001
3899	japan	ryuzo kitajima	equestrian	3	rio 2016	1985
3900	canada	sabrina d angelo	football	2	rio 2016	1993
3901	united states of america	sabrina ionescu	3x3 basketball	1	paris 2024	1997
3902	romania	sabrina maneca-voinea	artistic gymnastics	1	paris 2024	2007
3903	netherlands	sabrina van der sloot	water polo	2	tokyo 2020	1991
3904	canada	sade mccreath	athletics	1	paris 2024	1996
3905	republic of korea	saeyoung park	handball	1	paris 2024	1994
3906	israel	sagi muki	judo	3	rio 2016	1992
3907	cuba	sahily diago	athletics	3	rio 2016	1995
3908	uzbekistan	saidazamat mirsaidov	football	1	paris 2024	2001
3909	japan	saki hayashi	basketball	2	tokyo 2020	1995
3910	japan	saki kumagai	football	3	london 2012	1990
3911	japan	saki niizoe	judo	1	paris 2024	1996
3912	japan	saki tanaka	hockey	1	paris 2024	1998
3913	france	sakina karchaoui	football	2	rio 2016	1996
3914	japan	sakura mizutani	rugby sevens	1	paris 2024	2003
3915	japan	sakurako omoto	hockey	2	tokyo 2020	1998
3916	mali	salam jiddou	football	1	paris 2024	2000
3917	türkiye	salih yildiz	judo	1	paris 2024	2001
3918	united arab emirates	salim ahmed al suwaidi	equestrian	1	paris 2024	1988
3919	egypt	salma marei	artistic swimming	1	paris 2024	2005
3920	spain	salma paralluelo	football	1	paris 2024	2003
3921	spain	salma solaun	rhythmic gymnastics	1	paris 2024	2005
3922	switzerland	salome huesler	athletics	1	paris 2024	2002
3923	switzerland	salome kora	athletics	3	rio 2016	1994
3924	spain	salvador cases roca	judo	1	paris 2024	1998
3925	italy	salvatore monfrecola	rowing	1	paris 2024	1997
3926	new zealand	sam lane	hockey	2	tokyo 2020	1997
3927	great britain	sam redgrave	rowing	1	paris 2024	1994
3928	new zealand	sam sutton	football	2	tokyo 2020	2001
3929	netherlands	sam van nunen	swimming	1	paris 2024	2001
3930	great britain	sam ward	hockey	3	rio 2016	1990
3931	australia	sam welsford	cycling track	3	rio 2016	1996
3932	united states of america	samantha coffey	football	1	paris 2024	1998
3933	australia	samantha whitcomb	basketball	1	paris 2024	1988
3934	brazil	samara vieira	handball	2	tokyo 2020	1991
3935	canada	sami hill	basketball	1	paris 2024	1994
3936	south africa	samkelo mvimbi	hockey	2	tokyo 2020	1999
3937	united states of america	sammy sullivan	rugby sevens	1	paris 2024	1998
3938	spain	samuel aghehowa	football	1	paris 2024	2004
3939	kenya	samuel asati	rugby sevens	1	paris 2024	1999
3940	great britain	samuel dickinson	triathlon	1	paris 2024	1997
3941	austria	samuel gassner	judo	1	paris 2024	2001
3942	nigeria	samuel ogazi	athletics	1	paris 2024	2006
3943	canada	samuel zakutney	artistic gymnastics	1	paris 2024	1998
3944	trinidad and tobago	sanaa frederick	athletics	1	paris 2024	2006
3945	netherlands	sander de graaf	rowing	2	tokyo 2020	1995
3946	norway	sander sagosen	handball	2	tokyo 2020	1995
3947	france	sandie toletti	football	1	paris 2024	1995
3948	hungary	sandor totka	canoe	3	rio 2016	1994
3949	colombia	sandra arenas	athletics	4	london 2012	1993
3950	colombia	sandra sepulveda	football	2	london 2012	1988
3951	poland	sandra sysojeva	equestrian	1	paris 2024	1983
3952	denmark	sandra toft	handball	1	paris 2024	1989
3953	spain	sandra ygueravide	3x3 basketball	1	paris 2024	1984
3954	france	sandy baltimore	football	1	paris 2024	2000
3955	people's republic of china	sanfeng nong	water polo	1	paris 2024	1998
3956	republic of korea	sanguk oh	fencing	2	tokyo 2020	1996
3957	republic of korea	sangwon park	fencing	1	paris 2024	2000
3958	india	sanjay sanjay	hockey	1	paris 2024	2001
3959	finland	sanna siltakorpi	equestrian	1	paris 2024	1987
3960	norway	sanna solberg	handball	3	rio 2016	1990
3961	netherlands	sanna veerman	artistic gymnastics	1	paris 2024	2002
3962	netherlands	sanne anne leonie koolen	hockey	2	tokyo 2020	1996
3963	netherlands	sanne de jong	equestrian	1	paris 2024	1994
3964	netherlands	sanne van dijke	judo	2	tokyo 2020	1995
3965	netherlands	sanne wevers	artistic gymnastics	3	rio 2016	1991
3966	japan	sanshiro murao	judo	1	paris 2024	2000
3967	india	santhosh kumar tamilarasan	athletics	1	paris 2024	1998
3968	spain	santiago aldama	basketball	1	paris 2024	2001
3969	argentina	santiago alvarez	rugby sevens	3	rio 2016	1994
3970	colombia	santiago arcila	archery	1	paris 2024	1999
3971	argentina	santiago danani	volleyball	2	tokyo 2020	1995
3972	argentina	santiago hezze	football	1	paris 2024	2001
3973	argentina	santiago mare	rugby sevens	2	tokyo 2020	1996
3974	argentina	santiago tarazona	hockey	2	tokyo 2020	1996
3975	argentina	santiago vera feld	rugby sevens	1	paris 2024	2001
3976	japan	saori miyazaki	basketball	2	tokyo 2020	1995
3977	unknown	saoussen boudiaf	fencing	2	rio 2016	1993
3978	egypt	sara amr hossny	fencing	1	paris 2024	2010
3979	france	sara balzer	fencing	2	tokyo 2020	1995
3980	spain	sara barrios	hockey	1	paris 2024	2000
3981	italy	sara curtis	swimming	1	paris 2024	2006
3982	germany	sara doorsoun	football	1	paris 2024	1991
3983	hungary	sara fojt	canoe sprint	1	paris 2024	2003
3984	sweden	sara junevik	swimming	1	tokyo 2020	2000
3985	serbia	sara lozo	volleyball	1	paris 2024	1997
3986	denmark	sara maria johansen	rowing	1	paris 2024	2000
3987	spain	sara ouzande	canoe sprint	1	paris 2024	1996
3988	denmark	sarah aaberg iversen	handball	1	paris 2024	1990
3989	switzerland	sarah atcho	athletics	3	rio 2016	1995
3990	france	sarah bouktit	handball	1	paris 2024	2002
3991	germany	sarah bruessler	canoe sprint	2	tokyo 2020	1994
3992	netherlands	sarah buis	water polo	1	paris 2024	2000
3993	ireland	sarah ennis	equestrian	2	tokyo 2020	1975
3994	new zealand	sarah goss	rugby sevens	3	rio 2016	1992
3995	australia	sarah hawe	rowing	2	tokyo 2020	1987
3996	france	sarah leonie cysique	judo	2	tokyo 2020	1998
3997	united states of america	sarah levy	rugby sevens	1	paris 2024	1995
3998	great britain	sarah louise jones	hockey	2	tokyo 2020	1990
3999	italy	sarah luisa fahr	volleyball	2	tokyo 2020	2001
4000	france	sarah michel	basketball	3	rio 2016	1989
4001	france	sarah noutcha	fencing	1	paris 2024	1999
4002	canada	sarah orban	cycling track	2	tokyo 2020	1995
4003	great britain	sarah robertson	hockey	2	tokyo 2020	1993
4004	sweden	sarah sjöström	swimming	5	beijing 2008	1993
4005	netherlands	sarah van aalen	volleyball	1	paris 2024	2000
4006	canada	sarah van dam	cycling track	1	paris 2024	2001
4007	germany	sarah wachter	handball	1	paris 2024	1999
4008	germany	sarai linder	football	1	paris 2024	1999
4009	uzbekistan	sardor nurillaev	judo	2	tokyo 2020	1994
4010	australia	sariah paki	rugby sevens	2	tokyo 2020	2001
4011	japan	sarina koga	volleyball	2	tokyo 2020	1996
4012	new zealand	sarpreet singh	football	1	paris 2024	1999
4013	lithuania	sarunas vingelis	3x3 basketball	1	paris 2024	1989
4014	serbia	sasa cado	basketball	3	rio 2016	1989
4015	jamaica	sashalee forbes	athletics	2	rio 2016	1996
4016	australia	saskia broedelet	rhythmic gymnastics	1	paris 2024	2004
4017	germany	saskia feige	athletics	2	tokyo 2020	1997
4018	slovenia	saso stalekar	volleyball	1	paris 2024	1996
4019	japan	satomi fukudome	volleyball	1	paris 2024	1997
4020	japan	satomi suzuki	swimming	3	london 2012	1991
4021	germany	satou sabally	basketball	1	paris 2024	1998
4022	spain	saul craviotto	canoe	5	beijing 2008	1984
4023	serbia	sava randelovic	water polo	3	rio 2016	1993
4024	canada	savannah sutherland	athletics	1	paris 2024	2003
4025	italy	savita russo	judo	1	paris 2024	2005
4026	canada	scarlett finn	artistic swimming	1	paris 2024	2002
4027	denmark	schastine tabor	swimming	1	paris 2024	2005
4028	switzerland	scott baerlocher	rowing	1	paris 2024	1997
4029	new zealand	scott boyde	hockey	1	paris 2024	1994
4030	great britain	scott brash	equestrian	3	london 2012	1985
4031	new zealand	scott curry	rugby sevens	3	rio 2016	1988
4032	ireland	sean cribbin	rugby sevens	1	paris 2024	1998
4033	new zealand	sean findlay	hockey	2	tokyo 2020	2001
4034	israel	sean goldberg	football	1	paris 2024	1995
4035	ireland	sean murray	hockey	1	paris 2024	1997
4036	norway	sebastian hein barthold	handball	1	paris 2024	1991
4037	germany	sebastian heymann	handball	1	paris 2024	1998
4038	sweden	sebastian karlsson	handball	1	paris 2024	1995
4039	romania	sebastian stefan oltean	water polo	1	paris 2024	2001
4040	australia	sebastian sultana	athletics	1	paris 2024	2005
4041	france	sebastien patrice	fencing	1	paris 2024	2000
4042	france	sebastien vigier	cycling track	2	tokyo 2020	1997
4043	republic of korea	sebin choi	fencing	1	paris 2024	2000
4044	egypt	seif elderaa	handball	2	tokyo 2020	1998
4045	egypt	seifeldin hassan aly	volleyball	1	paris 2024	1999
4046	japan	seiji kimura	football	1	paris 2024	2001
4047	japan	seiya adachi	water polo	3	rio 2016	1995
4048	guinea	sekou tidiany bangoura	football	1	paris 2024	2002
4049	fiji	selesitino ravutaumada	rugby sevens	1	paris 2024	2000
4050	germany	selin oruz	hockey	3	rio 2016	1997
4051	france	selma bacha	football	1	paris 2024	2000
4052	south africa	selvyn davids	rugby sevens	2	tokyo 2020	1994
4053	republic of korea	yeo seojeong	artistic gymnastics	2	tokyo 2020	2002
4054	japan	sera azuma	fencing	2	tokyo 2020	1999
4055	republic of korea	sera song	fencing	2	tokyo 2020	1993
4056	france	seraphine okemba	rugby sevens	2	tokyo 2020	1995
4057	canada	serena browne	water polo	1	paris 2024	2004
4058	spain	sergi cabanas pegado	water polo	1	paris 2024	1996
4059	spain	sergio alvarez moya	equestrian	2	rio 2016	1985
4060	spain	sergio de celis montalban	swimming	1	paris 2024	2000
4061	spain	sergio gomez	football	1	paris 2024	2000
4062	spain	sergio llull	basketball	4	london 2012	1987
4063	romania	sergiu bejan	rowing	2	tokyo 2020	1996
4064	japan	seri ozaki	fencing	1	paris 2024	2002
4065	fiji	sesenieli donu	rugby sevens	2	tokyo 2020	1996
4066	united states of america	seth rider	triathlon	1	paris 2024	1997
4067	netherlands	severiano van ass	hockey	3	rio 2016	1992
4068	fiji	sevuloni mocenacagi	rugby sevens	1	paris 2024	1990
4069	united states of america	sha'carri richardson	athletics	1	paris 2024	2000
4070	new zealand	shaane fulton	cycling track	1	paris 2024	2000
4071	canada	shady elnahas	judo	2	tokyo 2020	1998
4072	canada	shae la roche	water polo	2	tokyo 2020	1992
4073	canada	shai gilgeous-alexander	basketball	1	paris 2024	1998
4074	trinidad and tobago	shakeem mc kay	athletics	1	paris 2024	2003
4075	uzbekistan	shakhzoda ibragimova	rhythmic gymnastics	1	paris 2024	2002
4076	canada	shallon olsen	artistic gymnastics	3	rio 2016	2000
4077	united states of america	shamier little	athletics	2	tokyo 2020	1995
4078	india	shamsher singh	hockey	2	tokyo 2020	1997
4079	france	shana grebo	athletics	1	paris 2024	2000
4080	ireland	shane odonoghue	hockey	2	rio 2016	1992
4081	australia	shane rose	equestrian	4	beijing 2008	1973
4082	ireland	shane ryan	swimming	3	rio 2016	1994
4083	ireland	shane sweetnam	equestrian	2	tokyo 2020	1981
4084	israel	shani bakanov	rhythmic gymnastics	1	paris 2024	2006
4085	people's republic of china	shanju bao	cycling track	2	tokyo 2020	1997
4086	india	sharath kamal achanta	table tennis	5	athens 2004	1982
4087	ireland	sharlene mawdsley	athletics	1	paris 2024	1998
4088	australia	sharn freier	football	1	paris 2024	2001
4089	australia	sharni williams	rugby sevens	3	rio 2016	1988
4090	uzbekistan	sharofiddin boltaboev	judo	2	tokyo 2020	1995
4091	canada	shaul gordon	fencing	2	tokyo 2020	1994
4092	south africa	shaun maswanganyi	athletics	2	tokyo 2020	2001
4093	south africa	shaun williams	rugby sevens	1	paris 2024	1998
4094	canada	shay colley	basketball	2	tokyo 2020	1996
4095	australia	shayna jack	swimming	1	paris 2024	1998
4096	canada	shelina zadorsky	football	2	rio 2016	1992
4097	australia	shenae lowings	equestrian	1	paris 2024	1996
4098	jamaica	shiann salmon	athletics	2	tokyo 2020	1999
4099	japan	shiho kobayakawa	hockey	1	paris 2024	1999
4100	japan	shihomi fukushima	fencing	2	tokyo 2020	1995
4101	japan	shihori oikawa	hockey	2	tokyo 2020	1989
4102	people's republic of china	shijie qieyang	athletics	4	london 2012	1990
4103	south africa	shilton van wyk	rugby sevens	1	paris 2024	1999
4104	japan	shinji nakano	cycling track	1	paris 2024	1999
4105	japan	shinnosuke oka	artistic gymnastics	1	paris 2024	2003
4106	japan	shinnosuke tokuda	handball	2	tokyo 2020	1995
4107	israel	shira rishony	judo	3	rio 2016	1991
4108	france	shirine boukli	judo	2	tokyo 2020	1999
4109	egypt	shirwit gaber	fencing	1	paris 2024	1998
4110	great britain	sholto carnegie	rowing	2	tokyo 2020	1995
4111	japan	shota fujio	football	1	paris 2024	2001
4112	japan	shotaro tsuoka	rugby sevens	1	paris 2024	1996
4113	people's republic of china	shuai guo	cycling track	1	paris 2024	1995
4114	japan	shuichi yoshida	handball	2	tokyo 2020	2001
4115	uzbekistan	shukurjon aminova	judo	1	paris 2024	2002
4116	japan	shunsuke mito	football	1	paris 2024	2002
4117	japan	shunsuke togami	table tennis	1	paris 2024	2001
4118	people's republic of china	shuxian zhang	rowing	1	paris 2024	1997
4119	people's republic of china	shuyu yang	3x3 basketball	2	tokyo 2020	2002
4120	australia	sienna green	water polo	1	paris 2024	2004
4121	australia	sienna hearn	water polo	1	paris 2024	2002
4122	denmark	signe bro	swimming	1	tokyo 2020	1999
4123	people's republic of china	sihan yu	fencing	1	paris 2024	2001
4124	republic of korea	sihyeon lim	archery	1	paris 2024	2003
4125	people's republic of china	sijing huang	basketball	3	rio 2016	1996
4126	norway	silje solberg	handball	2	tokyo 2020	1990
4127	netherlands	silke holkenborg	swimming	1	paris 2024	2001
4128	italy	silvia avegno	water polo	1	paris 2024	1997
4129	spain	silvia eugenia arderius	handball	1	paris 2024	1990
4130	italy	silvia terrazzi	rowing	1	paris 2024	1995
4131	romania	silvian colodrovschi	water polo	1	paris 2024	2000
4132	serbia	silvija popovic	volleyball	3	rio 2016	1986
4133	norway	simen ulstad lyse	handball	1	paris 2024	2000
4134	canada	simi awujo	football	1	paris 2024	2003
4135	austria	simon bucher	swimming	2	tokyo 2020	2000
4136	new zealand	simon child	hockey	4	beijing 2008	1988
4137	france	simon delestre	equestrian	3	london 2012	1981
4138	france	simon gauzy	table tennis	3	rio 2016	1994
4139	denmark	simon hald	handball	1	paris 2024	1994
4140	france	simon martin-brisac	hockey	1	paris 2024	1992
4141	canada	simon mctavish	canoe sprint	2	tokyo 2020	1996
4142	denmark	simon pytlick	handball	1	paris 2024	2000
4143	new zealand	simon yorston	hockey	1	paris 2024	2000
4144	romania	simona radis	rowing	2	tokyo 2020	1999
4145	lithuania	simonas maldonis	canoe sprint	1	paris 2024	1993
4146	united states of america	simone biles	artistic gymnastics	3	rio 2016	1997
4147	italy	simone consonni	cycling track	3	rio 2016	1994
4148	italy	simone giannelli	volleyball	3	rio 2016	1996
4149	united states of america	simone manuel	swimming	3	rio 2016	1996
4150	australia	simone pearce	equestrian	2	tokyo 2020	1991
4151	netherlands	simone van de kraats	water polo	2	tokyo 2020	2000
4152	hong kong	siobhan bernadette haughey	swimming	3	rio 2016	1997
4153	new zealand	sione molia	rugby sevens	3	rio 2016	1993
4154	south africa	siviwe siyozwapi	rugby sevens	2	tokyo 2020	1992
4155	people's republic of china	siya yan	water polo	1	paris 2024	2002
4156	people's republic of china	siyu wang	basketball	2	tokyo 2020	1995
4157	south africa	sizophila solontsi	rugby sevens	1	paris 2024	1992
4158	germany	sjoeke nuesken	football	1	paris 2024	2001
4159	germany	skadi schier	athletics	1	paris 2024	2000
4160	argentina	sofia cairo	hockey	1	paris 2024	2002
4161	mexico	sofia flores	rhythmic gymnastics	1	paris 2024	2004
4162	italy	sofia giustini	water polo	1	paris 2024	2003
4163	sweden	sofia hvenfelt	handball	1	paris 2024	1996
4164	bulgaria	sofia ivanova	rhythmic gymnastics	1	paris 2024	2005
4165	italy	sofia mastroianni	artistic swimming	1	paris 2024	2001
4166	italy	sofia morini	swimming	1	paris 2024	2003
4167	brazil	sofia pereira	rhythmic gymnastics	1	paris 2024	2003
4168	puerto rico	sofia roma	basketball	1	paris 2024	1996
4169	sweden	sofia sjoborg	equestrian	1	paris 2024	1998
4170	argentina	sofia toccalino	hockey	2	tokyo 2020	1997
4171	denmark	sofie vikkelsoee	rowing	1	paris 2024	2002
4172	japan	soichi hashimoto	judo	1	paris 2024	1991
4173	trinidad and tobago	sole frederick	athletics	1	paris 2024	2006
4174	norway	solveig lovseth	triathlon	1	paris 2024	1999
4175	republic of korea	solyi shin	artistic gymnastics	1	paris 2024	2004
4176	hungary	soma vogel	water polo	2	tokyo 2020	1997
4177	egypt	sondos mohamed	artistic swimming	1	paris 2024	2005
4178	spain	sonia molina-prados	athletics	1	paris 2024	1993
4179	germany	sonja greinacher	3x3 basketball	1	paris 2024	1992
4180	germany	sonja zimmermann	hockey	2	tokyo 2020	1999
4181	germany	sonke rothenberger	equestrian	2	rio 2016	1994
4182	united states of america	sophia gladieux	hockey	1	paris 2024	2002
4183	united states of america	sophia smith	football	1	paris 2024	2000
4184	canada	sophie angus	swimming	1	paris 2024	1999
4185	ireland	sophie becker	athletics	2	tokyo 2020	1997
4186	great britain	sophie capewell	cycling track	1	paris 2024	1998
4187	australia	sophie edwards	cycling track	1	paris 2024	2000
4188	great britain	sophie hamilton	hockey	1	paris 2024	2001
4189	sweden	sophie hansson	swimming	3	rio 2016	1998
4190	australia	sophie linn	triathlon	1	paris 2024	1995
4191	denmark	sophie oestergaard	rowing	1	paris 2024	1999
4192	georgia	sophio somkhishvili	judo	1	paris 2024	2000
4193	mongolia	sosorbaram lkhagvasuren	judo	2	tokyo 2020	2001
4194	japan	sota kawasaki	football	1	paris 2024	2001
4195	japan	sota takano	handball	1	paris 2024	1998
4196	morocco	soufiane rahimi	football	1	paris 2024	1996
4197	guinea	soumaila sylla	football	1	paris 2024	2004
4198	france	soungoutou magassa	football	1	paris 2024	2003
4199	france	sounkamba sylla	athletics	2	tokyo 2020	1998
4200	australia	spencer turrin	rowing	3	rio 2016	1991
4201	india	sreeja akula	table tennis	1	paris 2024	1998
4202	india	pr sreejesh	hockey	4	london 2012	1988
4203	jamaica	stacey ann williams	athletics	2	tokyo 2020	1999
4204	ireland	stacey flood	rugby sevens	1	paris 2024	1996
4205	new zealand	stacey waaka	rugby sevens	1	paris 2024	1995
4206	netherlands	stan pijnenburg	swimming	1	tokyo 2020	1996
4207	slovenia	stas jovicic	handball	1	paris 2024	2000
4208	israel	stav lemkin	football	1	paris 2024	2003
4209	romania	stefan berariu	rowing	2	tokyo 2020	1999
4210	germany	stefan boetticher	cycling track	2	tokyo 2020	1992
4211	austria	stefan lehfellner	equestrian	1	paris 2024	1983
4212	montenegro	stefan vidovic	water polo	2	tokyo 2020	1992
4213	united states of america	steffen peters	equestrian	6	atlanta 1996	1964
4214	netherlands	steffie van der peet	cycling track	1	paris 2024	1999
4215	netherlands	steijn van heijningen	hockey	1	paris 2024	1997
4216	angola	stelvia pascoal	handball	2	tokyo 2020	2002
4217	australia	steph catley	football	3	rio 2016	1994
4218	united states of america	steph rovetti	rugby sevens	1	paris 2024	1991
4219	brazil	stephan de freitas barcha	equestrian	2	rio 2016	1989
4220	france	stephane landois	equestrian	1	paris 2024	1994
4221	australia	stephanie anna kershaw	hockey	2	tokyo 2020	1995
4222	hong kong	stephanie au	swimming	3	beijing 2008	1992
4223	brazil	stephanie balduccini	swimming	1	tokyo 2020	2004
4224	south africa	stephanie botha	hockey	1	paris 2024	1998
4225	japan	stephanie mawuli	3x3 basketball	2	tokyo 2020	1998
4226	australia	stephanie talbot	basketball	3	rio 2016	1994
4227	belgium	stephanie vanden borre	hockey	1	paris 2024	1997
4228	united states of america	stephen curry	basketball	1	paris 2024	0
4229	united states of america	stephen nedoroscik	artistic gymnastics	1	paris 2024	1998
4230	france	stephen parez	rugby sevens	2	rio 2016	1994
4231	puerto rico	stephen thompson jr.	basketball	1	paris 2024	1997
4232	canada	stephen timothy maar	volleyball	2	tokyo 2020	1994
4233	united states of america	stephen tomasin	rugby sevens	2	tokyo 2020	1994
4234	jamaica	stephenie ann mcpherson	athletics	3	rio 2016	1988
4235	greece	stergios marios bilas	swimming	1	paris 2024	2001
4236	switzerland	steve guerdat	equestrian	6	athens 2004	1982
4237	samoa	steve solo	rugby sevens	1	paris 2024	2001
4238	norway	stine bredal oftedal	handball	3	rio 2016	1991
4239	germany	stine kurz	hockey	1	paris 2024	2000
4240	norway	stine skogrand	handball	2	tokyo 2020	1993
4241	serbia	strahinja buncic	judo	1	paris 2024	1996
4242	serbia	strahinja rasovic	water polo	2	tokyo 2020	1992
4243	serbia	strahinja stojacic	3x3 basketball	1	paris 2024	1992
4244	greece	stylianos argyropoulos kanakakis	water polo	2	tokyo 2020	1996
4245	iraq	suad natiq	football	2	rio 2016	1994
4246	india	subha venkatesan	athletics	2	tokyo 2020	1999
4247	hungary	sugar katinka battai	fencing	2	tokyo 2020	2003
4248	republic of korea	suhyeon nam	archery	1	paris 2024	2005
4249	india	sukhjeet singh	hockey	1	paris 2024	1996
4250	india	sumit	hockey	2	tokyo 2020	1996
4251	canada	summer mcintosh	swimming	2	tokyo 2020	2006
4252	south sudan	sunday dech	basketball	1	paris 2024	1994
4253	united states of america	sunisa lee	artistic gymnastics	2	tokyo 2020	2003
4254	republic of korea	sunwoo hwang	swimming	2	tokyo 2020	2003
4255	india	suraj panwar	athletics	1	paris 2024	2001
4256	ireland	susannah berry	equestrian	1	paris 2024	1996
4257	thailand	suthasini sawettabut	table tennis	3	rio 2016	1994
4258	germany	svenja brunckhorst	3x3 basketball	1	paris 2024	1991
4259	malaysia	syaqiera mashayikh	archery	2	tokyo 2020	2000
4260	germany	sydney lohmann	football	1	paris 2024	2000
4261	united states of america	sydney mclaughlin-levrone	athletics	3	rio 2016	1999
4262	canada	sydney payne	rowing	2	tokyo 2020	1997
4263	indonesia	syifa nurafifah kamal	archery	1	paris 2024	1991
4264	canada	syla swords	basketball	1	paris 2024	2006
4265	hungary	szabina gercsak	judo	1	paris 2024	1996
4266	hungary	szebasztian szabo	swimming	2	tokyo 2020	1996
4267	hungary	szilard jansik	water polo	2	tokyo 2020	1994
4268	hungary	szofi ozbas	judo	2	tokyo 2020	2001
4269	chinese taipei	szu-yu chen	table tennis	4	london 2012	1993
4270	germany	tabea schendekehl	rowing	1	paris 2024	1998
4271	argentina	tadeo marcucci	hockey	1	paris 2024	2001
4272	switzerland	taha serhani	artistic gymnastics	1	paris 2024	1995
4273	south africa	taheera augousti	hockey	1	paris 2024	2005
4274	japan	taichi yoshizawa	rugby sevens	1	paris 2024	1991
4275	japan	taiga ishida	rugby sevens	1	paris 2024	1997
4276	brazil	taina	football	1	paris 2024	1995
4277	brazil	tainara lemes santos	volleyball	1	paris 2024	2000
4278	japan	taishi nozawa	football	1	paris 2024	2002
4279	japan	taishi onodera	volleyball	2	tokyo 2020	1996
4280	japan	taiyo watanabe	water polo	1	paris 2024	2001
4281	japan	taizo sugitani	equestrian	7	atlanta 1996	1976
4282	japan	tajon akira jacobs	basketball	1	paris 2024	2004
4283	japan	takaaki sugino	artistic gymnastics	1	paris 2024	1998
4284	japan	takaharu furukawa	archery	6	athens 2004	1984
4285	japan	takahiro shikine	fencing	2	tokyo 2020	1997
4286	japan	takamasa maruo	rugby sevens	1	paris 2024	1999
4287	japan	takanori nagase	judo	3	rio 2016	1993
4288	japan	takashi haase shibayama	equestrian	1	paris 2024	1980
4289	japan	taku taniguchi	swimming	1	paris 2024	2001
4290	japan	takumi nakamura	handball	1	paris 2024	1996
4291	hungary	tamara csipes	canoe	3	rio 2016	1989
4292	netherlands	tamara haggerty	handball	1	paris 2024	1996
4293	france	tamara horacek	handball	2	rio 2016	1995
4294	slovenia	tamara mavsar	handball	1	paris 2024	1991
4295	australia	tameka butt	football	3	rio 2016	1991
4296	brazil	tamires	football	3	rio 2016	1987
4297	brazil	tamires lima de araujo	handball	2	tokyo 2020	1994
4298	united states of america	tanner tessmann	football	1	paris 2024	2001
4299	united states of america	tara prentice	water polo	1	paris 2024	1997
4300	new zealand	tara vaughan	canoe sprint	1	paris 2024	2003
4301	brazil	tarciane	football	1	paris 2024	2003
4302	india	tarundeep rai	archery	4	athens 2004	1984
4303	netherlands	tasa jiya	athletics	1	paris 2024	1997
4304	united states of america	tatiana nazlymov	fencing	1	paris 2024	2004
4305	georgia	tato grigalashvili	judo	2	tokyo 2020	1999
4306	japan	tatsuki yoshino	handball	2	tokyo 2020	1994
4307	japan	tatsunori otsuka	volleyball	2	tokyo 2020	2000
4308	japan	tatsuru saito	judo	1	paris 2024	2002
4309	japan	tatsuya murasa	swimming	1	paris 2024	2007
4310	australia	tatum stewart	hockey	1	paris 2024	2002
4311	samoa	taunuu niulevaea	rugby sevens	1	paris 2024	2000
4312	united states of america	taylor averill	volleyball	1	paris 2024	1992
4313	united states of america	taylor booth	football	1	paris 2024	2001
4314	united states of america	taylor knibb	cycling road	2	tokyo 2020	1998
4315	canada	taylor madison ruck	swimming	3	rio 2016	2000
4316	united states of america	taylor spivey	triathlon	1	paris 2024	1991
4317	netherlands	taymir burnet	athletics	2	tokyo 2020	1992
4318	puerto rico	tayra melendez	basketball	2	tokyo 2020	1993
4319	australia	teagan levi	rugby sevens	1	paris 2024	2003
4320	australia	teagan micah	football	2	tokyo 2020	1997
4321	united states of america	teal cohen	rowing	1	paris 2024	1999
4322	france	teddy riner	judo	5	beijing 2008	1989
4323	france	teo andant	athletics	1	paris 2024	1999
4324	germany	teo hinrichs	hockey	1	paris 2024	1999
4325	france	teo rayet	rowing	1	paris 2024	1999
4326	new zealand	tepaea cook savage	rugby sevens	1	paris 2024	2001
4327	spain	teresa abelleira	football	1	paris 2024	2000
4328	spain	teresa portela	canoe	7	sydney 2000	1982
4329	fiji	terio tamani	rugby sevens	1	paris 2024	1994
4330	ireland	terry kennedy	rugby sevens	2	tokyo 2020	1996
4331	netherlands	tes schouten	swimming	2	tokyo 2020	2000
4332	great britain	tess howard	hockey	1	paris 2024	1999
4333	australia	tess madgen	basketball	2	tokyo 2020	1990
4334	netherlands	tessa dullemans	rowing	1	paris 2024	1997
4335	netherlands	tessa giele	swimming	1	paris 2024	2002
4336	france	tessa-margot schubert	hockey	1	paris 2024	1996
4337	ukraine	tetiana melnyk	athletics	3	rio 2016	1995
4338	south africa	tevin michael kok	hockey	2	tokyo 2020	1996
4339	brazil	thais	football	1	paris 2024	1996
4340	brazil	thaisa daher de menezes	volleyball	1	paris 2024	1987
4341	australia	thaisa erwin	equestrian	1	paris 2024	1980
4342	norway	thale rushfeldt deila	handball	1	paris 2024	2000
4343	brazil	thales hoss	volleyball	2	tokyo 2020	1989
4344	brazil	thalia da silva costa	rugby sevens	2	tokyo 2020	1997
4345	brazil	thalita da silva costa	rugby sevens	2	tokyo 2020	1997
4346	denmark	thea blomsterberg	swimming	1	paris 2024	2002
4347	france	theo faure	volleyball	1	paris 2024	1999
4348	france	theo forner	rugby sevens	1	paris 2024	2001
4349	greece	theodora drakou	swimming	4	london 2012	1992
4350	new zealand	theresa fitzpatrick	rugby sevens	3	rio 2016	1995
4351	sweden	therese nilshagen	equestrian	2	tokyo 2020	1983
4352	argentina	thiago almada	football	2	tokyo 2020	2001
4353	france	thibaud turlan	rowing	2	tokyo 2020	1996
4354	belgium	thibeau stockbroekx	hockey	1	paris 2024	2000
4355	mali	thiemoko diarra	football	1	paris 2024	2003
4356	spain	thierno diallo	artistic gymnastics	2	tokyo 2020	2000
4357	netherlands	thierry brinkman	hockey	2	tokyo 2020	1995
4358	germany	thies prinz	hockey	1	paris 2024	1998
4359	netherlands	thijs johannes reinier van dam	hockey	2	tokyo 2020	1997
4360	denmark	thomas arnoldsen	handball	1	paris 2024	2002
4361	ireland	thomas barr	athletics	3	rio 2016	1992
4362	great britain	thomas barras	rowing	2	tokyo 2020	1994
4363	france	thomas boudat	cycling track	2	rio 2016	1994
4364	italy	thomas ceccon	swimming	2	tokyo 2020	2001
4365	france	thomas chirault	archery	2	tokyo 2020	1997
4366	france	thomas denis	cycling track	1	paris 2024	1997
4367	great britain	thomas ford	rowing	2	tokyo 2020	1992
4368	united states of america	thomas heilman	swimming	1	paris 2024	2007
4369	united states of america	thomas jaeschke	volleyball	3	rio 2016	1993
4370	new zealand	thomas murray	rowing	3	rio 2016	1994
4371	australia	thomas neill	swimming	2	tokyo 2020	2002
4372	great britain	thomas sorsby	hockey	2	tokyo 2020	1996
4373	france	thomas vernoux	water polo	1	paris 2024	2002
4374	greece	thomas walkup	basketball	1	paris 2024	1992
4375	jamaica	tia clayton	athletics	1	paris 2024	2004
4376	australia	tia hinds	rugby sevens	2	tokyo 2020	2002
4377	south africa	tiaan pretorius	rugby sevens	1	paris 2024	2001
4378	portugal	tiago apolonia	table tennis	5	beijing 2008	1986
4379	switzerland	tiago behar	swimming	1	paris 2024	2002
4380	hungary	tibor andrasfi	fencing	1	paris 2024	1999
4381	united states of america	tierna davidson	football	2	tokyo 2020	1998
4382	canada	tiffany foster	equestrian	3	london 2012	1984
4383	azerbaijan	tiffany hayes	3x3 basketball	1	paris 2024	1989
4384	serbia	tijana boskovic	volleyball	3	rio 2016	1997
4385	netherlands	tijmen reyenga	hockey	1	paris 2024	1999
4386	slovenia	tilen kodrin	handball	1	paris 2024	1994
4387	australia	tim brand	hockey	2	tokyo 2020	1998
4388	switzerland	tim eric roth	rowing	1	paris 2024	2001
4389	germany	tim hellwig	triathlon	1	paris 2024	1999
4390	germany	tim hornke	handball	1	paris 2024	1990
4391	great britain	tim nurse	hockey	1	paris 2024	1999
4392	germany	tim ole naske	rowing	2	tokyo 2020	1996
4393	new zealand	tim price	equestrian	3	rio 2016	1979
4394	germany	tim torn teutenberg	cycling track	1	paris 2024	2002
4395	nigeria	tima seikeseye godbless	athletics	1	paris 2024	2004
4396	israel	timna nelson levy	judo	2	tokyo 2020	1994
4397	germany	timo boll	table tennis	7	sydney 2000	1981
4398	germany	timo cavelius	judo	1	paris 2024	1996
4399	germany	timo eder	artistic gymnastics	1	paris 2024	2005
4400	germany	timo sorgius	swimming	1	paris 2024	2003
4401	france	timothe vergiat	3x3 basketball	1	paris 2024	1998
4402	france	timothee clement	hockey	1	paris 2024	2000
4403	ireland	timothy cross	hockey	1	paris 2024	1991
4404	australia	timothy masters	rowing	2	tokyo 2020	1992
4405	croatia	tin lucin	handball	1	paris 2024	1999
4406	serbia	tina krajisnik	basketball	2	tokyo 2020	1991
4407	belgium	tine magnus	equestrian	1	paris 2024	1991
4408	slovenia	tine urnaut	volleyball	1	paris 2024	1988
4409	people's republic of china	ting hao	rhythmic gymnastics	2	tokyo 2020	2001
4410	people's republic of china	zhu ting	volleyball	3	rio 2016	1994
4411	people's republic of china	tingkai bu	canoe sprint	2	tokyo 2020	1995
4412	netherlands	tinka offereins	rowing	1	paris 2024	1993
4413	netherlands	tisha volleman	artistic gymnastics	1	paris 2024	1999
4414	france	tiziana raspo	water polo	1	paris 2024	2005
4415	slovenia	tjasa pintar	swimming	1	rio 2016	1997
4416	slovenia	tjasa stanko	athletics	1	paris 2024	1997
4417	austria	tjebbe kaindl	triathlon	1	paris 2024	1999
4418	netherlands	tjep hoedemakers	hockey	1	paris 2024	1999
4419	germany	tobias brand	volleyball	1	paris 2024	1998
4420	germany	tobias krick	volleyball	1	paris 2024	1998
4421	argentina	tobias martins	hockey	1	paris 2024	1998
4422	norway	tobias schjoelberg groendahl	handball	1	paris 2024	2001
4423	sweden	tobias thulin	handball	1	paris 2024	1995
4424	argentina	tobias wade	rugby sevens	1	paris 2024	1999
4425	nigeria	tochukwu oluehi	football	2	beijing 2008	1987
4426	israel	tohar butbul	judo	2	tokyo 2020	1994
4427	japan	toi suzuki	water polo	2	tokyo 2020	1999
4428	japan	toko koga	football	1	paris 2024	2006
4429	belgium	tom boon	hockey	4	london 2012	1990
4430	australia	tom craig	hockey	3	rio 2016	1995
4431	great britain	tom dean	swimming	2	tokyo 2020	2000
4432	great britain	tom digby	rowing	1	paris 2024	1998
4433	germany	tom grambusch	hockey	2	rio 2016	1995
4434	great britain	tom hall	archery	2	tokyo 2020	1990
4435	australia	tom joseph wickham	hockey	2	tokyo 2020	1990
4436	germany	tom liebscher	canoe	3	rio 2016	1993
4437	samoa	tom maiava	rugby sevens	1	paris 2024	1999
4438	great britain	tom mcewen	equestrian	2	tokyo 2020	1991
4439	new zealand	tom sexton	cycling track	1	paris 2024	1998
4440	argentina	tomas domene	hockey	1	paris 2024	1997
4441	argentina	tomas elizalde	rugby sevens	1	paris 2024	2002
4442	uruguay	tomas etcheverry	rugby sevens	1	paris 2024	2001
4443	argentina	tomas habif	hockey	2	tokyo 2020	1996
4444	lithuania	tomas lukminas	swimming	1	paris 2024	2004
4445	lithuania	tomas navikonis	swimming	1	paris 2024	2003
4446	argentina	tomas santiago	hockey	1	paris 2024	1992
4447	poland	tomasz fornal	volleyball	1	paris 2024	1997
4448	israel	tomer frankel	swimming	2	tokyo 2020	2000
4449	croatia	tomislav pucar	table tennis	2	tokyo 2020	1996
4450	italy	tommaso gianazza	water polo	1	paris 2024	2002
4451	italy	tommaso marini	fencing	1	paris 2024	2000
4452	japan	tomohiro yamamoto	volleyball	2	tokyo 2020	1994
4453	japan	tomoka sato	artistic swimming	1	paris 2024	2001
4454	japan	tomokazu harimoto	table tennis	2	tokyo 2020	2003
4455	japan	tomoya sakurai	handball	1	paris 2024	1999
4456	slovenia	toncek stern	volleyball	1	paris 2024	1995
4457	new zealand	tone ng shiu	rugby sevens	2	tokyo 2020	1994
4458	netherlands	tone wieten	rowing	3	rio 2016	1994
4459	people's republic of china	tongtong wu	basketball	2	tokyo 2020	1994
4460	nigeria	toni payne	football	1	paris 2024	1995
4461	croatia	toni popadic	water polo	1	paris 2024	1994
4462	estonia	tonu endrekson	rowing	6	athens 2004	1979
4463	germany	torben johannesen	rowing	2	tokyo 2020	1994
4464	norway	torbjoern bergerud	handball	2	tokyo 2020	1994
4465	united states of america	torey defalco	volleyball	2	tokyo 2020	1997
4466	netherlands	tornike tsjakadoea	judo	2	tokyo 2020	1996
4467	united states of america	torri huske	swimming	2	tokyo 2020	2002
4468	australia	torrie lewis	athletics	1	paris 2024	2005
4469	japan	toshiyuki tanaka	equestrian	3	london 2012	1985
4470	canada	toshka besharah-hrebacka	canoe sprint	1	paris 2024	2003
4471	japan	towa nishimura	water polo	1	paris 2024	1998
4472	puerto rico	tremont waters	basketball	1	paris 2024	1998
4473	france	trevor clevenot	volleyball	3	rio 2016	1994
4474	canada	trey lyles	basketball	1	paris 2024	1995
4475	denmark	trine oestergaard	handball	1	paris 2024	1991
4476	united states of america	trinity rodman	football	1	paris 2024	2002
4477	puerto rico	trinity san antonio	basketball	1	paris 2024	2003
4478	south africa	tristan leyds	rugby sevens	1	paris 2024	1997
4479	spain	tristani mosakhlishvili	judo	1	paris 2024	1997
4480	kenya	trizah atuka	volleyball	1	paris 2024	1992
4481	sweden	truls moeregaardh	table tennis	1	paris 2024	2002
4482	chinese taipei	tsai-chi li	archery	1	paris 2024	2005
4483	mongolia	tsetsentsengel odkhuu	judo	1	paris 2024	1999
4484	romania	tudor-andrei fulea	water polo	1	paris 2024	1997
4485	türkiye	tugce beder	judo	1	paris 2024	1999
4486	chinese taipei	tung-chuan chien	table tennis	1	paris 2024	2002
4487	belgium	tuur dens	cycling track	1	paris 2024	2000
4488	united states of america	twanisha terry	athletics	1	paris 2024	1999
4489	spain	txell ferre gaset	artistic swimming	1	paris 2024	2006
4490	new zealand	tyla nathan-wong	rugby sevens	3	rio 2016	1994
4491	new zealand	tyler bindon	football	1	paris 2024	2005
4492	canada	tyler rorke	cycling track	1	paris 2024	2003
4493	sweden	tyra axner	handball	1	paris 2024	2002
4494	germany	tyrel prenz	athletics	1	paris 2024	2003
4495	united states of america	tyrese haliburton	basketball	1	paris 2024	2000
4496	nigeria	uchenna kanu	football	1	paris 2024	1997
4497	france	ugo crousillat	water polo	2	rio 2016	1990
4498	uzbekistan	umarali rakhmonaliev	football	1	paris 2024	2003
4499	spain	unai aguirre	water polo	2	tokyo 2020	2002
4500	spain	unai biel lara	water polo	1	paris 2024	2002
4501	slovenia	urban lesjak	handball	2	rio 2016	1990
4502	slovenia	urh kastelic	handball	1	paris 2024	1996
4503	serbia	uros kovacevic	volleyball	2	london 2012	1993
4504	serbia	uros plavsic	basketball	1	paris 2024	1998
4505	poland	urszula los	cycling track	2	tokyo 2020	1994
4506	nigeria	usheoritse itsekiri	athletics	2	tokyo 2020	1998
4507	spain	usman garuba	basketball	2	tokyo 2020	2002
4508	japan	uta abe	judo	2	tokyo 2020	2000
4509	japan	uta kobayashi	artistic swimming	1	paris 2024	2002
4510	samoa	vaa apelu maliko	rugby sevens	1	paris 2024	1998
4511	kazakhstan	vadim sharlaimov	fencing	1	paris 2024	1996
4512	austria	valentin bayer	swimming	1	paris 2024	1999
4513	uruguay	valentin grille	rugby sevens	1	paris 2024	1998
4514	france	valentin porte	handball	3	rio 2016	1990
4515	france	valentin tabellion	cycling track	1	paris 2024	1999
4516	slovenia	valentina klemencic	handball	1	paris 2024	2002
4517	argentina	valentina raposo ruiz de los llanos	hockey	2	tokyo 2020	2003
4518	france	valentine fortin	cycling track	2	tokyo 2020	1999
4519	france	valentine heurtaux	water polo	1	paris 2024	2005
4520	ukraine	valentyn rubchynskyi	football	1	paris 2024	2002
4521	italy	valeria palmieri	water polo	1	paris 2024	1993
4522	france	valeriane ayayi	basketball	3	rio 2016	1994
4523	ukraine	valeriia peremeta	rhythmic gymnastics	1	paris 2024	2007
4524	hungary	vanda valyi	water polo	2	tokyo 2020	1999
4525	belgium	vanessa blockmans	hockey	1	paris 2024	2002
4526	canada	vanessa gilles	football	2	tokyo 2020	1996
4527	serbia	vanja marinkovic	basketball	1	paris 2024	1997
4528	samoa	vaovasa afa	rugby sevens	1	paris 2024	1991
4529	france	varian pasquet	rugby sevens	1	paris 2024	1999
4530	portugal	vasco vilaca	triathlon	1	paris 2024	1999
4531	greece	vasileios toliopoulos	basketball	1	paris 2024	1996
4532	serbia	vasilije micic	basketball	1	paris 2024	1994
4533	montenegro	vasilije radovic	water polo	1	paris 2024	2003
4534	greece	vasiliki plevritou	water polo	1	paris 2024	1998
4535	greece	vasilis charalampopoulos	basketball	1	paris 2024	1997
4536	georgia	vazha margvelashvili	judo	3	rio 2016	1993
4537	türkiye	vedat albayrak	judo	2	tokyo 2020	1993
4538	finland	veera manninen	equestrian	1	paris 2024	2000
4539	spain	vega gimeno	3x3 basketball	1	paris 2024	1991
4540	serbia	velimir stjepanovic	swimming	4	london 2012	1993
4541	italy	verena steinhauser	triathlon	2	tokyo 2020	1994
4542	fiji	verenaisi ditavutu	rugby sevens	1	paris 2024	1999
4543	canada	verica bakoc	water polo	1	paris 2024	1999
4544	united states of america	vernon norwood	athletics	2	tokyo 2020	1992
4545	south africa	veroeshka grain	rugby sevens	1	paris 2024	1990
4546	croatia	veron nacinovic	handball	1	paris 2024	2000
4547	kenya	veronica adhiambo oluoch	volleyball	1	paris 2024	1999
4548	italy	veronica bumbaca	rowing	1	paris 2024	1999
4549	kenya	veronica kamumbe mutua	athletics	1	paris 2024	1992
4550	norway	veronica kristiansen	handball	3	rio 2016	1990
4551	italy	veronica toniolo	judo	1	paris 2024	2003
4552	norway	vetle bergsvik thorn	triathlon	1	paris 2024	1999
4553	norway	vetle eck aga	handball	1	paris 2024	1993
4554	ireland	vicki elmes kinlan	rugby sevens	1	paris 2024	2003
4555	france	victoire arnaud	hockey	1	paris 2024	2001
4556	france	victoire berteau	cycling road	2	tokyo 2020	2000
4557	france	victor charlet	hockey	1	paris 2024	1993
4558	denmark	victor gairy aasmul	canoe sprint	1	paris 2024	1999
4559	belgium	victor wegnez	hockey	2	tokyo 2020	1995
4560	france	victor wembanyama	basketball	1	paris 2024	2004
4561	brazil	victoria borges	rhythmic gymnastics	1	paris 2024	2002
4562	ireland	victoria catterson	swimming	1	paris 2024	2001
4563	new zealand	victoria esson	football	2	tokyo 2020	1991
4564	norway	victoria gulliksen	equestrian	1	paris 2024	1992
4565	austria	victoria max-theurer	equestrian	6	athens 2004	1985
4566	great britain	victoria ohuruogu	athletics	1	paris 2024	1993
4567	argentina	victoria sauze valdez	hockey	2	tokyo 2020	1991
4568	romania	victoria stefania petreanu	rowing	1	paris 2024	2003
4569	france	viktor lockwood	hockey	1	paris 2024	1992
4570	serbia	viktor rasovic	water polo	1	paris 2024	1993
4571	germany	viktoria huse	hockey	2	tokyo 2020	1995
4572	hungary	viktoria lukacs	handball	2	tokyo 2020	1995
4573	norway	vilde ingstad	handball	1	paris 2024	1994
4574	angola	vilma pegado nenganga	handball	2	rio 2016	1996
4575	hungary	vince pal vigvari	water polo	1	paris 2024	2003
4576	france	vincent gerard	handball	3	rio 2016	1986
4577	kenya	vincent onyala	rugby sevens	2	tokyo 2020	1996
4578	belgium	vincent vanasch	hockey	4	london 2012	1987
4579	italy	vincenzo abbagnale	rowing	2	tokyo 2020	1993
4580	italy	vincenzo renzuto jodice	water polo	2	tokyo 2020	1993
4581	germany	viola leuchter	handball	1	paris 2024	2004
4582	italy	viola scotto di carlo	swimming	1	paris 2024	2003
4583	czechia	vit hlavac	athletics	2	tokyo 2020	1997
4584	india	vithya ramraj	athletics	1	paris 2024	1998
4585	brazil	vitor benite	basketball	2	rio 2016	1990
4586	brazil	vitor ishiy	table tennis	2	tokyo 2020	1995
4587	brazil	vitoria yaya	football	1	paris 2024	2002
4588	italy	vittoria guazzini	cycling track	2	tokyo 2020	2000
4589	brazil	vittoria lopes	triathlon	2	tokyo 2020	1996
4590	india	vivek sagar prasad	hockey	2	tokyo 2020	2000
4591	netherlands	vivian sevenich	water polo	2	tokyo 2020	1993
4592	brazil	viviane lyra	athletics	1	paris 2024	1993
4593	germany	vivien endemann	football	1	paris 2024	2001
4594	romania	vlad-luca georgescu	water polo	1	paris 2024	1999
4595	ukraine	vlada kharkova	fencing	1	paris 2024	1996
4596	montenegro	vladan spaic	water polo	2	tokyo 2020	1997
4597	italy	vladimir aceti	athletics	2	tokyo 2020	1998
4598	serbia	vladimir misovic	water polo	1	paris 2024	2001
4599	uzbekistan	vladimir nazarov	football	1	paris 2024	2002
4600	serbia	vladimir torubarov	canoe	2	rio 2016	1993
4601	montenegro	vlado popadic	water polo	2	tokyo 2020	1996
4602	ukraine	vladyslav veleten	football	1	paris 2024	2002
4603	ukraine	volodymyr saliuk	football	1	paris 2024	2002
4604	serbia	vuk todorovic	volleyball	1	paris 2024	1998
4605	austria	wachid borchashvili	judo	1	paris 2024	1998
4606	fiji	waisea nacuqu	rugby sevens	2	tokyo 2020	1993
4607	japan	waka kobori	swimming	2	tokyo 2020	2000
4608	japan	wakaba hara	rugby sevens	2	tokyo 2020	2000
4609	france	walide khyar	judo	2	rio 2016	1995
4610	united states of america	walker zimmerman	football	1	paris 2024	1993
4611	people's republic of china	wanyu wang	rugby sevens	2	tokyo 2020	1997
4612	japan	wataru tanigawa	artistic gymnastics	2	tokyo 2020	1996
4613	people's republic of china	wen dan	hockey	1	paris 2024	1999
4614	people's republic of china	wenbo lu	3x3 basketball	1	paris 2024	1997
4615	people's republic of china	wenchao kao	archery	1	paris 2024	2000
4616	bahamas	wendell miller	athletics	1	paris 2024	2003
4617	france	wendie renard	football	3	london 2012	1990
4618	people's republic of china	wenxin dong	water polo	1	paris 2024	2001
4619	south sudan	wenyen gabriel	basketball	1	paris 2024	1997
4620	people's republic of china	wenyu xu	hockey	2	tokyo 2020	1995
4621	côte d'ivoire	whitney tie	athletics	1	paris 2024	1999
4622	poland	wiktoria knap	equestrian	1	paris 2024	1999
4623	paraguay	wilder viera	football	1	paris 2024	2002
4624	poland	wilfredo leon	volleyball	2	tokyo 2020	1993
4625	australia	will scott magnay	basketball	1	paris 2024	1998
4626	netherlands	willem greve	equestrian	2	tokyo 2020	1983
4627	great britain	william calnan	hockey	1	paris 2024	1996
4628	canada	william emard	artistic gymnastics	1	paris 2024	2000
4629	australia	william matthew	equestrian	1	paris 2024	1993
4630	brazil	willian lima	judo	1	paris 2024	2000
4631	spain	willy hernangomez	basketball	3	rio 2016	1994
4632	belgium	wilm vermeir	equestrian	1	paris 2024	1979
4633	mali	wilson samake	football	1	paris 2024	2004
4634	france	wissam-amazigh yebba	swimming	1	paris 2024	2000
4635	germany	wolf-niclas schroeder	rowing	1	paris 2024	1996
4636	republic of korea	won jin kim	judo	3	rio 2016	1992
4637	republic of korea	woojin jang	table tennis	2	tokyo 2020	1995
4638	republic of korea	woojin kim	archery	3	rio 2016	1992
4639	republic of korea	woomin kim	marathon swimming	2	tokyo 2020	2001
4640	republic of korea	wooseok lee	archery	1	\N	1997
4641	netherlands	worthy de jong	3x3 basketball	1	paris 2024	1988
4642	spain	xabi lopez-arostegui	basketball	2	tokyo 2020	1997
4643	netherlands	xan de waard	hockey	3	rio 2016	1995
4644	canada	xander ketrzynski	volleyball	1	paris 2024	2000
4645	spain	xantal gine	hockey	3	rio 2016	1992
4646	netherlands	xavi mo-ajok	athletics	1	paris 2024	2002
4647	spain	xavier gispert	hockey	1	paris 2024	1999
4648	dominican republic	xavier valdez	football	1	paris 2024	2003
4649	germany	xenia smits	handball	1	paris 2024	1994
4650	people's republic of china	xia ding	volleyball	3	rio 2016	1990
4651	people's republic of china	xianghong he	athletics	1	paris 2024	1998
4652	people's republic of china	xiangyu gong	volleyball	3	rio 2016	1997
4653	people's republic of china	xiao chen	water polo	2	tokyo 2020	1999
4654	people's republic of china	xiao wang	rugby sevens	1	paris 2024	1998
4655	people's republic of china	xiaodan ma	rugby sevens	1	paris 2024	1998
4656	people's republic of china	xiaolei yang	archery	2	tokyo 2020	2000
4657	germany	xiaona shan	table tennis	3	rio 2016	1983
4658	people's republic of china	xiaoqian liu	rugby sevens	2	tokyo 2020	1996
4659	people's republic of china	xiaotong cui	rowing	2	tokyo 2020	1994
4660	people's republic of china	xiaoxin liu	rowing	2	tokyo 2020	1997
4661	people's republic of china	xingye xu	rowing	1	paris 2024	1998
4662	people's republic of china	xinjie ji	swimming	2	tokyo 2020	1997
4663	people's republic of china	xinrong dou	rugby sevens	1	paris 2024	2001
4664	people's republic of china	xinyi ding	rhythmic gymnastics	1	paris 2024	2004
4665	people's republic of china	xinyu luo	basketball	1	paris 2024	2001
4666	people's republic of china	xinyue yuan	volleyball	3	rio 2016	1996
4667	people's republic of china	han xu	basketball	2	tokyo 2020	1999
4668	people's republic of china	xuan wang	bobsleigh	1	beijing 2022	1998
4669	people's republic of china	xueer wang	swimming	2	rio 2016	1998
4670	france	yacine louati	volleyball	2	tokyo 2020	1992
4671	brazil	yago santos	basketball	1	paris 2024	1999
4672	egypt	yahia omar	handball	2	tokyo 2020	1997
4673	australia	yale steinepreis	canoe sprint	1	paris 2024	1997
4674	israel	yam wolczak	judo	1	paris 2024	2003
4675	people's republic of china	yan wang	archery	1	paris 2024	2000
4676	people's republic of china	yan zhou	rugby sevens	1	paris 2024	1998
4677	people's republic of china	yang chen	hockey	3	rio 2016	1997
4678	people's republic of china	yang liu	artistic gymnastics	3	rio 2016	1994
4679	people's republic of china	yang lyu	rowing	3	rio 2016	1993
4680	france	yanis lenne	handball	1	paris 2024	1996
4681	france	yann le goff	swimming	1	paris 2024	2003
4682	france	yannick borel	fencing	4	london 2012	1988
4683	germany	yannick wolf	athletics	1	paris 2024	2000
4684	people's republic of china	yanning xiao	artistic swimming	2	tokyo 2020	1998
4685	people's republic of china	yaoyao gu	rugby sevens	2	tokyo 2020	1995
4686	people's republic of china	yaqin zhou	artistic gymnastics	1	paris 2024	2005
4687	egypt	yara elsharkawy	fencing	2	tokyo 2020	1999
4688	netherlands	yara ten holte	handball	1	paris 2024	1999
4689	brazil	yasmim	football	1	paris 2024	1996
4690	brazil	yasmim soares	rugby sevens	1	paris 2024	1999
4691	switzerland	yasmin giger	athletics	2	tokyo 2020	1999
4692	egypt	yassin khodir	fencing	1	paris 2024	2005
4693	morocco	yassine kechta	football	1	paris 2024	2002
4694	people's republic of china	yaxin liu	swimming	3	rio 2016	1999
4695	people's republic of china	yayi zhang	artistic swimming	1	paris 2024	1997
4696	egypt	yehia elderaa	handball	3	rio 2016	1995
4697	kazakhstan	yeldos smetov	judo	3	rio 2016	1992
4698	azerbaijan	yelyzaveta luzan	rhythmic gymnastics	2	tokyo 2020	2003
4699	republic of korea	yeonkyung hur	swimming	1	paris 2024	2005
4700	republic of korea	yerin jung	judo	1	paris 2024	1996
4701	kazakhstan	yerlik sertay	fencing	1	paris 2024	1998
4702	morocco	yessin rahmouni	equestrian	2	tokyo 2020	1984
4703	people's republic of china	yi chen	hockey	2	tokyo 2020	1997
4704	chinese taipei	yi-ching chiu	archery	1	paris 2024	2003
4705	people's republic of china	yi dong	canoe sprint	1	paris 2024	2002
4706	people's republic of china	yi gao	volleyball	1	paris 2024	1998
4707	netherlands	yibbi jansen	hockey	1	paris 2024	1999
4708	people's republic of china	yihan zhang	artistic gymnastics	1	paris 2024	2008
4709	people's republic of china	yineng shen	water polo	2	tokyo 2020	1995
4710	people's republic of china	ying zhang	hockey	2	tokyo 2020	1998
4711	people's republic of china	yingsha sun	table tennis	2	tokyo 2020	2000
4712	people's republic of china	yingying li	volleyball	2	tokyo 2020	2000
4713	colombia	yirleidys minota	football	1	paris 2024	2002
4714	people's republic of china	yiting yu	swimming	2	tokyo 2020	2005
4715	people's republic of china	yiwen lu	water polo	2	tokyo 2020	1996
4716	people's republic of china	yiwen sun	fencing	3	rio 2016	1992
4717	people's republic of china	yixin zheng	volleyball	1	paris 2024	1995
4718	brazil	yoandy leal hidalgo	volleyball	2	tokyo 2020	1988
4719	france	yohann ndoye-brouard	swimming	2	tokyo 2020	2000
4720	france	yohanna lhopital	hockey	1	paris 2024	1999
4721	france	yolaine yengo	rugby sevens	1	paris 2024	1993
4722	dominican republic	yonkaira paola pena isabel	volleyball	2	tokyo 2020	1993
4723	japan	yoshiaki oiwa	equestrian	5	beijing 2008	1976
4724	japan	yoshihide kiryu	athletics	3	rio 2016	1995
4725	japan	yoshihiro noguchi	rugby sevens	1	paris 2024	1994
4726	japan	yoshitaku nagasako	cycling	3	rio 2016	1993
4727	japan	yoshiyuki koga	rugby sevens	1	paris 2024	1998
4728	republic of korea	young mi kang	fencing	3	rio 2016	1985
4729	republic of korea	young shik hwang	equestrian	1	paris 2024	1990
4730	egypt	youssef abdel-aziz	table tennis	1	paris 2024	2000
4731	iraq	youssef amyn	football	1	paris 2024	2003
4732	france	ysaora thibus	fencing	4	london 2012	1991
4733	japan	yu asai	hockey	3	rio 2016	1996
4734	people's republic of china	yu feng	artistic swimming	2	tokyo 2020	1999
4735	japan	yu hirakawa	football	1	paris 2024	2001
4736	chinese taipei	yu-hsuan tai	archery	1	paris 2024	2002
4737	people's republic of china	yu hu	rugby sevens	1	paris 2024	1999
4738	japan	yu okudaira	rugby sevens	1	paris 2024	1999
4739	people's republic of china	yu zhou	cycling track	1	paris 2024	1999
4740	people's republic of china	yuan li	basketball	2	tokyo 2020	2000
4741	people's republic of china	yuanbo zhu	3x3 basketball	1	paris 2024	1993
4742	people's republic of china	yuanyuan wang	volleyball	2	tokyo 2020	1997
4743	republic of korea	shin yu-bin	table tennis	2	tokyo 2020	2004
4744	japan	yudai baba	basketball	2	tokyo 2020	1995
4745	japan	yudai nagano	fencing	2	tokyo 2020	1998
4746	people's republic of china	yue sun	rugby sevens	1	paris 2024	1999
4747	people's republic of china	yueru li	basketball	2	tokyo 2020	1999
4748	people's republic of china	yuewen sun	canoe sprint	1	paris 2024	1994
4749	people's republic of china	yufang guo	cycling track	2	tokyo 2020	1999
4750	people's republic of china	zhang yufei	swimming	3	rio 2016	1998
4751	japan	yui hasegawa	football	2	tokyo 2020	1997
4752	japan	yuji nishida	volleyball	2	tokyo 2020	2000
4753	people's republic of china	yujie cheng	swimming	1	tokyo 2020	2005
4754	japan	yuka ueno	fencing	2	tokyo 2020	2001
4755	japan	ishikawa yuki	volleyball	2	tokyo 2020	1995
4756	japan	yuki joseph nakajima	athletics	1	paris 2024	2002
4757	japan	yuki kawamura	basketball	1	paris 2024	2001
4758	japan	yuki miyazawa	basketball	3	rio 2016	1993
4759	japan	yuki togashi	basketball	2	tokyo 2020	1993
4760	japan	yukiko wada	volleyball	1	paris 2024	2002
4761	mexico	yuli verdugo osuna	cycling track	2	tokyo 2020	1997
4762	ukraine	yuliia bakastova	fencing	1	paris 2024	1996
4763	japan	yume hirano	rugby sevens	2	tokyo 2020	2000
4764	japan	yumi kajihara	cycling track	2	tokyo 2020	1997
4765	italy	yumin abbadini	artistic gymnastics	1	paris 2024	2001
4766	chinese taipei	yun ju lin	table tennis	2	tokyo 2020	2001
4767	canada	yunjia zhang	fencing	1	paris 2024	2007
4768	republic of korea	yunseo lee	artistic gymnastics	2	tokyo 2020	2003
4769	people's republic of china	yunxia chen	rowing	2	tokyo 2020	1995
4770	people's republic of china	yunxia fan	hockey	1	paris 2024	2002
4771	canada	yuri kisil	swimming	3	rio 2016	1995
4772	brazil	yuri mansur guerios	equestrian	2	tokyo 2020	1979
4773	japan	yuri nagai	hockey	3	rio 2016	1992
4774	italy	yuri romano	volleyball	1	paris 2024	1997
4775	people's republic of china	yushan ou	artistic gymnastics	2	tokyo 2020	2004
4776	japan	yusuke inaba	water polo	2	tokyo 2020	2000
4777	japan	yuta obara	cycling track	1	paris 2024	1996
4778	japan	yuta watanabe	basketball	2	tokyo 2020	1994
4779	people's republic of china	yuting wang	fencing	1	paris 2024	2001
4780	serbia	yvonne anderson	basketball	2	tokyo 2020	1990
4781	canada	yvonne ejim	basketball	1	paris 2024	2002
4782	dominican republic	yvonne losos de muniz	equestrian	3	rio 2016	1967
4783	ireland	zac ward	rugby sevens	1	paris 2024	1998
4784	canada	zachary clay	artistic gymnastics	1	paris 2024	1995
4785	great britain	zachary wallace	hockey	2	tokyo 2020	1999
4786	uzbekistan	zafarmurod abdirakhmatov	football	1	paris 2024	2003
4787	iraq	zaid tahseen	football	1	paris 2024	2001
4788	south africa	zain davids	rugby sevens	2	tokyo 2020	1997
4789	morocco	zakaria el ouahdi	football	1	paris 2024	2001
4790	south africa	zakithi nene	athletics	2	tokyo 2020	1998
4791	jamaica	zandrion barnes	athletics	1	paris 2024	2001
4792	italy	zaynab dosso	athletics	1	paris 2024	1999
4793	türkiye	zehra bilgin	swimming	1	paris 2024	2002
4794	türkiye	zehra gunes	volleyball	2	tokyo 2020	1999
4795	south africa	zenani kraai	hockey	1	paris 2024	2000
4796	people's republic of china	zewen deng	water polo	2	tokyo 2020	1997
4797	azerbaijan	zeynab hummatova	rhythmic gymnastics	2	tokyo 2020	1999
4798	people's republic of china	zhangjiayang huang	rhythmic gymnastics	2	tokyo 2020	2000
4799	people's republic of china	zhanle pan	swimming	1	paris 2024	2004
4800	people's republic of china	zhanshuo zhang	swimming	1	paris 2024	2007
4801	great britain	zharnel hughes	athletics	2	tokyo 2020	1995
4802	people's republic of china	fan zhendong	table tennis	2	tokyo 2020	1997
4803	people's republic of china	zhenye xie	athletics	4	london 2012	1993
4804	people's republic of china	zhijian deng	athletics	1	paris 2024	2002
4805	people's republic of china	zhiting zhang	3x3 basketball	2	tokyo 2020	1995
4806	people's republic of china	zhongyuan li	archery	1	paris 2024	2002
4807	egypt	ziad elsissy	fencing	2	tokyo 2020	1994
4808	egypt	ziad kamal	football	1	paris 2024	2001
4809	people's republic of china	zifeng wang	rowing	2	tokyo 2020	1997
4810	slovenia	ziga stern	volleyball	1	paris 2024	1994
4811	latvia	zigmars raimo	3x3 basketball	1	paris 2024	1997
4812	chinese taipei	zih-siang lin	archery	1	paris 2024	2001
4813	south africa	zintle mpupha	rugby sevens	1	paris 2024	1993
4814	people's republic of china	ziwei mo	fencing	1	paris 2024	1996
4815	people's republic of china	zixia ou	hockey	3	rio 2016	1995
4816	egypt	zizo	football	1	paris 2024	1996
4817	australia	zoe arancini	water polo	3	rio 2016	1991
4818	argentina	zoe diaz de armas	hockey	1	paris 2024	2006
4819	australia	zoe poulis	artistic swimming	1	paris 2024	2006
4820	canada	zoe sherar	athletics	1	paris 2024	1999
4821	algeria	zohra nora kehli	fencing	1	paris 2024	2001
4822	hungary	zoltan szita	handball	1	paris 2024	1998
4823	hungary	zoran ilic	handball	1	paris 2024	2002
4824	hungary	zsofi szemerey	handball	1	paris 2024	1994
4825	hungary	zsombor veg	judo	1	paris 2024	2001
4826	poland	zuzanna famulok	swimming	1	paris 2024	2003
4827	poland	zuzanna wielgos	table tennis	1	paris 2024	2005
4828	croatia	zvonimir srna	handball	1	paris 2024	1998
4829	people's republic of china	671	breaking	1	paris 2024	2005
4830	united states of america	aaliyah nickole butler	athletics	1	paris 2024	2003
4831	malaysia	aaron chia	badminton	2	tokyo 2020	1997
4832	united states of america	aaron marquel brooks	wrestling	1	paris 2024	2000
4833	united states of america	aaron shackell	swimming	1	paris 2024	2004
4834	united states of america	aaron small	canoe sprint	1	paris 2024	2001
4835	australia	abbey caldwell	athletics	2	tokyo 2020	2001
4836	australia	abbey lee connor	swimming	1	paris 2024	2005
4837	algeria	abd elkrim ouakali	wrestling	1	paris 2024	1993
4838	sudan	abdalla ahmed	rowing	1	paris 2024	1996
4839	morocco	abdelati el guesse	athletics	3	rio 2016	1993
4840	algeria	abdelkarim fergat	wrestling	2	tokyo 2020	1994
4841	egypt	abdelkhalek elbanna	rowing	3	rio 2016	1988
4842	egypt	abdellatif mohamed ahmed mohamed	wrestling	3	rio 2016	1995
4843	egypt	abdelrahman el sayed	weightlifting	2	beijing 2008	1989
4844	egypt	abdelrahman mohamed	judo	1	paris 2024	1998
4845	egypt	abdelrahman salah orabi abdelgawwad	boxing	2	tokyo 2020	1987
4846	qatar	abderrahaman samba	athletics	1	tokyo 2020	1995
4847	morocco	abderrahmane boushita	judo	1	paris 2024	1997
4848	spain	abdessamad oukhelfen	athletics	1	paris 2024	1998
4849	netherlands	abdi nageeye	athletics	2	rio 2016	1989
4850	djibouti	abdi waiss mouhyadin	athletics	2	rio 2016	1996
4851	united states of america	abdihamid nur	athletics	1	paris 2024	1997
4852	ethiopia	abdisa fayisa	athletics	1	paris 2024	2005
4853	niger	abdoulrazak issoufou alfaga	taekwondo	3	rio 2016	1994
4854	qatar	abdulaziz al-obaidly	swimming	2	tokyo 2020	2001
4855	uzbekistan	abdulla azimov	artistic gymnastics	1	paris 2024	1996
4856	india	abdulla narangolintevida	athletics	1	paris 2024	1996
4857	uzbekistan	abdumalik khalokov	boxing	1	paris 2024	2000
4858	israel	abishag semberg	taekwondo	2	tokyo 2020	2001
4859	brazil	abner teixeira	boxing	2	tokyo 2020	1996
4860	mexico	abraham ancer sagastegui	golf	2	tokyo 2020	1991
4861	south sudan	abraham guem	athletics	2	tokyo 2020	1999
4862	kenya	abraham kibiwot	athletics	2	tokyo 2020	1996
4863	unknown	abubakar khaslakhanau	wrestling	1	paris 2024	2004
4864	qatar	abubaker haydar abdalla	athletics	3	rio 2016	1996
4865	morocco	achraf ed doghmy	cycling road	1	paris 2024	1999
4866	morocco	achraf elaidi	canoe sprint	1	paris 2024	2002
4867	morocco	achraf moutii	judo	1	paris 2024	1996
4868	jamaica	ackelia smith	athletics	1	paris 2024	2002
4869	jamaica	ackera nugent	athletics	1	paris 2024	2002
4870	united states of america	ada claudia korkhin	shooting	1	paris 2024	2004
4871	unknown	adaejah hodge	athletics	1	paris 2024	2006
4872	mexico	adair zabdiel gutierrez prieto	cycling mountain bike	1	paris 2024	2001
4873	nigeria	adaku nwandu	swimming	1	paris 2024	2007
4874	great britain	adam burgess	canoe slalom	2	tokyo 2020	1992
4875	canada	adam dong	badminton	1	paris 2024	1994
4876	united states of america	adam jacob coon	wrestling	1	paris 2024	1994
4877	canada	adam keenan	athletics	1	paris 2024	1993
4878	czechia	adam li	archery	1	paris 2024	1997
4879	israel	adam maraana	swimming	1	paris 2024	2003
4880	czechia	adam mendrek	badminton	1	paris 2024	1995
4881	czechia	adam ondra	sport climbing	2	tokyo 2020	1993
4882	czechia	adam pavlasek	tennis	1	paris 2024	1994
4883	australia	adam spencer	athletics	1	paris 2024	2001
4884	poland	adam stodolski	judo	1	paris 2024	2000
4885	hungary	adam telegdy	swimming	3	rio 2016	1995
4886	hungary	adam varga	canoe sprint	2	tokyo 2020	1999
4887	ethiopia	addisu yihune	athletics	1	paris 2024	2003
4888	azerbaijan	ade resky dwicahyo	badminton	2	tokyo 2020	1998
4889	spain	adel mechaal	athletics	3	rio 2016	1990
4890	czechia	adela holubova	cycling mountain bike	1	paris 2024	2002
4891	togo	adele sodalo agnes gaitou	swimming	1	paris 2024	2007
4892	kosovo	adell sabovic	swimming	1	paris 2024	2002
4893	jamaica	adelle tracey	athletics	1	paris 2024	1993
4894	djibouti	aden-alexandre houssein	judo	2	tokyo 2020	1998
4895	republic of moldova	adil osmanov	judo	1	paris 2024	2000
4896	kazakhstan	adilbek mussin	swimming	1	paris 2024	1999
4897	india	aditi ashok	golf	3	rio 2016	1998
4898	south africa	adriaan wildschutt	athletics	1	paris 2024	1998
4899	spain	adrian abadia	diving	1	paris 2024	2002
4900	spain	adrian ben	athletics	2	tokyo 2020	1998
4901	spain	adrian del rio	canoe sprint	1	paris 2024	2002
4902	puerto rico	adrian gandia	judo	2	tokyo 2020	1997
4903	spain	adrian gavira collado	beach volleyball	4	london 2012	1987
4904	italy	adrian ignacio carambula raurich	beach volleyball	3	rio 2016	1988
4905	poland	adrian meronk	golf	2	tokyo 2020	1993
4906	botswana	adrian robinson	swimming	1	paris 2024	2000
4907	spain	adrian vicente yunta	taekwondo	2	tokyo 2020	1999
4908	spain	adriana cerezo iglesias	taekwondo	2	tokyo 2020	2003
4909	puerto rico	adriana diaz	table tennis	3	rio 2016	2000
4910	bermuda	adriana penruddocke	sailing	1	paris 2024	2000
4911	guatemala	adriana ruano oliva	shooting	2	tokyo 2020	1995
4912	peru	adriana sanguineti	rowing	1	paris 2024	2000
4913	serbia	adriana vilagos	athletics	1	paris 2024	2004
4914	poland	adrianna sulek	athletics	2	tokyo 2020	1999
4915	france	adrien bart	canoe	3	rio 2016	1991
4916	switzerland	adrien briffod	triathlon	1	paris 2024	1994
4917	belgium	adrien dumont de chassart	golf	1	paris 2024	2000
4918	republic of korea	aeji im	boxing	2	tokyo 2020	1999
4919	spain	africa zamorano sanz	swimming	3	rio 2016	1998
4920	poland	agata barwinska	sailing	1	paris 2024	1995
4921	latvia	agate caune	athletics	1	paris 2024	2004
4922	portugal	agate de sousa	athletics	1	paris 2024	2000
4923	latvia	agate rasmane	shooting	2	tokyo 2020	1997
4924	france	agathe guillemot	athletics	1	paris 2024	1999
4925	japan	ageha tanigawa	swimming	2	tokyo 2020	2003
4926	sweden	agnes alexiusson	boxing	2	tokyo 2020	1996
4927	hungary	agnes anna kiss	canoe sprint	1	paris 2024	2005
4928	poland	agnieszka skalniak-sojka	cycling road	1	paris 2024	1997
4929	argentina	agostina hein	swimming	1	paris 2024	2008
4930	spain	agueda marques	athletics	1	paris 2024	1999
4931	argentina	agustin vernice	canoe sprint	2	tokyo 2020	1995
4932	jordan	ahmad abu al soud	artistic gymnastics	1	paris 2024	1995
4933	egypt	ahmed abdelaal	rowing	1	paris 2024	1994
4934	libya	ahmed abuzriba	weightlifting	1	paris 2024	2000
4935	egypt	ahmed elgendy	modern pentathlon	2	tokyo 2020	2000
4936	libya	ahmed essabai	athletics	1	paris 2024	2000
4937	tunisia	ahmed jaouadi	marathon swimming	1	paris 2024	2005
4938	tunisia	ahmed jaziri	athletics	1	paris 2024	1997
4939	egypt	ahmed nassar	taekwondo	1	paris 2024	2000
4940	qatar	ahmed tijan	beach volleyball	2	tokyo 2020	1995
4941	mexico	ahtziri sandoval	artistic gymnastics	1	paris 2024	1996
4942	japan	mori ai	sport climbing	1	paris 2024	2003
4943	chinese taipei	ai wen yu	shooting	3	london 2012	1995
4944	kyrgyzstan	aiaal lazarev	wrestling	3	rio 2016	1986
4945	kazakhstan	aibek oralbay	boxing	1	paris 2024	2000
4946	mali	aichata diabate	swimming	1	paris 2024	2005
4947	ireland	aidan walsh	boxing	2	tokyo 2020	1997
4948	ukraine	aider abduraimov	boxing	1	paris 2024	2004
4949	kazakhstan	aidos sultangali	wrestling	1	paris 2024	1996
4950	ireland	aifric keogh	rowing	2	tokyo 2020	1992
4951	kazakhstan	aigerim sarybay	fencing	1	paris 2024	1997
4952	bulgaria	aik mnatsakanian	wrestling	2	tokyo 2020	1995
4953	belgium	aiko gommers	cycling bmx racing	1	paris 2024	2004
4954	ecuador	aimara nazareno	athletics	1	paris 2024	2001
4955	south africa	aimee canny	swimming	2	tokyo 2020	2003
4956	new zealand	aimee fisher	canoe	2	rio 2016	1995
4957	great britain	aimee pratt	athletics	2	tokyo 2020	1997
4958	spain	aina cid i centelles	rowing	3	rio 2016	1994
4959	madagascar	aina laura rasoanaivo razafy	judo	1	paris 2024	2004
4960	lithuania	aine raupelyte	beach volleyball	1	paris 2024	2000
4961	kyrgyzstan	aiperi medet kyzy	wrestling	2	tokyo 2020	1999
4962	philippines	aira villegas	boxing	1	paris 2024	1995
4963	japan	airi ebina	marathon swimming	1	paris 2024	2001
4964	japan	airi mitsui	swimming	1	paris 2024	2004
4965	lithuania	airine palsyte	athletics	4	london 2012	1992
4966	maldives	aishath ulya shaig	swimming	1	paris 2024	2002
4967	india	aishwary pratap singh tomar	shooting	2	tokyo 2020	2001
4968	australia	aislin jones	shooting	2	rio 2016	2000
4969	kyrgyzstan	aisuluu tynybekova	wrestling	4	london 2012	1993
4970	vanuatu	ajah pritchard-lolo	weightlifting	1	paris 2024	2002
4971	australia	ajla tomljanovic	tennis	2	tokyo 2020	1993
4972	japan	yamaguchi akane	badminton	2	rio 2016	1997
4973	japan	fujinami akari	wrestling	1	paris 2024	2003
4974	uzbekistan	akbar djuraev	weightlifting	2	tokyo 2020	1999
4975	bahrain	akhmed tazhudinov	wrestling	1	paris 2024	2003
4976	japan	aki yazawa	canoe slalom	3	rio 2016	1991
4977	japan	akihiro higashida	athletics	1	paris 2024	1995
4978	japan	akiko hasegawa	beach volleyball	1	paris 2024	1985
4979	kosovo	akil gjakova	judo	2	tokyo 2020	1996
4980	japan	akira akasaki	athletics	1	paris 2024	1998
4981	hong kong	akira luke sakai	sailing	1	paris 2024	1992
4982	togo	akoko komlanvi	rowing	1	paris 2024	1994
4983	finland	akseli keskinen	sailing	2	tokyo 2020	1999
4984	india	akshdeep singh	athletics	1	paris 2024	1999
4985	uzbekistan	aktenge keunimjaeva	wrestling	1	paris 2024	1999
4986	kyrgyzstan	akzhol makhmudov	wrestling	2	tokyo 2020	1999
4987	uruguay	alain aprahamian	judo	2	tokyo 2020	1988
4988	spain	alain kortabitarte	skateboarding	1	paris 2024	2005
4989	poland	alan banaszek	cycling track	1	paris 2024	1997
4990	mexico	alan cleland	surfing	1	paris 2024	2002
4991	south africa	alan hatherly	cycling mountain bike	3	rio 2016	1996
4992	tonga	alan koti lopeti uhi	swimming	1	paris 2024	2005
4993	new zealand	alana sherman	rowing	1	paris 2024	1998
4994	australia	alanah yukich	athletics	1	paris 2024	1998
4995	gambia	alasan ann	taekwondo	1	paris 2024	2000
4996	great britain	alastair chalmers	athletics	1	paris 2024	2000
4997	united states of america	alaysha johnson	athletics	1	paris 2024	1996
4998	spain	alba bautista	rhythmic gymnastics	1	paris 2024	2002
4999	spain	alba petisco	artistic gymnastics	2	tokyo 2020	2003
5000	switzerland	albane valenzuela	golf	3	rio 2016	1997
5001	poland	albert komanski	athletics	1	paris 2024	2000
5002	spain	albert torres barcelo	cycling track	3	london 2012	1990
5003	denmark	alberte kjaer pedersen	triathlon	1	paris 2024	1998
5004	italy	alberto bettiol	cycling road	2	tokyo 2020	1993
5005	spain	alberto fernandez	shooting	5	beijing 2008	1983
5006	spain	alberto gines lopez	sport climbing	2	tokyo 2020	2002
5007	guatemala	alberto gonzalez mindez	athletics	1	paris 2024	1996
5008	venezuela	alberto mestre	swimming	2	tokyo 2020	1999
5009	ecuador	alberto mino	table tennis	2	tokyo 2020	1990
5010	italy	alberto razzetti	swimming	2	tokyo 2020	1999
5011	costa rica	alberto vega	swimming	1	paris 2024	2005
5012	mozambique	alcinda helena panguana	boxing	2	tokyo 2020	1994
5013	philippines	aleah finnegan	artistic gymnastics	1	paris 2024	2003
5014	spain	aleix garcia i pujolar	rowing	1	paris 2024	2000
5015	paraguay	alejandra alonso	rowing	2	tokyo 2020	1996
5016	mexico	alejandra estudillo torres	diving	1	paris 2024	2005
5017	mexico	alejandra orozco	diving	4	london 2012	1997
5018	mexico	alejandra ortega	athletics	2	rio 2016	1994
5019	mexico	alejandra zavala vazquez	shooting	3	london 2012	1984
5020	cuba	alejandro claro fiz	boxing	1	paris 2024	2001
5021	argentina	alejandro colomino	rowing	1	paris 2024	1988
5022	cuba	alejandro enrique valdes tobier	wrestling	3	rio 2016	1988
5023	cuba	alejandro parada	athletics	1	paris 2024	2004
5024	colombia	alejandro solarte	diving	1	paris 2024	2001
5025	chile	alejandro tabilo	tennis	1	paris 2024	1997
5026	argentina	alejandro tosti	golf	1	paris 2024	1996
5027	guyana	aleka persaud	swimming	2	tokyo 2020	2006
5028	serbia	aleksandr andreevitch komarov	wrestling	1	paris 2024	1999
\.


--
-- Data for Name: negara; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.negara (nama_negara, benua) FROM stdin;
united states of america	NaN
canada	NaN
austria	NaN
new zealand	NaN
france	NaN
japan	NaN
great britain	NaN
uzbekistan	NaN
australia	NaN
morocco	NaN
egypt	NaN
guinea	NaN
south africa	NaN
ghana	NaN
united arab emirates	NaN
saudi arabia	NaN
türkiye	NaN
spain	NaN
india	NaN
kazakhstan	NaN
ireland	NaN
belgium	NaN
jamaica	NaN
poland	NaN
hungary	NaN
israel	NaN
nigeria	NaN
fiji	NaN
romania	NaN
mexico	NaN
mongolia	NaN
refugee olympic team	NaN
brazil	NaN
italy	NaN
argentina	NaN
kenya	NaN
chile	NaN
mali	NaN
iraq	NaN
liberia	NaN
trinidad and tobago	NaN
samoa	NaN
paraguay	NaN
angola	NaN
sweden	NaN
puerto rico	NaN
slovenia	NaN
serbia	NaN
people's republic of china	NaN
greece	NaN
germany	NaN
azerbaijan	NaN
norway	NaN
islamic republic of iran	NaN
ukraine	NaN
republic of moldova	NaN
montenegro	NaN
estonia	NaN
dominican republic	NaN
bahamas	NaN
denmark	NaN
syrian arab republic	NaN
croatia	NaN
colombia	NaN
switzerland	NaN
lithuania	NaN
netherlands	NaN
botswana	NaN
portugal	NaN
south sudan	NaN
malaysia	NaN
zambia	NaN
uruguay	NaN
republic of korea	NaN
ecuador	NaN
unknown	NaN
hong kong	NaN
peru	NaN
algeria	NaN
chinese taipei	NaN
singapore	NaN
cuba	NaN
indonesia	NaN
slovakia	NaN
finland	NaN
czechia	NaN
georgia	NaN
latvia	NaN
venezuela	NaN
thailand	NaN
côte d'ivoire	NaN
bulgaria	NaN
luxembourg	NaN
sudan	NaN
qatar	NaN
djibouti	NaN
ethiopia	NaN
niger	NaN
togo	NaN
kosovo	NaN
bermuda	NaN
guatemala	NaN
jordan	NaN
libya	NaN
tunisia	NaN
kyrgyzstan	NaN
madagascar	NaN
philippines	NaN
maldives	NaN
vanuatu	NaN
bahrain	NaN
tonga	NaN
gambia	NaN
costa rica	NaN
mozambique	NaN
guyana	NaN
\.


--
-- Data for Name: olahraga; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.olahraga (nama_olahraga) FROM stdin;
3x3 basketball
archery
artistic gymnastics
artistic swimming
athletics
basketball
canoe sprint
cycling track
equestrian
fencing
football
handball
hockey
judo
rhythmic gymnastics
rowing
rugby sevens
swimming
table tennis
triathlon
volleyball
water polo
badminton
beach volleyball
boxing
breaking
canoe slalom
cycling bmx freestyle
cycling bmx racing
cycling mountain bike
cycling road
diving
golf
marathon swimming
modern pentathlon
sailing
shooting
skateboarding
sport climbing
surfing
taekwondo
tennis
trampoline gymnastics
weightlifting
wrestling
\.


--
-- Data for Name: partisipasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partisipasi (id_pertandingan, id_atlet, medali) FROM stdin;
1	1893	emas
1	1030	emas
1	474	emas
1	4641	emas
1	2673	perak
1	4401	perak
1	2139	perak
1	1412	perak
1	4013	perunggu
1	1514	perunggu
1	502	perunggu
1	1297	perunggu
1	3358	#4
1	2243	#4
1	1409	#4
1	4811	#4
1	2950	#5
1	4243	#5
1	996	#5
1	3183	#5
1	1367	#6
1	3157	#6
1	3695	#6
1	62	#6
1	1999	#7
1	710	#7
1	3766	#7
1	1094	#7
1	3469	#8
1	4614	#8
1	1991	#8
1	4741	#8
2	2913	emas
2	1151	emas
2	4179	emas
2	4258	emas
2	4539	perak
2	3953	perak
2	2130	perak
2	1560	perak
2	989	perunggu
2	861	perunggu
2	1598	perunggu
2	3791	perunggu
2	3168	#4
2	2267	#4
2	2201	#4
2	3577	#4
2	185	#5
2	2863	#5
2	412	#5
2	2515	#5
2	4805	#6
2	3211	#6
2	2016	#6
2	2579	#6
2	1038	#7
2	4383	#7
2	201	#7
2	2840	#7
2	2907	#8
2	3311	#8
2	2455	#8
2	1702	#8
3	1924	emas
3	4638	emas
3	4640	emas
3	529	perak
3	4365	perak
3	1925	perak
3	3137	perunggu
3	584	perunggu
3	25	perunggu
3	4615	#4
3	4806	#4
3	4675	#4
3	1014	#5
3	3690	#5
3	4302	#5
3	1341	#6
3	3065	#6
3	165	#6
3	4812	#7
3	818	#7
3	4736	#7
3	4284	#8
3	2181	#8
3	1436	#8
3	3970	#9
3	2088	#9
3	357	#9
3	892	#9
3	4434	#9
3	186	#9
3	1757	#9
3	194	#9
3	969	#9
3	3027	#9
3	681	#9
3	725	#9
4	1718	emas
4	4124	emas
4	4248	emas
4	3703	perak
4	1986	perak
4	4656	perak
4	376	perunggu
4	142	perunggu
4	319	perunggu
4	3712	#4
4	1447	#4
4	2506	#4
4	4704	#5
4	817	#5
4	4482	#5
4	2260	#6
4	3166	#6
4	785	#6
4	1020	#7
4	4263	#7
4	3787	#7
4	388	#8
4	594	#8
4	993	#8
4	2604	#9
4	290	#9
4	733	#9
4	3644	#9
4	3099	#9
4	686	#9
4	4259	#9
4	3493	#9
4	450	#9
4	749	#9
4	739	#9
4	1948	#9
5	920	emas
5	2296	emas
5	4105	emas
5	4283	emas
5	4612	emas
5	4678	perak
5	3884	perak
5	632	perak
5	2005	perak
5	477	perunggu
5	3612	perunggu
5	669	perunggu
5	4229	perunggu
5	1424	perunggu
5	2035	#4
5	1637	#4
5	1878	#4
5	2730	#4
5	3076	#4
5	3360	#5
5	1762	#5
5	1748	#5
5	3719	#5
5	3512	#5
5	4765	#6
5	3403	#6
5	2641	#6
5	2936	#6
5	718	#6
5	3038	#7
5	2662	#7
5	1393	#7
5	3477	#7
5	4272	#7
5	4784	#8
5	3781	#8
5	1353	#8
5	4628	#8
5	3943	#8
5	1359	\N
5	52	\N
5	1732	\N
5	1235	\N
5	98	\N
5	2635	\N
5	2973	\N
5	1961	\N
5	742	\N
5	3372	\N
5	4356	\N
5	3419	\N
5	2041	\N
5	3753	\N
5	3591	\N
5	2716	\N
5	3459	\N
5	4399	\N
5	344	\N
6	4146	emas
6	1866	emas
6	2077	emas
6	4253	emas
6	1678	emas
6	372	perak
6	231	perak
6	2817	perak
6	1150	perak
6	1518	perak
6	3756	perunggu
6	1865	perunggu
6	2645	perunggu
6	1382	perunggu
6	2150	perunggu
6	549	#4
6	3876	#4
6	1480	#4
6	233	#4
6	37	#4
6	1181	#5
6	744	#5
6	4076	#5
6	505	#5
6	499	#5
6	1706	#6
6	4775	#6
6	3704	#6
6	4708	#6
6	4686	#6
6	311	#7
6	2580	#7
6	274	#7
6	3902	#7
6	347	#7
6	3811	#8
6	1640	#8
6	2810	#8
6	2387	#8
6	2931	\N
6	3113	\N
6	889	\N
6	3274	\N
6	3210	\N
6	4413	\N
6	3961	\N
6	3336	\N
6	2575	\N
6	3965	\N
6	1048	\N
6	4768	\N
6	986	\N
6	4175	\N
6	4053	\N
6	2257	\N
6	1222	\N
6	3877	\N
6	650	\N
6	1212	\N
7	1625	emas
7	4734	emas
7	863	emas
7	2619	emas
7	3700	emas
7	606	emas
7	4684	emas
7	4695	emas
7	385	perak
7	1875	perak
7	3103	perak
7	2300	perak
7	495	perak
7	1847	perak
7	950	perak
7	3878	perak
7	4489	perunggu
7	2927	perunggu
7	2584	perunggu
7	3135	perunggu
7	250	perunggu
7	3622	perunggu
7	1797	perunggu
7	619	perunggu
7	2453	#4
7	322	#4
7	288	#4
7	2494	#4
7	3848	#4
7	1305	#4
7	795	#4
7	2504	#4
7	3238	#5
7	3239	#5
7	4509	#5
7	4453	#5
7	516	#5
7	293	#5
7	3004	#5
7	3104	#5
7	4026	#6
7	496	#6
7	2074	#6
7	3743	#6
7	2332	#6
7	867	#6
7	1861	#6
7	1387	#6
7	3769	#7
7	2960	#7
7	3491	#7
7	1829	#7
7	2019	#7
7	2707	#7
7	1972	#7
7	3580	#7
7	2592	#8
7	2969	#8
7	4165	#8
7	1240	#8
7	2695	#8
7	1824	#8
7	1534	#8
7	1404	#8
7	736	#9
7	1479	#9
7	3742	#9
7	2358	#9
7	2870	#9
7	323	#9
7	4819	#9
7	3194	#9
7	1333	#10
7	2898	#10
7	3316	#10
7	294	#10
7	1613	#10
7	3919	#10
7	4177	#10
7	3362	#10
8	1282	emas
8	2573	emas
8	1819	emas
8	1357	emas
8	4544	perak
8	4077	perak
8	684	perak
8	2292	perak
8	2524	perunggu
8	179	perunggu
8	285	perunggu
8	188	#4
8	1661	#4
8	2071	#4
8	3335	#4
8	3771	#5
8	2177	#5
8	4791	#5
8	4234	#5
8	2665	#6
8	1502	#6
8	1110	#6
8	234	#6
8	2798	#7
8	2196	#7
8	2244	#7
8	241	#7
8	3289	\N
8	2652	\N
8	1328	\N
8	280	\N
8	853	\N
8	4185	\N
8	4361	\N
8	4087	\N
8	1250	\N
8	3192	\N
8	3823	\N
8	321	\N
8	3942	\N
8	1169	\N
8	1741	\N
8	3594	\N
8	777	\N
8	1532	\N
8	2602	\N
8	4691	\N
8	4616	\N
8	1918	\N
8	260	\N
8	3710	\N
8	977	\N
8	4549	\N
8	637	\N
8	3133	\N
8	1929	\N
8	226	\N
8	2826	\N
8	1124	\N
8	3517	\N
8	4337	\N
8	957	\N
8	2997	\N
9	266	emas
9	2886	emas
9	657	perak
9	1541	perak
9	1940	perunggu
9	3790	perunggu
9	771	#4
9	2366	#4
9	1314	#5
9	139	#5
9	3795	#5
9	3005	#6
9	430	#6
9	692	#7
9	4592	#7
9	3002	#8
9	2436	#8
9	3175	#9
9	911	#9
9	852	#10
9	4017	#10
9	501	#11
9	882	#11
9	3012	#12
9	3949	#12
9	2295	#13
9	515	#13
9	4651	#14
9	4102	#14
9	2176	#15
9	1993	#15
9	2773	#16
9	3522	#16
9	1830	#17
9	2739	#17
9	1055	#18
9	1608	#18
9	770	#19
9	2488	#19
9	1298	#20
9	3533	#20
9	568	#21
9	3821	#21
9	992	#22
9	3759	#22
9	3094	#23
9	520	#23
9	1160	\N
9	4583	\N
9	4255	\N
9	3693	\N
10	3	emas
10	1962	emas
10	654	emas
10	333	emas
10	544	perak
10	4092	perak
10	645	perak
10	109	perak
10	1954	perunggu
10	2648	perunggu
10	3373	perunggu
10	4801	perunggu
10	3042	#4
10	2465	#4
10	2642	#4
10	1375	#4
10	3896	#5
10	21	#5
10	4724	#5
10	2390	#5
10	3171	#6
10	1933	#6
10	3892	#6
10	3572	#6
10	4804	#8
10	4803	#8
10	1597	#8
10	1989	#8
10	837	\N
10	2325	\N
10	2447	\N
10	1421	\N
10	2107	\N
10	3838	\N
10	1851	\N
10	2450	\N
10	696	\N
10	4040	\N
10	42	\N
10	1937	\N
10	3499	\N
10	2377	\N
10	1938	\N
10	2286	\N
10	120	\N
10	1338	\N
10	1543	\N
10	4506	\N
10	1007	\N
10	3570	\N
10	2669	\N
10	2109	\N
10	2338	\N
10	4683	\N
10	3549	\N
10	1182	\N
10	4317	\N
10	3488	\N
10	4646	\N
10	1349	\N
10	3635	\N
10	1253	\N
10	3777	\N
10	1444	\N
10	2099	\N
10	1233	\N
10	1834	\N
10	2057	\N
10	110	\N
10	2101	\N
10	573	\N
10	1802	\N
10	1734	\N
10	22	\N
11	850	emas
11	4544	emas
11	684	emas
11	3732	emas
11	545	perak
11	688	perak
11	421	perak
11	2563	perak
11	179	perunggu
11	3055	perunggu
11	2566	perunggu
11	778	perunggu
11	2071	#4
11	1090	#4
11	2336	#4
11	1388	#4
11	1461	#5
11	4790	#5
11	2738	#5
11	433	#5
11	4756	#6
11	2216	#6
11	1434	#6
11	2328	#6
11	2665	#7
11	4597	#7
11	1110	#7
11	167	#7
11	3603	#8
11	2324	#8
11	773	#8
11	3307	#8
11	3289	#9
11	1511	#9
11	4323	#9
11	1328	#9
11	1077	\N
11	1316	\N
11	3942	\N
11	1741	\N
11	815	\N
11	1825	\N
11	2172	\N
11	1773	\N
11	972	\N
11	2824	\N
11	3560	\N
11	2671	\N
11	1071	\N
11	3017	\N
11	1871	\N
11	2683	\N
11	1142	\N
11	1870	\N
11	4074	\N
11	3786	\N
11	1952	\N
11	2219	\N
11	3608	\N
11	2849	\N
11	942	\N
11	2798	\N
11	2244	\N
11	1192	\N
11	1929	\N
11	1323	\N
11	2833	\N
11	4494	\N
11	2826	\N
11	2155	\N
11	299	\N
11	3736	\N
11	3967	\N
11	3291	\N
11	3292	\N
12	3118	emas
12	4488	emas
12	1456	emas
12	4069	emas
12	1036	perak
12	1768	perak
12	303	perak
12	967	perak
12	196	perunggu
12	2609	perunggu
12	1513	perunggu
12	3764	perunggu
12	3553	#4
12	1472	#4
12	1663	#4
12	827	#4
12	124	#5
12	2321	#5
12	4015	#5
12	4375	#5
12	3904	#6
12	1860	#6
12	2905	#6
12	497	#6
12	1809	#7
12	2919	#7
12	3214	#7
12	4303	#7
12	3923	\N
12	3989	\N
12	2556	\N
12	3294	\N
12	455	\N
12	4792	\N
12	1542	\N
12	925	\N
12	171	\N
12	1907	\N
12	1158	\N
12	1001	\N
12	3740	\N
12	3741	\N
12	2933	\N
12	3300	\N
12	1977	\N
12	2742	\N
12	2910	\N
12	4621	\N
12	3862	\N
12	2189	\N
12	4395	\N
12	1337	\N
12	3510	\N
12	3167	\N
12	2528	\N
12	3944	\N
12	4173	\N
12	113	\N
12	1874	\N
12	3618	\N
12	4178	\N
12	1273	\N
12	2880	\N
12	3623	\N
12	1167	\N
12	2418	\N
12	1099	\N
12	4468	\N
12	652	\N
12	153	\N
12	2760	\N
12	2762	\N
12	1315	\N
12	2432	\N
13	4077	emas
13	4261	emas
13	1456	emas
13	216	emas
13	2573	perak
13	754	perak
13	2615	perak
13	1357	perak
13	4566	perunggu
13	2524	perunggu
13	3427	perunggu
13	285	perunggu
13	4185	#4
13	3788	#4
13	3666	#4
13	4087	#4
13	4199	#5
13	4079	#5
13	280	#5
13	2652	#5
13	4820	#6
13	4024	#6
13	2444	#6
13	2511	#6
13	3335	#7
13	1770	#7
13	1620	#7
13	1661	#7
13	4203	\N
13	355	\N
13	4098	\N
13	4234	\N
13	727	\N
13	531	\N
13	617	\N
13	1296	\N
13	588	\N
13	2198	\N
13	3575	\N
13	3688	\N
13	4584	\N
13	4246	\N
13	3861	\N
13	921	\N
13	3907	\N
13	3868	\N
13	3119	\N
13	2617	\N
13	2732	\N
13	1124	\N
13	2608	\N
13	3269	\N
13	4159	\N
13	226	\N
13	151	\N
13	3341	\N
13	328	\N
13	2921	\N
13	2196	\N
13	241	\N
13	417	\N
13	4691	\N
13	760	\N
13	3922	\N
13	2149	\N
13	1532	\N
13	2543	\N
13	1754	\N
13	160	\N
13	3757	\N
13	1336	\N
13	234	\N
13	402	\N
13	1502	\N
13	2098	\N
13	488	\N
13	275	\N
13	1667	\N
13	2597	\N
13	1157	\N
14	4228	emas
14	420	emas
14	2532	emas
14	2337	emas
14	1010	emas
14	4495	emas
14	1922	emas
14	2040	emas
14	2122	emas
14	527	emas
14	419	emas
14	1013	emas
14	1417	perak
14	3406	perak
14	359	perak
14	1572	perak
14	1815	perak
14	1299	perak
14	3327	perak
14	3020	perak
14	3880	perak
14	4560	perak
14	3060	perak
14	599	perak
14	4504	perunggu
14	1368	perunggu
14	3446	perunggu
14	628	perunggu
14	4527	perunggu
14	3505	perunggu
14	3445	perunggu
14	4532	perunggu
14	2953	perunggu
14	994	perunggu
14	146	perunggu
14	3449	perunggu
14	1801	#4
14	3558	#4
14	2831	#4
14	3429	#4
14	3400	#4
14	2051	#4
14	1419	#4
14	943	#4
14	3279	#4
14	1008	#4
14	2049	#4
14	341	#4
14	2700	#5
14	3401	#5
14	4073	#5
14	3123	#5
14	1883	#5
14	1088	#5
14	4474	#5
14	3822	#5
14	2314	#5
14	363	#5
14	1029	#5
14	2353	#5
14	1096	#6
14	2104	#6
14	3609	#6
14	2105	#6
14	2036	#6
14	3048	#6
14	955	#6
14	2033	#6
14	3381	#6
14	1841	#6
14	4625	#6
14	1084	#6
14	4671	#7
14	908	#7
14	1021	#7
14	4585	#7
14	2843	#7
14	1573	#7
14	2550	#7
14	3748	#7
14	1484	#7
14	2024	#7
14	678	#7
14	2672	#7
14	4374	#8
14	1508	#8
14	1035	#8
14	4531	#8
14	3395	#8
14	3584	#8
14	1485	#8
14	4535	#8
14	2403	#8
14	3458	#8
14	1507	#8
14	2400	#8
14	717	#9
14	439	#9
14	2352	#9
14	687	#9
14	2434	#9
14	4619	#9
14	2123	#9
14	2897	#9
14	441	#9
14	2791	#9
14	3657	#9
14	4252	#9
14	2639	#10
14	1876	#10
14	3879	#10
14	4642	#10
14	3968	#10
14	961	#10
14	133	#10
14	2132	#10
14	4631	#10
14	4507	#10
14	4062	#10
14	4759	#11
14	4282	#11
14	4757	#11
14	2794	#11
14	2210	#11
14	3881	#11
14	4778	#11
14	4744	#11
14	2110	#11
14	2308	#11
14	1709	#11
14	1689	#11
14	1816	#12
14	1476	#12
14	2079	#12
14	984	#12
14	2093	#12
14	4231	#12
14	138	#12
14	1501	#12
14	1822	#12
14	854	#12
14	462	#12
14	4472	#12
15	1981	emas
15	2318	emas
15	3901	emas
15	2205	emas
15	801	emas
15	1	emas
15	651	emas
15	3337	emas
15	1019	emas
15	1862	emas
15	270	emas
15	667	emas
15	2932	perak
15	213	perak
15	4000	perak
15	4522	perak
15	1759	perak
15	1905	perak
15	1062	perak
15	1438	perak
15	2916	perak
15	2934	perak
15	2539	perak
15	3846	perak
15	1867	perunggu
15	2427	perunggu
15	4226	perunggu
15	4333	perunggu
15	127	perunggu
15	1318	perunggu
15	2902	perunggu
15	761	perunggu
15	1823	perunggu
15	2514	perunggu
15	3933	perunggu
15	1159	#4
15	432	#4
15	2507	#4
15	1221	#4
15	2439	#4
15	592	#4
15	550	#4
15	3087	#4
15	602	#4
15	2164	#4
15	1779	#4
15	2941	#5
15	2492	#5
15	129	#5
15	2871	#5
15	3708	#5
15	2561	#5
15	2557	#5
15	2874	#5
15	340	#5
15	3098	#5
15	3619	#5
15	2875	#5
15	1833	#6
15	4014	#6
15	3375	#6
15	4780	#6
15	1072	#6
15	2119	#6
15	2998	#6
15	374	#6
15	4406	#6
15	3206	#6
15	3315	#6
15	4021	#7
15	218	#7
15	204	#7
15	3494	#7
15	2909	#7
15	2554	#7
15	2706	#7
15	244	#7
15	1433	#7
15	1199	#7
15	2589	#7
15	3850	#7
15	305	#8
15	3579	#8
15	1162	#8
15	3508	#8
15	2510	#8
15	1743	#8
15	3694	#8
15	3302	#8
15	624	#8
15	1319	#8
15	50	#8
15	3420	#8
15	4740	#9
15	4156	#9
15	4459	#9
15	2621	#9
15	4119	#9
15	3127	#9
15	3872	#9
15	4125	#9
15	4665	#9
15	3131	#9
15	4747	#9
15	4667	#9
15	4318	#10
15	659	#10
15	3581	#10
15	2895	#10
15	221	#10
15	4168	#10
15	3309	#10
15	449	#10
15	4477	#10
15	1818	#10
15	1776	#10
15	1845	#10
15	4094	#11
15	3935	#11
15	2357	#11
15	661	#11
15	746	#11
15	4781	#11
15	3345	#11
15	4264	#11
15	2287	#11
15	2454	#11
15	3470	#11
15	2	#11
15	4225	#12
15	2793	#12
15	476	#12
15	3882	#12
15	3323	#12
15	2779	#12
15	3909	#12
15	1312	#12
15	3976	#12
15	4758	#12
15	3325	#12
15	1683	#12
16	3074	emas
16	3072	emas
16	1853	emas
16	4436	emas
16	3809	perak
16	3678	perak
16	1848	perak
16	3473	perak
16	4022	perunggu
16	719	perunggu
16	2860	perunggu
16	3834	perunggu
16	3514	#4
16	1046	#4
16	1751	#4
16	1832	#4
16	4145	#5
16	3209	#5
16	1747	#5
16	473	#5
16	331	#6
16	2956	#6
16	2951	#6
16	4600	#6
16	566	#7
16	2392	#7
16	1828	#7
16	3948	#7
16	3067	#8
16	1562	#8
16	2437	#8
16	1604	#8
16	3390	#9
16	3677	#9
16	2519	#9
16	4141	#9
16	4558	#10
16	2480	#10
16	3281	#10
16	2771	#10
16	4411	#11
16	890	#11
16	1064	#11
16	4705	#11
17	2605	emas
17	238	emas
17	3530	emas
17	4300	emas
17	3626	perak
17	2138	perak
17	3629	perak
17	3991	perak
17	3480	perunggu
17	3983	perunggu
17	4291	perunggu
17	242	perunggu
17	2245	#4
17	403	#4
17	73	#4
17	1059	#4
17	1066	#5
17	3128	#5
17	3324	#5
17	4748	#5
17	3987	#6
17	1268	#6
17	730	#6
17	4328	#6
17	2893	#7
17	397	#7
17	1653	#7
17	2423	#7
17	1166	#8
17	268	#8
17	197	#8
17	4673	#8
17	327	#9
17	3198	#9
17	2918	#9
17	1083	#9
17	905	#10
17	3346	#10
17	3810	#10
17	4470	#10
18	3524	emas
18	3931	emas
18	893	emas
18	2310	emas
18	1278	perak
18	933	perak
18	784	perak
18	1279	perak
18	3528	perak
18	4147	perunggu
18	1372	perunggu
18	1408	perunggu
18	2070	perunggu
18	3439	#4
18	713	#4
18	3747	#4
18	6	#5
18	2302	#5
18	4439	#5
18	707	#5
18	4363	#6
18	577	#6
18	4366	#6
18	4515	#6
18	1089	#7
18	3019	#7
18	3146	#7
18	738	#7
18	2594	#8
18	1327	#8
18	4487	#8
18	3474	#8
18	4394	#9
18	1127	#10
18	4104	#10
19	3871	emas
19	1632	emas
19	1935	emas
19	1102	perak
19	1605	perak
19	1836	perak
19	3050	perunggu
19	2537	perunggu
19	3058	perunggu
19	1392	#4
19	4042	#4
19	3750	#4
19	4726	#5
19	2218	#5
19	4777	#5
19	3434	#6
19	2666	#6
19	3083	#6
19	4210	#6
19	4113	#7
19	4739	#7
19	3696	#7
19	4492	#8
19	3399	#8
19	1886	#8
20	1949	emas
20	2587	emas
20	826	emas
20	2410	emas
20	257	perak
20	685	perak
20	1208	perak
20	3424	perak
20	1146	perunggu
20	2113	perunggu
20	400	perunggu
20	1969	perunggu
20	811	#4
20	4588	#4
20	1148	#4
20	2983	#4
20	2562	#4
20	869	#5
20	4518	#5
20	2939	#5
20	2911	#5
20	4556	#5
20	1420	#6
20	2606	#6
20	3174	#6
20	2540	#6
20	2503	#6
20	200	#7
20	4187	#7
20	829	#7
20	2757	#7
20	1478	#7
20	2765	#8
20	4006	#8
20	1258	#8
20	453	#8
20	3139	#9
20	2313	#9
20	4764	#10
20	3237	#10
21	2284	emas
21	4186	emas
21	1215	emas
21	3761	perak
21	4070	perak
21	1174	perak
21	3632	perunggu
21	1217	perunggu
21	2527	perunggu
21	2446	#4
21	1677	#4
21	4214	#4
21	1970	#5
21	4761	#5
21	2735	#5
21	4749	#6
21	4085	#6
21	2622	#6
21	2962	#7
21	4505	#7
21	3450	#7
21	4002	#8
21	2317	#8
21	2521	#8
22	1973	emas
22	1810	perak
22	792	perunggu
22	1039	#4
22	759	#5
22	714	#6
22	931	#7
22	551	#8
22	3329	#9
22	1806	#10
22	1234	#11
22	1218	#12
22	1423	#13
22	3606	#14
22	3951	#15
22	3628	#16
22	4565	#17
22	4351	#18
22	1385	#19
22	76	#20
22	1624	#21
22	1052	#22
22	2474	#23
22	3417	#24
22	2171	#25
22	1391	#26
22	2174	#27
22	638	#28
22	900	#29
22	1666	#30
22	205	#31
22	4150	#32
22	2028	#33
22	4729	#34
22	4629	#35
22	880	#36
22	36	#37
22	2190	#38
22	1921	#39
22	3117	#40
22	3322	#41
22	4702	#42
22	703	#43
22	3820	#44
22	4211	#45
22	3598	#46
22	437	#47
22	2251	#48
22	834	#49
22	2872	#50
22	4213	#51
22	440	#52
22	249	#53
22	2021	#54
22	365	#55
22	3643	#56
22	4782	#57
22	155	#58
22	2124	#59
22	2858	\N
23	1423	emas
23	1810	emas
23	1973	emas
23	4181	emas
23	931	perak
23	3329	perak
23	759	perak
23	3319	perak
23	551	perunggu
23	714	perunggu
23	792	perunggu
23	1624	#4
23	1234	#4
23	1039	#4
23	1117	#4
23	900	#5
23	205	#5
23	3628	#5
23	410	#5
23	2171	#6
23	4351	#6
23	3606	#6
23	2894	#6
23	1666	#7
23	2021	#7
23	1218	#7
23	1154	#7
23	4211	#8
23	1391	#8
23	4565	#8
23	842	#8
23	1921	#9
23	4629	#9
23	4150	#9
23	2994	#9
23	1052	#10
23	2474	#10
23	1385	#10
23	790	#10
23	3322	#11
23	834	#11
23	703	#11
23	1997	#11
23	437	#12
23	2872	#12
23	3820	#12
23	2026	#12
23	880	#13
23	2124	#13
23	638	#13
23	2251	#14
23	3951	#14
23	155	#14
23	2858	\N
23	76	\N
23	4213	\N
23	1237	\N
24	3148	emas
24	851	perak
24	4438	#4
24	2297	#5
24	4393	#6
24	4723	#7
24	1356	#8
24	1912	#9
24	642	#10
24	2145	#11
24	1430	#12
24	2470	#13
24	4220	#14
24	2234	#15
24	2236	#16
24	504	#17
24	878	#18
24	1156	#19
24	4081	#20
24	3858	#21
24	1310	#22
24	180	#23
24	2653	#24
24	3416	#25
24	3722	#26
24	3725	#27
24	4407	#28
24	3122	#29
24	3828	#30
24	4256	#31
24	2240	#32
24	4169	#33
24	1627	#34
24	3186	#35
24	4538	#36
24	735	#37
24	1967	#38
24	2803	#39
24	2072	#40
24	525	#41
24	3654	#42
24	192	#43
24	2850	#44
24	3483	#45
24	1523	#46
24	3963	#47
24	3824	#48
24	1267	#49
24	3222	#50
24	3413	#51
24	3993	\N
24	724	\N
24	3899	\N
24	721	\N
24	3959	\N
24	2339	\N
24	3853	\N
24	849	\N
24	1897	\N
24	2823	\N
24	3204	\N
24	1705	\N
24	1197	\N
24	3888	\N
24	443	\N
24	4097	\N
24	3680	\N
24	4469	\N
24	4622	\N
25	3858	emas
25	4438	emas
25	2487	emas
25	3416	perak
25	2234	perak
25	4220	perak
25	4469	perunggu
25	2297	perunggu
25	4723	perunggu
25	3899	perunggu
25	4407	#4
25	2236	#4
25	2470	#4
25	3122	#5
25	3828	#5
25	1356	#5
25	4169	#6
25	2653	#6
25	1430	#6
25	735	#7
25	1156	#7
25	642	#7
25	2072	#8
25	878	#8
25	4393	#8
25	443	#9
25	4256	#9
25	504	#9
25	3993	#9
25	3963	#10
25	3722	#10
25	1912	#10
25	1967	#11
25	3186	#11
25	2240	#11
25	3888	#12
25	2850	#12
25	3725	#12
25	724	#12
25	3680	#13
25	1523	#13
25	1310	#13
25	1197	#13
25	849	#14
25	2145	#14
25	3148	#14
25	4097	#15
25	4081	#15
25	851	#15
25	2339	#15
25	4622	#16
25	3824	#16
25	2803	#16
25	1897	#16
26	839	emas
26	4236	perak
26	2785	perunggu
26	2165	#4
26	4219	#5
26	4030	#6
26	3071	#7
26	2496	#8
26	560	#9
26	2976	#10
26	3738	#11
26	3667	#12
26	26	#13
26	1633	#14
26	1564	#15
26	2238	#16
26	4137	#17
26	2935	#18
26	3538	#19
26	1512	#20
26	1188	#21
26	4083	#22
26	2363	#23
26	4564	#24
26	2096	#25
26	356	#26
26	1669	#26
26	3836	#26
26	936	#26
26	4288	#26
26	1636	#31
26	3841	#32
90	1748	\N
26	860	#33
26	3095	#34
26	1963	#35
26	2263	#36
26	1263	#37
26	3535	#38
26	1821	#39
26	1285	#40
26	343	#41
26	3830	#42
26	3639	#43
26	1682	#44
26	1111	#45
26	2349	#46
26	1119	#47
26	1076	#48
26	4382	#50
26	4341	#51
26	44	#52
26	985	#53
26	4281	#54
26	3799	#55
26	2409	#56
26	1790	#57
26	2799	#58
26	1491	#59
26	4059	#60
26	3918	#61
26	4772	#62
26	2705	#63
26	1812	#64
26	84	#65
26	3782	#66
26	1903	\N
26	1114	\N
26	3308	\N
26	934	\N
26	1123	\N
26	366	\N
26	23	\N
26	301	\N
27	560	emas
27	1636	emas
27	4030	emas
27	2102	emas
27	2496	perak
27	2238	perak
27	3095	perak
27	2326	perak
27	4137	perunggu
27	3535	perunggu
27	2165	perunggu
27	2342	perunggu
27	2785	#4
27	2363	#4
27	1633	#4
27	4626	#4
27	839	#5
27	3799	#5
27	3667	#5
27	1902	#5
27	1669	#6
27	3841	#6
27	3639	#6
27	2805	#6
27	4083	#7
27	936	#7
27	860	#7
27	4632	#8
27	1512	#8
27	1963	#8
27	1564	#8
27	478	#9
27	3830	#9
27	934	#9
27	1812	#9
27	723	#10
27	1285	#10
27	1114	#11
27	1821	#11
27	4059	#11
27	461	#11
27	3686	#12
27	4236	#12
27	2976	#12
27	1111	#12
27	2263	#13
27	1491	#13
27	3071	#13
27	847	#13
27	304	#14
27	2935	#14
27	1263	#14
27	4382	#14
27	1682	#15
27	4341	#15
27	1119	#15
27	286	#15
27	4281	#16
27	4288	#16
27	1123	#16
27	3185	#16
27	44	#17
27	985	#17
27	2799	#17
27	222	#18
27	3538	#18
27	23	#18
27	3918	#18
27	2349	#19
27	26	#19
27	3738	#19
27	24	#19
27	3642	\N
27	4219	\N
27	3836	\N
27	4772	\N
28	4380	emas
28	3008	emas
28	976	emas
28	1492	emas
28	2388	perak
28	114	perak
28	2299	perak
28	3000	perak
28	2011	perunggu
28	3155	perunggu
28	1880	perunggu
28	2978	perunggu
28	3611	#4
28	4682	#4
28	3842	#4
28	2701	#4
28	1452	#5
28	980	#5
28	339	#5
28	1343	#5
28	1178	#6
28	3886	#6
28	4701	#6
28	4511	#6
28	1410	#7
28	1978	#7
28	3874	#7
28	1550	#7
28	2775	#8
28	3248	#8
28	2776	#8
28	3261	#8
29	2294	emas
29	2443	emas
29	4745	emas
29	4285	emas
29	1579	perak
29	173	perak
29	1373	perak
29	4451	perak
29	3084	perunggu
29	1244	perunggu
29	2166	perunggu
29	3079	perunggu
29	3195	#4
29	3396	#4
29	191	#4
29	1490	#4
29	1599	#5
29	4814	#5
29	603	#5
29	1994	#5
29	1895	#6
29	368	#6
29	3156	#6
29	68	#6
29	613	#7
29	939	#7
29	630	#7
29	3085	#7
29	119	#8
29	3249	#8
29	3251	#8
29	16	#8
30	1593	emas
30	636	emas
30	3956	emas
30	3957	emas
30	915	perak
30	2429	perak
30	332	perak
30	466	perak
30	635	perunggu
30	1932	perunggu
30	4041	perunggu
30	3080	perunggu
30	1335	#4
30	3262	#4
30	224	#4
30	3263	#4
30	2661	#5
30	3160	#5
30	2702	#5
30	3681	#5
30	3244	#6
30	4807	#6
30	4692	#6
30	53	#6
30	1137	#7
30	1366	#7
30	888	#7
30	3229	#7
30	1332	#8
30	1413	#8
30	3534	#8
30	4091	#8
31	3864	emas
31	2832	emas
31	1531	emas
31	131	emas
31	2908	perak
31	199	perak
31	503	perak
31	899	perak
31	152	perunggu
31	240	perunggu
31	3780	perunggu
31	2990	perunggu
31	4716	#4
31	2182	#4
31	3490	#4
31	4123	#4
31	1783	#5
31	4728	#5
31	1724	#5
31	4055	#5
31	1097	#6
31	4595	#6
31	3520	#6
31	962	#6
31	406	#7
31	2868	#7
31	2266	#7
31	1595	#7
31	3338	#8
31	4109	#8
31	510	#8
31	2654	#8
32	1859	emas
32	2534	emas
32	2517	emas
32	2781	emas
32	456	perak
32	2982	perak
32	1403	perak
32	235	perak
32	4054	perunggu
32	2393	perunggu
32	2237	perunggu
32	4754	perunggu
32	1975	#4
32	1132	#4
32	4767	#4
32	386	#5
32	1293	#5
32	3631	#5
32	4732	#5
32	2988	#6
32	1614	#6
32	2991	#6
32	2152	#6
32	803	#7
32	3698	#7
32	1239	#7
32	4779	#7
32	3978	#8
32	4687	#8
32	2802	#8
32	3481	#8
33	4762	emas
33	3523	emas
33	245	emas
33	3519	emas
33	4043	perak
33	1287	perak
33	1649	perak
33	2013	perak
33	3225	perunggu
33	4100	perunggu
33	4064	perunggu
33	3817	perunggu
33	2819	#4
33	3979	#4
33	763	#4
33	4001	#4
33	2780	#5
33	4304	#5
33	2758	#5
33	1164	#5
33	4247	#6
33	399	#6
33	2623	#6
33	2667	#6
33	3159	#7
33	2981	#7
33	812	#7
33	1796	#7
33	772	#8
33	3977	#8
33	4821	#8
33	2230	#8
34	463	emas
34	2836	emas
34	2129	emas
34	1248	emas
34	3610	emas
34	3571	emas
34	1025	emas
34	563	emas
34	30	emas
34	176	emas
34	1360	emas
34	2062	emas
34	2018	emas
34	100	emas
34	3177	emas
34	61	emas
34	4061	emas
34	3938	emas
34	3498	perak
34	747	perak
34	75	perak
34	2626	perak
34	2361	perak
34	2821	perak
34	3150	perak
34	2767	perak
34	464	perak
34	208	perak
34	1012	perak
34	1245	perak
34	2090	perak
34	1931	perak
34	644	perak
34	1581	perak
34	4198	perak
34	3749	perak
34	3297	perunggu
34	41	perunggu
34	116	perunggu
34	3105	perunggu
34	56	perunggu
34	574	perunggu
34	1140	perunggu
34	600	perunggu
34	4196	perunggu
34	1760	perunggu
34	4789	perunggu
34	3717	perunggu
34	4693	perunggu
34	3569	perunggu
34	3106	perunggu
34	13	perunggu
34	3568	perunggu
34	296	perunggu
34	1607	#4
34	3542	#4
34	90	#4
34	93	#4
34	1704	#4
34	3257	#4
34	2777	#4
34	4808	#4
34	3556	#4
34	1730	#4
34	3285	#4
34	95	#4
34	2233	#4
34	4816	#4
34	3259	#4
34	3260	#4
34	220	#4
34	3247	#4
34	601	#4
34	3250	#4
34	2546	#5
34	2217	#5
34	3898	#5
34	1687	#5
34	4046	#5
34	4194	#5
34	3801	#5
34	2039	#5
34	4111	#5
34	2389	#5
34	2830	#5
34	4278	#5
34	3895	#5
34	4116	#5
34	2405	#5
34	521	#5
34	4735	#5
34	2307	#5
34	1468	#6
34	122	#6
34	3854	#6
34	941	#6
34	1509	#6
34	2855	#6
34	2846	#6
34	1024	#6
34	2341	#6
34	4623	#6
34	1242	#6
34	3833	#6
34	215	#6
34	1321	#6
34	2173	#6
34	1362	#6
34	1589	#6
34	2847	#6
34	1497	#7
34	2852	#7
34	2175	#7
34	2029	#7
34	1317	#7
34	677	#7
34	2345	#7
34	907	#7
34	2153	#7
34	4352	#7
34	881	#7
34	2531	#7
34	1547	#7
34	3972	#7
34	1545	#7
34	3414	#7
34	1536	#7
34	2670	#7
34	3605	#8
34	3354	#8
34	4610	#8
34	3082	#8
34	2058	#8
34	1503	#8
34	2340	#8
34	4298	#8
34	1570	#8
34	4313	#8
34	3638	#8
34	3196	#8
34	1080	#8
34	1045	#8
34	575	#8
34	1840	#8
34	697	#8
34	1446	#8
34	1486	#9
34	1763	#9
34	3516	#9
34	2797	#9
34	4520	#9
34	3518	#9
34	3515	#9
34	3310	#9
34	1750	#9
34	2795	#9
34	2796	#9
34	2376	#9
34	4603	#9
34	958	#9
34	4602	#9
34	467	#9
34	3513	#9
34	1047	#9
34	1721	#10
34	2097	#10
34	1719	#10
34	4245	#10
34	94	#10
34	4787	#10
34	223	#10
34	1731	#10
34	1722	#10
34	4731	#10
34	3299	#10
34	2435	#10
34	2247	#10
34	2246	#10
34	3431	#10
34	3298	#10
34	3304	#10
34	518	#10
34	1720	#10
34	182	#11
34	3145	#11
34	3928	#11
34	4491	#11
34	1380	#11
34	2034	#11
34	3049	#11
34	561	#11
34	562	#11
34	4012	#11
34	1965	#11
34	2304	#11
34	2720	#11
34	1919	#11
34	3059	#11
34	1376	#11
34	2449	#11
34	3564	#11
34	2568	#11
34	1805	#11
34	4648	#12
34	1411	#12
34	2117	#12
34	1105	#12
34	2708	#12
34	1656	#12
34	3561	#12
34	371	#12
34	3727	#12
34	1106	#12
34	3655	#12
34	2027	#12
34	1241	#12
34	3540	#12
34	1324	#12
34	3366	#12
34	2094	#12
34	3486	#12
34	28	#13
34	3908	#13
34	20	#13
34	2356	#13
34	3290	#13
34	1738	#13
34	11	#13
34	3887	#13
34	2354	#13
34	1915	#13
34	3565	#13
34	4599	#13
34	4786	#13
34	1131	#13
34	4498	#13
34	475	#13
34	1042	#13
34	27	#13
34	1737	#13
34	2482	#14
34	1402	#14
34	1603	#14
34	2809	#14
34	1736	#14
34	887	#14
34	4633	#14
34	641	#14
34	800	#14
34	3916	#14
34	4355	#14
34	1827	#14
34	648	#14
34	1002	#14
34	3245	#14
34	3566	#14
34	92	#14
34	3287	#14
34	3543	#15
34	1756	#15
34	4034	#15
34	4208	#15
34	3869	#15
34	3544	#15
34	3562	#15
34	1280	#15
34	1067	#15
34	3559	#15
34	2576	#15
34	3475	#15
34	1130	#15
34	513	#15
34	55	#15
34	3550	#15
34	1739	#15
34	3471	#15
34	3870	#15
34	4197	#16
34	3314	#16
34	528	#16
34	3258	#16
34	3752	#16
34	272	#16
34	248	#16
34	3313	#16
34	1670	#16
34	3275	#16
34	3567	#16
34	219	#16
34	2754	#16
34	271	#16
34	1826	#16
34	3282	#16
34	18	#16
34	4048	#16
34	806	#16
35	269	emas
35	1203	emas
35	2401	emas
35	3334	emas
35	4476	emas
35	740	emas
35	914	emas
35	2736	emas
35	2806	emas
35	2595	emas
35	4183	emas
35	4381	emas
35	1943	emas
35	1209	emas
35	1872	emas
35	3860	emas
35	3932	emas
35	741	emas
35	913	emas
35	2637	perak
35	431	perak
35	4301	perak
35	3731	perak
35	1079	perak
35	4296	perak
35	2333	perak
35	4587	perak
35	69	perak
35	1982	perak
35	4276	perak
35	4689	perak
35	2698	perak
35	4339	perak
35	1439	perak
35	320	perak
35	1440	perak
35	377	perak
35	3136	perunggu
35	4008	perunggu
35	2270	perunggu
35	597	perunggu
35	2928	perunggu
35	1908	perunggu
35	2526	perunggu
35	4260	perunggu
35	4158	perunggu
35	2491	perunggu
35	202	perunggu
35	389	perunggu
35	3982	perunggu
35	1153	perunggu
35	1529	perunggu
35	2137	perunggu
35	2380	perunggu
35	4593	perunggu
35	3224	#4
35	3545	#4
35	4327	#4
35	1794	#4
35	3506	#4
35	107	#4
35	491	#4
35	2940	#4
35	3920	#4
35	1946	#4
35	214	#4
35	3595	#4
35	748	#4
35	2456	#4
35	1294	#4
35	2457	#4
35	2684	#4
35	3521	#4
35	512	#5
35	3816	#5
35	3240	#5
35	3910	#5
35	1610	#5
35	4428	#5
35	1685	#5
35	2360	#5
35	3807	#5
35	1435	#5
35	3208	#5
35	3268	#5
35	1681	#5
35	4751	#5
35	442	#5
35	1700	#5
35	2784	#5
35	821	#5
35	3776	#5
35	3233	#5
35	895	#6
35	2756	#6
35	4617	#6
35	1269	#6
35	1149	#6
35	283	#6
35	3913	#6
35	1554	#6
35	1284	#6
35	999	#6
35	2204	#6
35	2904	#6
35	4051	#6
35	3947	#6
35	2331	#6
35	3630	#6
35	3954	#6
35	1569	#6
35	1304	#6
35	2212	#7
35	1454	#7
35	2203	#7
35	1313	#7
35	3711	#7
35	886	#7
35	2142	#7
35	1920	#7
35	2085	#7
35	482	#7
35	72	#7
35	1868	#7
35	4134	#7
35	4526	#7
35	3384	#7
35	1909	#7
35	1976	#7
35	3900	#7
35	4096	#7
35	750	#8
35	2828	#8
35	944	#8
35	945	#8
35	4713	#8
35	947	#8
35	2827	#8
35	2842	#8
35	3092	#8
35	2536	#8
35	751	#8
35	2268	#8
35	1753	#8
35	373	#8
35	2570	#8
35	2087	#8
35	729	#8
35	2591	#8
35	3950	#8
35	2744	#9
35	3165	#9
35	2215	#9
35	874	#9
35	903	#9
35	2279	#9
35	4217	#9
35	2445	#9
35	695	#9
35	1210	#9
35	2993	#9
35	1176	#9
35	4295	#9
35	126	#9
35	873	#9
35	1647	#9
35	875	#9
35	4320	#9
35	4088	#9
35	396	#10
35	2258	#10
35	2745	#10
35	864	#10
35	3109	#10
35	2804	#10
35	3153	#10
35	2743	#10
35	1441	#10
35	1777	#10
35	2275	#10
35	4563	#10
35	3763	#10
35	2274	#10
35	256	#10
35	1863	#10
35	3200	#10
35	1555	#10
35	404	#10
35	4425	#11
35	3162	#11
35	3563	#11
35	3422	#11
35	816	#11
35	1274	#11
35	4460	#11
35	823	#11
35	856	#11
35	1945	#11
35	4496	#11
35	990	#11
35	623	#11
35	3745	#11
35	810	#11
35	824	#11
35	1742	#11
35	757	#12
35	1016	#12
35	2734	#12
35	1275	#12
35	3634	#12
35	3789	#12
35	3227	#12
35	3500	#12
35	2200	#12
35	1551	#12
35	534	#12
35	507	#12
35	2972	#12
35	3691	#12
35	1664	#12
35	1272	#12
35	3377	#12
35	2996	#12
36	3438	emas
36	3402	emas
36	2769	emas
36	1194	emas
36	3746	emas
36	1195	emas
36	2770	emas
36	1623	emas
36	3018	emas
36	1668	emas
36	3189	emas
36	2718	emas
36	2479	emas
36	4139	emas
36	4360	emas
36	4142	emas
36	979	perak
36	2047	perak
36	2668	perak
36	4037	perak
36	2194	perak
36	2184	perak
36	2154	perak
36	3778	perak
36	2206	perak
36	4390	perak
36	346	perak
36	3883	perak
36	2723	perak
36	848	perak
36	2952	perak
36	1913	perak
36	1549	perunggu
36	2089	perunggu
36	178	perunggu
36	3832	perunggu
36	63	perunggu
36	1769	perunggu
36	31	perunggu
36	83	perunggu
36	140	perunggu
36	1729	perunggu
36	3179	perunggu
36	937	perunggu
36	2285	perunggu
36	938	perunggu
36	1917	perunggu
36	621	#4
36	3432	#4
36	622	#4
36	2183	#4
36	3363	#4
36	4207	#4
36	4386	#4
36	3010	#4
36	3180	#4
36	2383	#4
36	2424	#4
36	988	#4
36	640	#4
36	1051	#4
36	145	#4
36	4501	#4
36	4502	#4
36	4672	#5
36	14	#5
36	97	#5
36	3259	#5
36	3260	#5
36	1733	#5
36	3541	#5
36	4696	#5
36	4044	#5
36	3242	#5
36	117	#5
36	96	#5
36	2235	#5
36	225	#5
36	3265	#5
36	3243	#5
36	4553	#6
36	3946	#6
36	4036	#6
36	3665	#6
36	2417	#6
36	2414	#6
94	2716	\N
36	2768	#6
36	4422	#6
36	840	#6
36	1628	#6
36	4464	#6
36	1443	#6
36	4133	#6
36	207	#6
36	2066	#7
36	3068	#7
36	1355	#7
36	940	#7
36	342	#7
36	4038	#7
36	1606	#7
36	4423	#7
36	1351	#7
36	2679	#7
36	136	#7
36	1998	#7
36	2067	#7
36	3557	#7
36	2724	#7
36	2241	#7
36	4680	#8
36	519	#8
36	3361	#8
36	1180	#8
36	3125	#8
36	1028	#8
36	3415	#8
36	4576	#8
36	3448	#8
36	2712	#8
36	2699	#8
36	1711	#8
36	4514	#8
36	1093	#8
36	2239	#8
36	3774	#8
36	1058	#9
36	2655	#9
36	1050	#9
36	2938	#9
36	2714	#9
36	4828	#9
36	3011	#9
36	2114	#9
36	2711	#9
36	3443	#9
36	4405	#9
36	1831	#9
36	2925	#9
36	4546	#9
36	66	#10
36	569	#10
36	3607	#10
36	3840	#10
36	1493	#10
36	3641	#10
36	564	#10
36	4822	#10
36	2425	#10
36	1442	#10
36	3797	#10
36	4823	#10
36	3190	#10
36	2483	#10
36	3007	#10
36	1121	#10
36	565	#10
36	4290	#11
36	2404	#11
36	4455	#11
36	3333	#11
36	4114	#11
36	48	#11
36	4106	#11
36	2000	#11
36	922	#11
36	1686	#11
36	1691	#11
36	4306	#11
36	3331	#11
36	4195	#11
36	1339	#12
36	1342	#12
36	3408	#12
36	1023	#12
36	1745	#12
36	3574	#12
36	2678	#12
36	358	#12
36	1583	#12
36	3640	#12
36	1466	#12
36	1888	#12
36	2552	#12
36	3407	#12
36	2127	#12
37	4550	emas
37	2861	emas
37	4240	emas
37	3484	emas
37	4238	emas
37	4126	emas
37	2232	emas
37	2422	emas
37	4573	emas
37	2281	emas
37	2942	emas
37	701	emas
37	3960	emas
37	1665	emas
37	4342	emas
37	2493	perak
37	3116	perak
37	239	perak
37	831	perak
37	898	perak
37	1559	perak
37	885	perak
37	2490	perak
37	3552	perak
37	4293	perak
37	3624	perak
37	1270	perak
37	3546	perak
37	2692	perak
37	3990	perak
37	2541	perak
37	1641	perak
37	3952	perunggu
37	3988	perunggu
37	1659	perunggu
37	408	perunggu
37	2271	perunggu
37	2596	perunggu
37	263	perunggu
37	3138	perunggu
37	2420	perunggu
37	4475	perunggu
37	2649	perunggu
37	3173	perunggu
37	1216	perunggu
37	3806	perunggu
37	3158	perunggu
37	2045	#4
37	3463	#4
37	711	#4
37	2599	#4
37	1892	#4
37	3022	#4
37	1311	#4
37	3351	#4
37	2419	#4
37	4163	#4
37	1144	#4
37	1951	#4
37	3532	#4
37	4493	#4
37	2505	#5
37	2630	#5
37	2473	#5
37	625	#5
37	2134	#5
37	4292	#5
37	2364	#5
37	2312	#5
37	375	#5
37	3812	#5
37	4688	#5
37	3437	#5
37	1040	#5
37	1266	#5
37	3661	#6
37	3318	#6
37	390	#6
37	2369	#6
37	620	#6
37	1567	#6
37	3455	#6
94	3719	\N
37	4824	#6
37	3479	#6
37	3664	#6
37	2278	#6
37	1566	#6
37	3772	#6
37	916	#6
37	2370	#6
37	4572	#6
37	3663	#6
37	1451	#7
37	675	#7
37	2901	#7
37	4297	#7
37	1968	#7
37	314	#7
37	2472	#7
37	71	#7
37	3934	#7
37	1528	#7
37	1448	#7
37	2841	#7
37	1983	#7
37	3599	#7
37	2315	#7
37	3779	#7
37	243	#8
37	3110	#8
37	2603	#8
37	4649	#8
37	1200	#8
37	416	#8
37	4007	#8
37	2146	#8
37	422	#8
37	1950	#8
37	2261	#8
37	4581	#8
37	2140	#8
37	2046	#8
37	2968	#9
37	4574	#9
37	2581	#9
37	2157	#9
37	1049	#9
37	1660	#9
37	3344	#9
37	132	#9
37	2923	#9
37	3340	#9
37	802	#9
37	4216	#9
37	1138	#9
37	522	#9
37	2015	#10
37	1291	#10
37	1286	#10
37	2006	#10
37	3905	#10
37	3226	#10
37	1288	#10
37	607	#10
37	2448	#10
37	1292	#10
37	2014	#10
37	987	#10
37	626	#10
37	2007	#10
37	4516	#11
37	316	#11
37	1163	#11
37	3465	#11
37	4416	#11
37	309	#11
37	4294	#11
37	2790	#11
37	3349	#11
37	253	#11
37	300	#11
37	532	#11
37	2789	#11
37	1185	#11
37	1184	#11
37	3426	#12
37	2970	#12
37	728	#12
37	4129	#12
37	2786	#12
37	3132	#12
37	1947	#12
37	2471	#12
37	3615	#12
37	2737	#12
37	2199	#12
37	237	#12
37	2887	#12
37	210	#12
37	3217	#12
38	2010	emas
38	2476	emas
38	2063	emas
38	4359	emas
38	4357	emas
38	4067	emas
38	2092	emas
38	2185	emas
38	1009	emas
38	1399	emas
38	4418	emas
38	2385	emas
38	2043	emas
38	4215	emas
38	3684	emas
38	4385	emas
38	1078	emas
38	1398	emas
38	3021	perak
38	3033	perak
38	2725	perak
38	3440	perak
38	2048	perak
38	4358	perak
38	3613	perak
38	4324	perak
38	4433	perak
38	1548	perak
38	855	perak
38	2195	perak
38	2853	perak
38	2979	perak
38	1622	perak
38	2807	perak
38	3277	perak
38	1930	perak
38	2820	perunggu
38	32	perunggu
38	1629	perunggu
38	1587	perunggu
38	3958	perunggu
38	2814	perunggu
38	1630	perunggu
38	2460	perunggu
38	4202	perunggu
38	4250	perunggu
38	4078	perunggu
38	3735	perunggu
38	298	perunggu
38	4590	perunggu
38	4249	perunggu
38	143	#4
38	2084	#4
38	4647	#4
38	3729	#4
38	3647	#4
38	265	#4
38	2095	#4
38	1489	#4
38	2838	#4
38	2835	#4
38	2703	#4
38	2837	#4
38	2030	#4
38	2839	#4
38	639	#4
38	1112	#4
38	1746	#4
38	679	#4
38	2627	#5
38	4354	#5
38	472	#5
38	2054	#5
38	1390	#5
38	764	#5
38	1469	#5
38	3409	#5
38	189	#5
38	1352	#5
38	4578	#5
38	468	#5
38	425	#5
38	2629	#5
38	4559	#5
94	3612	\N
38	4429	#5
38	3081	#5
38	3367	#5
38	465	#5
38	2452	#6
38	4430	#6
38	902	#6
38	1877	#6
38	4435	#6
38	3047	#6
38	3353	#6
38	2108	#6
38	1104	#6
38	1855	#6
38	615	#6
38	447	#6
38	2438	#6
38	1400	#6
38	4387	#6
38	360	#6
38	1958	#6
38	3393	#7
38	1844	#7
38	971	#7
38	1849	#7
38	4785	#7
38	3885	#7
38	3930	#7
38	1884	#7
38	3669	#7
38	974	#7
38	3526	#7
38	2569	#7
38	2535	#7
38	4372	#7
38	894	#7
38	4627	#7
38	4391	#7
38	1462	#7
38	4446	#8
38	2125	#8
38	3411	#8
38	4421	#8
38	2783	#8
38	3410	#8
38	2681	#8
38	3974	#8
38	1340	#8
38	4440	#8
38	3029	#8
38	2676	#8
38	87	#8
38	4271	#8
38	4443	#8
38	82	#8
38	543	#8
38	1774	#8
38	3305	#9
38	361	#9
38	1858	#9
38	19	#9
38	646	#9
38	2303	#9
38	4338	#9
38	3052	#9
38	3889	#9
38	932	#9
38	3386	#9
38	4795	#9
38	3487	#9
38	3936	#9
38	1300	#9
38	699	#9
38	975	#10
38	4403	#10
38	2055	#10
38	3056	#10
38	959	#10
38	2441	#10
38	4080	#10
38	4035	#10
38	3658	#10
38	1957	#10
38	3151	#10
38	579	#10
38	2069	#10
38	3652	#10
38	2533	#10
38	559	#10
38	3392	#10
38	471	#11
38	1465	#11
38	3037	#11
38	2677	#11
38	4140	#11
38	612	#11
38	4569	#11
38	3476	#11
38	284	#11
38	1464	#11
38	1415	#11
38	912	#11
38	1147	#11
38	1281	#11
38	4557	#11
38	780	#11
38	4402	#11
38	663	#11
38	1053	#12
38	4029	#12
38	928	#12
38	4136	#12
38	781	#12
38	1879	#12
38	3926	#12
38	4143	#12
38	3383	#12
38	643	#12
38	2100	#12
38	2547	#12
38	2228	#12
38	610	#12
38	4033	#12
38	1714	#12
38	1643	#12
38	2801	#12
38	1804	#12
39	411	emas
39	2733	emas
39	1427	emas
39	2612	emas
39	4643	emas
39	4707	emas
39	3785	emas
39	1346	emas
39	2892	emas
39	3962	emas
39	1426	emas
39	2076	emas
39	2961	emas
39	3674	emas
39	2920	emas
39	2498	emas
39	3673	emas
39	1988	perak
39	604	perak
39	2618	perak
39	4710	perak
39	4703	perak
39	3468	perak
39	1698	perak
39	4815	perak
39	4613	perak
39	3112	perak
39	1987	perak
39	4770	perak
39	4677	perak
39	4620	perak
39	1990	perak
39	2009	perak
39	384	perak
39	4170	perunggu
39	89	perunggu
39	4517	perunggu
39	80	perunggu
39	88	perunggu
39	2879	perunggu
39	910	perunggu
39	3831	perunggu
39	4567	perunggu
39	4160	perunggu
39	1283	perunggu
39	2469	perunggu
39	2131	perunggu
39	2873	perunggu
39	2168	perunggu
39	4818	perunggu
39	2192	#4
39	1000	#4
39	38	#4
39	791	#4
39	2135	#4
39	1224	#4
39	1211	#4
39	252	#4
39	4525	#4
39	3169	#4
39	533	#4
39	106	#4
39	4227	#4
39	2577	#4
39	1179	#4
39	287	#4
39	2690	#4
39	1662	#4
39	702	#4
39	866	#5
39	673	#5
39	306	#5
39	1558	#5
39	3646	#5
39	2747	#5
39	227	#5
39	1642	#5
39	4221	#5
39	2213	#5
39	1904	#5
39	2032	#5
39	2248	#5
39	3784	#5
39	4310	#5
39	2896	#5
39	3758	#5
39	1557	#5
39	2373	#6
39	292	#6
39	3436	#6
39	4050	#6
39	571	#6
39	409	#6
39	2610	#6
39	2542	#6
39	794	#6
39	3352	#6
39	4180	#6
39	762	#6
39	1213	#6
39	4571	#6
39	1347	#6
39	4239	#6
39	1979	#6
39	2600	#6
39	2486	#7
39	3980	#7
39	2151	#7
39	2685	#7
39	2882	#7
39	554	#7
39	2971	#7
39	897	#7
39	618	#7
39	2633	#7
39	552	#7
39	4645	#7
39	547	#7
39	141	#7
39	871	#7
39	3596	#7
39	2502	#8
39	393	#8
39	1616	#8
39	3998	#8
39	302	#8
39	4003	#8
39	796	#8
39	4332	#8
39	1813	#8
39	1525	#8
39	1696	#8
39	1381	#8
39	4188	#8
39	2586	#8
39	1384	#8
39	3220	#8
39	39	#9
39	3134	#9
39	483	#9
39	3101	#9
39	672	#9
39	2751	#9
39	277	#9
39	481	#9
39	1165	#9
39	2529	#9
39	198	#9
39	4182	#9
39	2309	#9
39	2242	#9
39	1214	#9
39	2316	#9
39	1122	#10
39	4733	#10
39	3235	#10
39	4773	#10
39	1651	#10
39	4101	#10
39	3188	#10
39	4099	#10
39	2229	#10
39	2778	#10
39	3912	#10
39	2227	#10
39	297	#10
39	3915	#10
39	3234	#10
39	3803	#10
39	370	#11
39	766	#11
39	4224	#11
39	1107	#11
39	2412	#11
39	3548	#11
39	1041	#11
39	3590	#11
39	4273	#11
39	1259	#11
39	3489	#11
39	1617	#11
39	3547	#11
39	2912	#11
39	2289	#11
39	3706	#11
39	2290	#11
39	756	#12
39	1223	#12
39	3172	#12
39	3587	#12
39	4720	#12
39	3668	#12
39	1457	#12
39	4555	#12
39	1592	#12
39	3023	#12
39	1308	#12
39	1781	#12
39	2691	#12
39	130	#12
39	998	#12
39	4336	#12
39	3024	#12
40	4108	emas
40	281	emas
40	3996	emas
40	876	emas
40	2906	emas
40	3847	emas
40	2749	emas
40	2017	emas
40	4609	emas
40	2715	emas
40	262	emas
40	3077	emas
40	500	emas
40	4322	emas
40	4508	perak
40	1639	perak
40	3357	perak
40	3911	perak
40	3191	perak
40	115	perak
40	3804	perak
40	1680	perak
40	4172	perak
40	3897	perak
40	3966	perak
40	4287	perak
40	4308	perak
40	9	perak
40	2475	perunggu
40	3730	perunggu
40	2335	perunggu
40	548	perunggu
40	935	perunggu
40	4630	perunggu
40	3724	perunggu
40	1577	perunggu
40	2549	perunggu
40	3728	perunggu
40	3205	perunggu
40	4700	perunggu
40	1725	perunggu
40	2012	perunggu
40	1650	perunggu
40	1726	perunggu
40	541	perunggu
40	4636	perunggu
40	2197	perunggu
40	2075	perunggu
40	3213	perunggu
40	3501	#5
40	487	#5
40	4551	#5
40	2365	#5
40	4025	#5
40	228	#5
40	490	#5
40	334	#5
40	2825	#5
40	3043	#5
40	435	#5
40	841	#5
40	1475	#5
40	3003	#5
40	2262	#5
40	3633	#5
40	3218	#5
40	3783	#5
40	398	#5
40	1749	#5
40	4398	#5
40	1113	#5
40	1251	#5
40	3197	#7
40	2903	#7
40	3199	#7
40	4241	#7
40	3369	#7
40	148	#7
40	4115	#7
40	1043	#7
40	2351	#7
40	1586	#7
40	1799	#7
40	4009	#7
40	1070	#7
40	3303	#7
40	983	#7
40	4090	#7
40	3306	#7
40	251	#7
40	2264	#9
40	2657	#9
40	3154	#9
40	3941	#9
40	4605	#9
40	5	#9
40	836	#9
40	2311	#9
40	755	#9
40	317	#9
40	469	#9
40	1414	#9
40	4071	#9
40	2499	#9
40	454	#9
40	909	#9
40	99	#9
40	3924	#9
40	973	#9
40	4479	#9
40	3457	#9
40	1277	#9
40	1276	#9
40	4192	#9
40	4536	#9
40	1515	#9
40	2478	#9
40	2477	#9
40	4305	#9
40	1758	#9
40	4396	#9
40	1471	#9
40	4107	#9
40	3089	#9
40	1510	#9
40	3754	#9
40	1775	#9
40	4426	#9
40	539	#9
40	4674	#9
40	3906	#9
40	3659	#9
40	34	#9
40	1265	#9
40	2224	#9
40	1588	#9
40	953	#9
40	4697	#9
40	40	#9
40	3492	#9
40	2159	#9
40	3964	#9
40	2023	#9
40	2943	#9
40	1591	#9
40	4466	#9
40	1416	#9
40	3478	#9
40	3149	#9
40	1939	#9
40	4485	#9
40	1365	#9
40	2293	#9
40	3293	#9
40	3917	#9
40	4537	#9
40	3181	#9
40	1735	#9
40	3296	#17
40	2772	#17
40	3264	#17
40	445	#17
40	60	#17
40	3773	#17
40	4268	#17
40	4265	#17
40	567	#17
40	2430	#17
40	493	#17
40	4825	#17
40	523	#17
40	4193	#17
40	1238	#17
40	59	#17
40	2355	#17
40	460	#17
40	540	#17
40	1247	#17
40	1544	#17
40	4483	#17
41	4664	emas
41	3702	emas
41	4409	emas
41	4798	emas
41	2467	emas
41	4084	perak
41	49	perak
41	3849	perak
41	3503	perak
41	1018	perak
41	2980	perunggu
41	78	perunggu
41	169	perunggu
41	946	perunggu
41	2500	perunggu
41	4164	#4
41	2764	#4
41	2221	#4
41	3715	#4
41	2867	#4
41	1585	#5
41	2462	#5
41	4797	#5
41	4698	#5
41	966	#5
41	102	#6
41	2815	#6
41	768	#6
41	2191	#6
41	2656	#6
41	1015	#7
41	246	#7
41	4523	#7
41	2374	#7
41	2917	#7
41	1309	#8
41	4075	#8
41	3295	#8
41	276	#8
41	1800	#8
41	2877	#9
41	4561	#9
41	991	#9
41	4167	#9
41	3423	#9
41	310	#10
41	1780	#10
41	3216	#10
41	3600	#10
41	3921	#10
41	4016	#11
41	1231	#11
41	2572	#11
41	3670	#11
41	1974	#11
41	924	#12
41	4161	#12
41	2143	#12
41	2367	#12
41	58	#12
41	387	#13
41	949	#13
41	247	#13
41	1619	#13
41	1196	#13
41	2463	#14
41	2052	#14
41	1334	#14
41	29	#14
41	295	#14
42	4110	emas
42	3856	emas
42	3272	emas
42	1850	emas
42	779	emas
42	4432	emas
42	1889	emas
42	4367	emas
42	1635	emas
42	3737	perak
42	3509	perak
42	3945	perak
42	3873	perak
42	1498	perak
42	1854	perak
42	1901	perak
42	3170	perak
42	1027	perak
42	1672	perunggu
42	3398	perunggu
42	843	perunggu
42	877	perunggu
42	832	perunggu
42	3653	perunggu
42	1301	perunggu
42	3679	perunggu
42	3800	perunggu
42	572	#4
42	3044	#4
42	3507	#4
42	2522	#4
42	3070	#4
42	1425	#4
42	4635	#4
42	4463	#4
42	2065	#4
42	3184	#5
42	2520	#5
42	627	#5
42	896	#5
42	2944	#5
42	3288	#5
42	1395	#5
42	1397	#5
42	65	#5
42	557	#6
42	4404	#6
42	4200	#6
42	193	#6
42	1838	#6
42	1842	#6
42	381	#6
42	383	#6
42	2323	#6
42	3036	#7
42	1857	#7
42	1190	#7
42	3925	#7
42	981	#7
42	1474	#7
42	2551	#7
42	4579	#7
42	161	#7
43	3391	emas
43	2186	emas
43	3147	emas
43	2567	emas
43	3536	perak
43	2625	perak
43	4370	perak
43	3035	perak
43	3527	perunggu
43	970	perunggu
43	3034	perunggu
43	1422	perunggu
43	3041	#4
43	1520	#4
43	1537	#4
43	3388	#4
43	4209	#5
43	4063	#5
43	349	#5
43	862	#5
43	1843	#6
43	1358	#6
43	190	#6
43	1590	#7
43	3368	#7
43	1136	#7
43	3802	#7
43	4353	#8
43	1582	#8
43	580	#8
43	4325	#8
43	2042	#9
43	4388	#9
43	3601	#9
43	2207	#9
44	2544	emas
44	1378	emas
44	4458	emas
44	2386	emas
44	2659	perak
44	2664	perak
44	338	perak
44	1500	perak
44	1056	perunggu
44	3015	perunggu
44	3223	perunggu
44	1322	perunggu
44	4362	#4
44	698	#4
44	3054	#4
44	1561	#4
44	428	#5
44	3066	#5
44	4392	#5
44	3280	#5
44	1054	#6
44	1894	#6
44	4028	#6
44	3064	#6
44	3187	#7
44	255	#7
44	4462	#7
44	2044	#7
44	2426	#8
44	1900	#8
44	2064	#8
44	1252	#8
44	2558	#9
44	348	#9
44	1396	#9
44	1784	#9
45	2761	emas
45	3867	emas
45	329	emas
45	2881	emas
45	70	emas
45	273	emas
45	1786	emas
45	4144	emas
45	4568	emas
45	1971	perak
45	691	perak
45	3091	perak
45	2249	perak
45	506	perak
45	4262	perak
45	2421	perak
45	35	perak
45	2411	perak
45	1654	perunggu
45	3865	perunggu
45	1697	perunggu
45	1202	perunggu
45	2513	perunggu
45	1306	perunggu
45	1634	perunggu
45	415	perunggu
45	1671	perunggu
45	2280	#4
45	671	#4
45	1483	#4
45	1864	#4
45	1516	#4
45	3995	#4
45	3576	#4
45	1648	#4
45	3267	#5
45	2864	#5
45	2750	#5
45	3770	#5
45	3102	#5
45	865	#5
45	3531	#5
45	788	#5
45	3461	#5
45	1517	#6
45	2593	#6
45	232	#6
45	105	#6
45	1152	#6
45	4130	#6
45	230	#6
45	4548	#6
45	1189	#6
45	3330	#7
45	734	#7
45	870	#7
45	3986	#7
45	1432	#7
45	2231	#7
45	4171	#7
45	3456	#7
45	4191	#7
46	2964	emas
46	1676	emas
46	4412	emas
46	583	emas
46	1657	perak
46	1264	perak
46	3927	perak
46	3762	perak
46	1846	perunggu
46	3671	perunggu
46	982	perunggu
46	2334	perunggu
46	70	#4
46	2881	#4
46	2761	#4
46	273	#4
46	1205	#5
46	2319	#5
46	923	#5
46	2256	#5
46	4118	#6
46	4660	#6
46	4809	#6
46	4661	#6
46	1771	#7
46	1125	#7
46	3347	#7
46	1204	#7
46	489	#8
46	1431	#8
46	2914	#8
46	2163	#8
46	3537	#9
46	1926	#9
46	2585	#9
47	2512	emas
47	1618	emas
47	2631	emas
47	1482	emas
47	2458	perak
47	581	perak
47	3855	perak
47	4334	perak
47	2862	perunggu
47	4270	perunggu
47	2555	perunggu
47	3672	perunggu
47	1325	#4
47	767	#4
47	3592	#4
47	2607	#4
47	1740	#5
47	2259	#5
47	968	#5
47	325	#5
47	4769	#6
47	2598	#6
47	4679	#6
47	4659	#6
47	1785	#7
47	1187	#7
47	203	#7
47	3597	#7
47	3792	#8
47	2495	#8
47	693	#8
47	1556	#9
47	1201	#9
47	4321	#9
47	2516	#9
48	4529	emas
48	369	emas
48	3751	emas
48	4348	emas
48	4230	emas
48	3625	emas
48	1934	emas
48	426	emas
48	7	emas
48	1927	emas
48	424	emas
48	2082	emas
48	3365	emas
48	2060	perak
48	2103	perak
48	1953	perak
48	4068	perak
48	1792	perak
48	3687	perak
48	4329	perak
48	4606	perak
48	1964	perak
48	1793	perak
48	2226	perak
48	4049	perak
48	3734	perak
48	1370	perak
48	844	perunggu
48	3891	perunggu
48	1772	perunggu
48	4788	perunggu
48	3709	perunggu
48	4377	perunggu
48	4478	perunggu
48	4052	perunggu
48	4093	perunggu
48	3863	perunggu
48	4154	perunggu
48	4103	perunggu
48	3852	perunggu
48	1673	#4
48	558	#4
48	901	#4
48	1026	#4
48	2947	#4
48	1674	#4
48	1644	#4
48	1890	#4
48	3051	#4
48	3397	#4
48	3063	#4
48	3355	#4
48	4031	#5
48	647	#5
48	4457	#5
48	118	#5
48	1091	#5
48	3378	#5
48	1344	#5
48	362	#5
48	3768	#5
48	4326	#5
48	3283	#5
48	2559	#5
48	2038	#5
48	4153	#5
48	1839	#6
48	364	#6
48	1638	#6
48	2948	#6
48	4783	#6
48	798	#6
48	2078	#6
48	1715	#6
48	1716	#6
48	4330	#6
48	1470	#6
48	3379	#6
48	4032	#6
48	2031	#7
48	4441	#7
48	1496	#7
48	3039	#7
48	85	#7
48	3969	#7
48	4424	#7
48	1467	#7
48	3028	#7
48	3973	#7
48	2687	#7
48	2856	#7
48	3835	#7
48	3975	#7
48	4	#8
48	2792	#8
48	3554	#8
48	3006	#8
48	2859	#8
48	2346	#8
48	3321	#8
48	2800	#8
48	4233	#8
48	2755	#8
48	3648	#8
48	2675	#8
48	3685	#8
48	43	#8
48	2056	#9
48	2464	#9
48	1477	#9
48	4577	#9
48	658	#9
48	2344	#9
48	438	#9
48	1675	#9
48	3939	#9
48	3496	#9
48	3604	#9
48	835	#9
48	1005	#9
48	4528	#10
48	121	#10
48	608	#10
48	3286	#10
48	4437	#10
48	4311	#10
48	2461	#10
48	3374	#10
48	1320	#10
48	3614	#10
48	4237	#10
48	4510	#10
48	1887	#11
48	4513	#11
48	4442	#11
48	2128	#11
48	542	#11
48	1022	#11
48	3013	#11
48	1348	#11
48	1584	#11
48	526	#11
48	1744	#11
48	2126	#11
48	2384	#11
48	956	#11
48	4275	#12
48	2371	#12
48	4112	#12
48	2180	#12
48	2116	#12
48	3241	#12
48	2372	#12
48	4725	#12
48	2298	#12
48	4286	#12
48	4738	#12
48	4727	#12
48	4274	#12
49	3818	emas
49	2091	emas
49	4205	emas
49	2811	emas
49	3994	emas
49	3152	emas
49	4490	emas
49	2774	emas
49	1923	emas
49	4350	emas
49	3689	emas
49	159	emas
49	731	perak
49	3529	perak
49	267	perak
49	484	perak
49	825	perak
49	776	perak
49	1386	perak
49	712	perak
49	2408	perak
49	1331	perak
49	3683	perak
49	2347	perak
49	451	perunggu
49	1764	perunggu
49	2288	perunggu
49	3937	perunggu
49	174	perunggu
49	2509	perunggu
49	3359	perunggu
49	183	perunggu
49	158	perunggu
49	4218	perunggu
49	3997	perunggu
49	2413	perunggu
49	598	#4
49	4089	#4
49	1330	#4
49	1061	#4
49	4319	#4
49	4010	#4
49	789	#4
49	2214	#4
49	4376	#4
49	1811	#4
49	662	#4
49	2748	#4
49	4056	#5
49	407	#5
49	830	#5
49	2647	#5
49	2020	#5
49	4721	#5
49	828	#5
49	705	#5
49	715	#5
49	732	#5
49	1728	#5
49	2578	#5
49	1699	#6
49	3111	#6
49	3697	#6
49	4676	#6
49	4685	#6
49	4611	#6
49	2348	#6
49	4746	#6
49	1345	#6
49	4663	#6
49	4658	#6
49	4737	#6
49	4655	#6
49	4654	#6
49	2614	#7
49	1869	#7
49	1175	#7
49	1552	#7
49	1652	#7
49	2518	#7
49	1226	#7
49	1177	#7
49	1820	#7
49	3100	#7
49	1914	#7
49	308	#7
49	33	#7
49	479	#8
49	4554	#8
49	4204	#8
49	125	#8
49	289	#8
49	2273	#8
49	553	#8
49	3097	#8
49	2697	#8
49	1303	#8
49	1261	#8
49	1206	#8
49	820	#9
49	2924	#9
49	3813	#9
49	3914	#9
49	809	#9
49	3108	#9
49	4763	#9
49	459	#9
49	1611	#9
49	1191	#9
49	4608	#9
49	1701	#9
49	2900	#10
49	2709	#10
49	3193	#10
49	1524	#10
49	4344	#10
49	4345	#10
49	4690	#10
49	2926	#10
49	1450	#10
49	3744	#10
49	595	#10
49	2844	#10
49	2538	#10
49	2571	#11
49	689	#11
49	514	#11
49	4813	#11
49	2963	#11
49	4545	#11
49	2891	#11
49	4157	#11
49	3317	#11
49	3025	#11
49	2322	#11
49	2616	#11
49	3733	#12
49	4542	#12
49	54	#12
49	2523	#12
49	3755	#12
49	318	#12
49	1761	#12
49	2391	#12
49	261	#12
49	2459	#12
49	2888	#12
49	4065	#12
50	1835	emas
50	833	emas
50	1717	emas
50	690	emas
50	1837	perak
50	1401	perak
50	2209	perak
50	2440	perak
50	164	perunggu
50	4364	perunggu
50	3589	perunggu
50	2822	perunggu
50	4799	#4
50	4662	#4
50	2178	#4
50	1626	#4
50	3057	#5
50	1856	#5
50	4431	#5
50	1081	#5
50	2111	#6
50	4771	#6
50	1377	#6
50	1916	#6
50	2106	#7
50	3726	#7
50	2658	#7
50	3660	#7
50	3328	#8
50	4266	#8
50	45	#8
50	1708	#8
50	4060	#9
50	2704	#9
50	769	#9
50	2937	#9
50	1576	#10
50	2845	#10
50	1445	#10
50	655	#10
50	4540	#11
50	3441	#11
50	2187	#11
50	353	#11
50	1596	#12
50	3723	#12
50	1580	#12
50	4634	#12
50	3016	#13
50	1057	#13
50	538	#13
50	2223	#13
50	4448	#14
50	1460	#14
50	1006	#14
50	212	#14
50	3829	#15
50	609	#15
50	1139	#15
50	1817	#15
50	345	#16
50	3583	#16
50	4235	#16
50	3502	#16
51	1992	emas
51	1600	emas
51	1985	emas
51	4799	emas
51	774	emas
51	3890	perak
51	3380	perak
51	690	perak
51	1717	perak
51	1835	perak
51	4368	perak
51	783	perak
51	4719	perunggu
51	2548	perunggu
51	3078	perunggu
51	1389	perunggu
51	3723	perunggu
51	884	perunggu
51	3525	#4
51	47	#4
51	1081	#4
51	3057	#4
51	2037	#4
51	616	#5
51	1377	#5
51	1765	#5
51	2111	#5
51	1916	#5
51	1803	#6
51	2112	#6
51	3061	#6
51	2440	#6
51	556	#6
51	3511	#7
51	3124	#7
51	2658	#7
51	2106	#7
51	2674	#7
51	2211	#8
51	743	#8
51	3497	#8
51	4206	#8
51	4364	#9
51	3428	#9
51	1499	#9
51	164	#9
51	2433	#10
51	1896	#10
51	1882	#10
51	538	#10
51	891	#11
51	965	#11
51	3073	#11
51	4082	#11
51	587	#12
51	4512	#12
51	4135	#12
51	1655	#12
51	2136	#13
94	4272	\N
51	1065	#13
51	1996	#13
51	4254	#13
51	3808	#14
51	4289	#14
51	3332	#14
51	2282	#14
51	3845	#15
51	1956	#15
51	3460	#15
51	434	#15
51	1713	#16
51	716	#16
51	2937	#16
51	4060	#16
52	1885	emas
52	4431	emas
52	3057	emas
52	1081	emas
52	2728	perak
52	737	perak
52	1075	perak
52	2359	perak
52	3086	perunggu
52	1401	perunggu
52	1143	perunggu
52	4371	perunggu
52	4662	#4
52	2620	#4
52	4799	#4
52	4800	#4
52	4634	#5
52	1596	#5
52	4681	#5
52	3844	#5
52	1873	#6
52	1695	#6
52	4639	#6
52	4254	#6
52	4309	#7
52	2282	#7
52	1679	#7
52	2394	#7
52	2722	#8
52	3726	#8
52	4400	#8
52	2106	#8
52	1006	#9
52	1460	#9
52	4448	#9
52	530	#9
52	1521	#10
52	166	#10
52	720	#10
52	1374	#10
52	1032	#11
52	2397	#11
52	2396	#11
52	345	#11
52	3301	#12
52	1363	#12
52	1116	#12
52	1575	#12
52	769	#13
52	2704	#13
52	722	#13
52	1364	#13
52	3602	#14
52	175	#14
52	1955	#14
52	2644	#14
52	4445	#15
52	927	#15
52	4444	#15
52	367	#15
52	434	#16
52	3460	#16
52	1956	#16
52	4379	#16
53	3890	emas
53	3380	emas
53	1568	emas
53	4467	emas
53	1992	perak
53	1600	perak
53	4750	perak
53	2179	perak
53	2291	perunggu
53	2112	perunggu
53	3061	perunggu
53	3266	perunggu
53	4719	#4
53	2548	#4
53	2915	#4
53	589	#4
53	2442	#5
53	1377	#5
53	2111	#5
53	2865	#5
53	2375	#6
53	743	#6
53	3497	#6
53	2967	#6
53	2269	#7
53	1891	#7
53	1081	#7
53	395	#7
53	3808	#8
53	4289	#8
53	3236	#8
53	3805	#8
53	3511	#9
53	3124	#9
53	378	#9
53	3462	#9
53	326	#10
53	3851	#10
53	1460	#10
53	337	#10
53	3161	#11
53	3428	#11
53	904	#11
53	4166	#11
53	1615	#12
53	1255	#12
53	3984	#12
53	3829	#12
53	444	#13
53	1302	#13
53	401	#13
53	4349	#13
53	2202	#14
53	1060	#14
53	64	#14
53	2402	#14
53	1290	#15
53	1065	#15
53	1996	#15
53	4699	#15
53	1574	#16
53	1455	#16
53	3405	#16
53	4223	#16
54	3266	emas
54	4095	emas
54	1220	emas
54	3096	emas
54	2255	perak
54	1568	perak
54	4467	perak
54	4149	perak
54	2179	perunggu
54	4753	perunggu
54	4750	perunggu
54	3701	perunggu
54	2865	#4
54	4315	#4
54	4251	#4
54	3645	#4
54	4004	#5
54	3164	#5
54	3984	#5
54	2651	#5
54	589	#6
54	787	#6
54	2992	#6
54	2915	#6
54	395	#7
54	1295	#7
54	2696	#7
54	1428	#7
54	4166	#8
54	814	#8
54	3981	#8
54	1227	#8
54	4335	#9
54	2362	#9
54	3929	#9
54	2967	#9
54	3662	#10
54	2582	#10
54	3586	#10
54	3454	#10
54	4122	#11
54	2162	#11
54	1155	#11
54	2985	#11
54	313	#12
54	4223	#12
54	1519	#12
54	2885	#12
54	2252	#13
54	2402	#13
54	2147	#13
54	4826	#13
54	3376	#14
54	1910	#14
54	2277	#14
54	4415	#14
54	807	#15
54	1694	#15
54	704	#15
54	4222	#15
54	951	#16
54	1553	#16
54	1262	#16
54	4562	#16
55	3767	emas
55	2583	emas
55	1568	emas
55	4467	emas
55	2265	emas
55	2255	emas
55	184	emas
55	1228	emas
55	2291	perak
55	1944	perak
55	1220	perak
55	3266	perak
55	1791	perak
55	3096	perak
55	209	perak
55	1170	perak
55	2560	perunggu
55	3699	perunggu
55	4750	perunggu
55	2179	perunggu
55	4669	perunggu
55	3701	perunggu
55	4714	perunggu
55	2442	#4
55	4184	#4
55	2865	#4
55	4251	#4
55	2995	#4
55	3645	#4
55	1782	#4
55	3815	#5
55	4020	#5
55	3236	#5
55	3805	#5
55	1225	#6
55	787	#6
55	2915	#6
55	589	#6
55	2992	#6
55	1615	#7
55	4189	#7
55	2651	#7
55	4004	#7
55	2740	#8
55	4331	#8
55	4335	#8
55	2967	#8
55	2501	#9
55	391	#9
55	378	#9
55	3462	#9
55	2269	#10
55	380	#10
55	2301	#10
55	1428	#10
55	951	#11
55	3270	#11
55	1172	#11
55	1553	#11
55	51	#12
55	1060	#12
55	3627	#12
55	2402	#12
55	4222	#13
55	4152	#13
55	807	#13
55	1694	#13
55	2564	#14
55	1236	#14
55	2002	#14
55	822	#14
55	4027	#15
55	4346	#15
55	2985	#15
55	1155	#15
55	2869	#15
55	570	#15
55	4582	#15
55	4166	#15
56	3266	emas
56	2466	emas
56	660	emas
56	457	emas
56	868	perak
56	3578	perak
56	2276	perak
56	1260	perak
56	2179	perunggu
56	605	perunggu
56	859	perunggu
56	4694	perunggu
56	2995	#4
56	1168	#4
56	4251	#4
56	2160	#4
56	1429	#5
56	10	#5
56	1428	#5
56	2696	#5
56	3454	#6
56	2582	#6
56	108	#6
56	3586	#6
56	2878	#7
56	4223	#7
56	2885	#7
56	1455	#7
56	1257	#8
56	1307	#8
56	694	#8
56	2484	#8
56	4166	#9
56	1527	#9
56	3032	#9
56	1530	#9
56	1807	#10
56	3421	#10
56	2148	#10
56	3364	#10
56	326	#11
56	960	#11
56	517	#11
56	2525	#11
56	1911	#12
56	1767	#12
56	4127	#12
56	2967	#12
56	3320	#13
56	4607	#13
56	1688	#13
56	3815	#13
56	2693	#14
56	486	#14
56	2929	#14
56	324	#14
56	2876	#15
56	128	#15
56	3620	#15
56	101	#15
56	1539	#16
56	1129	#16
56	1101	#16
56	4793	#16
57	4802	emas
57	2634	emas
57	858	emas
57	429	perak
57	2416	perak
57	4481	perak
57	4138	perunggu
57	217	perunggu
57	1354	perunggu
57	4454	#4
57	4117	#4
57	1690	#4
57	1710	#5
57	4586	#5
57	1578	#5
57	929	#5
57	1031	#5
57	4397	#5
57	2073	#5
57	917	#5
57	4637	#5
57	4766	#5
57	804	#5
57	819	#5
57	1723	#9
57	1379	#9
57	3389	#9
57	1959	#9
57	1118	#9
57	354	#9
57	4449	#9
57	1369	#9
57	2068	#9
57	330	#9
57	2974	#9
57	3539	#9
57	3246	#9
57	4730	#9
57	2350	#9
57	4086	#9
57	1631	#9
57	2813	#9
57	2025	#9
57	2854	#9
57	4378	#9
57	1004	#9
57	3656	#9
57	963	#9
58	3126	emas
58	4711	emas
58	2829	emas
58	1684	perak
58	3232	perak
58	3231	perak
58	4743	perunggu
58	1995	perunggu
58	1289	perunggu
58	3464	#4
58	4657	#4
58	413	#4
58	2816	#5
58	4201	#5
58	448	#5
58	2590	#5
58	846	#5
58	1371	#5
58	4257	#5
58	3551	#5
58	2008	#5
58	1727	#5
58	4486	#5
58	4269	#5
58	3212	#9
58	3163	#9
58	3120	#9
58	1533	#9
58	676	#9
58	674	#9
58	1037	#9
58	1609	#9
58	2899	#9
58	793	#9
58	3692	#9
58	1984	#9
58	1693	#9
58	1692	#9
58	805	#9
58	2253	#9
58	3343	#9
58	4827	#9
58	57	#9
58	585	#9
58	1161	#9
58	3716	#9
58	307	#9
58	2588	#9
59	4389	emas
59	2613	emas
59	2481	emas
59	2497	emas
59	4066	perak
59	4316	perak
59	3273	perak
59	4314	perak
59	187	perunggu
59	1481	perunggu
59	3940	perunggu
59	590	perunggu
59	3676	#4
59	1219	#4
59	2545	#4
59	745	#4
59	3793	#5
59	3114	#5
59	4530	#5
59	2890	#5
59	1505	#6
59	229	#6
59	172	#6
59	4541	#6
59	3075	#7
59	2161	#7
59	758	#7
59	3178	#8
59	1044	#8
59	2818	#8
59	4589	#8
59	134	#9
59	394	#9
59	436	#9
59	3219	#9
59	3228	#10
59	3090	#10
59	3798	#10
59	3714	#10
59	4552	#11
59	2646	#11
59	2415	#11
59	4174	#11
59	2731	#12
59	3348	#12
59	3053	#12
59	4190	#12
59	446	#13
59	3857	#13
59	906	#13
59	2624	#13
59	1645	#14
59	3425	#14
59	1092	#14
59	103	#14
59	258	\N
59	2144	\N
59	4417	\N
59	2611	\N
60	535	emas
60	1941	emas
60	1928	emas
60	578	emas
60	2343	emas
60	1098	emas
60	423	emas
60	3412	emas
60	4473	emas
60	4670	emas
60	4347	emas
60	3707	emas
60	2726	perak
60	537	perak
60	4624	perak
60	150	perak
60	1571	perak
60	1881	perak
60	2222	perak
60	3637	perak
60	2848	perak
60	3014	perak
60	4447	perak
60	536	perak
60	3485	perak
60	3045	perunggu
60	8	perunggu
60	1936	perunggu
60	4465	perunggu
60	3141	perunggu
60	3088	perunggu
60	3142	perunggu
60	4369	perunggu
60	1463	perunggu
60	4312	perunggu
60	978	perunggu
60	1256	perunggu
60	163	#4
60	4148	#4
60	1326	#4
60	3796	#4
60	1522	#4
60	3062	#4
94	2730	\N
60	1504	#4
60	948	#4
60	4774	#4
60	3827	#4
60	162	#4
60	2663	#4
60	4456	#5
60	157	#5
60	1898	#5
60	997	#5
60	4018	#5
60	1906	#5
60	4810	#5
60	1563	#5
60	4408	#5
60	2382	#5
60	3839	#5
60	3433	#5
60	838	#6
60	3278	#6
60	2050	#6
60	1594	#6
60	2156	#6
60	2719	#6
60	427	#6
60	3875	#6
60	3276	#6
60	4420	#6
60	4419	#6
60	2721	#6
60	4752	#7
60	4279	#7
60	111	#7
60	2330	#7
60	4307	#7
60	112	#7
60	2999	#7
60	2329	#7
60	3739	#7
60	4755	#7
60	3001	#7
60	4452	#7
60	682	#8
60	2717	#8
60	74	#8
60	4718	#8
60	1814	#8
60	1361	#8
60	2680	#8
60	4343	#8
60	3794	#8
60	123	#8
60	1383	#8
60	964	#8
60	4503	#9
60	3201	#9
60	3650	#9
60	2954	#9
60	3447	#9
60	3215	#9
60	3636	#9
60	147	#9
60	1073	#9
60	2957	#9
60	4604	#9
60	149	#9
60	2727	#10
60	3387	#10
60	668	#10
60	954	#10
60	4232	#10
60	656	#10
60	4644	#10
60	2682	#10
60	470	#10
60	2188	#10
60	1437	#10
60	1249	#10
60	3030	#11
60	1899	#11
60	1329	#11
60	86	#11
60	3971	#11
60	680	#11
60	2686	#11
60	3573	#11
60	2689	#11
60	2977	#11
60	2688	#11
60	3418	#11
60	91	#12
60	3255	#12
60	3252	#12
60	15	#12
60	3256	#12
60	3253	#12
60	1703	#12
60	4045	#12
60	17	#12
60	3284	#12
60	3765	#12
60	3254	#12
61	2930	emas
61	726	emas
61	1755	emas
61	3271	emas
61	170	emas
61	753	emas
61	392	emas
61	3312	emas
61	3588	emas
61	3999	emas
61	3504	emas
61	1128	emas
61	1458	emas
61	2086	perak
61	508	perak
61	2193	perak
61	2508	perak
61	2080	perak
61	335	perak
61	2083	perak
61	1601	perak
61	926	perak
61	2272	perak
61	2320	perak
61	808	perak
61	3495	perunggu
61	1017	perunggu
61	2746	perunggu
61	4340	perunggu
61	3859	perunggu
61	3826	perunggu
61	1449	perunggu
61	315	perunggu
61	3339	perunggu
61	312	perunggu
61	2141	perunggu
61	4277	perunggu
61	2638	perunggu
61	1540	#4
61	709	#4
61	3121	#4
61	1612	#4
61	3115	#4
61	1011	#4
61	1141	#4
61	1103	#4
61	4794	#4
61	485	#4
61	593	#4
61	1100	#4
61	4666	#5
61	4410	#5
61	2601	#5
61	4706	#5
61	4652	#5
61	4742	#5
61	775	#5
61	4712	#5
61	4717	#5
61	4650	#5
61	3129	#5
61	3130	#5
61	2889	#6
61	2381	#6
61	79	#6
61	2763	#6
61	2989	#6
61	154	#6
61	2022	#6
61	2987	#6
61	2808	#6
61	2254	#6
61	3342	#6
61	2759	#6
61	596	#7
61	2250	#7
61	634	#7
61	3207	#7
61	156	#7
61	2788	#7
61	2787	#7
61	2121	#7
61	4132	#7
61	4384	#7
61	633	#7
61	3985	#7
61	708	#8
61	653	#8
61	452	#8
61	3472	#8
61	259	#8
61	1487	#8
61	2752	#8
61	4722	#8
61	591	#8
61	649	#8
61	2001	#8
61	1459	#8
61	2407	#9
61	2406	#9
61	4011	#9
61	3093	#9
61	3326	#9
61	2812	#9
61	458	#9
61	3385	#9
61	4019	#9
61	104	#9
61	511	#9
61	4760	#9
61	765	#10
61	2061	#10
61	2167	#10
61	4005	#10
61	405	#10
61	666	#10
61	1778	#10
61	2966	#10
61	3435	#10
61	1145	#10
61	1394	#10
61	1173	#10
61	1658	#11
61	282	#11
61	845	#11
61	1766	#11
61	3466	#11
61	2694	#11
61	279	#11
61	2530	#11
61	1198	#11
61	291	#11
61	1602	#11
61	2170	#11
61	1271	#12
61	4547	#12
61	3582	#12
61	2553	#12
61	555	#12
61	1230	#12
61	4480	#12
61	2628	#12
61	2158	#12
61	2643	#12
61	81	#12
61	1108	#12
62	3720	emas
62	1086	emas
62	4242	emas
62	4023	emas
62	3202	emas
62	3442	emas
62	3718	emas
62	3444	emas
62	3371	emas
62	3370	emas
62	3649	emas
62	4570	emas
62	4598	emas
62	2949	perak
62	3814	perak
62	2636	perak
62	2713	perak
62	2965	perak
62	2710	perak
62	418	perak
62	2959	perak
62	1960	perak
62	2115	perak
62	3026	perak
62	2395	perak
62	4461	perak
62	67	perunggu
62	2059	perunggu
62	2958	perunggu
62	181	perunggu
62	1621	perunggu
62	2660	perunggu
62	576	perunggu
62	1095	perunggu
62	177	perunggu
62	797	perunggu
62	3894	perunggu
62	3069	perunggu
62	1074	perunggu
62	4176	#4
62	930	#4
62	2428	#4
62	1254	#4
62	2986	#4
62	46	#4
62	1495	#4
62	1494	#4
62	4575	#4
62	1003	#4
62	4267	#4
62	524	#4
62	2946	#4
62	1232	#5
62	2398	#5
62	1034	#5
62	1120	#5
62	1789	#5
62	211	#5
62	3451	#5
62	4244	#5
62	3452	#5
62	2399	#5
62	1033	#5
62	379	#5
62	3585	#5
62	4499	#6
62	135	#6
62	264	#6
62	586	#6
62	3176	#6
62	2834	#6
62	2975	#6
62	4058	#6
62	3837	#6
62	1350	#6
62	4500	#6
62	144	#6
62	1115	#6
62	2851	#7
62	1406	#7
62	168	#7
62	4450	#7
62	336	#7
62	1405	#7
62	4580	#7
62	1546	#7
62	3394	#7
62	2640	#7
62	1109	#7
62	3040	#7
62	1506	#7
62	3382	#8
62	382	#8
62	3203	#8
62	782	#8
62	3356	#8
62	2451	#8
62	2729	#8
62	1852	#8
62	3046	#8
62	2857	#8
62	799	#8
62	614	#8
62	2053	#8
62	995	#9
62	2955	#9
62	3221	#9
62	2118	#9
62	254	#9
62	4601	#9
62	4212	#9
62	629	#9
62	1085	#9
62	4596	#9
62	1087	#9
62	4533	#9
62	3651	#9
62	883	#10
62	3775	#10
62	4497	#10
62	206	#10
62	1243	#10
62	4373	#10
62	3843	#10
62	1193	#10
62	3107	#10
62	3144	#10
62	3675	#10
62	1246	#10
62	1712	#10
62	2283	#11
62	4047	#11
62	4280	#11
62	919	#11
62	2208	#11
62	4427	#11
62	2379	#11
62	3230	#11
62	1752	#11
62	4776	#11
62	2306	#11
62	2327	#11
62	4471	#11
62	2945	#12
62	1407	#12
62	3009	#12
62	4484	#12
62	350	#12
62	351	#12
62	352	#12
62	3404	#12
62	4131	#12
62	4594	#12
62	4039	#12
62	2565	#12
62	3182	#12
63	2489	emas
63	1808	emas
63	414	emas
63	546	emas
63	3482	emas
63	3617	emas
63	1134	emas
63	3682	emas
63	2133	emas
63	3616	emas
63	2782	emas
63	3621	emas
63	2984	emas
63	1453	perak
63	2305	perak
63	1171	perak
63	670	perak
63	4120	perak
63	12	perak
63	786	perak
63	4121	perak
63	4817	perak
63	236	perak
63	3031	perak
63	952	perak
63	1473	perak
63	2485	perunggu
63	1798	perunggu
63	665	perunggu
63	3903	perunggu
63	2741	perunggu
63	4151	perunggu
63	582	perunggu
63	4591	perunggu
63	2378	perunggu
63	2574	perunggu
63	2632	perunggu
63	3467	perunggu
63	3992	perunggu
63	480	#4
63	2753	#4
63	4299	#4
63	3713	#4
63	1942	#4
63	2766	#4
63	2081	#4
63	3893	#4
63	1980	#4
63	2220	#4
63	1207	#4
63	2120	#4
63	278	#4
63	137	#5
63	1069	#5
63	4524	#5
63	1565	#5
63	1488	#5
63	3760	#5
63	664	#5
63	3819	#5
63	1068	#5
63	3350	#5
63	2225	#5
63	2431	#5
63	631	#5
63	1538	#6
63	813	#6
63	1526	#6
63	4128	#6
63	4162	#6
63	918	#6
63	1063	#6
63	3825	#6
63	4521	#6
63	879	#6
63	77	#6
63	1535	#6
63	752	#6
63	857	#7
63	1133	#7
63	1787	#7
63	3453	#7
63	2866	#7
63	1135	#7
63	195	#7
63	2884	#7
63	1126	#7
63	4534	#7
63	492	#7
63	2883	#7
63	1788	#7
63	1966	#8
63	3721	#8
63	509	#8
63	1229	#8
63	2922	#8
63	611	#8
63	4543	#8
63	1183	#8
63	1646	#8
63	4057	#8
63	2368	#8
63	4072	#8
63	872	#8
63	3140	#9
63	2468	#9
63	4519	#9
63	700	#9
63	2650	#9
63	3555	#9
63	2169	#9
63	498	#9
63	1186	#9
63	706	#9
63	4414	#9
63	494	#9
63	3593	#9
63	4618	#10
63	4155	#10
63	2003	#10
63	1082	#10
63	3705	#10
63	4668	#10
63	4715	#10
63	1707	#10
63	4796	#10
63	3955	#10
63	4653	#10
63	2004	#10
63	4709	#10
64	4831	perunggu
64	4875	#13
64	4880	#13
65	4888	#14
66	4778	perunggu
68	4972	#5
69	4940	#4
69	4903	#5
69	4904	#19
70	4978	#9
70	4960	#19
71	4845	#9
72	5020	#5
74	4857	emas
94	2936	\N
74	4948	#9
75	4945	#5
76	4947	#17
77	4859	#9
78	4918	perunggu
79	4926	#17
81	4962	perunggu
83	2618	perak
83	5012	#9
85	4829	perunggu
86	4638	emas
86	4640	perunggu
86	529	#5
86	3065	#6
86	3137	#7
86	1924	#8
86	3970	#9
86	4365	#9
86	3027	#9
86	4434	#9
86	584	#9
86	4675	#9
86	1014	#17
86	2088	#17
86	892	#17
86	4615	#17
86	4812	#17
86	1341	#17
86	2181	#17
86	165	#17
86	1436	#17
86	4736	#17
86	818	#17
86	186	#17
86	1757	#33
86	4284	#33
86	357	#33
86	3690	#33
86	4878	#33
86	4806	#33
86	681	#33
86	4302	#33
86	725	#33
86	1925	#33
86	194	#33
86	25	#33
86	969	#33
87	4124	emas
87	4638	emas
87	3166	perak
87	739	perunggu
87	388	#4
87	1014	#4
87	2181	#5
87	3065	#7
87	142	#8
87	3027	#8
87	4656	#9
87	4675	#9
87	3970	#9
87	2604	#9
87	529	#9
87	1020	#9
87	817	#9
87	4736	#9
87	3137	#9
87	1447	#17
87	686	#19
87	186	#19
87	4878	#25
88	4124	emas
88	4248	perak
88	2604	perunggu
88	1718	#4
88	1020	#5
88	142	#6
88	993	#7
88	3099	#9
88	594	#9
88	3166	#9
88	817	#9
88	1986	#9
88	290	#17
88	749	#17
88	739	#17
88	733	#17
88	4259	#17
88	3787	#17
88	686	#17
88	3712	#17
88	785	#17
88	4656	#17
88	3703	#33
88	2260	#33
88	388	#33
88	4704	#33
88	3644	#33
88	4263	#33
88	4482	#33
88	3493	#33
88	450	#33
88	1948	#33
88	376	#33
88	1447	#33
88	2506	#33
88	319	#33
89	4105	emas
89	632	perak
89	3884	perunggu
89	1762	#4
89	2035	#5
89	920	#6
89	1878	#7
89	3512	#8
89	3038	#10
89	4765	#11
89	742	#13
89	3612	#14
89	1424	#15
89	1393	#16
89	3781	#17
89	3459	#18
89	2936	#19
89	1353	#20
89	98	\N
89	1961	\N
89	669	\N
89	2730	\N
89	4855	\N
89	1235	\N
89	2041	\N
89	4399	\N
89	3477	\N
89	3419	\N
89	3943	\N
89	2641	\N
89	3372	\N
89	3591	\N
90	1878	perunggu
90	1762	#4
90	2730	#6
90	3753	#7
90	632	#8
90	3943	\N
90	2936	\N
90	4765	\N
90	3781	\N
90	4784	\N
90	4356	\N
90	3459	\N
90	2035	\N
90	1353	\N
90	4229	\N
90	52	\N
90	3038	\N
90	2641	\N
90	2635	\N
90	477	\N
90	1732	\N
90	344	\N
90	3403	\N
90	3719	\N
90	4612	\N
90	4272	\N
90	1359	\N
90	3512	\N
90	2005	\N
90	4283	\N
90	4678	\N
90	2662	\N
90	3477	\N
90	3419	\N
90	920	\N
90	4628	\N
90	2296	\N
90	742	\N
90	2973	\N
90	4855	\N
90	3076	\N
90	1637	\N
90	1235	\N
90	4399	\N
90	3372	\N
90	1961	\N
90	1393	\N
90	3612	\N
90	4105	\N
90	98	\N
90	2041	\N
90	669	\N
90	718	\N
90	3360	\N
90	3884	\N
90	3591	\N
90	2716	\N
90	1424	\N
91	4105	emas
91	632	perunggu
91	4283	#7
91	2005	\N
91	2296	\N
91	3038	\N
91	920	\N
91	2035	\N
91	1359	\N
91	2662	\N
91	2936	\N
91	3753	\N
91	3781	\N
91	3372	\N
91	344	\N
91	4765	\N
91	4784	\N
91	1762	\N
91	4272	\N
91	669	\N
91	1878	\N
91	1732	\N
91	1748	\N
91	718	\N
91	742	\N
91	1235	\N
91	1424	\N
91	1637	\N
91	1393	\N
91	2041	\N
91	3719	\N
91	3360	\N
91	3419	\N
91	4678	\N
91	4229	\N
91	3884	\N
91	4399	\N
91	2641	\N
91	3943	\N
91	2730	\N
91	4628	\N
91	3512	\N
91	3076	\N
91	3591	\N
91	2973	\N
91	3403	\N
91	477	\N
91	98	\N
91	1961	\N
91	3459	\N
91	52	\N
91	4855	\N
91	1353	\N
91	3477	\N
91	4612	\N
91	3612	\N
91	4356	\N
91	2716	\N
91	2635	\N
92	2005	emas
92	1762	perak
92	4105	perunggu
92	632	#4
92	1359	#5
92	4612	#6
92	2716	#7
92	3512	#8
92	2973	\N
92	4229	\N
92	1961	\N
92	1748	\N
92	669	\N
92	2635	\N
92	3038	\N
92	3612	\N
92	2936	\N
92	3753	\N
92	2641	\N
92	718	\N
92	1235	\N
92	1732	\N
92	4765	\N
92	4356	\N
92	3943	\N
92	4283	\N
92	52	\N
92	2041	\N
92	4784	\N
92	3419	\N
92	3403	\N
92	3372	\N
92	4855	\N
92	3884	\N
92	1424	\N
92	4628	\N
92	2730	\N
92	2296	\N
92	1637	\N
92	742	\N
92	4678	\N
92	2662	\N
92	920	\N
92	3781	\N
92	3477	\N
92	4399	\N
92	344	\N
92	4272	\N
92	3719	\N
92	1878	\N
92	477	\N
92	1393	\N
92	3076	\N
92	3459	\N
92	2035	\N
92	1353	\N
92	3591	\N
92	3360	\N
92	98	\N
93	4229	perunggu
93	3076	#4
93	3512	#5
93	4283	#6
93	2635	#8
93	4784	\N
93	3459	\N
93	4105	\N
93	2730	\N
93	1637	\N
93	718	\N
93	3591	\N
93	3943	\N
93	1393	\N
93	1235	\N
93	3884	\N
93	1748	\N
93	4612	\N
93	1961	\N
93	742	\N
93	3719	\N
93	4765	\N
93	2973	\N
93	669	\N
93	4628	\N
93	4272	\N
93	2936	\N
93	2716	\N
93	1424	\N
93	3612	\N
93	1732	\N
93	98	\N
93	52	\N
93	2041	\N
93	477	\N
93	1359	\N
93	3753	\N
93	3038	\N
93	1353	\N
93	1762	\N
93	3360	\N
93	1878	\N
93	3781	\N
93	344	\N
93	3372	\N
93	4855	\N
93	2662	\N
93	632	\N
93	2005	\N
93	3419	\N
93	3403	\N
93	2296	\N
93	4399	\N
93	4678	\N
93	2641	\N
93	4932	\N
93	2035	\N
93	3477	\N
93	4356	\N
93	920	\N
94	4678	emas
94	2005	perak
94	52	#5
94	1637	#7
94	4612	\N
94	1424	\N
94	98	\N
94	920	\N
94	3372	\N
94	3884	\N
94	1235	\N
94	3943	\N
94	3591	\N
94	1732	\N
94	718	\N
94	2635	\N
94	2041	\N
94	2973	\N
94	3753	\N
94	3459	\N
94	344	\N
94	3360	\N
94	2035	\N
94	4229	\N
94	3419	\N
94	4784	\N
94	1762	\N
94	2296	\N
94	3076	\N
94	669	\N
94	1748	\N
94	4765	\N
94	3477	\N
94	3512	\N
94	742	\N
94	3038	\N
94	4356	\N
94	1393	\N
94	477	\N
94	3403	\N
94	1878	\N
94	4105	\N
94	4628	\N
94	1359	\N
94	1961	\N
94	1353	\N
94	2641	\N
94	4283	\N
94	632	\N
94	3781	\N
94	4855	\N
94	4399	\N
94	2662	\N
95	1637	perunggu
95	1878	#4
95	3360	#6
95	1748	#8
95	632	\N
95	3591	\N
95	3781	\N
95	1762	\N
95	3038	\N
95	4784	\N
95	2635	\N
95	4612	\N
95	344	\N
95	2041	\N
95	477	\N
95	3719	\N
95	3512	\N
95	2035	\N
95	1961	\N
95	4628	\N
95	2662	\N
95	3419	\N
95	920	\N
95	3403	\N
95	2973	\N
95	3612	\N
95	1359	\N
95	4765	\N
95	1424	\N
95	4678	\N
95	1393	\N
95	3884	\N
95	3943	\N
95	2005	\N
95	4855	\N
95	3459	\N
95	718	\N
95	52	\N
95	4229	\N
95	4356	\N
95	1732	\N
95	3477	\N
95	4283	\N
95	1235	\N
95	4272	\N
95	2730	\N
95	2641	\N
95	2936	\N
95	669	\N
95	2716	\N
95	98	\N
95	742	\N
95	3372	\N
95	4105	\N
95	4399	\N
95	2296	\N
95	3076	\N
95	1353	\N
95	3753	\N
96	4146	emas
96	3756	perak
96	4253	perunggu
96	231	#4
96	1181	#6
96	3704	#7
96	1382	#9
96	3336	#10
96	3811	#11
96	233	#12
96	3877	#13
96	2817	#14
96	1640	#15
96	4775	#16
96	311	#17
96	1480	#18
96	505	#19
96	274	#22
96	5013	\N
96	4941	\N
96	1865	\N
96	4768	\N
96	499	\N
96	2575	\N
96	2580	\N
96	1222	\N
96	2077	\N
96	1150	\N
96	4413	\N
96	2810	\N
96	2387	\N
96	4175	\N
96	3876	\N
96	3113	\N
96	4999	\N
96	3274	\N
97	231	emas
97	4686	perak
97	2817	perunggu
97	3756	#4
97	4146	#5
97	4253	#6
97	2150	#7
97	3902	#8
97	1866	\N
97	1181	\N
97	1518	\N
97	3961	\N
97	347	\N
97	2931	\N
97	1480	\N
97	4708	\N
97	549	\N
97	2257	\N
97	505	\N
97	3113	\N
97	4941	\N
97	650	\N
97	986	\N
97	2575	\N
97	372	\N
97	5013	\N
97	3877	\N
97	1640	\N
97	311	\N
97	1706	\N
97	3876	\N
97	3210	\N
97	3811	\N
97	4999	\N
97	2580	\N
97	274	\N
97	233	\N
97	4175	\N
97	1382	\N
97	4053	\N
97	3336	\N
97	2077	\N
97	37	\N
97	4775	\N
97	2645	\N
97	3274	\N
97	3704	\N
97	744	\N
97	2810	\N
97	3965	\N
97	1222	\N
97	4413	\N
97	1865	\N
97	1678	\N
97	889	\N
97	4076	\N
97	499	\N
97	2387	\N
97	1150	\N
97	1048	\N
97	4768	\N
97	1212	\N
98	3756	emas
98	4146	perak
98	311	perunggu
98	3902	#4
98	2077	#5
98	231	#6
98	3811	#7
98	4775	#8
98	2817	#9
98	2931	\N
98	1181	\N
98	274	\N
98	4076	\N
98	2575	\N
98	499	\N
98	650	\N
98	2387	\N
98	2580	\N
98	1480	\N
98	4175	\N
98	2810	\N
98	1518	\N
98	1212	\N
98	2257	\N
98	505	\N
98	4053	\N
98	3274	\N
98	1048	\N
98	233	\N
98	3210	\N
98	372	\N
98	3336	\N
98	4941	\N
98	347	\N
98	37	\N
98	4999	\N
98	2645	\N
98	1150	\N
98	1706	\N
98	3965	\N
98	744	\N
98	1678	\N
98	3961	\N
98	3113	\N
98	2150	\N
98	1865	\N
98	4708	\N
98	3876	\N
98	3704	\N
98	1382	\N
98	4413	\N
98	5013	\N
98	986	\N
98	4686	\N
98	4768	\N
98	549	\N
98	1222	\N
98	1640	\N
98	3877	\N
98	1866	\N
98	889	\N
98	4253	\N
99	3704	perak
99	4253	perunggu
99	231	#5
99	549	#7
99	4708	#8
99	1048	\N
99	274	\N
99	650	\N
99	3336	\N
99	1706	\N
99	5013	\N
99	4999	\N
99	4775	\N
99	1866	\N
99	3902	\N
99	372	\N
99	2931	\N
99	311	\N
99	1222	\N
99	3113	\N
99	3756	\N
99	4175	\N
99	2810	\N
99	2387	\N
99	889	\N
99	4146	\N
99	2817	\N
99	2077	\N
99	986	\N
99	499	\N
99	233	\N
99	1640	\N
99	347	\N
99	1518	\N
99	1181	\N
99	3811	\N
99	3876	\N
99	1382	\N
99	2645	\N
99	3210	\N
99	744	\N
99	2575	\N
99	2150	\N
99	1678	\N
99	1480	\N
99	1212	\N
99	2257	\N
99	3274	\N
99	505	\N
99	4413	\N
99	1150	\N
99	37	\N
99	3961	\N
99	4941	\N
99	4686	\N
99	4768	\N
99	4053	\N
99	1865	\N
99	3877	\N
99	2580	\N
99	4076	\N
99	3965	\N
100	4146	emas
100	3756	perak
100	1866	perunggu
100	1181	#6
100	4053	#7
100	4076	#8
100	1706	\N
100	274	\N
100	1678	\N
100	505	\N
100	1865	\N
100	5013	\N
100	4775	\N
100	4708	\N
100	4999	\N
100	3902	\N
100	1222	\N
100	1150	\N
100	744	\N
100	2580	\N
100	4253	\N
100	2387	\N
100	3113	\N
100	372	\N
100	4686	\N
100	1048	\N
100	347	\N
100	4413	\N
100	3877	\N
100	3210	\N
100	2810	\N
100	231	\N
100	2257	\N
100	3704	\N
100	2575	\N
100	1382	\N
100	549	\N
100	499	\N
100	233	\N
100	4941	\N
100	4768	\N
100	37	\N
100	2817	\N
100	311	\N
100	2645	\N
100	3336	\N
100	889	\N
100	3274	\N
100	4175	\N
100	1518	\N
100	3876	\N
100	986	\N
100	3965	\N
100	3811	\N
100	2150	\N
100	650	\N
100	2931	\N
100	1640	\N
100	3961	\N
100	1480	\N
100	1212	\N
100	2077	\N
101	2619	emas
101	3700	emas
101	250	#7
101	1797	#7
101	3238	#8
101	4453	#8
101	496	#9
101	1861	#9
101	1875	#10
101	3103	#10
101	3491	#12
101	2019	#12
101	322	#14
101	3848	#14
101	3316	#15
101	1613	#15
101	736	#16
101	2358	#16
101	2592	\N
101	2695	\N
102	4898	#10
102	4848	#23
103	2377	perak
103	1421	perunggu
103	109	#4
103	2465	#5
103	2563	#6
103	2325	#7
103	3499	#8
103	21	\N
103	3838	\N
103	4936	\N
103	2109	\N
103	3	\N
103	1233	\N
103	3896	\N
103	4803	\N
103	3570	\N
103	22	\N
103	4977	\N
103	3635	\N
103	1253	\N
103	1338	\N
103	42	\N
103	573	\N
103	1349	\N
103	2648	\N
103	333	\N
103	2107	\N
103	4092	\N
103	4801	\N
103	2286	\N
103	1954	\N
105	4883	\N
105	4889	\N
105	4852	\N
106	2563	emas
106	2325	perak
106	2099	#7
106	333	\N
106	5001	\N
106	2390	\N
106	1375	\N
106	4092	\N
106	654	\N
106	4801	\N
106	3	\N
106	2109	\N
106	3777	\N
106	3892	\N
106	3572	\N
106	696	\N
107	657	emas
107	692	perak
107	266	perunggu
107	3005	#4
107	1298	#5
107	501	#9
107	2176	#10
107	992	#11
107	3790	#12
107	3795	#14
107	852	#19
107	2773	#29
107	1055	#34
107	568	#46
107	771	\N
107	4984	\N
108	4862	perunggu
108	4938	#5
109	3055	perak
109	3307	perunggu
109	1952	#4
109	850	#6
109	3942	#7
109	688	\N
109	1929	\N
109	1090	\N
109	815	\N
109	2665	\N
109	545	\N
109	2738	\N
109	3517	\N
109	2671	\N
109	778	\N
109	4756	\N
109	1434	\N
109	188	\N
109	1511	\N
109	2328	\N
109	4790	\N
109	2602	\N
109	2071	\N
110	3732	emas
110	4846	#6
110	3017	\N
110	1316	\N
110	167	\N
110	1192	\N
110	4996	\N
111	4887	#14
111	4851	\N
111	4889	\N
111	4850	\N
112	4839	\N
112	4861	\N
112	4900	\N
112	4864	\N
115	4877	\N
118	5023	\N
119	4980	#6
119	5007	#66
119	4849	\N
122	4856	\N
124	4069	perak
124	3118	perunggu
124	967	#4
124	4488	#5
124	3294	#6
124	4375	#7
124	2910	#8
124	3740	\N
124	1472	\N
124	1860	\N
124	4015	\N
124	1315	\N
124	3167	\N
124	1768	\N
124	1001	\N
124	3862	\N
124	1167	\N
124	2528	\N
124	4792	\N
124	4395	\N
124	1036	\N
124	3923	\N
124	1513	\N
124	3764	\N
124	497	\N
124	2742	\N
124	652	\N
124	2762	\N
125	4997	#7
125	4869	\N
126	4924	#9
126	4930	#11
126	4893	\N
127	1456	emas
127	1036	#4
127	967	#5
127	1337	#6
127	1977	#8
127	1860	\N
127	4303	\N
127	4468	\N
127	2432	\N
127	2910	\N
127	1663	\N
127	925	\N
127	1874	\N
127	4954	\N
127	1770	\N
127	3294	\N
127	2556	\N
127	2742	\N
127	1472	\N
127	497	\N
127	4871	\N
128	1993	emas
128	2886	perak
128	1940	perunggu
128	3949	#4
128	139	#5
128	1541	#6
128	911	#10
128	2739	#14
128	882	#15
128	2366	#16
128	4592	#18
128	5018	#24
128	1160	#27
128	4017	#28
128	3759	#31
128	3821	#33
128	1608	#37
128	3693	#41
128	430	\N
129	4957	\N
130	3341	perunggu
130	3788	#4
130	285	#5
130	216	#6
130	1667	#8
130	2196	\N
130	4087	\N
130	4830	\N
130	2511	\N
130	4820	\N
130	2524	\N
130	2177	\N
130	3868	\N
130	1169	\N
130	4203	\N
130	2573	\N
130	234	\N
130	3575	\N
130	4185	\N
130	4566	\N
130	1661	\N
131	4261	emas
131	1357	perunggu
131	4098	#6
131	4024	#7
131	2652	#8
131	4691	\N
131	4994	\N
131	275	\N
131	1620	\N
131	4079	\N
131	2597	\N
131	3335	\N
131	754	\N
132	4921	\N
133	4893	\N
133	4835	\N
133	921	\N
133	3861	\N
136	4914	#12
137	4965	\N
138	4913	\N
139	4868	#8
139	4922	\N
142	4746	\N
143	4868	#7
144	4874	perak
145	4874	#31
148	4976	#36
149	4976	#17
150	4915	#10
150	3067	#13
150	1562	#13
151	4915	#16
152	1853	emas
152	3072	emas
152	566	perak
152	3948	perak
152	4901	#4
152	2860	#4
152	3074	#5
152	4436	#5
152	4834	#8
152	719	#9
152	3834	#9
152	3677	#10
152	4141	#10
152	2956	#11
152	2951	#11
152	1604	#14
152	2437	#14
152	4886	#15
152	331	#16
152	4600	#16
152	4411	#17
152	1064	#17
152	3514	#18
152	1751	#18
152	3209	#19
153	4886	perak
153	4931	#4
153	4901	#12
153	1064	#21
153	4834	#25
153	4866	#29
154	4927	#4
155	4927	#11
156	2605	emas
156	238	emas
156	4291	perak
156	242	perak
156	3626	perunggu
156	2138	perunggu
156	3480	perunggu
156	3983	perunggu
156	3629	#6
156	1166	#7
156	268	#7
156	2245	#12
156	403	#12
156	905	#15
156	3346	#15
156	730	#16
156	3987	#16
156	2893	#18
156	397	#18
156	4956	#19
157	2605	emas
157	4291	perak
157	4956	#4
157	3324	#5
157	242	#6
157	3198	#9
157	4328	#10
157	3128	#13
157	1059	#18
157	3810	#22
157	1268	#31
157	1653	#35
161	4953	#17
162	4991	perunggu
162	4872	#23
163	4890	#31
164	1372	perak
164	5004	#18
164	4865	#32
165	5004	#23
165	4865	\N
166	826	perunggu
166	4928	#12
166	3174	#13
166	4314	#19
167	2410	emas
167	826	#15
167	4556	#27
167	4928	#45
167	1148	#54
168	1632	emas
168	3058	perak
168	3050	perunggu
168	1836	#4
168	4104	#4
168	2666	#9
168	1605	#11
168	1935	#13
168	1886	#16
168	3399	#16
168	3696	#19
168	4042	#19
168	3083	#23
168	4739	#27
168	3750	#27
168	2218	\N
169	4147	perak
169	3439	perunggu
169	6	#4
169	707	#4
169	5002	#8
169	3528	#9
169	2594	#10
169	1327	#10
169	4363	#11
169	577	#11
169	3931	#12
169	2310	#12
169	3019	#13
169	3146	#13
170	577	emas
170	1327	perunggu
170	5002	#4
170	6	#5
170	4394	#7
170	1278	#8
170	3439	#10
170	3931	#14
170	4989	#18
170	1089	#19
171	1632	emas
171	3058	perak
171	1836	perunggu
171	1935	#4
171	4777	#6
171	1605	#7
171	2218	#7
171	2537	#10
171	3750	#14
171	2666	#18
171	4042	#19
171	4739	#20
171	4492	#21
171	3399	#22
171	3083	#24
171	3696	#28
172	1174	emas
172	1677	perak
172	1215	perunggu
172	2284	#4
172	1217	#5
172	2735	#6
172	2527	#7
172	4214	#10
172	3761	#12
172	4749	#13
172	2622	#13
172	2521	#16
172	2317	#16
172	2962	#19
172	829	#23
172	4761	#27
172	4505	#27
173	4588	emas
173	811	emas
173	1146	perak
173	1949	#4
173	2587	#4
173	2939	#5
173	869	#5
173	685	#8
173	1208	#8
173	1478	#9
173	200	#9
173	1420	#13
173	2540	#13
173	453	#15
173	2765	#15
174	1949	emas
174	257	perunggu
174	1478	#5
174	2765	#9
174	2562	#13
174	4518	#16
174	4764	#17
174	1420	#18
175	1174	emas
175	2527	perak
175	1215	perunggu
175	1677	#4
175	4186	#5
175	1217	#6
175	2317	#8
175	4070	#11
175	2521	#13
175	4214	#14
175	2735	#15
175	4761	#19
175	4085	#22
175	2962	#23
175	3450	#25
175	829	#27
175	2622	\N
176	5024	#20
179	4899	#6
180	5017	#8
181	5016	#6
182	5017	#5
184	2388	emas
184	4682	perak
184	3248	perunggu
184	4380	#4
184	1343	#5
184	3886	#6
184	3000	#7
184	1492	#9
184	3842	#10
184	980	#11
184	2299	#12
184	1178	#14
184	339	#15
184	1550	#16
184	3008	#17
184	2701	#18
184	3874	#21
184	3261	#22
184	1410	#23
184	2978	#28
184	2011	#29
184	4511	#31
184	1880	#32
184	2776	#33
185	1373	perak
185	3396	perunggu
185	2294	#4
185	3251	#5
185	1244	#6
185	1579	#7
185	3079	#8
185	4451	#9
185	2443	#10
185	191	#11
185	1490	#13
185	4814	#15
185	16	#16
185	4285	#18
185	1994	#21
185	1599	#22
185	3085	#23
185	119	#24
185	3156	#25
185	2166	#28
185	1895	#29
185	613	#30
185	939	#32
185	68	#34
186	3956	emas
186	2702	perunggu
186	4807	#4
186	3244	#6
186	1332	#8
186	4041	#10
186	2661	#11
186	635	#12
186	224	#13
186	3229	#14
186	3957	#15
186	915	#16
186	1137	#17
186	466	#18
186	888	#19
186	3160	#20
186	3080	#21
186	53	#22
186	636	#24
186	332	#25
186	3263	#28
186	4091	#29
186	3262	#33
186	1413	#34
187	503	perak
187	131	#5
187	4123	#6
187	4595	#7
187	3520	#8
187	2908	#9
187	4055	#10
187	899	#11
187	1595	#12
187	406	#13
187	240	#15
187	4716	#17
187	1531	#18
187	3864	#21
187	2868	#22
187	1724	#23
187	3780	#25
187	4728	#26
187	2182	#27
187	2990	#28
187	1097	#29
187	510	#30
187	3338	#31
187	4109	#34
188	2534	emas
188	2517	perak
188	1132	perunggu
188	235	#4
188	456	#5
188	2982	#6
188	2152	#9
188	1975	#10
188	3631	#11
188	3698	#12
188	1293	#13
188	4767	#16
188	803	#17
188	1859	#18
188	4054	#19
188	4754	#20
188	4687	#21
188	2237	#22
188	4779	#24
188	2802	#27
188	4732	#28
188	3978	#29
188	1614	#30
188	2988	#31
189	2819	emas
189	3979	perak
189	3523	perunggu
189	4043	#4
189	1649	#6
189	2667	#7
189	399	#8
189	3225	#9
189	763	#11
189	2013	#12
189	2623	#13
189	1164	#18
189	2981	#19
189	4304	#21
189	2758	#22
189	3159	#23
189	812	#25
189	245	#26
189	3817	#27
189	4100	#29
189	4951	#30
189	3519	#32
189	3977	#33
189	4821	#34
189	772	#36
190	5026	#18
190	4860	#35
190	4917	#40
190	4905	#49
191	5000	#13
191	4897	#29
192	1758	perak
192	3659	perunggu
192	3306	perunggu
192	3457	#5
192	3149	#7
192	9	#7
192	4071	#9
192	500	#9
192	4825	#9
192	1475	#9
192	3492	#9
192	5	#17
192	2549	#17
192	60	#17
192	1544	#17
192	148	#17
193	4697	emas
193	2715	perak
193	3897	perunggu
193	3917	#5
193	1515	#5
193	4636	#7
193	4674	#9
193	334	#9
193	460	#9
193	4466	#17
193	1070	#17
194	1680	emas
194	4630	perak
194	1588	perunggu
194	4241	#5
194	4609	#5
194	540	#7
194	4536	#9
194	567	#9
194	539	#9
194	3043	#9
194	541	#9
194	3264	#17
194	973	#17
194	4847	#17
194	3293	#17
194	4009	#17
195	2017	perak
195	4895	perunggu
195	4172	perunggu
195	2825	#5
195	4979	#5
195	469	#7
195	1247	#7
195	3941	#9
195	3924	#9
195	1749	#9
195	4426	#9
195	3303	#9
195	935	#17
195	4894	#17
195	2478	#17
195	953	#17
195	4884	#17
196	4287	emas
196	4305	perak
196	2075	perunggu
196	435	#5
196	1414	#7
196	4090	#7
196	4605	#9
196	1577	#9
196	262	#9
196	493	#9
196	3906	#9
196	1416	#9
196	4902	#9
196	4537	#9
196	445	#17
196	4398	#17
196	40	#17
196	4867	#17
196	4987	#17
196	4844	#33
197	2477	emas
197	3966	perak
197	3077	perunggu
197	3724	#5
197	4479	#5
197	2197	#7
197	3369	#9
197	1113	#17
197	2430	#17
197	841	#17
197	3478	#17
197	3181	#17
197	983	#17
198	4322	emas
198	3213	perak
198	251	perunggu
198	4308	#5
198	1251	#9
198	1735	#9
198	3728	#17
198	4483	#17
198	1939	#17
199	3357	emas
199	523	perak
199	4108	perunggu
199	2499	#5
199	34	#5
199	487	#7
199	2264	#9
199	3197	#9
199	2351	#9
199	2262	#17
199	4107	#17
199	1725	#17
199	4485	#17
200	1043	emas
200	2475	perunggu
200	281	perunggu
200	3501	#5
200	3773	#5
200	3003	#7
200	1471	#7
200	4508	#9
200	4193	#9
200	2311	#17
200	454	#17
200	4700	#17
201	836	emas
201	3205	perak
201	1639	perunggu
201	3996	perunggu
201	3730	#5
201	1277	#5
201	2903	#7
201	1238	#7
201	3633	#9
201	4396	#9
201	4115	#9
201	3296	#17
201	4551	#17
201	2159	#17
202	876	perunggu
202	2657	#5
202	2012	#7
202	755	#7
202	2335	#9
202	4268	#9
202	3191	#9
202	2023	#9
202	909	#17
202	1276	#17
202	1510	#17
202	4025	#17
202	1265	#17
203	3218	perak
203	3154	perunggu
203	99	#5
203	3964	#5
203	3911	#7
203	2906	#7
203	3089	#9
203	2365	#9
203	1586	#9
203	4265	#17
203	4959	#17
203	1365	#17
204	228	emas
204	1775	perak
204	398	#5
204	3804	#5
204	1591	#7
204	2749	#9
204	1726	#9
204	2355	#9
204	1799	#9
205	548	emas
205	3754	perak
205	1650	perunggu
205	3847	perunggu
205	2293	#5
205	3199	#5
205	115	#7
205	4192	#9
205	59	#9
205	2943	#9
205	317	#17
205	2772	#17
205	3783	#17
205	490	#17
205	2224	#17
206	1575	\N
206	722	\N
206	4937	\N
207	4963	#13
208	4935	emas
210	4998	#20
211	5021	#12
211	4933	#16
213	5014	#5
214	1395	#4
214	1397	#4
215	4841	#21
215	4838	#33
216	329	perak
216	4144	perak
217	1786	perak
217	3867	perak
217	4958	#7
217	4950	#8
217	4993	#13
218	5015	#19
218	4912	#24
218	4982	#32
221	4981	#20
224	4983	#7
225	4920	#15
225	4910	#36
230	4923	#16
231	5019	#17
231	4923	#23
231	4943	#35
235	5019	#20
235	4923	#26
235	4870	#32
237	4967	#11
240	4968	#11
241	4968	#25
242	5005	#14
243	4911	emas
244	4988	#19
248	4881	#6
248	5006	#7
250	4942	#4
252	4990	#9
254	4364	emas
254	1992	perak
254	3890	perunggu
254	444	#4
254	1713	#6
254	4719	#7
254	3525	#8
254	1708	#10
254	1717	#11
254	2433	#12
254	616	#16
254	3845	#17
254	3511	#18
254	45	#19
254	1916	#20
254	2211	#21
254	1803	#21
254	3161	#23
254	4879	#28
254	2136	#30
254	3808	#31
254	587	#36
254	4992	#46
255	3428	emas
255	47	perak
255	3380	perak
255	3124	#4
255	2674	#5
255	1600	#7
255	743	#8
255	1891	#11
255	2112	#12
255	783	#14
255	587	#15
255	3851	#16
255	1985	#17
255	1065	#18
255	4289	#19
255	367	#20
255	1896	#22
255	4906	#27
255	4854	#30
256	2111	perak
256	1765	perunggu
256	3078	#5
256	3497	#6
256	3061	#7
256	3332	#8
256	556	#9
256	4135	#10
256	1882	#11
256	1460	#12
256	690	#13
256	884	#14
256	2282	#15
256	1708	#16
256	4368	#18
256	1985	#19
256	4448	#21
256	1885	#23
256	2937	#25
256	774	#26
256	4896	#29
257	4799	emas
257	2440	perak
257	3328	#4
257	3078	#5
257	2106	#6
257	1835	#7
257	833	#8
257	164	#9
257	1576	#10
257	2111	#11
257	3057	#12
257	353	#14
257	4540	#16
257	4254	#17
257	1856	#18
257	4060	#19
257	927	#20
257	4448	#21
257	1626	#22
257	3723	#23
257	4771	#29
257	2845	#35
257	1882	#36
257	5008	#37
257	609	#40
257	4896	#41
257	4892	#58
258	4937	#6
258	2620	#9
258	1032	#19
258	722	#22
259	1708	emas
259	444	perak
259	3845	perunggu
259	1713	#6
259	2722	#8
259	4364	#9
259	3890	#10
259	2136	#11
259	3525	#12
259	4885	#13
259	4719	#16
259	2433	#17
259	616	#19
259	2211	#23
259	1992	#29
260	2548	emas
260	743	perunggu
260	2112	#8
260	1600	#10
260	1255	#13
260	1896	#20
261	2548	emas
261	1765	perunggu
261	5010	#8
261	4368	#10
261	1499	#12
261	3405	#18
261	3061	#23
262	3057	perak
262	2728	perunggu
262	1081	#4
262	2722	#5
262	927	#5
262	3086	#7
262	2282	#8
262	4254	#9
262	4371	#10
262	4639	#12
262	1374	#13
262	166	#14
262	3726	#15
262	1006	#16
262	434	#17
262	4540	#18
262	833	#19
262	4799	#22
262	4662	#23
262	3328	#26
262	1575	#26
263	2548	emas
263	1081	perak
263	737	#4
263	4431	#5
263	5010	#6
263	1377	#8
263	4371	#11
263	3851	#12
263	1956	#13
263	1713	#24
264	2722	emas
264	1143	perak
264	4639	perunggu
264	1575	#5
264	2620	#6
264	4833	#8
264	4937	#9
264	927	#10
264	2359	#11
264	4800	#12
264	434	#23
264	1116	#28
264	5011	#35
265	2548	emas
265	737	perunggu
265	5010	#5
265	4800	#10
266	4937	#4
266	1143	#8
266	2620	#10
266	722	#18
266	1575	#20
266	4800	#21
266	1032	#26
267	2291	emas
267	3767	perak
267	2265	perunggu
267	2442	#4
267	1791	#5
267	1782	#6
267	1225	#7
267	589	#8
267	4669	#11
267	2560	#12
267	2740	#13
267	2375	#14
267	2651	#15
267	951	#16
267	51	#17
267	2269	#18
268	3699	perak
268	3270	perunggu
268	570	#4
268	2583	#4
268	380	#6
268	4331	#10
268	4020	#12
268	4189	#13
268	326	#17
268	4184	#18
268	391	#20
268	1060	#21
268	1944	#22
268	1228	#23
268	1236	#25
269	4467	emas
269	1568	perak
269	4750	perunggu
269	378	#4
269	2865	#5
269	1220	#6
269	3236	#7
269	2651	#8
269	2915	#9
269	3805	#12
269	209	#13
269	4335	#15
269	2301	#16
269	401	#19
269	904	#21
269	1172	#22
269	4582	#32
270	4004	emas
270	4467	perak
270	4152	perunggu
270	3266	#4
270	4095	#5
270	2179	#6
270	2967	#7
270	1568	#8
270	3701	#9
270	2915	#10
270	395	#11
270	3164	#12
270	3376	#14
270	589	#16
270	2865	#17
270	2402	#20
270	5027	#28
271	2276	emas
271	324	perak
271	1807	perunggu
271	605	#5
271	822	#9
271	1307	#12
271	2466	#17
272	2291	emas
272	3767	perak
272	2442	perunggu
272	1225	#9
272	4919	#14
272	1290	#15
272	326	#16
272	2869	#20
272	51	#24
273	2255	emas
273	4331	perunggu
273	4020	#4
273	2583	#8
273	1944	#10
273	3270	#11
273	1170	#12
273	4346	#19
273	4189	#20
273	1236	#22
274	4251	emas
274	3767	perak
274	4750	perunggu
274	184	#6
274	4836	#7
274	2301	#9
274	4964	#11
274	1688	#13
275	3266	emas
275	457	perak
275	4152	perunggu
275	2995	#4
275	2179	#5
275	1257	#7
275	868	#8
275	1260	#9
275	605	#10
275	2878	#11
275	4955	#12
275	2582	#14
275	2148	#17
275	2525	#19
275	3454	#31
276	4251	emas
276	2255	perak
276	2291	perunggu
276	4714	#4
276	10	#5
276	1170	#7
276	326	#9
276	1172	#13
276	787	#16
276	1429	#18
276	2967	#20
276	2525	#28
277	457	emas
277	4251	perak
277	2276	perunggu
277	1257	#4
277	1807	#5
277	3578	#6
277	2878	#7
277	605	#9
277	4694	#10
277	4607	#11
277	108	#13
277	324	#15
277	1455	#16
277	1307	#17
277	4929	#18
278	4251	emas
278	1429	#4
278	1170	#5
278	1172	#8
278	326	#10
278	1168	#11
278	4925	#13
279	4004	emas
279	3096	perak
279	4750	perunggu
279	1568	#4
279	2252	#5
279	3376	#6
279	3701	#7
279	4095	#8
279	3164	#9
279	395	#10
279	589	#11
279	4315	#13
279	3981	#14
279	2162	#16
279	4349	#17
279	2362	#18
279	4149	#18
279	2402	#20
279	951	#21
279	3662	#24
279	4873	#34
279	4966	#56
279	4891	#72
279	4946	#77
280	2276	emas
280	457	perak
280	3578	perunggu
280	1807	#5
280	2466	#6
280	324	#7
280	1257	#8
280	605	#9
280	2878	#10
280	822	#11
280	1307	#12
280	108	#13
280	4929	#14
281	4802	emas
281	4481	perak
281	1354	perunggu
281	1710	#4
281	3539	#5
281	4454	#5
281	4637	#5
281	4766	#5
281	963	#9
281	804	#9
281	217	#9
281	330	#9
281	1031	#9
281	4117	#9
281	354	#17
281	2068	#17
281	4586	#17
281	429	#17
281	1004	#17
281	5009	#17
281	4449	#17
281	929	#17
281	858	#17
281	4086	#33
281	4378	#33
281	917	#33
281	1631	#33
281	3246	#33
281	2854	#33
281	3389	#33
281	1379	#33
281	1118	#33
282	858	emas
282	4711	emas
282	2073	perunggu
282	4743	perunggu
282	1693	#4
282	585	#5
282	2416	#5
282	846	#5
282	4766	#5
282	4269	#5
282	3389	#9
282	3212	#9
282	4586	#9
282	676	#9
282	3539	#9
282	1037	#9
282	217	#9
282	1984	#9
282	929	#9
282	3464	#9
282	4454	#9
282	1684	#9
283	3126	emas
283	4711	perak
283	1684	perunggu
283	4743	#4
283	1727	#5
283	3231	#5
283	4201	#9
283	3343	#9
283	2816	#9
283	4909	#9
283	585	#9
283	1984	#9
283	2588	#9
283	2590	#17
283	1037	#17
283	3464	#17
283	3692	#17
283	1161	#17
283	676	#17
283	307	#17
283	805	#17
283	4486	#33
283	1693	#33
283	1609	#33
283	3212	#33
283	1995	#33
283	846	#33
283	3551	#33
283	4257	#33
283	4657	#33
283	1533	#33
283	3120	#33
283	2253	#33
284	4907	#5
285	4939	#11
287	4853	#7
287	4995	#11
288	4908	#9
288	4858	#11
292	4882	#4
292	5025	#9
293	5025	#33
295	4971	#17
296	4971	#33
298	2802	#16
299	187	emas
299	1645	perak
299	2545	perunggu
299	3676	#4
299	4530	#5
299	3793	#6
299	3053	#7
299	134	#8
299	3178	#10
299	2415	#12
299	1505	#14
299	4552	#17
299	4389	#18
299	1092	#19
299	2481	#21
299	258	#23
299	3228	#26
299	4066	#29
299	172	#30
299	3273	#31
299	436	#32
299	4417	#33
299	906	#39
299	3075	#40
299	3798	#44
299	2818	#45
299	2731	#46
299	446	#47
299	4916	#49
299	3940	\N
300	745	emas
300	2161	perak
300	590	perunggu
300	1219	#4
300	1481	#6
300	3090	#7
300	2497	#8
300	2613	#9
300	4316	#10
300	2890	#11
300	3714	#14
300	229	#16
300	394	#17
300	3857	#18
300	4314	#19
300	1044	#20
300	4190	#21
300	4589	#25
300	2624	#30
300	3425	#31
300	2144	#32
300	3219	#33
300	5003	#36
300	4541	#39
300	3348	#42
300	758	#43
300	103	#44
300	3114	#45
300	4174	#48
300	2611	#50
300	2646	\N
301	4843	#7
302	4974	perak
302	4934	\N
310	4970	#11
311	4944	#5
313	5022	#11
315	4832	perunggu
316	4975	emas
317	4842	#5
317	4876	#12
318	4949	#14
318	4840	#16
320	4986	perunggu
320	4952	#12
320	4837	#16
321	5028	#8
322	4863	#7
323	4985	#13
324	4973	emas
326	4969	perunggu
328	4961	#5
\.


--
-- Data for Name: pertandingan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pertandingan (id, nama_olahraga, nama_pertandingan, jenis_pertandingan) FROM stdin;
1	3x3 basketball	men	team
2	3x3 basketball	women	team
3	archery	men's team	team
4	archery	women's team	team
5	artistic gymnastics	men's team	team
6	artistic gymnastics	women's team	team
7	artistic swimming	team	team
8	athletics	4 x 400m relay mixed	team
9	athletics	marathon race walk relay mixed	team
10	athletics	men's 4 x 100m relay	team
11	athletics	men's 4 x 400m relay	team
12	athletics	women's 4 x 100m relay	team
13	athletics	women's 4 x 400m relay	team
14	basketball	men	team
15	basketball	women	team
16	canoe sprint	men's kayak four 500m	team
17	canoe sprint	women's kayak four 500m	team
18	cycling track	men's team pursuit	team
19	cycling track	men's team sprint	team
20	cycling track	women's team pursuit	team
21	cycling track	women's team sprint	team
22	equestrian	dressage individual	team
23	equestrian	dressage team	team
24	equestrian	eventing individual	team
25	equestrian	eventing team	team
26	equestrian	jumping individual	team
27	equestrian	jumping team	team
28	fencing	men's épée team	team
29	fencing	men's foil team	team
30	fencing	men's sabre team	team
31	fencing	women's épée team	team
32	fencing	women's foil team	team
33	fencing	women's sabre team	team
34	football	men	team
35	football	women	team
36	handball	men	team
37	handball	women	team
38	hockey	men	team
39	hockey	women	team
40	judo	mixed team	team
41	rhythmic gymnastics	group all-around	team
42	rowing	men's eight	team
43	rowing	men's four	team
44	rowing	men's quadruple sculls	team
45	rowing	women's eight	team
46	rowing	women's four	team
47	rowing	women's quadruple sculls	team
48	rugby sevens	men	team
49	rugby sevens	women	team
50	swimming	men's 4 x 100m freestyle relay	team
51	swimming	men's 4 x 100m medley relay	team
52	swimming	men's 4 x 200m freestyle relay	team
53	swimming	mixed 4 x 100m medley relay	team
54	swimming	women's 4 x 100m freestyle relay	team
55	swimming	women's 4 x 100m medley relay	team
56	swimming	women's 4 x 200m freestyle relay	team
57	table tennis	men's team	team
58	table tennis	women's team	team
59	triathlon	mixed relay	team
60	volleyball	men	team
61	volleyball	women	team
62	water polo	men	team
63	water polo	women	team
64	badminton	men's doubles	team
65	badminton	men's singles	individual
66	badminton	mixed doubles	team
67	badminton	women's doubles	team
68	badminton	women's singles	individual
69	beach volleyball	men	team
70	beach volleyball	women	team
71	boxing	men -80kg	individual
72	boxing	men's 51kg	individual
73	boxing	men's 63.5kg	individual
74	boxing	mens feather (57kg)	individual
75	boxing	mens heavy (92kg)	individual
76	boxing	mens light middle (71kg)	individual
77	boxing	mens super heavy (+92kg)	individual
78	boxing	women's 54kg	individual
79	boxing	women's 60kg	individual
80	boxing	womens feather (57kg)	individual
81	boxing	womens light fly (50kg)	individual
82	boxing	womens middle (75kg)	individual
83	boxing	womens welter (66kg)	individual
84	breaking	b-boys	individual
85	breaking	b-girls	individual
86	archery	men's individual	individual
87	archery	mixed team	team
88	archery	women's individual	individual
89	artistic gymnastics	men's all-around	individual
90	artistic gymnastics	men's floor exercise	individual
91	artistic gymnastics	men's horizontal bar	individual
92	artistic gymnastics	men's parallel bars	individual
93	artistic gymnastics	men's pommel horse	individual
94	artistic gymnastics	men's rings	individual
95	artistic gymnastics	men's vault	individual
96	artistic gymnastics	women's all-around	individual
97	artistic gymnastics	women's balance beam	individual
98	artistic gymnastics	women's floor exercise	individual
99	artistic gymnastics	women's uneven bars	individual
100	artistic gymnastics	women's vault	individual
101	artistic swimming	duet	team
102	athletics	men's 10,000m	individual
103	athletics	men's 100m	individual
104	athletics	men's 110m hurdles	individual
105	athletics	men's 1500m	individual
106	athletics	men's 200m	individual
107	athletics	men's 20km race walk	individual
108	athletics	men's 3000m steeplechase	individual
109	athletics	men's 400m	individual
110	athletics	men's 400m hurdles	individual
111	athletics	men's 5000m	individual
112	athletics	men's 800m	individual
113	athletics	men's decathlon	individual
114	athletics	men's discus throw	individual
115	athletics	men's hammer throw	individual
116	athletics	men's high jump	individual
117	athletics	men's javelin throw	individual
118	athletics	men's long jump	individual
119	athletics	men's marathon	individual
120	athletics	men's pole vault	individual
121	athletics	men's shot put	individual
122	athletics	men's triple jump	individual
123	athletics	women's 10,000m	individual
124	athletics	women's 100m	individual
125	athletics	women's 100m hurdles	individual
126	athletics	women's 1500m	individual
127	athletics	women's 200m	individual
128	athletics	women's 20km race walk	individual
129	athletics	women's 3000m steeplechase	individual
130	athletics	women's 400m	individual
131	athletics	women's 400m hurdles	individual
132	athletics	women's 5000m	individual
133	athletics	women's 800m	individual
134	athletics	women's discus throw	individual
135	athletics	women's hammer throw	individual
136	athletics	women's heptathlon	individual
137	athletics	women's high jump	individual
138	athletics	women's javelin throw	individual
139	athletics	women's long jump	individual
140	athletics	women's marathon	individual
141	athletics	women's pole vault	individual
142	athletics	women's shot put	individual
143	athletics	women's triple jump	individual
144	canoe slalom	men's canoe single	individual
145	canoe slalom	men's kayak cross	individual
146	canoe slalom	men's kayak single	individual
147	canoe slalom	women's canoe single	individual
148	canoe slalom	women's kayak cross	individual
149	canoe slalom	women's kayak single	individual
150	canoe sprint	men's canoe double 500m	team
151	canoe sprint	men's canoe single 1000m	individual
152	canoe sprint	men's kayak double 500m	team
153	canoe sprint	men's kayak single 1000m	individual
154	canoe sprint	women's canoe double 500m	team
155	canoe sprint	women's canoe single 200m	individual
156	canoe sprint	women's kayak double 500m	team
157	canoe sprint	women's kayak single 500m	individual
158	cycling bmx freestyle	men's park	individual
159	cycling bmx freestyle	women's park	individual
160	cycling bmx racing	men	individual
161	cycling bmx racing	women	individual
162	cycling mountain bike	men's cross-country	individual
163	cycling mountain bike	women's cross-country	individual
164	cycling road	men's individual time trial	individual
165	cycling road	men's road race	individual
166	cycling road	women's individual time trial	individual
167	cycling road	women's road race	individual
168	cycling track	men's keirin	individual
169	cycling track	men's madison	team
170	cycling track	men's omnium	individual
171	cycling track	men's sprint	individual
172	cycling track	women's keirin	individual
173	cycling track	women's madison	team
174	cycling track	women's omnium	individual
175	cycling track	women's sprint	individual
176	diving	men's 10m platform	individual
177	diving	men's 3m springboard	individual
178	diving	men's synchronised 10m platform	team
179	diving	men's synchronised 3m springboard	team
180	diving	women's 10m platform	individual
181	diving	women's 3m springboard	individual
182	diving	women's synchronised 10m platform	team
183	diving	women's synchronised 3m springboard	team
184	fencing	men's épée individual	individual
185	fencing	men's foil individual	individual
186	fencing	men's sabre individual	individual
187	fencing	women's épée individual	individual
188	fencing	women's foil individual	individual
189	fencing	women's sabre individual	individual
190	golf	men's individual stroke play	individual
191	golf	women's individual stroke play	individual
192	judo	men -100 kg	individual
193	judo	men -60 kg	individual
194	judo	men -66 kg	individual
195	judo	men -73 kg	individual
196	judo	men -81 kg	individual
197	judo	men -90 kg	individual
198	judo	men +100 kg	individual
199	judo	women -48 kg	individual
200	judo	women -52 kg	individual
201	judo	women -57 kg	individual
202	judo	women -63 kg	individual
203	judo	women -70 kg	individual
204	judo	women -78 kg	individual
205	judo	women +78 kg	individual
206	marathon swimming	men's 10km	individual
207	marathon swimming	women's 10km	individual
208	modern pentathlon	men's individual	individual
209	modern pentathlon	women's individual	individual
210	rhythmic gymnastics	individual all-around	individual
211	rowing	lightweight men's double sculls	team
212	rowing	lightweight women's double sculls	team
213	rowing	men's double sculls	team
214	rowing	men's pair	team
215	rowing	men's single sculls	individual
216	rowing	women's double sculls	team
217	rowing	women's pair	team
218	rowing	women's single sculls	individual
219	sailing	men's dinghy	individual
220	sailing	men's kite	individual
221	sailing	men's skiff	team
222	sailing	men's windsurfing	individual
223	sailing	mixed dinghy	team
224	sailing	mixed multihull	team
225	sailing	women's dinghy	individual
226	sailing	women's kite	individual
227	sailing	women's skiff	team
228	sailing	women's windsurfing	individual
229	shooting	10m air pistol men	individual
230	shooting	10m air pistol mixed team	team
231	shooting	10m air pistol women	individual
232	shooting	10m air rifle men	individual
233	shooting	10m air rifle mixed team	team
234	shooting	10m air rifle women	individual
235	shooting	25m pistol women	individual
236	shooting	25m rapid fire pistol men	individual
237	shooting	50m rifle 3 positions men	individual
238	shooting	50m rifle 3 positions women	individual
239	shooting	skeet men	individual
240	shooting	skeet mixed team	team
241	shooting	skeet women	individual
242	shooting	trap men	individual
243	shooting	trap women	individual
244	skateboarding	men's park	individual
245	skateboarding	men's street	individual
246	skateboarding	women's park	individual
247	skateboarding	women's street	individual
248	sport climbing	men's boulder & lead	individual
249	sport climbing	men's speed	individual
250	sport climbing	women's boulder & lead	individual
251	sport climbing	women's speed	individual
252	surfing	men	individual
253	surfing	women	individual
254	swimming	men's 100m backstroke	individual
255	swimming	men's 100m breaststroke	individual
256	swimming	men's 100m butterfly	individual
257	swimming	men's 100m freestyle	individual
258	swimming	men's 1500m freestyle	individual
259	swimming	men's 200m backstroke	individual
260	swimming	men's 200m breaststroke	individual
261	swimming	men's 200m butterfly	individual
262	swimming	men's 200m freestyle	individual
263	swimming	men's 200m individual medley	individual
264	swimming	men's 400m freestyle	individual
265	swimming	men's 400m individual medley	individual
266	swimming	men's 800m freestyle	individual
267	swimming	women's 100m backstroke	individual
268	swimming	women's 100m breaststroke	individual
269	swimming	women's 100m butterfly	individual
270	swimming	women's 100m freestyle	individual
271	swimming	women's 1500m freestyle	individual
272	swimming	women's 200m backstroke	individual
273	swimming	women's 200m breaststroke	individual
274	swimming	women's 200m butterfly	individual
275	swimming	women's 200m freestyle	individual
276	swimming	women's 200m individual medley	individual
277	swimming	women's 400m freestyle	individual
278	swimming	women's 400m individual medley	individual
279	swimming	women's 50m freestyle	individual
280	swimming	women's 800m freestyle	individual
281	table tennis	men's singles	individual
282	table tennis	mixed doubles	team
283	table tennis	women's singles	individual
284	taekwondo	men -58kg	individual
285	taekwondo	men -68kg	individual
286	taekwondo	men -80kg	individual
287	taekwondo	men +80kg	individual
288	taekwondo	women -49kg	individual
289	taekwondo	women -57kg	individual
290	taekwondo	women -67kg	individual
291	taekwondo	women +67kg	individual
292	tennis	men's doubles	team
293	tennis	men's singles	individual
294	tennis	mixed doubles	team
295	tennis	women's doubles	team
296	tennis	women's singles	individual
297	trampoline gymnastics	men	individual
298	trampoline gymnastics	women	individual
299	triathlon	men's individual	individual
300	triathlon	women's individual	individual
301	weightlifting	men's +102kg	individual
302	weightlifting	men's 102kg	individual
303	weightlifting	men's 61kg	individual
304	weightlifting	men's 73kg	individual
305	weightlifting	men's 89kg	individual
306	weightlifting	women -49kg	individual
307	weightlifting	women's +81kg	individual
308	weightlifting	women's 59kg	individual
309	weightlifting	women's 71kg	individual
310	weightlifting	women's 81kg	individual
311	wrestling	men's freestyle 125kg	individual
312	wrestling	men's freestyle 57kg	individual
313	wrestling	men's freestyle 65kg	individual
314	wrestling	men's freestyle 74kg	individual
315	wrestling	men's freestyle 86kg	individual
316	wrestling	men's freestyle 97kg	individual
317	wrestling	men's greco-roman 130kg	individual
318	wrestling	men's greco-roman 60kg	individual
319	wrestling	men's greco-roman 67kg	individual
320	wrestling	men's greco-roman 77kg	individual
321	wrestling	men's greco-roman 87kg	individual
322	wrestling	men's greco-roman 97kg	individual
323	wrestling	women's freestyle 50kg	individual
324	wrestling	women's freestyle 53kg	individual
325	wrestling	women's freestyle 57kg	individual
326	wrestling	women's freestyle 62kg	individual
327	wrestling	women's freestyle 68kg	individual
328	wrestling	women's freestyle 76kg	individual
\.


--
-- Data for Name: pertandingan_venue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pertandingan_venue (id_pertandingan, id_venue) FROM stdin;
\.


--
-- Data for Name: venue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venue (id, nama_tempat, kapasitas_penonton) FROM stdin;
\.


--
-- Name: atlet atlet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atlet
    ADD CONSTRAINT atlet_pkey PRIMARY KEY (id);


--
-- Name: negara negara_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.negara
    ADD CONSTRAINT negara_pkey PRIMARY KEY (nama_negara);


--
-- Name: olahraga olahraga_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.olahraga
    ADD CONSTRAINT olahraga_pkey PRIMARY KEY (nama_olahraga);


--
-- Name: partisipasi partisipasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partisipasi
    ADD CONSTRAINT partisipasi_pkey PRIMARY KEY (id_pertandingan, id_atlet);


--
-- Name: pertandingan pertandingan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertandingan
    ADD CONSTRAINT pertandingan_pkey PRIMARY KEY (id);


--
-- Name: pertandingan_venue pertandingan_venue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertandingan_venue
    ADD CONSTRAINT pertandingan_venue_pkey PRIMARY KEY (id_pertandingan, id_venue);


--
-- Name: venue venue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venue
    ADD CONSTRAINT venue_pkey PRIMARY KEY (id);


--
-- Name: atlet atlet_nama_negara_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atlet
    ADD CONSTRAINT atlet_nama_negara_fkey FOREIGN KEY (nama_negara) REFERENCES public.negara(nama_negara);


--
-- Name: partisipasi partisipasi_id_atlet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partisipasi
    ADD CONSTRAINT partisipasi_id_atlet_fkey FOREIGN KEY (id_atlet) REFERENCES public.atlet(id);


--
-- Name: partisipasi partisipasi_id_pertandingan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partisipasi
    ADD CONSTRAINT partisipasi_id_pertandingan_fkey FOREIGN KEY (id_pertandingan) REFERENCES public.pertandingan(id);


--
-- Name: pertandingan pertandingan_nama_olahraga_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertandingan
    ADD CONSTRAINT pertandingan_nama_olahraga_fkey FOREIGN KEY (nama_olahraga) REFERENCES public.olahraga(nama_olahraga);


--
-- Name: pertandingan_venue pertandingan_venue_id_pertandingan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertandingan_venue
    ADD CONSTRAINT pertandingan_venue_id_pertandingan_fkey FOREIGN KEY (id_pertandingan) REFERENCES public.pertandingan(id);


--
-- Name: pertandingan_venue pertandingan_venue_id_venue_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pertandingan_venue
    ADD CONSTRAINT pertandingan_venue_id_venue_fkey FOREIGN KEY (id_venue) REFERENCES public.venue(id);


--
-- PostgreSQL database dump complete
--


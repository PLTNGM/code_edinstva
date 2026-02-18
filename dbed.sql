--
-- PostgreSQL database dump
--

\restrict NnLA9ZULIbY2nI14JoxnVhBEqVTLe1n6C7Xspn7Q71phhcNOO7Qmx3QZMusokSX

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-18 11:36:47

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
-- TOC entry 226 (class 1259 OID 16425)
-- Name: media_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_post (
    id integer NOT NULL,
    id_post integer,
    img_adress text
);


ALTER TABLE public.media_post OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16424)
-- Name: media_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_post_id_seq OWNER TO postgres;

--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 225
-- Name: media_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_post_id_seq OWNED BY public.media_post.id;


--
-- TOC entry 222 (class 1259 OID 16400)
-- Name: media_respublic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media_respublic (
    id integer NOT NULL,
    id_respublic integer,
    img_adress text
);


ALTER TABLE public.media_respublic OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16399)
-- Name: media_respublic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_respublic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_respublic_id_seq OWNER TO postgres;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 221
-- Name: media_respublic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_respublic_id_seq OWNED BY public.media_respublic.id;


--
-- TOC entry 224 (class 1259 OID 16415)
-- Name: post_forum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_forum (
    id integer NOT NULL,
    name character varying(255),
    avatar text,
    post_idea character varying(150),
    text text
);


ALTER TABLE public.post_forum OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16414)
-- Name: post_forum_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_forum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_forum_id_seq OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 223
-- Name: post_forum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_forum_id_seq OWNED BY public.post_forum.id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: respublic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.respublic (
    id integer NOT NULL,
    name character varying(50),
    text text
);


ALTER TABLE public.respublic OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: respublic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.respublic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.respublic_id_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 219
-- Name: respublic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.respublic_id_seq OWNED BY public.respublic.id;


--
-- TOC entry 4827 (class 2604 OID 16428)
-- Name: media_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_post ALTER COLUMN id SET DEFAULT nextval('public.media_post_id_seq'::regclass);


--
-- TOC entry 4825 (class 2604 OID 16403)
-- Name: media_respublic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_respublic ALTER COLUMN id SET DEFAULT nextval('public.media_respublic_id_seq'::regclass);


--
-- TOC entry 4826 (class 2604 OID 16418)
-- Name: post_forum id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_forum ALTER COLUMN id SET DEFAULT nextval('public.post_forum_id_seq'::regclass);


--
-- TOC entry 4824 (class 2604 OID 16393)
-- Name: respublic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respublic ALTER COLUMN id SET DEFAULT nextval('public.respublic_id_seq'::regclass);


--
-- TOC entry 4992 (class 0 OID 16425)
-- Dependencies: 226
-- Data for Name: media_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media_post (id, id_post, img_adress) FROM stdin;
1	1	rom6.png
2	1	rom5.png
3	1	rom4.png
4	1	rom3.png
5	1	rom2.png
6	1	rom1.png
7	2	yar2.png
8	2	yar1.png
9	3	pla3.png
10	3	pla2.png
11	3	pla1.png
\.


--
-- TOC entry 4988 (class 0 OID 16400)
-- Dependencies: 222
-- Data for Name: media_respublic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media_respublic (id, id_respublic, img_adress) FROM stdin;
1	1	tat1.png
2	1	tat2.png
3	1	tat3.png
4	2	nen1.png
5	2	nen2.png
6	2	nen3.png
8	3	kar3.png
9	3	kar2.png
10	3	kar1.png
11	4	udm1.png
12	4	udm2.png
13	4	udm3.png
16	5	kalm1.png
14	5	kalm3.png
15	5	kalm2.png
\.


--
-- TOC entry 4990 (class 0 OID 16415)
-- Dependencies: 224
-- Data for Name: post_forum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_forum (id, name, avatar, post_idea, text) FROM stdin;
1	Роман	roman.png	История одной вещи 🕰️	У каждой семьи есть предмет, который дороже золота. Старая бабушкина шаль с национальным узором, дедушкин ремесленный нож или пожелтевшая книга рецептов. Расскажите, какая вещь в вашей семье хранит память о предках? Сделайте фото и напишите, сколько ей лет!
2	Rezzhwxc	yarik.png	Как мы встречаем весну 🌸	Кто-то плетет венки и пускает их по воде, кто-то печет особенные хлеба, а кто-то обязательно зажигает огонь во дворе. Какие необычные традиции соблюдаются в вашем народе или семье в праздничные дни? Расскажите о самом любимом ритуале!
3	Платон	platon.png	Гость в доме — радость в доме ☕	В одних семьях гостю первым делом подают чай с солью, в других — не отпускают, пока не накормят тремя блюдами. Как принято встречать гостей у вашего народа? Есть ли особенное место за столом или фраза, с которой начинается встреча?
\.


--
-- TOC entry 4986 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: respublic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.respublic (id, name, text) FROM stdin;
1	Татары	Татары — один из крупнейших этносов России с богатейшей многовековой историей. Это народ, в котором удивительным образом переплетаются традиции Востока и Запада.\n\nИстория и культура: Культура татар уходит корнями в эпоху Волжской Булгарии и Золотой Орды. Сегодня это народ с высочайшим уровнем образования и искусства. Особое место занимает праздник Сабантуй — «праздник плуга», который вошел в список шедевров устного и нематериального наследия ЮНЕСКО.\n\nКухня: Татарская кулинария — это отдельный вид искусства. Кто не слышал о золотистом чак-чаке, сытном эчпочмаке или праздничном губадие? Гостеприимство здесь всегда стоит на первом месте: гостя обязательно накормят и напоят чаем из самовара.\n\nАрхитектура: Сердце Татарстана — Казанский Кремль, где бок о бок стоят Благовещенский собор и мечеть Кул-Шариф, символизируя единство и мирное сосуществование разных религий и культур.
2	Ненцы	Ненцы — самодийский народ, «хозяева Арктики», живущие на бескрайних просторах от Кольского полуострова до Таймыра. Это люди, чья жизнь на протяжении тысячелетий неразрывно связана с северным оленем и суровым ритмом тундры.\n\nОленеводство: Главное сокровище ненца — олень. Он даёт всё: пищу, одежду (малицы и ягушки) и транспорт. Ненцы — одни из немногих в мире, кто до сих пор сохраняет кочевой образ жизни, преодолевая сотни километров в год вместе со своими стадами.\n\nДом на колесах (Чум): Жилище ненцев — чум — это гениальное изобретение. Его можно собрать или разобрать за полчаса. В центре чума всегда горит огонь, который считается священным и охраняется женщиной — хозяйкой очага.\n\nВерования: Ненцы бережно хранят древние традиции и верят в духов природы. Они почитают священные места, такие как остров Вайгач, и верят в верховное божество Нума. Для ненца тундра — это не просто земля, а живое существо, к которому нужно относиться с глубоким уважением.
3	Карелы	Карелы — древний финно-угорский народ, коренные жители сурового и прекрасного края озер и гранитных скал. Их культура — это уникальный сплав северного язычества и православных традиций.\n\nЭпос и руны: Именно здесь родился знаменитый эпос «Калевала». На протяжении веков карельские сказители — рунопевцы — передавали из уст в уста древние песни о сотворении мира, богатыре Вяйнямёйнене и коварной старухе Лоухи.\n\nДеревянное зодчество: Карелы — непревзойденные мастера работы с деревом. Шедевры острова Кижи, возведенные без единого гвоздя, являются вершиной их мастерства. Традиционный карельский дом — это огромный, надежный сруб, способный выдержать самые лютые морозы.\n\nКухня: Символ карельского стола — калитки. Это маленькие открытые пирожки из ржаного теста с разнообразными начинками. Карелы также мастера приготовления рыбы и использования лесных даров: морошки, клюквы и знаменитого карельского бальзама на травах.
4	Удмурты	Удмурты — финно-угорский народ, коренные жители Прикамья и Предуралья. Их часто называют «самым рыжеволосым этносом России», а их культура пропитана глубоким уважением к силам природы и духам предков.\n\nРодина пельменей: Мало кто знает, что слово «пельмень» имеет удмуртские корни: «пельнянь» переводится как «хлебное ушко». Кулинарным символом Удмуртии также являются перепечи — открытые корзиночки из ржаного теста с сочной начинкой, которые готовятся перед пылающей печью.\n\nМузыка и мифология: Удмуртский фольклор — это мир напевов и древних сказаний. Всемирную славу народу принесли «Бурановские бабушки», показав всему миру искренность и глубину удмуртской души. В древности удмурты верили в бога неба Инмара и духа леса Нюлэсмурта, сохраняя гармонию с окружающим миром.\n\nТрадиции: Удмурты славятся своим декоративно-прикладным искусством, особенно ткачеством. Традиционный женский костюм с его сложной вышивкой и монистами (украшениями из монет) считается одним из самых богатых и многослойных среди народов Поволжья.
5	Калмыки	Калмыки (самоназвание — хальмг) — уникальный народ с героическим прошлым, прямые потомки западных монголов (ойратов). Это единственный народ в Европе, традиционной религией которого является буддизм.\n\nНаследие кочевников: История калмыков — это история великих переселений. Перекочевав из Центральной Азии в XVII веке, они принесли с собой культуру степной вольницы. Главный символ их духа — героический эпос «Джангар», повествующий о сказочной стране счастья и равенства.\n\nБуддизм в сердце степи: Калмыкия — центр буддизма в европейской части России. Величественный хурул «Золотая обитель Будды Шакьямуни» в Элисте притягивает паломников со всего мира. Здесь в воздухе вибрирует звук колокольчиков, а молитвенные барабаны кюрде крутятся, даруя благо всем живым существам.\n\nКухня и традиции: Калмыцкое гостеприимство начинается с джоббы — калмыцкого чая с молоком, солью и маслом (иногда и перцем). Это напиток воинов и кочевников, который согревает и придает сил. А на праздник Зул (калмыцкий Новый год) в каждой семье зажигают лампады, символизируя победу света над тьмой.
\.


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 225
-- Name: media_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_post_id_seq', 11, true);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 221
-- Name: media_respublic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_respublic_id_seq', 16, true);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 223
-- Name: post_forum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_forum_id_seq', 3, true);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 219
-- Name: respublic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.respublic_id_seq', 1, true);


--
-- TOC entry 4835 (class 2606 OID 16433)
-- Name: media_post media_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_post
    ADD CONSTRAINT media_post_pkey PRIMARY KEY (id);


--
-- TOC entry 4831 (class 2606 OID 16408)
-- Name: media_respublic media_respublic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_respublic
    ADD CONSTRAINT media_respublic_pkey PRIMARY KEY (id);


--
-- TOC entry 4833 (class 2606 OID 16423)
-- Name: post_forum post_forum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_forum
    ADD CONSTRAINT post_forum_pkey PRIMARY KEY (id);


--
-- TOC entry 4829 (class 2606 OID 16398)
-- Name: respublic respublic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respublic
    ADD CONSTRAINT respublic_pkey PRIMARY KEY (id);


--
-- TOC entry 4837 (class 2606 OID 16434)
-- Name: media_post media_post_id_post_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_post
    ADD CONSTRAINT media_post_id_post_fkey FOREIGN KEY (id_post) REFERENCES public.post_forum(id) ON DELETE CASCADE;


--
-- TOC entry 4836 (class 2606 OID 16409)
-- Name: media_respublic media_respublic_id_respublic_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media_respublic
    ADD CONSTRAINT media_respublic_id_respublic_fkey FOREIGN KEY (id_respublic) REFERENCES public.respublic(id) ON DELETE CASCADE;


-- Completed on 2026-02-18 11:36:47

--
-- PostgreSQL database dump complete
--

\unrestrict NnLA9ZULIbY2nI14JoxnVhBEqVTLe1n6C7Xspn7Q71phhcNOO7Qmx3QZMusokSX


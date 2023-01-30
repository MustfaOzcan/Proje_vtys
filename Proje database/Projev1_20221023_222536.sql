--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: kalori_toplam(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kalori_toplam() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE 
toplam INTEGER;
BEGIN 
toplam:=(SELECT SUM("urun_kalori")FROM "tbl_urun");
RETURN toplam;
END;
$$;


ALTER FUNCTION public.kalori_toplam() OWNER TO postgres;

--
-- Name: maxkalori(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.maxkalori() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE 
MAKS INTEGER;
BEGIN 
MAKS:=(SELECT MAX("urun_kalori")FROM "tbl_urun");
RETURN MAKS;
END;
$$;


ALTER FUNCTION public.maxkalori() OWNER TO postgres;

--
-- Name: minkalori(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.minkalori() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE 
MAKS INTEGER;
BEGIN 
MAKS:=(SELECT MIN("urun_kalori")FROM "tbl_urun");
RETURN MAKS;
END;
$$;


ALTER FUNCTION public.minkalori() OWNER TO postgres;

--
-- Name: silindi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.silindi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO tbl_silinenler (id_s,ad_s)
VALUES(OLD.urun_id,OLD.urun_ad);
RETURN NEW;
END;
$$;


ALTER FUNCTION public.silindi() OWNER TO postgres;

--
-- Name: toplam_urun(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplam_urun() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN 
UPDATE tbl_uruntoplam SET urunsayisi=urunsayisi+1;
return new;
END;
$$;


ALTER FUNCTION public.toplam_urun() OWNER TO postgres;

--
-- Name: toplam_urun2(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplam_urun2() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN 
UPDATE tbl_uruntoplam SET urunsayisi=urunsayisi-1;
return new;
END;
$$;


ALTER FUNCTION public.toplam_urun2() OWNER TO postgres;

--
-- Name: urun_sayac(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.urun_sayac() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
total INTEGER;
BEGIN 
SELECT COUNT(*) INTO total FROM "tbl_urun";
RETURN total;
END;
$$;


ALTER FUNCTION public.urun_sayac() OWNER TO postgres;

--
-- Name: urun_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.urun_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."urun_fiyat" <> OLD."urun_fiyat" THEN
        INSERT INTO "tbl_urunson"("urun_no", "eski_fiyat", "yeni_fiyat")
        VALUES(OLD."urun_id", OLD."urun_fiyat", NEW."urun_fiyat");
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.urun_update() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tbl_kurye; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_kurye (
    kisi_id integer NOT NULL
);


ALTER TABLE public.tbl_kurye OWNER TO postgres;

--
-- Name: Tbl_Kurye_kisi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tbl_Kurye_kisi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tbl_Kurye_kisi_id_seq" OWNER TO postgres;

--
-- Name: Tbl_Kurye_kisi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tbl_Kurye_kisi_id_seq" OWNED BY public.tbl_kurye.kisi_id;


--
-- Name: tbl_fatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_fatura (
    fatura_id integer NOT NULL,
    fatura_tarih date NOT NULL
);


ALTER TABLE public.tbl_fatura OWNER TO postgres;

--
-- Name: tbl_Fatura_fatura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Fatura_fatura_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Fatura_fatura_id_seq" OWNER TO postgres;

--
-- Name: tbl_Fatura_fatura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Fatura_fatura_id_seq" OWNED BY public.tbl_fatura.fatura_id;


--
-- Name: tbl_kisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_kisi (
    kisi_id integer NOT NULL,
    kisi_ad character varying NOT NULL,
    kisi_soyad character varying NOT NULL,
    kisi_tel character varying NOT NULL,
    kisi_tur character varying NOT NULL
);


ALTER TABLE public.tbl_kisi OWNER TO postgres;

--
-- Name: tbl_Kisi_kisi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Kisi_kisi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Kisi_kisi_id_seq" OWNER TO postgres;

--
-- Name: tbl_Kisi_kisi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Kisi_kisi_id_seq" OWNED BY public.tbl_kisi.kisi_id;


--
-- Name: tbl_malzeme_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_malzeme_kategori (
    mal_kategori_id integer NOT NULL,
    malzeme_id integer NOT NULL,
    mal_kategori_adi character varying NOT NULL
);


ALTER TABLE public.tbl_malzeme_kategori OWNER TO postgres;

--
-- Name: tbl_MalzemeKategori_mal_kategori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_MalzemeKategori_mal_kategori_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_MalzemeKategori_mal_kategori_id_seq" OWNER TO postgres;

--
-- Name: tbl_MalzemeKategori_mal_kategori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_MalzemeKategori_mal_kategori_id_seq" OWNED BY public.tbl_malzeme_kategori.mal_kategori_id;


--
-- Name: tbl_musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_musteri (
    kisi_id integer NOT NULL,
    kisi_id_temsilci integer NOT NULL
);


ALTER TABLE public.tbl_musteri OWNER TO postgres;

--
-- Name: tbl_Musteri_kisi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Musteri_kisi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Musteri_kisi_id_seq" OWNER TO postgres;

--
-- Name: tbl_Musteri_kisi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Musteri_kisi_id_seq" OWNED BY public.tbl_musteri.kisi_id;


--
-- Name: tbl_Musteri_kisi_id_temsilci_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Musteri_kisi_id_temsilci_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Musteri_kisi_id_temsilci_seq" OWNER TO postgres;

--
-- Name: tbl_Musteri_kisi_id_temsilci_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Musteri_kisi_id_temsilci_seq" OWNED BY public.tbl_musteri.kisi_id_temsilci;


--
-- Name: tbl_personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_personel (
    kisi_id integer NOT NULL,
    kisi_id_sef integer NOT NULL
);


ALTER TABLE public.tbl_personel OWNER TO postgres;

--
-- Name: tbl_Personel_kisi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Personel_kisi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Personel_kisi_id_seq" OWNER TO postgres;

--
-- Name: tbl_Personel_kisi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Personel_kisi_id_seq" OWNED BY public.tbl_personel.kisi_id;


--
-- Name: tbl_sef; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_sef (
    kisi_id integer NOT NULL
);


ALTER TABLE public.tbl_sef OWNER TO postgres;

--
-- Name: tbl_Sef_kisi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Sef_kisi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Sef_kisi_id_seq" OWNER TO postgres;

--
-- Name: tbl_Sef_kisi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Sef_kisi_id_seq" OWNED BY public.tbl_sef.kisi_id;


--
-- Name: tbl_siparis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_siparis (
    siparis_id integer NOT NULL,
    siparis_tarih date,
    siparis_tutar integer NOT NULL,
    kisi_id_musteri integer NOT NULL,
    kisi_id_kurye integer NOT NULL,
    fatura_id integer NOT NULL
);


ALTER TABLE public.tbl_siparis OWNER TO postgres;

--
-- Name: tbl_Siparis_siparis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Siparis_siparis_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Siparis_siparis_id_seq" OWNER TO postgres;

--
-- Name: tbl_Siparis_siparis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Siparis_siparis_id_seq" OWNED BY public.tbl_siparis.siparis_id;


--
-- Name: tbl_tedarik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_tedarik (
    tedarik_id integer NOT NULL,
    tedarik_adi character varying NOT NULL,
    tedarikci_ad character varying NOT NULL
);


ALTER TABLE public.tbl_tedarik OWNER TO postgres;

--
-- Name: tbl_Tedarik_tedarik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Tedarik_tedarik_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Tedarik_tedarik_id_seq" OWNER TO postgres;

--
-- Name: tbl_Tedarik_tedarik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Tedarik_tedarik_id_seq" OWNED BY public.tbl_tedarik.tedarik_id;


--
-- Name: tbl_temsilci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_temsilci (
    kisi_id integer NOT NULL
);


ALTER TABLE public.tbl_temsilci OWNER TO postgres;

--
-- Name: tbl_Temsilci_kisi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Temsilci_kisi_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Temsilci_kisi_id_seq" OWNER TO postgres;

--
-- Name: tbl_Temsilci_kisi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Temsilci_kisi_id_seq" OWNED BY public.tbl_temsilci.kisi_id;


--
-- Name: tbl_urunkategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_urunkategori (
    "UrunKategori_id" integer NOT NULL,
    urun_id integer NOT NULL
);


ALTER TABLE public.tbl_urunkategori OWNER TO postgres;

--
-- Name: tbl_UrunKategori_UrunKategori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_UrunKategori_UrunKategori_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_UrunKategori_UrunKategori_id_seq" OWNER TO postgres;

--
-- Name: tbl_UrunKategori_UrunKategori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_UrunKategori_UrunKategori_id_seq" OWNED BY public.tbl_urunkategori."UrunKategori_id";


--
-- Name: tbl_urun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_urun (
    urun_id integer NOT NULL,
    urun_ad character varying NOT NULL,
    urun_fiyat integer NOT NULL,
    urun_kategori_no integer NOT NULL,
    kisi_id_sef integer NOT NULL,
    urun_miktar integer NOT NULL,
    urun_kalori integer NOT NULL
);


ALTER TABLE public.tbl_urun OWNER TO postgres;

--
-- Name: tbl_Urun_urun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tbl_Urun_urun_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."tbl_Urun_urun_id_seq" OWNER TO postgres;

--
-- Name: tbl_Urun_urun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tbl_Urun_urun_id_seq" OWNED BY public.tbl_urun.urun_id;


--
-- Name: tbl_malzeme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_malzeme (
    malzeme_id integer NOT NULL,
    malzeme_ad character varying NOT NULL,
    malzeme_stok integer NOT NULL,
    malzeme_fiyat integer NOT NULL,
    tedarikci_id integer NOT NULL
);


ALTER TABLE public.tbl_malzeme OWNER TO postgres;

--
-- Name: tbl_malzeme_urun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_malzeme_urun (
    urun_id integer NOT NULL,
    malzeme_id integer NOT NULL
);


ALTER TABLE public.tbl_malzeme_urun OWNER TO postgres;

--
-- Name: tbl_silinenler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_silinenler (
    ad_s character varying NOT NULL,
    id_s integer NOT NULL
);


ALTER TABLE public.tbl_silinenler OWNER TO postgres;

--
-- Name: tbl_urunsiparis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_urunsiparis (
    siparis_id integer NOT NULL,
    urun_id integer NOT NULL,
    siparis_tutari integer NOT NULL
);


ALTER TABLE public.tbl_urunsiparis OWNER TO postgres;

--
-- Name: tbl_urunson; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_urunson (
    urun_no integer NOT NULL,
    eski_fiyat integer NOT NULL,
    yeni_fiyat integer NOT NULL
);


ALTER TABLE public.tbl_urunson OWNER TO postgres;

--
-- Name: tbl_uruntoplam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_uruntoplam (
    urunsayisi integer NOT NULL
);


ALTER TABLE public.tbl_uruntoplam OWNER TO postgres;

--
-- Name: tbl_fatura fatura_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_fatura ALTER COLUMN fatura_id SET DEFAULT nextval('public."tbl_Fatura_fatura_id_seq"'::regclass);


--
-- Name: tbl_kisi kisi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_kisi ALTER COLUMN kisi_id SET DEFAULT nextval('public."tbl_Kisi_kisi_id_seq"'::regclass);


--
-- Name: tbl_kurye kisi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_kurye ALTER COLUMN kisi_id SET DEFAULT nextval('public."Tbl_Kurye_kisi_id_seq"'::regclass);


--
-- Name: tbl_malzeme_kategori mal_kategori_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_malzeme_kategori ALTER COLUMN mal_kategori_id SET DEFAULT nextval('public."tbl_MalzemeKategori_mal_kategori_id_seq"'::regclass);


--
-- Name: tbl_musteri kisi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_musteri ALTER COLUMN kisi_id SET DEFAULT nextval('public."tbl_Musteri_kisi_id_seq"'::regclass);


--
-- Name: tbl_musteri kisi_id_temsilci; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_musteri ALTER COLUMN kisi_id_temsilci SET DEFAULT nextval('public."tbl_Musteri_kisi_id_temsilci_seq"'::regclass);


--
-- Name: tbl_personel kisi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_personel ALTER COLUMN kisi_id SET DEFAULT nextval('public."tbl_Personel_kisi_id_seq"'::regclass);


--
-- Name: tbl_sef kisi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_sef ALTER COLUMN kisi_id SET DEFAULT nextval('public."tbl_Sef_kisi_id_seq"'::regclass);


--
-- Name: tbl_siparis siparis_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_siparis ALTER COLUMN siparis_id SET DEFAULT nextval('public."tbl_Siparis_siparis_id_seq"'::regclass);


--
-- Name: tbl_tedarik tedarik_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_tedarik ALTER COLUMN tedarik_id SET DEFAULT nextval('public."tbl_Tedarik_tedarik_id_seq"'::regclass);


--
-- Name: tbl_temsilci kisi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_temsilci ALTER COLUMN kisi_id SET DEFAULT nextval('public."tbl_Temsilci_kisi_id_seq"'::regclass);


--
-- Name: tbl_urun urun_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_urun ALTER COLUMN urun_id SET DEFAULT nextval('public."tbl_Urun_urun_id_seq"'::regclass);


--
-- Name: tbl_urunkategori UrunKategori_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_urunkategori ALTER COLUMN "UrunKategori_id" SET DEFAULT nextval('public."tbl_UrunKategori_UrunKategori_id_seq"'::regclass);


--
-- Data for Name: tbl_fatura; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_kisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_kisi VALUES
	(1, 'acun', 'ılıcalı', '455611651', 'Şef'),
	(2, 'fatih', 'terim', '564416516', 'Personel'),
	(3, 'murat', 'boz', '561626512', 'Kurye'),
	(4, 'aleyna', 'tilki', '658952652', 'Müşteri'),
	(5, 'cem ', 'yılmaz', '625665265', 'Temsilci');


--
-- Data for Name: tbl_kurye; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_malzeme; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_malzeme_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_malzeme_urun; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_musteri; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_personel; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_sef; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_sef VALUES
	(1);


--
-- Data for Name: tbl_silinenler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_silinenler VALUES
	('su', 3),
	('baklava', 5),
	('baklava', 5),
	('dondurma', 7),
	('şöbiyet', 7);


--
-- Data for Name: tbl_siparis; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_tedarik; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_temsilci; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_urun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_urun VALUES
	(1, 'pasta', 100, 1, 1, 100, 1000),
	(2, 'limonata', 50, 2, 1, 75, 650),
	(3, 'su', 100, 3, 1, 100, 150),
	(4, 'kola', 80, 4, 1, 90, 250),
	(5, 'baklava', 150, 5, 1, 70, 1510),
	(6, 'kurabiye', 40, 6, 1, 80, 420),
	(7, 'şöbiyet', 80, 7, 1, 80, 750);


--
-- Data for Name: tbl_urunkategori; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_urunsiparis; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tbl_urunson; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_urunson VALUES
	(4, 16, 40),
	(4, 40, 80),
	(7, 40, 80);


--
-- Data for Name: tbl_uruntoplam; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tbl_uruntoplam VALUES
	(7);


--
-- Name: Tbl_Kurye_kisi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tbl_Kurye_kisi_id_seq"', 1, false);


--
-- Name: tbl_Fatura_fatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Fatura_fatura_id_seq"', 1, false);


--
-- Name: tbl_Kisi_kisi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Kisi_kisi_id_seq"', 7, true);


--
-- Name: tbl_MalzemeKategori_mal_kategori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_MalzemeKategori_mal_kategori_id_seq"', 1, false);


--
-- Name: tbl_Musteri_kisi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Musteri_kisi_id_seq"', 1, false);


--
-- Name: tbl_Musteri_kisi_id_temsilci_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Musteri_kisi_id_temsilci_seq"', 1, false);


--
-- Name: tbl_Personel_kisi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Personel_kisi_id_seq"', 1, false);


--
-- Name: tbl_Sef_kisi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Sef_kisi_id_seq"', 1, true);


--
-- Name: tbl_Siparis_siparis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Siparis_siparis_id_seq"', 1, false);


--
-- Name: tbl_Tedarik_tedarik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Tedarik_tedarik_id_seq"', 1, false);


--
-- Name: tbl_Temsilci_kisi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Temsilci_kisi_id_seq"', 1, false);


--
-- Name: tbl_UrunKategori_UrunKategori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_UrunKategori_UrunKategori_id_seq"', 1, false);


--
-- Name: tbl_Urun_urun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tbl_Urun_urun_id_seq"', 1, false);


--
-- Name: tbl_kurye Tbl_Kurye_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_kurye
    ADD CONSTRAINT "Tbl_Kurye_pkey" PRIMARY KEY (kisi_id);


--
-- Name: tbl_fatura tbl_Fatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_fatura
    ADD CONSTRAINT "tbl_Fatura_pkey" PRIMARY KEY (fatura_id);


--
-- Name: tbl_kisi tbl_Kisi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_kisi
    ADD CONSTRAINT "tbl_Kisi_pkey" PRIMARY KEY (kisi_id);


--
-- Name: tbl_malzeme_urun tbl_Malzeme/Urun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_malzeme_urun
    ADD CONSTRAINT "tbl_Malzeme/Urun_pkey" PRIMARY KEY (malzeme_id, urun_id);


--
-- Name: tbl_malzeme_kategori tbl_MalzemeKategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_malzeme_kategori
    ADD CONSTRAINT "tbl_MalzemeKategori_pkey" PRIMARY KEY (mal_kategori_id);


--
-- Name: tbl_malzeme tbl_Malzeme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_malzeme
    ADD CONSTRAINT "tbl_Malzeme_pkey" PRIMARY KEY (malzeme_id);


--
-- Name: tbl_musteri tbl_Musteri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_musteri
    ADD CONSTRAINT "tbl_Musteri_pkey" PRIMARY KEY (kisi_id);


--
-- Name: tbl_personel tbl_Personel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_personel
    ADD CONSTRAINT "tbl_Personel_pkey" PRIMARY KEY (kisi_id);


--
-- Name: tbl_sef tbl_Sef_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_sef
    ADD CONSTRAINT "tbl_Sef_pkey" PRIMARY KEY (kisi_id);


--
-- Name: tbl_siparis tbl_Siparis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_siparis
    ADD CONSTRAINT "tbl_Siparis_pkey" PRIMARY KEY (siparis_id);


--
-- Name: tbl_tedarik tbl_Tedarik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_tedarik
    ADD CONSTRAINT "tbl_Tedarik_pkey" PRIMARY KEY (tedarik_id);


--
-- Name: tbl_temsilci tbl_Temsilci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_temsilci
    ADD CONSTRAINT "tbl_Temsilci_pkey" PRIMARY KEY (kisi_id);


--
-- Name: tbl_urunsiparis tbl_Urun/Siparis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_urunsiparis
    ADD CONSTRAINT "tbl_Urun/Siparis_pkey" PRIMARY KEY (siparis_id, urun_id);


--
-- Name: tbl_urunkategori tbl_UrunKategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_urunkategori
    ADD CONSTRAINT "tbl_UrunKategori_pkey" PRIMARY KEY ("UrunKategori_id");


--
-- Name: tbl_urun tbl_Urun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_urun
    ADD CONSTRAINT "tbl_Urun_pkey" PRIMARY KEY (urun_id);


--
-- Name: tbl_uruntoplam tbl_uruntoplam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_uruntoplam
    ADD CONSTRAINT tbl_uruntoplam_pkey PRIMARY KEY (urunsayisi);


--
-- Name: fki_f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_f ON public.tbl_musteri USING btree (kisi_id);


--
-- Name: fki_fk_fatura_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_fatura_id ON public.tbl_siparis USING btree (fatura_id);


--
-- Name: fki_fk_kisi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_kisi ON public.tbl_personel USING btree (kisi_id);


--
-- Name: fki_fk_kisi_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_kisi_id ON public.tbl_kurye USING btree (kisi_id);


--
-- Name: fki_fk_kisi_id_kurye; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_kisi_id_kurye ON public.tbl_siparis USING btree (kisi_id_kurye);


--
-- Name: fki_fk_kisi_id_musteri; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_kisi_id_musteri ON public.tbl_siparis USING btree (kisi_id_musteri);


--
-- Name: fki_fk_kisi_id_sef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_kisi_id_sef ON public.tbl_personel USING btree (kisi_id_sef);


--
-- Name: fki_fk_malzeme_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_malzeme_id ON public.tbl_malzeme_kategori USING btree (malzeme_id);


--
-- Name: fki_fk_mazleme_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_mazleme_id ON public.tbl_malzeme_urun USING btree (malzeme_id);


--
-- Name: fki_fk_sef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_sef ON public.tbl_sef USING btree (kisi_id);


--
-- Name: fki_fk_siparis_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_siparis_id ON public.tbl_urunsiparis USING btree (siparis_id);


--
-- Name: fki_fk_tedarikci; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_tedarikci ON public.tbl_malzeme USING btree (tedarikci_id);


--
-- Name: fki_fk_urun_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_urun_id ON public.tbl_urunsiparis USING btree (urun_id);


--
-- Name: fki_k; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_k ON public.tbl_musteri USING btree (kisi_id_temsilci);


--
-- Name: fki_pk_fk kisi_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_pk_fk kisi_id" ON public.tbl_musteri USING btree (kisi_id);


--
-- Name: tbl_urun toplam_urun; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER toplam_urun AFTER INSERT ON public.tbl_urun FOR EACH ROW EXECUTE FUNCTION public.toplam_urun();


--
-- Name: tbl_urun toplam_urun2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER toplam_urun2 AFTER DELETE ON public.tbl_urun FOR EACH ROW EXECUTE FUNCTION public.toplam_urun2();


--
-- Name: tbl_urun urun_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER urun_update BEFORE UPDATE ON public.tbl_urun FOR EACH ROW EXECUTE FUNCTION public.urun_update();


--
-- Name: tbl_urun urunsilindi; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER urunsilindi AFTER DELETE ON public.tbl_urun FOR EACH ROW EXECUTE FUNCTION public.silindi();


--
-- Name: tbl_siparis fk_fatura_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_siparis
    ADD CONSTRAINT fk_fatura_id FOREIGN KEY (fatura_id) REFERENCES public.tbl_fatura(fatura_id);


--
-- Name: tbl_personel fk_kisi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_personel
    ADD CONSTRAINT fk_kisi FOREIGN KEY (kisi_id) REFERENCES public.tbl_kisi(kisi_id);


--
-- Name: tbl_kurye fk_kisi_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_kurye
    ADD CONSTRAINT fk_kisi_id FOREIGN KEY (kisi_id) REFERENCES public.tbl_kisi(kisi_id);


--
-- Name: tbl_temsilci fk_kisi_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_temsilci
    ADD CONSTRAINT fk_kisi_id FOREIGN KEY (kisi_id) REFERENCES public.tbl_kisi(kisi_id);


--
-- Name: tbl_siparis fk_kisi_id_kurye; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_siparis
    ADD CONSTRAINT fk_kisi_id_kurye FOREIGN KEY (kisi_id_kurye) REFERENCES public.tbl_kurye(kisi_id);


--
-- Name: tbl_siparis fk_kisi_id_musteri; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_siparis
    ADD CONSTRAINT fk_kisi_id_musteri FOREIGN KEY (kisi_id_musteri) REFERENCES public.tbl_musteri(kisi_id);


--
-- Name: tbl_personel fk_kisi_id_sef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_personel
    ADD CONSTRAINT fk_kisi_id_sef FOREIGN KEY (kisi_id_sef) REFERENCES public.tbl_sef(kisi_id);


--
-- Name: tbl_urun fk_kisi_id_sef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_urun
    ADD CONSTRAINT fk_kisi_id_sef FOREIGN KEY (kisi_id_sef) REFERENCES public.tbl_sef(kisi_id);


--
-- Name: tbl_musteri fk_kisi_id_temsilci; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_musteri
    ADD CONSTRAINT fk_kisi_id_temsilci FOREIGN KEY (kisi_id_temsilci) REFERENCES public.tbl_kisi(kisi_id);


--
-- Name: tbl_malzeme_kategori fk_malzeme_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_malzeme_kategori
    ADD CONSTRAINT fk_malzeme_id FOREIGN KEY (malzeme_id) REFERENCES public.tbl_malzeme(malzeme_id);


--
-- Name: tbl_malzeme_urun fk_mazleme_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_malzeme_urun
    ADD CONSTRAINT fk_mazleme_id FOREIGN KEY (malzeme_id) REFERENCES public.tbl_malzeme(malzeme_id);


--
-- Name: tbl_sef fk_sef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_sef
    ADD CONSTRAINT fk_sef FOREIGN KEY (kisi_id) REFERENCES public.tbl_kisi(kisi_id);


--
-- Name: tbl_urunsiparis fk_siparis_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_urunsiparis
    ADD CONSTRAINT fk_siparis_id FOREIGN KEY (siparis_id) REFERENCES public.tbl_siparis(siparis_id);


--
-- Name: tbl_malzeme fk_tedarikci; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_malzeme
    ADD CONSTRAINT fk_tedarikci FOREIGN KEY (tedarikci_id) REFERENCES public.tbl_tedarik(tedarik_id);


--
-- Name: tbl_urunsiparis fk_urun_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_urunsiparis
    ADD CONSTRAINT fk_urun_id FOREIGN KEY (urun_id) REFERENCES public.tbl_urun(urun_id);


--
-- Name: tbl_urunkategori fk_urun_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_urunkategori
    ADD CONSTRAINT fk_urun_id FOREIGN KEY (urun_id) REFERENCES public.tbl_urun(urun_id);


--
-- Name: tbl_malzeme_urun fk_urun_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_malzeme_urun
    ADD CONSTRAINT fk_urun_id FOREIGN KEY (urun_id) REFERENCES public.tbl_urun(urun_id);


--
-- Name: tbl_musteri pk_fk kisi_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_musteri
    ADD CONSTRAINT "pk_fk kisi_id" FOREIGN KEY (kisi_id) REFERENCES public.tbl_kisi(kisi_id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 13.12 (Debian 13.12-1.pgdg120+1)
-- Dumped by pg_dump version 13.12 (Debian 13.12-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: PromoterApp_pricevariation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PromoterApp_pricevariation" (
    id bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public."PromoterApp_pricevariation" OWNER TO postgres;

--
-- Name: PromoterApp_pricevariation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."PromoterApp_pricevariation" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."PromoterApp_pricevariation_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: PromoterApp_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PromoterApp_product" (
    id bigint NOT NULL,
    name character varying(350) NOT NULL,
    ean character varying(13) NOT NULL,
    image character varying(100),
    min_price numeric(8,2),
    max_price numeric(8,2),
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public."PromoterApp_product" OWNER TO postgres;

--
-- Name: PromoterApp_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."PromoterApp_product" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."PromoterApp_product_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: admin_interface_theme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_interface_theme (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    active boolean NOT NULL,
    title character varying(50) NOT NULL,
    title_visible boolean NOT NULL,
    logo character varying(100) NOT NULL,
    logo_visible boolean NOT NULL,
    css_header_background_color character varying(10) NOT NULL,
    title_color character varying(10) NOT NULL,
    css_header_text_color character varying(10) NOT NULL,
    css_header_link_color character varying(10) NOT NULL,
    css_header_link_hover_color character varying(10) NOT NULL,
    css_module_background_color character varying(10) NOT NULL,
    css_module_text_color character varying(10) NOT NULL,
    css_module_link_color character varying(10) NOT NULL,
    css_module_link_hover_color character varying(10) NOT NULL,
    css_module_rounded_corners boolean NOT NULL,
    css_generic_link_color character varying(10) NOT NULL,
    css_generic_link_hover_color character varying(10) NOT NULL,
    css_save_button_background_color character varying(10) NOT NULL,
    css_save_button_background_hover_color character varying(10) NOT NULL,
    css_save_button_text_color character varying(10) NOT NULL,
    css_delete_button_background_color character varying(10) NOT NULL,
    css_delete_button_background_hover_color character varying(10) NOT NULL,
    css_delete_button_text_color character varying(10) NOT NULL,
    list_filter_dropdown boolean NOT NULL,
    related_modal_active boolean NOT NULL,
    related_modal_background_color character varying(10) NOT NULL,
    related_modal_rounded_corners boolean NOT NULL,
    logo_color character varying(10) NOT NULL,
    recent_actions_visible boolean NOT NULL,
    favicon character varying(100) NOT NULL,
    related_modal_background_opacity character varying(5) NOT NULL,
    env_name character varying(50) NOT NULL,
    env_visible_in_header boolean NOT NULL,
    env_color character varying(10) NOT NULL,
    env_visible_in_favicon boolean NOT NULL,
    related_modal_close_button_visible boolean NOT NULL,
    language_chooser_active boolean NOT NULL,
    language_chooser_display character varying(10) NOT NULL,
    list_filter_sticky boolean NOT NULL,
    form_pagination_sticky boolean NOT NULL,
    form_submit_sticky boolean NOT NULL,
    css_module_background_selected_color character varying(10) NOT NULL,
    css_module_link_selected_color character varying(10) NOT NULL,
    logo_max_height smallint NOT NULL,
    logo_max_width smallint NOT NULL,
    foldable_apps boolean NOT NULL,
    language_chooser_control character varying(20) NOT NULL,
    list_filter_highlight boolean NOT NULL,
    list_filter_removal_links boolean NOT NULL,
    show_fieldsets_as_tabs boolean NOT NULL,
    show_inlines_as_tabs boolean NOT NULL,
    css_generic_link_active_color character varying(10) NOT NULL,
    collapsible_stacked_inlines boolean NOT NULL,
    collapsible_stacked_inlines_collapsed boolean NOT NULL,
    collapsible_tabular_inlines boolean NOT NULL,
    collapsible_tabular_inlines_collapsed boolean NOT NULL,
    CONSTRAINT admin_interface_theme_logo_max_height_check CHECK ((logo_max_height >= 0)),
    CONSTRAINT admin_interface_theme_logo_max_width_check CHECK ((logo_max_width >= 0))
);


ALTER TABLE public.admin_interface_theme OWNER TO postgres;

--
-- Name: admin_interface_theme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.admin_interface_theme ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.admin_interface_theme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Data for Name: PromoterApp_pricevariation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PromoterApp_pricevariation" (id, price, created_at, product_id) FROM stdin;
1	12.50	2023-10-01 13:14:21.108+00	1
2	13.00	2023-10-01 14:14:21.108+00	1
3	18.00	2023-10-03 15:14:21.108+00	1
4	19.50	2023-10-04 16:14:21.108+00	1
5	8.50	2023-10-05 17:14:21.108+00	1
6	9.00	2023-10-06 18:14:21.108+00	1
7	10.50	2023-10-07 19:14:21.108+00	1
8	11.00	2023-10-08 20:14:21.108+00	2
9	16.00	2023-10-09 21:14:21.108+00	2
10	16.50	2023-10-09 22:14:21.108+00	2
11	14.00	2023-10-11 23:14:21.108+00	2
12	14.50	2023-10-13 00:14:21.108+00	2
13	22.00	2023-10-14 01:14:21.108+00	2
14	23.00	2023-10-15 02:14:21.108+00	3
15	19.50	2023-10-15 03:14:21.108+00	3
16	20.00	2023-10-16 04:14:21.108+00	3
17	10.00	2023-10-16 05:14:21.108+00	3
18	10.50	2023-10-18 06:14:21.108+00	3
19	13.00	2023-10-19 07:14:21.108+00	3
20	13.50	2023-10-20 08:14:21.108+00	4
21	28.00	2023-10-21 09:14:21.108+00	4
22	28.50	2023-10-21 10:14:21.108+00	4
23	16.00	2023-10-21 11:14:21.108+00	4
24	17.00	2023-10-24 12:14:21.108+00	4
25	20.00	2023-10-25 13:14:21.108+00	4
26	20.50	2023-10-26 14:14:21.108+00	5
27	22.50	2023-10-27 15:14:21.108+00	5
28	23.00	2023-10-28 16:14:21.108+00	5
29	17.50	2023-10-29 17:14:21.108+00	5
30	18.00	2023-10-30 18:14:21.108+00	5
31	15.00	2023-10-31 19:14:21.108+00	5
32	15.50	2023-11-01 20:14:21.108+00	6
33	14.00	2023-11-02 21:14:21.108+00	6
34	14.50	2023-11-03 22:14:21.108+00	6
35	19.00	2023-11-04 23:14:21.108+00	6
36	19.50	2023-11-06 00:14:21.108+00	6
37	23.50	2023-11-07 01:14:21.108+00	6
38	24.00	2023-11-08 02:14:21.108+00	7
39	11.50	2023-11-08 03:14:21.108+00	7
40	12.00	2023-11-09 04:14:21.108+00	7
41	13.50	2023-11-10 05:14:21.108+00	7
42	14.00	2023-11-11 06:14:21.108+00	7
43	21.00	2023-11-12 07:14:21.108+00	7
44	21.50	2023-11-13 08:14:21.108+00	8
45	22.50	2023-11-14 09:14:21.108+00	8
46	23.00	2023-11-15 10:14:21.108+00	8
47	27.00	2023-11-16 11:14:21.108+00	8
48	27.50	2023-11-17 12:14:21.108+00	8
49	28.00	2023-11-18 13:14:21.108+00	8
50	29.00	2023-11-19 14:14:21.108+00	9
51	30.00	2023-11-20 15:14:21.108+00	9
52	30.50	2023-11-21 16:14:21.108+00	9
53	32.50	2023-11-22 17:14:21.108+00	9
54	33.00	2023-11-23 18:14:21.108+00	9
55	35.50	2023-11-24 19:14:21.108+00	9
56	36.00	2023-11-25 20:14:21.108+00	10
57	38.50	2023-11-26 21:14:21.108+00	10
58	39.00	2023-11-27 22:14:21.108+00	10
59	40.00	2023-11-28 23:14:21.108+00	10
60	40.50	2023-11-30 00:14:21.108+00	10
\.


--
-- Data for Name: PromoterApp_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PromoterApp_product" (id, name, ean, image, min_price, max_price, created_at) FROM stdin;
1	Produto A	1234567890123	produtos/cafeteira.jpeg	10.00	20.00	2023-10-06 19:14:21.108+00
2	Produto B	9876543210987	produtos/caixa_de_som.jpeg	15.00	25.00	2023-10-06 19:14:21.108+00
3	Produto C	5432167890123	produtos/camera.jpg	8.00	24.00	2023-10-06 19:14:21.108+00
4	Produto D	1234567890124	produtos/computador.jpeg	9.00	30.00	2023-10-06 19:14:21.108+00
5	Produto E	9876543210986	produtos/drone.jpg	14.00	24.00	2023-10-06 19:14:21.108+00
6	Produto F	5432167890125	produtos/impressora.jpeg	12.00	25.00	2023-10-06 19:14:21.108+00
7	Produto G	1234567890126	produtos/oculos.jpg	16.00	26.00	2023-10-06 19:14:21.108+00
8	Produto H	9876543210985	produtos/relogio.jpg	13.00	28.00	2023-10-06 19:14:21.108+00
9	Produto I	5432167890127	produtos/robo.jpeg	20.00	36.00	2023-10-06 19:14:21.108+00
10	Produto J	1234567890128	produtos/tablet.jpg	30.00	45.00	2023-10-06 19:14:21.108+00
\.


--
-- Data for Name: admin_interface_theme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_interface_theme (id, name, active, title, title_visible, logo, logo_visible, css_header_background_color, title_color, css_header_text_color, css_header_link_color, css_header_link_hover_color, css_module_background_color, css_module_text_color, css_module_link_color, css_module_link_hover_color, css_module_rounded_corners, css_generic_link_color, css_generic_link_hover_color, css_save_button_background_color, css_save_button_background_hover_color, css_save_button_text_color, css_delete_button_background_color, css_delete_button_background_hover_color, css_delete_button_text_color, list_filter_dropdown, related_modal_active, related_modal_background_color, related_modal_rounded_corners, logo_color, recent_actions_visible, favicon, related_modal_background_opacity, env_name, env_visible_in_header, env_color, env_visible_in_favicon, related_modal_close_button_visible, language_chooser_active, language_chooser_display, list_filter_sticky, form_pagination_sticky, form_submit_sticky, css_module_background_selected_color, css_module_link_selected_color, logo_max_height, logo_max_width, foldable_apps, language_chooser_control, list_filter_highlight, list_filter_removal_links, show_fieldsets_as_tabs, show_inlines_as_tabs, css_generic_link_active_color, collapsible_stacked_inlines, collapsible_stacked_inlines_collapsed, collapsible_tabular_inlines, collapsible_tabular_inlines_collapsed) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Theme	7	add_theme
26	Can change Theme	7	change_theme
27	Can delete Theme	7	delete_theme
28	Can view Theme	7	view_theme
29	Can add Produto	8	add_product
30	Can change Produto	8	change_product
31	Can delete Produto	8	delete_product
32	Can view Produto	8	view_product
33	Can add Variação de preço	9	add_pricevariation
34	Can change Variação de preço	9	change_pricevariation
35	Can delete Variação de preço	9	delete_pricevariation
36	Can view Variação de preço	9	view_pricevariation
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$600000$U8paOlOcJdHJvkhhe8Wreb$ubgGfMFTLPlDVxNrYUQYIqvlAgP3nrCn2uBJbCjW6t4=	\N	t	admin			admin@admin.com	t	t	2023-10-07 17:44:42.085061+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	admin_interface	theme
8	PromoterApp	product
9	PromoterApp	pricevariation
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	PromoterApp	0001_initial	2023-10-07 17:44:40.202515+00
2	contenttypes	0001_initial	2023-10-07 17:44:40.218692+00
3	auth	0001_initial	2023-10-07 17:44:40.406235+00
4	admin	0001_initial	2023-10-07 17:44:40.441391+00
5	admin	0002_logentry_remove_auto_add	2023-10-07 17:44:40.450026+00
6	admin	0003_logentry_add_action_flag_choices	2023-10-07 17:44:40.458643+00
7	admin_interface	0001_initial	2023-10-07 17:44:40.479928+00
8	admin_interface	0002_add_related_modal	2023-10-07 17:44:40.497751+00
9	admin_interface	0003_add_logo_color	2023-10-07 17:44:40.506353+00
10	admin_interface	0004_rename_title_color	2023-10-07 17:44:40.512248+00
11	admin_interface	0005_add_recent_actions_visible	2023-10-07 17:44:40.521492+00
12	admin_interface	0006_bytes_to_str	2023-10-07 17:44:40.570006+00
13	admin_interface	0007_add_favicon	2023-10-07 17:44:40.580408+00
14	admin_interface	0008_change_related_modal_background_opacity_type	2023-10-07 17:44:40.590227+00
15	admin_interface	0009_add_enviroment	2023-10-07 17:44:40.599269+00
16	admin_interface	0010_add_localization	2023-10-07 17:44:40.614682+00
17	admin_interface	0011_add_environment_options	2023-10-07 17:44:40.633709+00
18	admin_interface	0012_update_verbose_names	2023-10-07 17:44:40.643154+00
19	admin_interface	0013_add_related_modal_close_button	2023-10-07 17:44:40.652191+00
20	admin_interface	0014_name_unique	2023-10-07 17:44:40.668894+00
21	admin_interface	0015_add_language_chooser_active	2023-10-07 17:44:40.67488+00
22	admin_interface	0016_add_language_chooser_display	2023-10-07 17:44:40.683018+00
23	admin_interface	0017_change_list_filter_dropdown	2023-10-07 17:44:40.689691+00
24	admin_interface	0018_theme_list_filter_sticky	2023-10-07 17:44:40.696629+00
25	admin_interface	0019_add_form_sticky	2023-10-07 17:44:40.708086+00
26	admin_interface	0020_module_selected_colors	2023-10-07 17:44:40.725947+00
27	admin_interface	0021_file_extension_validator	2023-10-07 17:44:40.736625+00
28	admin_interface	0022_add_logo_max_width_and_height	2023-10-07 17:44:40.746753+00
29	admin_interface	0023_theme_foldable_apps	2023-10-07 17:44:40.755172+00
30	admin_interface	0024_remove_theme_css	2023-10-07 17:44:40.763121+00
31	admin_interface	0025_theme_language_chooser_control	2023-10-07 17:44:40.771034+00
32	admin_interface	0026_theme_list_filter_highlight	2023-10-07 17:44:40.778524+00
33	admin_interface	0027_theme_list_filter_removal_links	2023-10-07 17:44:40.787357+00
34	admin_interface	0028_theme_show_fieldsets_as_tabs_and_more	2023-10-07 17:44:40.797312+00
35	admin_interface	0029_theme_css_generic_link_active_color	2023-10-07 17:44:40.805074+00
36	admin_interface	0030_theme_collapsible_stacked_inlines_and_more	2023-10-07 17:44:40.823995+00
37	contenttypes	0002_remove_content_type_name	2023-10-07 17:44:40.841965+00
38	auth	0002_alter_permission_name_max_length	2023-10-07 17:44:40.855242+00
39	auth	0003_alter_user_email_max_length	2023-10-07 17:44:40.863749+00
40	auth	0004_alter_user_username_opts	2023-10-07 17:44:40.87467+00
41	auth	0005_alter_user_last_login_null	2023-10-07 17:44:40.884268+00
42	auth	0006_require_contenttypes_0002	2023-10-07 17:44:40.888801+00
43	auth	0007_alter_validators_add_error_messages	2023-10-07 17:44:40.899112+00
44	auth	0008_alter_user_username_max_length	2023-10-07 17:44:40.915682+00
45	auth	0009_alter_user_last_name_max_length	2023-10-07 17:44:40.924262+00
46	auth	0010_alter_group_name_max_length	2023-10-07 17:44:40.941056+00
47	auth	0011_update_proxy_permissions	2023-10-07 17:44:40.954275+00
48	auth	0012_alter_user_first_name_max_length	2023-10-07 17:44:40.967411+00
49	sessions	0001_initial	2023-10-07 17:44:40.996729+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: PromoterApp_pricevariation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PromoterApp_pricevariation_id_seq"', 60, true);


--
-- Name: PromoterApp_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PromoterApp_product_id_seq"', 11, true);


--
-- Name: admin_interface_theme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_interface_theme_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 49, true);


--
-- Name: PromoterApp_pricevariation PromoterApp_pricevariation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PromoterApp_pricevariation"
    ADD CONSTRAINT "PromoterApp_pricevariation_pkey" PRIMARY KEY (id);


--
-- Name: PromoterApp_product PromoterApp_product_ean_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PromoterApp_product"
    ADD CONSTRAINT "PromoterApp_product_ean_key" UNIQUE (ean);


--
-- Name: PromoterApp_product PromoterApp_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PromoterApp_product"
    ADD CONSTRAINT "PromoterApp_product_pkey" PRIMARY KEY (id);


--
-- Name: admin_interface_theme admin_interface_theme_name_30bda70f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_interface_theme
    ADD CONSTRAINT admin_interface_theme_name_30bda70f_uniq UNIQUE (name);


--
-- Name: admin_interface_theme admin_interface_theme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_interface_theme
    ADD CONSTRAINT admin_interface_theme_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: PromoterApp_pricevariation_product_id_9da9944b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PromoterApp_pricevariation_product_id_9da9944b" ON public."PromoterApp_pricevariation" USING btree (product_id);


--
-- Name: PromoterApp_product_ean_59f4d62d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PromoterApp_product_ean_59f4d62d_like" ON public."PromoterApp_product" USING btree (ean varchar_pattern_ops);


--
-- Name: admin_interface_theme_name_30bda70f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_interface_theme_name_30bda70f_like ON public.admin_interface_theme USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: PromoterApp_pricevariation PromoterApp_pricevar_product_id_9da9944b_fk_PromoterA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PromoterApp_pricevariation"
    ADD CONSTRAINT "PromoterApp_pricevar_product_id_9da9944b_fk_PromoterA" FOREIGN KEY (product_id) REFERENCES public."PromoterApp_product"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


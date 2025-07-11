PGDMP  3    %                }            postgres    12.0    17.2 Q   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    13423    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                     postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    3747                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        postgres    false    6            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                        postgres    false    6            �            1259    16563    admin_permissions    TABLE     �  CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 %   DROP TABLE public.admin_permissions;
       public         heap r       postgres    false    6            �            1259    16561    admin_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.admin_permissions_id_seq;
       public               postgres    false    229    6            �           0    0    admin_permissions_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;
          public               postgres    false    228                       1259    16812    admin_permissions_role_lnk    TABLE     �   CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);
 .   DROP TABLE public.admin_permissions_role_lnk;
       public         heap r       postgres    false    6            
           1259    16810 !   admin_permissions_role_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.admin_permissions_role_lnk_id_seq;
       public               postgres    false    267    6            �           0    0 !   admin_permissions_role_lnk_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;
          public               postgres    false    266            �            1259    16591    admin_roles    TABLE     �  CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.admin_roles;
       public         heap r       postgres    false    6            �            1259    16589    admin_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_roles_id_seq;
       public               postgres    false    233    6            �           0    0    admin_roles_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;
          public               postgres    false    232            �            1259    16577    admin_users    TABLE     �  CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.admin_users;
       public         heap r       postgres    false    6            �            1259    16575    admin_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_users_id_seq;
       public               postgres    false    6    231            �           0    0    admin_users_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;
          public               postgres    false    230                       1259    16825    admin_users_roles_lnk    TABLE     �   CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);
 )   DROP TABLE public.admin_users_roles_lnk;
       public         heap r       postgres    false    6                       1259    16823    admin_users_roles_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.admin_users_roles_lnk_id_seq;
       public               postgres    false    269    6            �           0    0    admin_users_roles_lnk_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;
          public               postgres    false    268                       1259    17169    authors    TABLE     �  CREATE TABLE public.authors (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    birthdate date,
    bio text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.authors;
       public         heap r       postgres    false    6                       1259    17167    authors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.authors_id_seq;
       public               postgres    false    275    6            �           0    0    authors_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;
          public               postgres    false    274            �            1259    16413    files    TABLE       CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.files;
       public         heap r       postgres    false    6            �            1259    16709    files_folder_lnk    TABLE     �   CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);
 $   DROP TABLE public.files_folder_lnk;
       public         heap r       postgres    false    6            �            1259    16707    files_folder_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.files_folder_lnk_id_seq;
       public               postgres    false    251    6            �           0    0    files_folder_lnk_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;
          public               postgres    false    250            �            1259    16411    files_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public               postgres    false    209    6            �           0    0    files_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
          public               postgres    false    208            �            1259    16695    files_related_mph    TABLE     �   CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);
 %   DROP TABLE public.files_related_mph;
       public         heap r       postgres    false    6            �            1259    16693    files_related_mph_id_seq    SEQUENCE     �   CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.files_related_mph_id_seq;
       public               postgres    false    249    6            �           0    0    files_related_mph_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;
          public               postgres    false    248            �            1259    16451    i18n_locale    TABLE     �  CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.i18n_locale;
       public         heap r       postgres    false    6            �            1259    16449    i18n_locale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.i18n_locale_id_seq;
       public               postgres    false    213    6            �           0    0    i18n_locale_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;
          public               postgres    false    212            )           1259    32771    pages    TABLE     o  CREATE TABLE public.pages (
    id integer NOT NULL,
    document_id character varying(255),
    text text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    page_number integer
);
    DROP TABLE public.pages;
       public         heap r       postgres    false    6            (           1259    32769    pages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pages_id_seq;
       public               postgres    false    297    6            �           0    0    pages_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;
          public               postgres    false    296            +           1259    49155    pages_parent_lnk    TABLE     �   CREATE TABLE public.pages_parent_lnk (
    id integer NOT NULL,
    page_id integer,
    text_id integer,
    page_ord double precision
);
 $   DROP TABLE public.pages_parent_lnk;
       public         heap r       postgres    false    6            *           1259    49153    pages_parent_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.pages_parent_lnk_id_seq;
       public               postgres    false    6    299            �           0    0    pages_parent_lnk_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.pages_parent_lnk_id_seq OWNED BY public.pages_parent_lnk.id;
          public               postgres    false    298            �            1259    16619    strapi_api_token_permissions    TABLE     �  CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 0   DROP TABLE public.strapi_api_token_permissions;
       public         heap r       postgres    false    6            �            1259    16617 #   strapi_api_token_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.strapi_api_token_permissions_id_seq;
       public               postgres    false    237    6            �           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;
          public               postgres    false    236                       1259    16839 &   strapi_api_token_permissions_token_lnk    TABLE     �   CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);
 :   DROP TABLE public.strapi_api_token_permissions_token_lnk;
       public         heap r       postgres    false    6                       1259    16837 -   strapi_api_token_permissions_token_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq;
       public               postgres    false    6    271            �           0    0 -   strapi_api_token_permissions_token_lnk_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;
          public               postgres    false    270            �            1259    16605    strapi_api_tokens    TABLE     q  CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    encrypted_key text,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 %   DROP TABLE public.strapi_api_tokens;
       public         heap r       postgres    false    6            �            1259    16603    strapi_api_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_api_tokens_id_seq;
       public               postgres    false    235    6            �           0    0    strapi_api_tokens_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;
          public               postgres    false    234            �            1259    16661    strapi_core_store_settings    TABLE     �   CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);
 .   DROP TABLE public.strapi_core_store_settings;
       public         heap r       postgres    false    6            �            1259    16659 !   strapi_core_store_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.strapi_core_store_settings_id_seq;
       public               postgres    false    6    243            �           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;
          public               postgres    false    242            �            1259    16402    strapi_database_schema    TABLE     �   CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);
 *   DROP TABLE public.strapi_database_schema;
       public         heap r       postgres    false    6            �            1259    16400    strapi_database_schema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_database_schema_id_seq;
       public               postgres    false    207    6            �           0    0    strapi_database_schema_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;
          public               postgres    false    206            �            1259    16683    strapi_history_versions    TABLE     ]  CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);
 +   DROP TABLE public.strapi_history_versions;
       public         heap r       postgres    false    6            �            1259    16681    strapi_history_versions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.strapi_history_versions_id_seq;
       public               postgres    false    6    247            �           0    0    strapi_history_versions_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;
          public               postgres    false    246            �            1259    16386    strapi_migrations    TABLE     �   CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);
 %   DROP TABLE public.strapi_migrations;
       public         heap r       postgres    false    6            �            1259    16384    strapi_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_migrations_id_seq;
       public               postgres    false    6    203            �           0    0    strapi_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;
          public               postgres    false    202            �            1259    16394    strapi_migrations_internal    TABLE     �   CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);
 .   DROP TABLE public.strapi_migrations_internal;
       public         heap r       postgres    false    6            �            1259    16392 !   strapi_migrations_internal_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.strapi_migrations_internal_id_seq;
       public               postgres    false    6    205            �           0    0 !   strapi_migrations_internal_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;
          public               postgres    false    204            �            1259    16479    strapi_release_actions    TABLE     �  CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 *   DROP TABLE public.strapi_release_actions;
       public         heap r       postgres    false    6            �            1259    16477    strapi_release_actions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_release_actions_id_seq;
       public               postgres    false    217    6            �           0    0    strapi_release_actions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;
          public               postgres    false    216            �            1259    16735 "   strapi_release_actions_release_lnk    TABLE     �   CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);
 6   DROP TABLE public.strapi_release_actions_release_lnk;
       public         heap r       postgres    false    6            �            1259    16733 )   strapi_release_actions_release_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.strapi_release_actions_release_lnk_id_seq;
       public               postgres    false    255    6            �           0    0 )   strapi_release_actions_release_lnk_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;
          public               postgres    false    254            �            1259    16465    strapi_releases    TABLE       CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 #   DROP TABLE public.strapi_releases;
       public         heap r       postgres    false    6            �            1259    16463    strapi_releases_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strapi_releases_id_seq;
       public               postgres    false    6    215            �           0    0    strapi_releases_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;
          public               postgres    false    214            �            1259    16647 !   strapi_transfer_token_permissions    TABLE     �  CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 5   DROP TABLE public.strapi_transfer_token_permissions;
       public         heap r       postgres    false    6            �            1259    16645 (   strapi_transfer_token_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.strapi_transfer_token_permissions_id_seq;
       public               postgres    false    6    241            �           0    0 (   strapi_transfer_token_permissions_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;
          public               postgres    false    240                       1259    16852 +   strapi_transfer_token_permissions_token_lnk    TABLE     �   CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);
 ?   DROP TABLE public.strapi_transfer_token_permissions_token_lnk;
       public         heap r       postgres    false    6                       1259    16850 2   strapi_transfer_token_permissions_token_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq;
       public               postgres    false    273    6            �           0    0 2   strapi_transfer_token_permissions_token_lnk_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;
          public               postgres    false    272            �            1259    16633    strapi_transfer_tokens    TABLE     =  CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 *   DROP TABLE public.strapi_transfer_tokens;
       public         heap r       postgres    false    6            �            1259    16631    strapi_transfer_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_transfer_tokens_id_seq;
       public               postgres    false    239    6            �           0    0    strapi_transfer_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;
          public               postgres    false    238            �            1259    16672    strapi_webhooks    TABLE     �   CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);
 #   DROP TABLE public.strapi_webhooks;
       public         heap r       postgres    false    6            �            1259    16670    strapi_webhooks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strapi_webhooks_id_seq;
       public               postgres    false    6    245            �           0    0    strapi_webhooks_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;
          public               postgres    false    244            �            1259    16493    strapi_workflows    TABLE     �  CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 $   DROP TABLE public.strapi_workflows;
       public         heap r       postgres    false    6            �            1259    16491    strapi_workflows_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.strapi_workflows_id_seq;
       public               postgres    false    219    6            �           0    0    strapi_workflows_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;
          public               postgres    false    218                       1259    16748 .   strapi_workflows_stage_required_to_publish_lnk    TABLE     �   CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);
 B   DROP TABLE public.strapi_workflows_stage_required_to_publish_lnk;
       public         heap r       postgres    false    6                        1259    16746 5   strapi_workflows_stage_required_to_publish_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq;
       public               postgres    false    257    6            �           0    0 5   strapi_workflows_stage_required_to_publish_lnk_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;
          public               postgres    false    256            �            1259    16507    strapi_workflows_stages    TABLE     �  CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 +   DROP TABLE public.strapi_workflows_stages;
       public         heap r       postgres    false    6            �            1259    16505    strapi_workflows_stages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.strapi_workflows_stages_id_seq;
       public               postgres    false    6    221            �           0    0    strapi_workflows_stages_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;
          public               postgres    false    220                       1259    16773 '   strapi_workflows_stages_permissions_lnk    TABLE     �   CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);
 ;   DROP TABLE public.strapi_workflows_stages_permissions_lnk;
       public         heap r       postgres    false    6                       1259    16771 .   strapi_workflows_stages_permissions_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq;
       public               postgres    false    6    261            �           0    0 .   strapi_workflows_stages_permissions_lnk_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;
          public               postgres    false    260                       1259    16760 $   strapi_workflows_stages_workflow_lnk    TABLE     �   CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);
 8   DROP TABLE public.strapi_workflows_stages_workflow_lnk;
       public         heap r       postgres    false    6                       1259    16758 +   strapi_workflows_stages_workflow_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq;
       public               postgres    false    259    6            �           0    0 +   strapi_workflows_stages_workflow_lnk_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;
          public               postgres    false    258                       1259    17183    tags    TABLE     h  CREATE TABLE public.tags (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.tags;
       public         heap r       postgres    false    6                       1259    17181    tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tags_id_seq;
       public               postgres    false    6    277            �           0    0    tags_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
          public               postgres    false    276            #           1259    24684    text_author_types    TABLE     �  CREATE TABLE public.text_author_types (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 %   DROP TABLE public.text_author_types;
       public         heap r       postgres    false    6            "           1259    24682    text_author_types_id_seq    SEQUENCE     �   CREATE SEQUENCE public.text_author_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.text_author_types_id_seq;
       public               postgres    false    6    291            �           0    0    text_author_types_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.text_author_types_id_seq OWNED BY public.text_author_types.id;
          public               postgres    false    290            !           1259    24633    text_tapies    TABLE     �  CREATE TABLE public.text_tapies (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.text_tapies;
       public         heap r       postgres    false    6                        1259    24631    text_tapies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.text_tapies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.text_tapies_id_seq;
       public               postgres    false    6    289            �           0    0    text_tapies_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.text_tapies_id_seq OWNED BY public.text_tapies.id;
          public               postgres    false    288                       1259    17197    texts    TABLE     �  CREATE TABLE public.texts (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    annotation text,
    date date,
    table_of_contents jsonb,
    key_words jsonb
);
    DROP TABLE public.texts;
       public         heap r       postgres    false    6                       1259    17225    texts_authors_lnk    TABLE     �   CREATE TABLE public.texts_authors_lnk (
    id integer NOT NULL,
    text_id integer,
    author_id integer,
    author_ord double precision,
    text_ord double precision
);
 %   DROP TABLE public.texts_authors_lnk;
       public         heap r       postgres    false    6                       1259    17223    texts_authors_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.texts_authors_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.texts_authors_lnk_id_seq;
       public               postgres    false    6    283            �           0    0    texts_authors_lnk_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.texts_authors_lnk_id_seq OWNED BY public.texts_authors_lnk.id;
          public               postgres    false    282                       1259    17195    texts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.texts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.texts_id_seq;
       public               postgres    false    279    6            �           0    0    texts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.texts_id_seq OWNED BY public.texts.id;
          public               postgres    false    278                       1259    17239    texts_tags_lnk    TABLE     �   CREATE TABLE public.texts_tags_lnk (
    id integer NOT NULL,
    text_id integer,
    tag_id integer,
    tag_ord double precision,
    text_ord double precision
);
 "   DROP TABLE public.texts_tags_lnk;
       public         heap r       postgres    false    6                       1259    17237    texts_tags_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.texts_tags_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.texts_tags_lnk_id_seq;
       public               postgres    false    285    6            �           0    0    texts_tags_lnk_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.texts_tags_lnk_id_seq OWNED BY public.texts_tags_lnk.id;
          public               postgres    false    284            '           1259    24722    texts_text_author_type_lnk    TABLE     �   CREATE TABLE public.texts_text_author_type_lnk (
    id integer NOT NULL,
    text_id integer,
    text_author_type_id integer
);
 .   DROP TABLE public.texts_text_author_type_lnk;
       public         heap r       postgres    false    6            &           1259    24720 !   texts_text_author_type_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.texts_text_author_type_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.texts_text_author_type_lnk_id_seq;
       public               postgres    false    6    295            �           0    0 !   texts_text_author_type_lnk_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.texts_text_author_type_lnk_id_seq OWNED BY public.texts_text_author_type_lnk.id;
          public               postgres    false    294            %           1259    24710    texts_text_type_lnk    TABLE     t   CREATE TABLE public.texts_text_type_lnk (
    id integer NOT NULL,
    text_id integer,
    text_tapy_id integer
);
 '   DROP TABLE public.texts_text_type_lnk;
       public         heap r       postgres    false    6            $           1259    24708    texts_text_type_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.texts_text_type_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.texts_text_type_lnk_id_seq;
       public               postgres    false    293    6            �           0    0    texts_text_type_lnk_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.texts_text_type_lnk_id_seq OWNED BY public.texts_text_type_lnk.id;
          public               postgres    false    292                       1259    17211 	   timelines    TABLE     �  CREATE TABLE public.timelines (
    id integer NOT NULL,
    document_id character varying(255),
    caption character varying(255),
    date date,
    description text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.timelines;
       public         heap r       postgres    false    6                       1259    17253    timelines_author_lnk    TABLE     �   CREATE TABLE public.timelines_author_lnk (
    id integer NOT NULL,
    timeline_id integer,
    author_id integer,
    timeline_ord double precision
);
 (   DROP TABLE public.timelines_author_lnk;
       public         heap r       postgres    false    6                       1259    17251    timelines_author_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.timelines_author_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.timelines_author_lnk_id_seq;
       public               postgres    false    287    6            �           0    0    timelines_author_lnk_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.timelines_author_lnk_id_seq OWNED BY public.timelines_author_lnk.id;
          public               postgres    false    286                       1259    17209    timelines_id_seq    SEQUENCE     �   CREATE SEQUENCE public.timelines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.timelines_id_seq;
       public               postgres    false    6    281            �           0    0    timelines_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.timelines_id_seq OWNED BY public.timelines.id;
          public               postgres    false    280            �            1259    16521    up_permissions    TABLE     s  CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 "   DROP TABLE public.up_permissions;
       public         heap r       postgres    false    6            �            1259    16519    up_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.up_permissions_id_seq;
       public               postgres    false    6    223            �           0    0    up_permissions_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;
          public               postgres    false    222                       1259    16786    up_permissions_role_lnk    TABLE     �   CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);
 +   DROP TABLE public.up_permissions_role_lnk;
       public         heap r       postgres    false    6                       1259    16784    up_permissions_role_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.up_permissions_role_lnk_id_seq;
       public               postgres    false    263    6            �           0    0    up_permissions_role_lnk_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;
          public               postgres    false    262            �            1259    16535    up_roles    TABLE     �  CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.up_roles;
       public         heap r       postgres    false    6            �            1259    16533    up_roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_roles_id_seq;
       public               postgres    false    6    225            �           0    0    up_roles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;
          public               postgres    false    224            �            1259    16549    up_users    TABLE     g  CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
    DROP TABLE public.up_users;
       public         heap r       postgres    false    6            �            1259    16547    up_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_users_id_seq;
       public               postgres    false    227    6            �           0    0    up_users_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;
          public               postgres    false    226            	           1259    16799    up_users_role_lnk    TABLE     �   CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);
 %   DROP TABLE public.up_users_role_lnk;
       public         heap r       postgres    false    6                       1259    16797    up_users_role_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.up_users_role_lnk_id_seq;
       public               postgres    false    6    265            �           0    0    up_users_role_lnk_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;
          public               postgres    false    264            �            1259    16433    upload_folders    TABLE     �  CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);
 "   DROP TABLE public.upload_folders;
       public         heap r       postgres    false    6            �            1259    16431    upload_folders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.upload_folders_id_seq;
       public               postgres    false    6    211            �           0    0    upload_folders_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;
          public               postgres    false    210            �            1259    16722    upload_folders_parent_lnk    TABLE     �   CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);
 -   DROP TABLE public.upload_folders_parent_lnk;
       public         heap r       postgres    false    6            �            1259    16720     upload_folders_parent_lnk_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.upload_folders_parent_lnk_id_seq;
       public               postgres    false    6    253            �           0    0     upload_folders_parent_lnk_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;
          public               postgres    false    252            2           2604    16566    admin_permissions id    DEFAULT     |   ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);
 C   ALTER TABLE public.admin_permissions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    229    229            E           2604    16815    admin_permissions_role_lnk id    DEFAULT     �   ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);
 L   ALTER TABLE public.admin_permissions_role_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    267    266    267            4           2604    16594    admin_roles id    DEFAULT     p   ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);
 =   ALTER TABLE public.admin_roles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    233    232    233            3           2604    16580    admin_users id    DEFAULT     p   ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);
 =   ALTER TABLE public.admin_users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    231    230    231            F           2604    16828    admin_users_roles_lnk id    DEFAULT     �   ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);
 G   ALTER TABLE public.admin_users_roles_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    269    268    269            I           2604    17172 
   authors id    DEFAULT     h   ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);
 9   ALTER TABLE public.authors ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    274    275    275            (           2604    16416    files id    DEFAULT     d   ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    209    208    209            =           2604    16712    files_folder_lnk id    DEFAULT     z   ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);
 B   ALTER TABLE public.files_folder_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    251    250    251            <           2604    16698    files_related_mph id    DEFAULT     |   ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);
 C   ALTER TABLE public.files_related_mph ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    248    249    249            *           2604    16454    i18n_locale id    DEFAULT     p   ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);
 =   ALTER TABLE public.i18n_locale ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    212    213    213            T           2604    32774    pages id    DEFAULT     d   ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);
 7   ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    296    297    297            U           2604    49158    pages_parent_lnk id    DEFAULT     z   ALTER TABLE ONLY public.pages_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.pages_parent_lnk_id_seq'::regclass);
 B   ALTER TABLE public.pages_parent_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    298    299    299            6           2604    16622    strapi_api_token_permissions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);
 N   ALTER TABLE public.strapi_api_token_permissions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    236    237    237            G           2604    16842 )   strapi_api_token_permissions_token_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);
 X   ALTER TABLE public.strapi_api_token_permissions_token_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    270    271    271            5           2604    16608    strapi_api_tokens id    DEFAULT     |   ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);
 C   ALTER TABLE public.strapi_api_tokens ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    235    234    235            9           2604    16664    strapi_core_store_settings id    DEFAULT     �   ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);
 L   ALTER TABLE public.strapi_core_store_settings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    242    243    243            '           2604    16405    strapi_database_schema id    DEFAULT     �   ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);
 H   ALTER TABLE public.strapi_database_schema ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    207    206    207            ;           2604    16686    strapi_history_versions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);
 I   ALTER TABLE public.strapi_history_versions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    246    247    247            %           2604    16389    strapi_migrations id    DEFAULT     |   ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);
 C   ALTER TABLE public.strapi_migrations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    202    203    203            &           2604    16397    strapi_migrations_internal id    DEFAULT     �   ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);
 L   ALTER TABLE public.strapi_migrations_internal ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    205    204    205            ,           2604    16482    strapi_release_actions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);
 H   ALTER TABLE public.strapi_release_actions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    216    217    217            ?           2604    16738 %   strapi_release_actions_release_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);
 T   ALTER TABLE public.strapi_release_actions_release_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    255    254    255            +           2604    16468    strapi_releases id    DEFAULT     x   ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);
 A   ALTER TABLE public.strapi_releases ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    214    215    215            8           2604    16650 $   strapi_transfer_token_permissions id    DEFAULT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);
 S   ALTER TABLE public.strapi_transfer_token_permissions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    240    241    241            H           2604    16855 .   strapi_transfer_token_permissions_token_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);
 ]   ALTER TABLE public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    272    273    273            7           2604    16636    strapi_transfer_tokens id    DEFAULT     �   ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);
 H   ALTER TABLE public.strapi_transfer_tokens ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    239    238    239            :           2604    16675    strapi_webhooks id    DEFAULT     x   ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);
 A   ALTER TABLE public.strapi_webhooks ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    244    245    245            -           2604    16496    strapi_workflows id    DEFAULT     z   ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);
 B   ALTER TABLE public.strapi_workflows ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    218    219            @           2604    16751 1   strapi_workflows_stage_required_to_publish_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);
 `   ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    256    257    257            .           2604    16510    strapi_workflows_stages id    DEFAULT     �   ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);
 I   ALTER TABLE public.strapi_workflows_stages ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220    221            B           2604    16776 *   strapi_workflows_stages_permissions_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);
 Y   ALTER TABLE public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    260    261    261            A           2604    16763 '   strapi_workflows_stages_workflow_lnk id    DEFAULT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);
 V   ALTER TABLE public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    258    259    259            J           2604    17186    tags id    DEFAULT     b   ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
 6   ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    277    276    277            Q           2604    24687    text_author_types id    DEFAULT     |   ALTER TABLE ONLY public.text_author_types ALTER COLUMN id SET DEFAULT nextval('public.text_author_types_id_seq'::regclass);
 C   ALTER TABLE public.text_author_types ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    290    291    291            P           2604    24636    text_tapies id    DEFAULT     p   ALTER TABLE ONLY public.text_tapies ALTER COLUMN id SET DEFAULT nextval('public.text_tapies_id_seq'::regclass);
 =   ALTER TABLE public.text_tapies ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    288    289    289            K           2604    17200    texts id    DEFAULT     d   ALTER TABLE ONLY public.texts ALTER COLUMN id SET DEFAULT nextval('public.texts_id_seq'::regclass);
 7   ALTER TABLE public.texts ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    278    279    279            M           2604    17228    texts_authors_lnk id    DEFAULT     |   ALTER TABLE ONLY public.texts_authors_lnk ALTER COLUMN id SET DEFAULT nextval('public.texts_authors_lnk_id_seq'::regclass);
 C   ALTER TABLE public.texts_authors_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    283    282    283            N           2604    17242    texts_tags_lnk id    DEFAULT     v   ALTER TABLE ONLY public.texts_tags_lnk ALTER COLUMN id SET DEFAULT nextval('public.texts_tags_lnk_id_seq'::regclass);
 @   ALTER TABLE public.texts_tags_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    285    284    285            S           2604    24725    texts_text_author_type_lnk id    DEFAULT     �   ALTER TABLE ONLY public.texts_text_author_type_lnk ALTER COLUMN id SET DEFAULT nextval('public.texts_text_author_type_lnk_id_seq'::regclass);
 L   ALTER TABLE public.texts_text_author_type_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    294    295    295            R           2604    24713    texts_text_type_lnk id    DEFAULT     �   ALTER TABLE ONLY public.texts_text_type_lnk ALTER COLUMN id SET DEFAULT nextval('public.texts_text_type_lnk_id_seq'::regclass);
 E   ALTER TABLE public.texts_text_type_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    292    293    293            L           2604    17214    timelines id    DEFAULT     l   ALTER TABLE ONLY public.timelines ALTER COLUMN id SET DEFAULT nextval('public.timelines_id_seq'::regclass);
 ;   ALTER TABLE public.timelines ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    280    281    281            O           2604    17256    timelines_author_lnk id    DEFAULT     �   ALTER TABLE ONLY public.timelines_author_lnk ALTER COLUMN id SET DEFAULT nextval('public.timelines_author_lnk_id_seq'::regclass);
 F   ALTER TABLE public.timelines_author_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    286    287    287            /           2604    16524    up_permissions id    DEFAULT     v   ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);
 @   ALTER TABLE public.up_permissions ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    223    223            C           2604    16789    up_permissions_role_lnk id    DEFAULT     �   ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);
 I   ALTER TABLE public.up_permissions_role_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    263    262    263            0           2604    16538    up_roles id    DEFAULT     j   ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);
 :   ALTER TABLE public.up_roles ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    225    225            1           2604    16552    up_users id    DEFAULT     j   ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);
 :   ALTER TABLE public.up_users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    226    227            D           2604    16802    up_users_role_lnk id    DEFAULT     |   ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);
 C   ALTER TABLE public.up_users_role_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    265    264    265            )           2604    16436    upload_folders id    DEFAULT     v   ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);
 @   ALTER TABLE public.upload_folders ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    211    210    211            >           2604    16725    upload_folders_parent_lnk id    DEFAULT     �   ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);
 K   ALTER TABLE public.upload_folders_parent_lnk ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    252    253    253            W          0    16563    admin_permissions 
   TABLE DATA           �   COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    229   bB      }          0    16812    admin_permissions_role_lnk 
   TABLE DATA           `   COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
    public               postgres    false    267   �Q      [          0    16591    admin_roles 
   TABLE DATA           �   COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    233   �S      Y          0    16577    admin_users 
   TABLE DATA             COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    231   U                0    16825    admin_users_roles_lnk 
   TABLE DATA           Y   COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
    public               postgres    false    269   �V      �          0    17169    authors 
   TABLE DATA           �   COPY public.authors (id, document_id, name, birthdate, bio, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    275   �V      C          0    16413    files 
   TABLE DATA             COPY public.files (id, document_id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    209   �W      m          0    16709    files_folder_lnk 
   TABLE DATA           L   COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
    public               postgres    false    251   C]      k          0    16695    files_related_mph 
   TABLE DATA           b   COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
    public               postgres    false    249   `]      G          0    16451    i18n_locale 
   TABLE DATA           �   COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    213   �^      �          0    32771    pages 
   TABLE DATA           �   COPY public.pages (id, document_id, text, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, page_number) FROM stdin;
    public               postgres    false    297   �^      �          0    49155    pages_parent_lnk 
   TABLE DATA           J   COPY public.pages_parent_lnk (id, page_id, text_id, page_ord) FROM stdin;
    public               postgres    false    299   �      _          0    16619    strapi_api_token_permissions 
   TABLE DATA           �   COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    237   M      �          0    16839 &   strapi_api_token_permissions_token_lnk 
   TABLE DATA           �   COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
    public               postgres    false    271   j      ]          0    16605    strapi_api_tokens 
   TABLE DATA           �   COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, encrypted_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    235   �      e          0    16661    strapi_core_store_settings 
   TABLE DATA           \   COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
    public               postgres    false    243   m      A          0    16402    strapi_database_schema 
   TABLE DATA           J   COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
    public               postgres    false    207   d=      i          0    16683    strapi_history_versions 
   TABLE DATA           �   COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
    public               postgres    false    247   *K      =          0    16386    strapi_migrations 
   TABLE DATA           =   COPY public.strapi_migrations (id, name, "time") FROM stdin;
    public               postgres    false    203   GK      ?          0    16394    strapi_migrations_internal 
   TABLE DATA           F   COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
    public               postgres    false    205   dK      K          0    16479    strapi_release_actions 
   TABLE DATA           �   COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public               postgres    false    217   /L      q          0    16735 "   strapi_release_actions_release_lnk 
   TABLE DATA           s   COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
    public               postgres    false    255   LL      I          0    16465    strapi_releases 
   TABLE DATA           �   COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    215   iL      c          0    16647 !   strapi_transfer_token_permissions 
   TABLE DATA           �   COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    241   �L      �          0    16852 +   strapi_transfer_token_permissions_token_lnk 
   TABLE DATA           �   COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
    public               postgres    false    273   �L      a          0    16633    strapi_transfer_tokens 
   TABLE DATA           �   COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    239   �L      g          0    16672    strapi_webhooks 
   TABLE DATA           R   COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
    public               postgres    false    245   �L      M          0    16493    strapi_workflows 
   TABLE DATA           �   COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    219   �L      s          0    16748 .   strapi_workflows_stage_required_to_publish_lnk 
   TABLE DATA           l   COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
    public               postgres    false    257   M      O          0    16507    strapi_workflows_stages 
   TABLE DATA           �   COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    221   4M      w          0    16773 '   strapi_workflows_stages_permissions_lnk 
   TABLE DATA           w   COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
    public               postgres    false    261   QM      u          0    16760 $   strapi_workflows_stages_workflow_lnk 
   TABLE DATA           v   COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
    public               postgres    false    259   nM      �          0    17183    tags 
   TABLE DATA           �   COPY public.tags (id, document_id, title, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    277   �M      �          0    24684    text_author_types 
   TABLE DATA           �   COPY public.text_author_types (id, document_id, title, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    291   �N      �          0    24633    text_tapies 
   TABLE DATA           �   COPY public.text_tapies (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    289   �O      �          0    17197    texts 
   TABLE DATA           �   COPY public.texts (id, document_id, title, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, annotation, date, table_of_contents, key_words) FROM stdin;
    public               postgres    false    279   JP      �          0    17225    texts_authors_lnk 
   TABLE DATA           Y   COPY public.texts_authors_lnk (id, text_id, author_id, author_ord, text_ord) FROM stdin;
    public               postgres    false    283   fW      �          0    17239    texts_tags_lnk 
   TABLE DATA           P   COPY public.texts_tags_lnk (id, text_id, tag_id, tag_ord, text_ord) FROM stdin;
    public               postgres    false    285   �W      �          0    24722    texts_text_author_type_lnk 
   TABLE DATA           V   COPY public.texts_text_author_type_lnk (id, text_id, text_author_type_id) FROM stdin;
    public               postgres    false    295   VX      �          0    24710    texts_text_type_lnk 
   TABLE DATA           H   COPY public.texts_text_type_lnk (id, text_id, text_tapy_id) FROM stdin;
    public               postgres    false    293   �X      �          0    17211 	   timelines 
   TABLE DATA           �   COPY public.timelines (id, document_id, caption, date, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    281   �X      �          0    17253    timelines_author_lnk 
   TABLE DATA           X   COPY public.timelines_author_lnk (id, timeline_id, author_id, timeline_ord) FROM stdin;
    public               postgres    false    287   �Y      Q          0    16521    up_permissions 
   TABLE DATA           �   COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    223   Z      y          0    16786    up_permissions_role_lnk 
   TABLE DATA           ]   COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
    public               postgres    false    263   �[      S          0    16535    up_roles 
   TABLE DATA           �   COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    225   �[      U          0    16549    up_users 
   TABLE DATA           �   COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    227   �\      {          0    16799    up_users_role_lnk 
   TABLE DATA           K   COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
    public               postgres    false    265   �\      E          0    16433    upload_folders 
   TABLE DATA           �   COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
    public               postgres    false    211   �\      o          0    16722    upload_folders_parent_lnk 
   TABLE DATA           ]   COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
    public               postgres    false    253   �\      �           0    0    admin_permissions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.admin_permissions_id_seq', 143, true);
          public               postgres    false    228            �           0    0 !   admin_permissions_role_lnk_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 143, true);
          public               postgres    false    266            �           0    0    admin_roles_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);
          public               postgres    false    232            �           0    0    admin_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_users_id_seq', 2, true);
          public               postgres    false    230            �           0    0    admin_users_roles_lnk_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 7, true);
          public               postgres    false    268            �           0    0    authors_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.authors_id_seq', 4, true);
          public               postgres    false    274            �           0    0    files_folder_lnk_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 1, false);
          public               postgres    false    250            �           0    0    files_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.files_id_seq', 6, true);
          public               postgres    false    208            �           0    0    files_related_mph_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.files_related_mph_id_seq', 70, true);
          public               postgres    false    248            �           0    0    i18n_locale_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);
          public               postgres    false    212            �           0    0    pages_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pages_id_seq', 127, true);
          public               postgres    false    296            �           0    0    pages_parent_lnk_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pages_parent_lnk_id_seq', 1357, true);
          public               postgres    false    298            �           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);
          public               postgres    false    236            �           0    0 -   strapi_api_token_permissions_token_lnk_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);
          public               postgres    false    270            �           0    0    strapi_api_tokens_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 4, true);
          public               postgres    false    234            �           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 34, true);
          public               postgres    false    242            �           0    0    strapi_database_schema_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 16, true);
          public               postgres    false    206            �           0    0    strapi_history_versions_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);
          public               postgres    false    246            �           0    0    strapi_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);
          public               postgres    false    202            �           0    0 !   strapi_migrations_internal_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 6, true);
          public               postgres    false    204            �           0    0    strapi_release_actions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);
          public               postgres    false    216            �           0    0 )   strapi_release_actions_release_lnk_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);
          public               postgres    false    254            �           0    0    strapi_releases_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);
          public               postgres    false    214            �           0    0 (   strapi_transfer_token_permissions_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);
          public               postgres    false    240            �           0    0 2   strapi_transfer_token_permissions_token_lnk_id_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);
          public               postgres    false    272            �           0    0    strapi_transfer_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);
          public               postgres    false    238            �           0    0    strapi_webhooks_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);
          public               postgres    false    244            �           0    0    strapi_workflows_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);
          public               postgres    false    218            �           0    0 5   strapi_workflows_stage_required_to_publish_lnk_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);
          public               postgres    false    256            �           0    0    strapi_workflows_stages_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);
          public               postgres    false    220            �           0    0 .   strapi_workflows_stages_permissions_lnk_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);
          public               postgres    false    260            �           0    0 +   strapi_workflows_stages_workflow_lnk_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);
          public               postgres    false    258            �           0    0    tags_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.tags_id_seq', 8, true);
          public               postgres    false    276            �           0    0    text_author_types_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.text_author_types_id_seq', 4, true);
          public               postgres    false    290            �           0    0    text_tapies_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.text_tapies_id_seq', 2, true);
          public               postgres    false    288            �           0    0    texts_authors_lnk_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.texts_authors_lnk_id_seq', 35, true);
          public               postgres    false    282            �           0    0    texts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.texts_id_seq', 53, true);
          public               postgres    false    278            �           0    0    texts_tags_lnk_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.texts_tags_lnk_id_seq', 71, true);
          public               postgres    false    284            �           0    0 !   texts_text_author_type_lnk_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.texts_text_author_type_lnk_id_seq', 18, true);
          public               postgres    false    294            �           0    0    texts_text_type_lnk_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.texts_text_type_lnk_id_seq', 17, true);
          public               postgres    false    292                        0    0    timelines_author_lnk_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.timelines_author_lnk_id_seq', 7, true);
          public               postgres    false    286                       0    0    timelines_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.timelines_id_seq', 7, true);
          public               postgres    false    280                       0    0    up_permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.up_permissions_id_seq', 9, true);
          public               postgres    false    222                       0    0    up_permissions_role_lnk_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 9, true);
          public               postgres    false    262                       0    0    up_roles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);
          public               postgres    false    224                       0    0    up_users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);
          public               postgres    false    226                       0    0    up_users_role_lnk_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 1, false);
          public               postgres    false    264                       0    0    upload_folders_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);
          public               postgres    false    210                       0    0     upload_folders_parent_lnk_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);
          public               postgres    false    252            �           2606    16571 (   admin_permissions admin_permissions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_pkey;
       public                 postgres    false    229                       2606    16817 :   admin_permissions_role_lnk admin_permissions_role_lnk_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.admin_permissions_role_lnk DROP CONSTRAINT admin_permissions_role_lnk_pkey;
       public                 postgres    false    267                       2606    16821 8   admin_permissions_role_lnk admin_permissions_role_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);
 b   ALTER TABLE ONLY public.admin_permissions_role_lnk DROP CONSTRAINT admin_permissions_role_lnk_uq;
       public                 postgres    false    267    267            �           2606    16599    admin_roles admin_roles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_pkey;
       public                 postgres    false    233            �           2606    16585    admin_users admin_users_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_pkey;
       public                 postgres    false    231            
           2606    16830 0   admin_users_roles_lnk admin_users_roles_lnk_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.admin_users_roles_lnk DROP CONSTRAINT admin_users_roles_lnk_pkey;
       public                 postgres    false    269                       2606    16834 .   admin_users_roles_lnk admin_users_roles_lnk_uq 
   CONSTRAINT     u   ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);
 X   ALTER TABLE ONLY public.admin_users_roles_lnk DROP CONSTRAINT admin_users_roles_lnk_uq;
       public                 postgres    false    269    269                       2606    17177    authors authors_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public                 postgres    false    275            �           2606    16714 &   files_folder_lnk files_folder_lnk_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.files_folder_lnk DROP CONSTRAINT files_folder_lnk_pkey;
       public                 postgres    false    251            �           2606    16718 $   files_folder_lnk files_folder_lnk_uq 
   CONSTRAINT     m   ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);
 N   ALTER TABLE ONLY public.files_folder_lnk DROP CONSTRAINT files_folder_lnk_uq;
       public                 postgres    false    251    251            _           2606    16421    files files_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public                 postgres    false    209            �           2606    16703 (   files_related_mph files_related_mph_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.files_related_mph DROP CONSTRAINT files_related_mph_pkey;
       public                 postgres    false    249            s           2606    16459    i18n_locale i18n_locale_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_pkey;
       public                 postgres    false    213            e           2606    49160 &   pages_parent_lnk pages_parent_lnk_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.pages_parent_lnk
    ADD CONSTRAINT pages_parent_lnk_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.pages_parent_lnk DROP CONSTRAINT pages_parent_lnk_pkey;
       public                 postgres    false    299            g           2606    49164 $   pages_parent_lnk pages_parent_lnk_uq 
   CONSTRAINT     k   ALTER TABLE ONLY public.pages_parent_lnk
    ADD CONSTRAINT pages_parent_lnk_uq UNIQUE (page_id, text_id);
 N   ALTER TABLE ONLY public.pages_parent_lnk DROP CONSTRAINT pages_parent_lnk_uq;
       public                 postgres    false    299    299            _           2606    32779    pages pages_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_pkey;
       public                 postgres    false    297            �           2606    16627 >   strapi_api_token_permissions strapi_api_token_permissions_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_pkey;
       public                 postgres    false    237                       2606    16844 R   strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);
 |   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT strapi_api_token_permissions_token_lnk_pkey;
       public                 postgres    false    271                       2606    16848 P   strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);
 z   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT strapi_api_token_permissions_token_lnk_uq;
       public                 postgres    false    271    271            �           2606    16613 (   strapi_api_tokens strapi_api_tokens_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_pkey;
       public                 postgres    false    235            �           2606    16669 :   strapi_core_store_settings strapi_core_store_settings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.strapi_core_store_settings DROP CONSTRAINT strapi_core_store_settings_pkey;
       public                 postgres    false    243            [           2606    16410 2   strapi_database_schema strapi_database_schema_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_database_schema DROP CONSTRAINT strapi_database_schema_pkey;
       public                 postgres    false    207            �           2606    16691 4   strapi_history_versions strapi_history_versions_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.strapi_history_versions DROP CONSTRAINT strapi_history_versions_pkey;
       public                 postgres    false    247            Y           2606    16399 :   strapi_migrations_internal strapi_migrations_internal_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.strapi_migrations_internal DROP CONSTRAINT strapi_migrations_internal_pkey;
       public                 postgres    false    205            W           2606    16391 (   strapi_migrations strapi_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_migrations DROP CONSTRAINT strapi_migrations_pkey;
       public                 postgres    false    203            }           2606    16487 2   strapi_release_actions strapi_release_actions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_release_actions DROP CONSTRAINT strapi_release_actions_pkey;
       public                 postgres    false    217            �           2606    16740 J   strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT strapi_release_actions_release_lnk_pkey;
       public                 postgres    false    255            �           2606    16744 H   strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);
 r   ALTER TABLE ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT strapi_release_actions_release_lnk_uq;
       public                 postgres    false    255    255            x           2606    16473 $   strapi_releases strapi_releases_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strapi_releases DROP CONSTRAINT strapi_releases_pkey;
       public                 postgres    false    215            �           2606    16655 H   strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_pkey;
       public                 postgres    false    241                       2606    16857 \   strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey;
       public                 postgres    false    273                       2606    16861 Z   strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq;
       public                 postgres    false    273    273            �           2606    16641 2   strapi_transfer_tokens strapi_transfer_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_pkey;
       public                 postgres    false    239            �           2606    16680 $   strapi_webhooks strapi_webhooks_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strapi_webhooks DROP CONSTRAINT strapi_webhooks_pkey;
       public                 postgres    false    245            �           2606    16501 &   strapi_workflows strapi_workflows_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.strapi_workflows DROP CONSTRAINT strapi_workflows_pkey;
       public                 postgres    false    219            �           2606    16753 b   strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey;
       public                 postgres    false    257            �           2606    16757 `   strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);
 �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq;
       public                 postgres    false    257    257            �           2606    16778 T   strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);
 ~   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey;
       public                 postgres    false    261            �           2606    16782 R   strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);
 |   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT strapi_workflows_stages_permissions_lnk_uq;
       public                 postgres    false    261    261            �           2606    16515 4   strapi_workflows_stages strapi_workflows_stages_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.strapi_workflows_stages DROP CONSTRAINT strapi_workflows_stages_pkey;
       public                 postgres    false    221            �           2606    16765 N   strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey;
       public                 postgres    false    259            �           2606    16769 L   strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);
 v   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT strapi_workflows_stages_workflow_lnk_uq;
       public                 postgres    false    259    259            #           2606    17191    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public                 postgres    false    277            N           2606    24692 (   text_author_types text_author_types_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.text_author_types
    ADD CONSTRAINT text_author_types_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.text_author_types DROP CONSTRAINT text_author_types_pkey;
       public                 postgres    false    291            I           2606    24641    text_tapies text_tapies_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.text_tapies
    ADD CONSTRAINT text_tapies_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.text_tapies DROP CONSTRAINT text_tapies_pkey;
       public                 postgres    false    289            4           2606    17230 (   texts_authors_lnk texts_authors_lnk_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.texts_authors_lnk
    ADD CONSTRAINT texts_authors_lnk_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.texts_authors_lnk DROP CONSTRAINT texts_authors_lnk_pkey;
       public                 postgres    false    283            6           2606    17234 &   texts_authors_lnk texts_authors_lnk_uq 
   CONSTRAINT     o   ALTER TABLE ONLY public.texts_authors_lnk
    ADD CONSTRAINT texts_authors_lnk_uq UNIQUE (text_id, author_id);
 P   ALTER TABLE ONLY public.texts_authors_lnk DROP CONSTRAINT texts_authors_lnk_uq;
       public                 postgres    false    283    283            (           2606    17205    texts texts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.texts
    ADD CONSTRAINT texts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.texts DROP CONSTRAINT texts_pkey;
       public                 postgres    false    279            <           2606    17244 "   texts_tags_lnk texts_tags_lnk_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.texts_tags_lnk
    ADD CONSTRAINT texts_tags_lnk_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.texts_tags_lnk DROP CONSTRAINT texts_tags_lnk_pkey;
       public                 postgres    false    285            >           2606    17248     texts_tags_lnk texts_tags_lnk_uq 
   CONSTRAINT     f   ALTER TABLE ONLY public.texts_tags_lnk
    ADD CONSTRAINT texts_tags_lnk_uq UNIQUE (text_id, tag_id);
 J   ALTER TABLE ONLY public.texts_tags_lnk DROP CONSTRAINT texts_tags_lnk_uq;
       public                 postgres    false    285    285            Y           2606    24727 :   texts_text_author_type_lnk texts_text_author_type_lnk_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.texts_text_author_type_lnk
    ADD CONSTRAINT texts_text_author_type_lnk_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.texts_text_author_type_lnk DROP CONSTRAINT texts_text_author_type_lnk_pkey;
       public                 postgres    false    295            [           2606    24731 8   texts_text_author_type_lnk texts_text_author_type_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.texts_text_author_type_lnk
    ADD CONSTRAINT texts_text_author_type_lnk_uq UNIQUE (text_id, text_author_type_id);
 b   ALTER TABLE ONLY public.texts_text_author_type_lnk DROP CONSTRAINT texts_text_author_type_lnk_uq;
       public                 postgres    false    295    295            S           2606    24715 ,   texts_text_type_lnk texts_text_type_lnk_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.texts_text_type_lnk
    ADD CONSTRAINT texts_text_type_lnk_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.texts_text_type_lnk DROP CONSTRAINT texts_text_type_lnk_pkey;
       public                 postgres    false    293            U           2606    24719 *   texts_text_type_lnk texts_text_type_lnk_uq 
   CONSTRAINT     v   ALTER TABLE ONLY public.texts_text_type_lnk
    ADD CONSTRAINT texts_text_type_lnk_uq UNIQUE (text_id, text_tapy_id);
 T   ALTER TABLE ONLY public.texts_text_type_lnk DROP CONSTRAINT texts_text_type_lnk_uq;
       public                 postgres    false    293    293            C           2606    17258 .   timelines_author_lnk timelines_author_lnk_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.timelines_author_lnk
    ADD CONSTRAINT timelines_author_lnk_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.timelines_author_lnk DROP CONSTRAINT timelines_author_lnk_pkey;
       public                 postgres    false    287            E           2606    17262 ,   timelines_author_lnk timelines_author_lnk_uq 
   CONSTRAINT     y   ALTER TABLE ONLY public.timelines_author_lnk
    ADD CONSTRAINT timelines_author_lnk_uq UNIQUE (timeline_id, author_id);
 V   ALTER TABLE ONLY public.timelines_author_lnk DROP CONSTRAINT timelines_author_lnk_uq;
       public                 postgres    false    287    287            -           2606    17219    timelines timelines_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.timelines
    ADD CONSTRAINT timelines_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.timelines DROP CONSTRAINT timelines_pkey;
       public                 postgres    false    281            �           2606    16529 "   up_permissions up_permissions_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_pkey;
       public                 postgres    false    223            �           2606    16791 4   up_permissions_role_lnk up_permissions_role_lnk_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.up_permissions_role_lnk DROP CONSTRAINT up_permissions_role_lnk_pkey;
       public                 postgres    false    263            �           2606    16795 2   up_permissions_role_lnk up_permissions_role_lnk_uq 
   CONSTRAINT        ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);
 \   ALTER TABLE ONLY public.up_permissions_role_lnk DROP CONSTRAINT up_permissions_role_lnk_uq;
       public                 postgres    false    263    263            �           2606    16543    up_roles up_roles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_pkey;
       public                 postgres    false    225            �           2606    16557    up_users up_users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_pkey;
       public                 postgres    false    227            �           2606    16804 (   up_users_role_lnk up_users_role_lnk_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.up_users_role_lnk DROP CONSTRAINT up_users_role_lnk_pkey;
       public                 postgres    false    265            �           2606    16808 &   up_users_role_lnk up_users_role_lnk_uq 
   CONSTRAINT     m   ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);
 P   ALTER TABLE ONLY public.up_users_role_lnk DROP CONSTRAINT up_users_role_lnk_uq;
       public                 postgres    false    265    265            �           2606    16727 8   upload_folders_parent_lnk upload_folders_parent_lnk_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.upload_folders_parent_lnk DROP CONSTRAINT upload_folders_parent_lnk_pkey;
       public                 postgres    false    253            �           2606    16731 6   upload_folders_parent_lnk upload_folders_parent_lnk_uq 
   CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);
 `   ALTER TABLE ONLY public.upload_folders_parent_lnk DROP CONSTRAINT upload_folders_parent_lnk_uq;
       public                 postgres    false    253    253            j           2606    16443 +   upload_folders upload_folders_path_id_index 
   CONSTRAINT     i   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);
 U   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_id_index;
       public                 postgres    false    211            l           2606    16445 (   upload_folders upload_folders_path_index 
   CONSTRAINT     c   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);
 R   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_index;
       public                 postgres    false    211            n           2606    16441 "   upload_folders upload_folders_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_pkey;
       public                 postgres    false    211            �           1259    16573 "   admin_permissions_created_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);
 6   DROP INDEX public.admin_permissions_created_by_id_fk;
       public                 postgres    false    229            �           1259    16572    admin_permissions_documents_idx    INDEX     z   CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);
 3   DROP INDEX public.admin_permissions_documents_idx;
       public                 postgres    false    229    229    229            �           1259    16818    admin_permissions_role_lnk_fk    INDEX     m   CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);
 1   DROP INDEX public.admin_permissions_role_lnk_fk;
       public                 postgres    false    267            �           1259    16819    admin_permissions_role_lnk_ifk    INDEX     h   CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);
 2   DROP INDEX public.admin_permissions_role_lnk_ifk;
       public                 postgres    false    267                        1259    16822    admin_permissions_role_lnk_oifk    INDEX     p   CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);
 3   DROP INDEX public.admin_permissions_role_lnk_oifk;
       public                 postgres    false    267            �           1259    16574 "   admin_permissions_updated_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);
 6   DROP INDEX public.admin_permissions_updated_by_id_fk;
       public                 postgres    false    229            �           1259    16601    admin_roles_created_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);
 0   DROP INDEX public.admin_roles_created_by_id_fk;
       public                 postgres    false    233            �           1259    16600    admin_roles_documents_idx    INDEX     n   CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);
 -   DROP INDEX public.admin_roles_documents_idx;
       public                 postgres    false    233    233    233            �           1259    16602    admin_roles_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);
 0   DROP INDEX public.admin_roles_updated_by_id_fk;
       public                 postgres    false    233            �           1259    16587    admin_users_created_by_id_fk    INDEX     ]   CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);
 0   DROP INDEX public.admin_users_created_by_id_fk;
       public                 postgres    false    231            �           1259    16586    admin_users_documents_idx    INDEX     n   CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);
 -   DROP INDEX public.admin_users_documents_idx;
       public                 postgres    false    231    231    231                       1259    16831    admin_users_roles_lnk_fk    INDEX     ]   CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);
 ,   DROP INDEX public.admin_users_roles_lnk_fk;
       public                 postgres    false    269                       1259    16832    admin_users_roles_lnk_ifk    INDEX     ^   CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);
 -   DROP INDEX public.admin_users_roles_lnk_ifk;
       public                 postgres    false    269                       1259    16835    admin_users_roles_lnk_ofk    INDEX     _   CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);
 -   DROP INDEX public.admin_users_roles_lnk_ofk;
       public                 postgres    false    269                       1259    16836    admin_users_roles_lnk_oifk    INDEX     `   CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);
 .   DROP INDEX public.admin_users_roles_lnk_oifk;
       public                 postgres    false    269            �           1259    16588    admin_users_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);
 0   DROP INDEX public.admin_users_updated_by_id_fk;
       public                 postgres    false    231                       1259    17179    authors_created_by_id_fk    INDEX     U   CREATE INDEX authors_created_by_id_fk ON public.authors USING btree (created_by_id);
 ,   DROP INDEX public.authors_created_by_id_fk;
       public                 postgres    false    275                       1259    17178    authors_documents_idx    INDEX     f   CREATE INDEX authors_documents_idx ON public.authors USING btree (document_id, locale, published_at);
 )   DROP INDEX public.authors_documents_idx;
       public                 postgres    false    275    275    275                       1259    17180    authors_updated_by_id_fk    INDEX     U   CREATE INDEX authors_updated_by_id_fk ON public.authors USING btree (updated_by_id);
 ,   DROP INDEX public.authors_updated_by_id_fk;
       public                 postgres    false    275            \           1259    16429    files_created_by_id_fk    INDEX     Q   CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);
 *   DROP INDEX public.files_created_by_id_fk;
       public                 postgres    false    209            ]           1259    16428    files_documents_idx    INDEX     b   CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);
 '   DROP INDEX public.files_documents_idx;
       public                 postgres    false    209    209    209            �           1259    16715    files_folder_lnk_fk    INDEX     S   CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);
 '   DROP INDEX public.files_folder_lnk_fk;
       public                 postgres    false    251            �           1259    16716    files_folder_lnk_ifk    INDEX     V   CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);
 (   DROP INDEX public.files_folder_lnk_ifk;
       public                 postgres    false    251            �           1259    16719    files_folder_lnk_oifk    INDEX     V   CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);
 )   DROP INDEX public.files_folder_lnk_oifk;
       public                 postgres    false    251            �           1259    16704    files_related_mph_fk    INDEX     U   CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);
 (   DROP INDEX public.files_related_mph_fk;
       public                 postgres    false    249            �           1259    16706    files_related_mph_idix    INDEX     Z   CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);
 *   DROP INDEX public.files_related_mph_idix;
       public                 postgres    false    249            �           1259    16705    files_related_mph_oidx    INDEX     W   CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");
 *   DROP INDEX public.files_related_mph_oidx;
       public                 postgres    false    249            `           1259    16430    files_updated_by_id_fk    INDEX     Q   CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);
 *   DROP INDEX public.files_updated_by_id_fk;
       public                 postgres    false    209            p           1259    16461    i18n_locale_created_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);
 0   DROP INDEX public.i18n_locale_created_by_id_fk;
       public                 postgres    false    213            q           1259    16460    i18n_locale_documents_idx    INDEX     n   CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);
 -   DROP INDEX public.i18n_locale_documents_idx;
       public                 postgres    false    213    213    213            t           1259    16462    i18n_locale_updated_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);
 0   DROP INDEX public.i18n_locale_updated_by_id_fk;
       public                 postgres    false    213            \           1259    32781    pages_created_by_id_fk    INDEX     Q   CREATE INDEX pages_created_by_id_fk ON public.pages USING btree (created_by_id);
 *   DROP INDEX public.pages_created_by_id_fk;
       public                 postgres    false    297            ]           1259    32780    pages_documents_idx    INDEX     b   CREATE INDEX pages_documents_idx ON public.pages USING btree (document_id, locale, published_at);
 '   DROP INDEX public.pages_documents_idx;
       public                 postgres    false    297    297    297            a           1259    49161    pages_parent_lnk_fk    INDEX     S   CREATE INDEX pages_parent_lnk_fk ON public.pages_parent_lnk USING btree (page_id);
 '   DROP INDEX public.pages_parent_lnk_fk;
       public                 postgres    false    299            b           1259    49162    pages_parent_lnk_ifk    INDEX     T   CREATE INDEX pages_parent_lnk_ifk ON public.pages_parent_lnk USING btree (text_id);
 (   DROP INDEX public.pages_parent_lnk_ifk;
       public                 postgres    false    299            c           1259    49165    pages_parent_lnk_oifk    INDEX     V   CREATE INDEX pages_parent_lnk_oifk ON public.pages_parent_lnk USING btree (page_ord);
 )   DROP INDEX public.pages_parent_lnk_oifk;
       public                 postgres    false    299            `           1259    32782    pages_updated_by_id_fk    INDEX     Q   CREATE INDEX pages_updated_by_id_fk ON public.pages USING btree (updated_by_id);
 *   DROP INDEX public.pages_updated_by_id_fk;
       public                 postgres    false    297            �           1259    16629 -   strapi_api_token_permissions_created_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_created_by_id_fk;
       public                 postgres    false    237            �           1259    16628 *   strapi_api_token_permissions_documents_idx    INDEX     �   CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);
 >   DROP INDEX public.strapi_api_token_permissions_documents_idx;
       public                 postgres    false    237    237    237                       1259    16845 )   strapi_api_token_permissions_token_lnk_fk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);
 =   DROP INDEX public.strapi_api_token_permissions_token_lnk_fk;
       public                 postgres    false    271                       1259    16846 *   strapi_api_token_permissions_token_lnk_ifk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);
 >   DROP INDEX public.strapi_api_token_permissions_token_lnk_ifk;
       public                 postgres    false    271                       1259    16849 +   strapi_api_token_permissions_token_lnk_oifk    INDEX     �   CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);
 ?   DROP INDEX public.strapi_api_token_permissions_token_lnk_oifk;
       public                 postgres    false    271            �           1259    16630 -   strapi_api_token_permissions_updated_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_updated_by_id_fk;
       public                 postgres    false    237            �           1259    16615 "   strapi_api_tokens_created_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);
 6   DROP INDEX public.strapi_api_tokens_created_by_id_fk;
       public                 postgres    false    235            �           1259    16614    strapi_api_tokens_documents_idx    INDEX     z   CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);
 3   DROP INDEX public.strapi_api_tokens_documents_idx;
       public                 postgres    false    235    235    235            �           1259    16616 "   strapi_api_tokens_updated_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);
 6   DROP INDEX public.strapi_api_tokens_updated_by_id_fk;
       public                 postgres    false    235            �           1259    16692 (   strapi_history_versions_created_by_id_fk    INDEX     u   CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);
 <   DROP INDEX public.strapi_history_versions_created_by_id_fk;
       public                 postgres    false    247            z           1259    16489 '   strapi_release_actions_created_by_id_fk    INDEX     s   CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);
 ;   DROP INDEX public.strapi_release_actions_created_by_id_fk;
       public                 postgres    false    217            {           1259    16488 $   strapi_release_actions_documents_idx    INDEX     �   CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);
 8   DROP INDEX public.strapi_release_actions_documents_idx;
       public                 postgres    false    217    217    217            �           1259    16741 %   strapi_release_actions_release_lnk_fk    INDEX     �   CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);
 9   DROP INDEX public.strapi_release_actions_release_lnk_fk;
       public                 postgres    false    255            �           1259    16742 &   strapi_release_actions_release_lnk_ifk    INDEX     {   CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);
 :   DROP INDEX public.strapi_release_actions_release_lnk_ifk;
       public                 postgres    false    255            �           1259    16745 '   strapi_release_actions_release_lnk_oifk    INDEX     �   CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);
 ;   DROP INDEX public.strapi_release_actions_release_lnk_oifk;
       public                 postgres    false    255            ~           1259    16490 '   strapi_release_actions_updated_by_id_fk    INDEX     s   CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);
 ;   DROP INDEX public.strapi_release_actions_updated_by_id_fk;
       public                 postgres    false    217            u           1259    16475     strapi_releases_created_by_id_fk    INDEX     e   CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);
 4   DROP INDEX public.strapi_releases_created_by_id_fk;
       public                 postgres    false    215            v           1259    16474    strapi_releases_documents_idx    INDEX     v   CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);
 1   DROP INDEX public.strapi_releases_documents_idx;
       public                 postgres    false    215    215    215            y           1259    16476     strapi_releases_updated_by_id_fk    INDEX     e   CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);
 4   DROP INDEX public.strapi_releases_updated_by_id_fk;
       public                 postgres    false    215            �           1259    16657 2   strapi_transfer_token_permissions_created_by_id_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);
 F   DROP INDEX public.strapi_transfer_token_permissions_created_by_id_fk;
       public                 postgres    false    241            �           1259    16656 /   strapi_transfer_token_permissions_documents_idx    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);
 C   DROP INDEX public.strapi_transfer_token_permissions_documents_idx;
       public                 postgres    false    241    241    241                       1259    16858 .   strapi_transfer_token_permissions_token_lnk_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);
 B   DROP INDEX public.strapi_transfer_token_permissions_token_lnk_fk;
       public                 postgres    false    273                       1259    16859 /   strapi_transfer_token_permissions_token_lnk_ifk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);
 C   DROP INDEX public.strapi_transfer_token_permissions_token_lnk_ifk;
       public                 postgres    false    273                       1259    16862 0   strapi_transfer_token_permissions_token_lnk_oifk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);
 D   DROP INDEX public.strapi_transfer_token_permissions_token_lnk_oifk;
       public                 postgres    false    273            �           1259    16658 2   strapi_transfer_token_permissions_updated_by_id_fk    INDEX     �   CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);
 F   DROP INDEX public.strapi_transfer_token_permissions_updated_by_id_fk;
       public                 postgres    false    241            �           1259    16643 '   strapi_transfer_tokens_created_by_id_fk    INDEX     s   CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);
 ;   DROP INDEX public.strapi_transfer_tokens_created_by_id_fk;
       public                 postgres    false    239            �           1259    16642 $   strapi_transfer_tokens_documents_idx    INDEX     �   CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);
 8   DROP INDEX public.strapi_transfer_tokens_documents_idx;
       public                 postgres    false    239    239    239            �           1259    16644 '   strapi_transfer_tokens_updated_by_id_fk    INDEX     s   CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);
 ;   DROP INDEX public.strapi_transfer_tokens_updated_by_id_fk;
       public                 postgres    false    239                       1259    16503 !   strapi_workflows_created_by_id_fk    INDEX     g   CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);
 5   DROP INDEX public.strapi_workflows_created_by_id_fk;
       public                 postgres    false    219            �           1259    16502    strapi_workflows_documents_idx    INDEX     x   CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);
 2   DROP INDEX public.strapi_workflows_documents_idx;
       public                 postgres    false    219    219    219            �           1259    16754 1   strapi_workflows_stage_required_to_publish_lnk_fk    INDEX     �   CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);
 E   DROP INDEX public.strapi_workflows_stage_required_to_publish_lnk_fk;
       public                 postgres    false    257            �           1259    16755 2   strapi_workflows_stage_required_to_publish_lnk_ifk    INDEX     �   CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);
 F   DROP INDEX public.strapi_workflows_stage_required_to_publish_lnk_ifk;
       public                 postgres    false    257            �           1259    16517 (   strapi_workflows_stages_created_by_id_fk    INDEX     u   CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);
 <   DROP INDEX public.strapi_workflows_stages_created_by_id_fk;
       public                 postgres    false    221            �           1259    16516 %   strapi_workflows_stages_documents_idx    INDEX     �   CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);
 9   DROP INDEX public.strapi_workflows_stages_documents_idx;
       public                 postgres    false    221    221    221            �           1259    16779 *   strapi_workflows_stages_permissions_lnk_fk    INDEX     �   CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);
 >   DROP INDEX public.strapi_workflows_stages_permissions_lnk_fk;
       public                 postgres    false    261            �           1259    16780 +   strapi_workflows_stages_permissions_lnk_ifk    INDEX     �   CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);
 ?   DROP INDEX public.strapi_workflows_stages_permissions_lnk_ifk;
       public                 postgres    false    261            �           1259    16783 +   strapi_workflows_stages_permissions_lnk_ofk    INDEX     �   CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);
 ?   DROP INDEX public.strapi_workflows_stages_permissions_lnk_ofk;
       public                 postgres    false    261            �           1259    16518 (   strapi_workflows_stages_updated_by_id_fk    INDEX     u   CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);
 <   DROP INDEX public.strapi_workflows_stages_updated_by_id_fk;
       public                 postgres    false    221            �           1259    16766 '   strapi_workflows_stages_workflow_lnk_fk    INDEX     �   CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);
 ;   DROP INDEX public.strapi_workflows_stages_workflow_lnk_fk;
       public                 postgres    false    259            �           1259    16767 (   strapi_workflows_stages_workflow_lnk_ifk    INDEX     �   CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);
 <   DROP INDEX public.strapi_workflows_stages_workflow_lnk_ifk;
       public                 postgres    false    259            �           1259    16770 )   strapi_workflows_stages_workflow_lnk_oifk    INDEX     �   CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);
 =   DROP INDEX public.strapi_workflows_stages_workflow_lnk_oifk;
       public                 postgres    false    259            �           1259    16504 !   strapi_workflows_updated_by_id_fk    INDEX     g   CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);
 5   DROP INDEX public.strapi_workflows_updated_by_id_fk;
       public                 postgres    false    219                        1259    17193    tags_created_by_id_fk    INDEX     O   CREATE INDEX tags_created_by_id_fk ON public.tags USING btree (created_by_id);
 )   DROP INDEX public.tags_created_by_id_fk;
       public                 postgres    false    277            !           1259    17192    tags_documents_idx    INDEX     `   CREATE INDEX tags_documents_idx ON public.tags USING btree (document_id, locale, published_at);
 &   DROP INDEX public.tags_documents_idx;
       public                 postgres    false    277    277    277            $           1259    17194    tags_updated_by_id_fk    INDEX     O   CREATE INDEX tags_updated_by_id_fk ON public.tags USING btree (updated_by_id);
 )   DROP INDEX public.tags_updated_by_id_fk;
       public                 postgres    false    277            K           1259    24694 "   text_author_types_created_by_id_fk    INDEX     i   CREATE INDEX text_author_types_created_by_id_fk ON public.text_author_types USING btree (created_by_id);
 6   DROP INDEX public.text_author_types_created_by_id_fk;
       public                 postgres    false    291            L           1259    24693    text_author_types_documents_idx    INDEX     z   CREATE INDEX text_author_types_documents_idx ON public.text_author_types USING btree (document_id, locale, published_at);
 3   DROP INDEX public.text_author_types_documents_idx;
       public                 postgres    false    291    291    291            O           1259    24695 "   text_author_types_updated_by_id_fk    INDEX     i   CREATE INDEX text_author_types_updated_by_id_fk ON public.text_author_types USING btree (updated_by_id);
 6   DROP INDEX public.text_author_types_updated_by_id_fk;
       public                 postgres    false    291            F           1259    24643    text_tapies_created_by_id_fk    INDEX     ]   CREATE INDEX text_tapies_created_by_id_fk ON public.text_tapies USING btree (created_by_id);
 0   DROP INDEX public.text_tapies_created_by_id_fk;
       public                 postgres    false    289            G           1259    24642    text_tapies_documents_idx    INDEX     n   CREATE INDEX text_tapies_documents_idx ON public.text_tapies USING btree (document_id, locale, published_at);
 -   DROP INDEX public.text_tapies_documents_idx;
       public                 postgres    false    289    289    289            J           1259    24644    text_tapies_updated_by_id_fk    INDEX     ]   CREATE INDEX text_tapies_updated_by_id_fk ON public.text_tapies USING btree (updated_by_id);
 0   DROP INDEX public.text_tapies_updated_by_id_fk;
       public                 postgres    false    289            /           1259    17231    texts_authors_lnk_fk    INDEX     U   CREATE INDEX texts_authors_lnk_fk ON public.texts_authors_lnk USING btree (text_id);
 (   DROP INDEX public.texts_authors_lnk_fk;
       public                 postgres    false    283            0           1259    17232    texts_authors_lnk_ifk    INDEX     X   CREATE INDEX texts_authors_lnk_ifk ON public.texts_authors_lnk USING btree (author_id);
 )   DROP INDEX public.texts_authors_lnk_ifk;
       public                 postgres    false    283            1           1259    17235    texts_authors_lnk_ofk    INDEX     Y   CREATE INDEX texts_authors_lnk_ofk ON public.texts_authors_lnk USING btree (author_ord);
 )   DROP INDEX public.texts_authors_lnk_ofk;
       public                 postgres    false    283            2           1259    17236    texts_authors_lnk_oifk    INDEX     X   CREATE INDEX texts_authors_lnk_oifk ON public.texts_authors_lnk USING btree (text_ord);
 *   DROP INDEX public.texts_authors_lnk_oifk;
       public                 postgres    false    283            %           1259    17207    texts_created_by_id_fk    INDEX     Q   CREATE INDEX texts_created_by_id_fk ON public.texts USING btree (created_by_id);
 *   DROP INDEX public.texts_created_by_id_fk;
       public                 postgres    false    279            &           1259    17206    texts_documents_idx    INDEX     b   CREATE INDEX texts_documents_idx ON public.texts USING btree (document_id, locale, published_at);
 '   DROP INDEX public.texts_documents_idx;
       public                 postgres    false    279    279    279            7           1259    17245    texts_tags_lnk_fk    INDEX     O   CREATE INDEX texts_tags_lnk_fk ON public.texts_tags_lnk USING btree (text_id);
 %   DROP INDEX public.texts_tags_lnk_fk;
       public                 postgres    false    285            8           1259    17246    texts_tags_lnk_ifk    INDEX     O   CREATE INDEX texts_tags_lnk_ifk ON public.texts_tags_lnk USING btree (tag_id);
 &   DROP INDEX public.texts_tags_lnk_ifk;
       public                 postgres    false    285            9           1259    17249    texts_tags_lnk_ofk    INDEX     P   CREATE INDEX texts_tags_lnk_ofk ON public.texts_tags_lnk USING btree (tag_ord);
 &   DROP INDEX public.texts_tags_lnk_ofk;
       public                 postgres    false    285            :           1259    17250    texts_tags_lnk_oifk    INDEX     R   CREATE INDEX texts_tags_lnk_oifk ON public.texts_tags_lnk USING btree (text_ord);
 '   DROP INDEX public.texts_tags_lnk_oifk;
       public                 postgres    false    285            V           1259    24728    texts_text_author_type_lnk_fk    INDEX     g   CREATE INDEX texts_text_author_type_lnk_fk ON public.texts_text_author_type_lnk USING btree (text_id);
 1   DROP INDEX public.texts_text_author_type_lnk_fk;
       public                 postgres    false    295            W           1259    24729    texts_text_author_type_lnk_ifk    INDEX     t   CREATE INDEX texts_text_author_type_lnk_ifk ON public.texts_text_author_type_lnk USING btree (text_author_type_id);
 2   DROP INDEX public.texts_text_author_type_lnk_ifk;
       public                 postgres    false    295            P           1259    24716    texts_text_type_lnk_fk    INDEX     Y   CREATE INDEX texts_text_type_lnk_fk ON public.texts_text_type_lnk USING btree (text_id);
 *   DROP INDEX public.texts_text_type_lnk_fk;
       public                 postgres    false    293            Q           1259    24717    texts_text_type_lnk_ifk    INDEX     _   CREATE INDEX texts_text_type_lnk_ifk ON public.texts_text_type_lnk USING btree (text_tapy_id);
 +   DROP INDEX public.texts_text_type_lnk_ifk;
       public                 postgres    false    293            )           1259    17208    texts_updated_by_id_fk    INDEX     Q   CREATE INDEX texts_updated_by_id_fk ON public.texts USING btree (updated_by_id);
 *   DROP INDEX public.texts_updated_by_id_fk;
       public                 postgres    false    279            ?           1259    17259    timelines_author_lnk_fk    INDEX     _   CREATE INDEX timelines_author_lnk_fk ON public.timelines_author_lnk USING btree (timeline_id);
 +   DROP INDEX public.timelines_author_lnk_fk;
       public                 postgres    false    287            @           1259    17260    timelines_author_lnk_ifk    INDEX     ^   CREATE INDEX timelines_author_lnk_ifk ON public.timelines_author_lnk USING btree (author_id);
 ,   DROP INDEX public.timelines_author_lnk_ifk;
       public                 postgres    false    287            A           1259    17263    timelines_author_lnk_oifk    INDEX     b   CREATE INDEX timelines_author_lnk_oifk ON public.timelines_author_lnk USING btree (timeline_ord);
 -   DROP INDEX public.timelines_author_lnk_oifk;
       public                 postgres    false    287            *           1259    17221    timelines_created_by_id_fk    INDEX     Y   CREATE INDEX timelines_created_by_id_fk ON public.timelines USING btree (created_by_id);
 .   DROP INDEX public.timelines_created_by_id_fk;
       public                 postgres    false    281            +           1259    17220    timelines_documents_idx    INDEX     j   CREATE INDEX timelines_documents_idx ON public.timelines USING btree (document_id, locale, published_at);
 +   DROP INDEX public.timelines_documents_idx;
       public                 postgres    false    281    281    281            .           1259    17222    timelines_updated_by_id_fk    INDEX     Y   CREATE INDEX timelines_updated_by_id_fk ON public.timelines USING btree (updated_by_id);
 .   DROP INDEX public.timelines_updated_by_id_fk;
       public                 postgres    false    281            �           1259    16531    up_permissions_created_by_id_fk    INDEX     c   CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);
 3   DROP INDEX public.up_permissions_created_by_id_fk;
       public                 postgres    false    223            �           1259    16530    up_permissions_documents_idx    INDEX     t   CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);
 0   DROP INDEX public.up_permissions_documents_idx;
       public                 postgres    false    223    223    223            �           1259    16792    up_permissions_role_lnk_fk    INDEX     g   CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);
 .   DROP INDEX public.up_permissions_role_lnk_fk;
       public                 postgres    false    263            �           1259    16793    up_permissions_role_lnk_ifk    INDEX     b   CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);
 /   DROP INDEX public.up_permissions_role_lnk_ifk;
       public                 postgres    false    263            �           1259    16796    up_permissions_role_lnk_oifk    INDEX     j   CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);
 0   DROP INDEX public.up_permissions_role_lnk_oifk;
       public                 postgres    false    263            �           1259    16532    up_permissions_updated_by_id_fk    INDEX     c   CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);
 3   DROP INDEX public.up_permissions_updated_by_id_fk;
       public                 postgres    false    223            �           1259    16545    up_roles_created_by_id_fk    INDEX     W   CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);
 -   DROP INDEX public.up_roles_created_by_id_fk;
       public                 postgres    false    225            �           1259    16544    up_roles_documents_idx    INDEX     h   CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);
 *   DROP INDEX public.up_roles_documents_idx;
       public                 postgres    false    225    225    225            �           1259    16546    up_roles_updated_by_id_fk    INDEX     W   CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);
 -   DROP INDEX public.up_roles_updated_by_id_fk;
       public                 postgres    false    225            �           1259    16559    up_users_created_by_id_fk    INDEX     W   CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);
 -   DROP INDEX public.up_users_created_by_id_fk;
       public                 postgres    false    227            �           1259    16558    up_users_documents_idx    INDEX     h   CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);
 *   DROP INDEX public.up_users_documents_idx;
       public                 postgres    false    227    227    227            �           1259    16805    up_users_role_lnk_fk    INDEX     U   CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);
 (   DROP INDEX public.up_users_role_lnk_fk;
       public                 postgres    false    265            �           1259    16806    up_users_role_lnk_ifk    INDEX     V   CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);
 )   DROP INDEX public.up_users_role_lnk_ifk;
       public                 postgres    false    265            �           1259    16809    up_users_role_lnk_oifk    INDEX     X   CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);
 *   DROP INDEX public.up_users_role_lnk_oifk;
       public                 postgres    false    265            �           1259    16560    up_users_updated_by_id_fk    INDEX     W   CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);
 -   DROP INDEX public.up_users_updated_by_id_fk;
       public                 postgres    false    227            a           1259    16423    upload_files_created_at_index    INDEX     U   CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);
 1   DROP INDEX public.upload_files_created_at_index;
       public                 postgres    false    209            b           1259    16427    upload_files_ext_index    INDEX     G   CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);
 *   DROP INDEX public.upload_files_ext_index;
       public                 postgres    false    209            c           1259    16422    upload_files_folder_path_index    INDEX     W   CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);
 2   DROP INDEX public.upload_files_folder_path_index;
       public                 postgres    false    209            d           1259    16425    upload_files_name_index    INDEX     I   CREATE INDEX upload_files_name_index ON public.files USING btree (name);
 +   DROP INDEX public.upload_files_name_index;
       public                 postgres    false    209            e           1259    16426    upload_files_size_index    INDEX     I   CREATE INDEX upload_files_size_index ON public.files USING btree (size);
 +   DROP INDEX public.upload_files_size_index;
       public                 postgres    false    209            f           1259    16424    upload_files_updated_at_index    INDEX     U   CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);
 1   DROP INDEX public.upload_files_updated_at_index;
       public                 postgres    false    209            g           1259    16447    upload_folders_created_by_id_fk    INDEX     c   CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);
 3   DROP INDEX public.upload_folders_created_by_id_fk;
       public                 postgres    false    211            h           1259    16446    upload_folders_documents_idx    INDEX     t   CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);
 0   DROP INDEX public.upload_folders_documents_idx;
       public                 postgres    false    211    211    211            �           1259    16728    upload_folders_parent_lnk_fk    INDEX     g   CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);
 0   DROP INDEX public.upload_folders_parent_lnk_fk;
       public                 postgres    false    253            �           1259    16729    upload_folders_parent_lnk_ifk    INDEX     l   CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);
 1   DROP INDEX public.upload_folders_parent_lnk_ifk;
       public                 postgres    false    253            �           1259    16732    upload_folders_parent_lnk_oifk    INDEX     j   CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);
 2   DROP INDEX public.upload_folders_parent_lnk_oifk;
       public                 postgres    false    253            o           1259    16448    upload_folders_updated_by_id_fk    INDEX     c   CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);
 3   DROP INDEX public.upload_folders_updated_by_id_fk;
       public                 postgres    false    211            |           2606    16963 4   admin_permissions admin_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_created_by_id_fk;
       public               postgres    false    229    231    3232            �           2606    17123 8   admin_permissions_role_lnk admin_permissions_role_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.admin_permissions_role_lnk DROP CONSTRAINT admin_permissions_role_lnk_fk;
       public               postgres    false    229    3227    267            �           2606    17128 9   admin_permissions_role_lnk admin_permissions_role_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.admin_permissions_role_lnk DROP CONSTRAINT admin_permissions_role_lnk_ifk;
       public               postgres    false    233    3237    267            }           2606    16968 4   admin_permissions admin_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_updated_by_id_fk;
       public               postgres    false    3232    229    231            �           2606    16983 (   admin_roles admin_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_created_by_id_fk;
       public               postgres    false    231    3232    233            �           2606    16988 (   admin_roles admin_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_updated_by_id_fk;
       public               postgres    false    3232    231    233            ~           2606    16973 (   admin_users admin_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_created_by_id_fk;
       public               postgres    false    231    3232    231            �           2606    17133 .   admin_users_roles_lnk admin_users_roles_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.admin_users_roles_lnk DROP CONSTRAINT admin_users_roles_lnk_fk;
       public               postgres    false    269    3232    231            �           2606    17138 /   admin_users_roles_lnk admin_users_roles_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.admin_users_roles_lnk DROP CONSTRAINT admin_users_roles_lnk_ifk;
       public               postgres    false    233    3237    269                       2606    16978 (   admin_users admin_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_updated_by_id_fk;
       public               postgres    false    3232    231    231            �           2606    17264     authors authors_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_created_by_id_fk;
       public               postgres    false    3232    275    231            �           2606    17269     authors authors_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_updated_by_id_fk;
       public               postgres    false    231    3232    275            h           2606    16863    files files_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_created_by_id_fk;
       public               postgres    false    209    231    3232            �           2606    17043 $   files_folder_lnk files_folder_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.files_folder_lnk DROP CONSTRAINT files_folder_lnk_fk;
       public               postgres    false    209    3167    251            �           2606    17048 %   files_folder_lnk files_folder_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.files_folder_lnk DROP CONSTRAINT files_folder_lnk_ifk;
       public               postgres    false    211    251    3182            �           2606    17038 &   files_related_mph files_related_mph_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.files_related_mph DROP CONSTRAINT files_related_mph_fk;
       public               postgres    false    249    209    3167            i           2606    16868    files files_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_updated_by_id_fk;
       public               postgres    false    209    231    3232            l           2606    16883 (   i18n_locale i18n_locale_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_created_by_id_fk;
       public               postgres    false    213    3232    231            m           2606    16888 (   i18n_locale i18n_locale_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_updated_by_id_fk;
       public               postgres    false    231    3232    213            �           2606    32783    pages pages_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_created_by_id_fk;
       public               postgres    false    231    297    3232            �           2606    49166 $   pages_parent_lnk pages_parent_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_parent_lnk
    ADD CONSTRAINT pages_parent_lnk_fk FOREIGN KEY (page_id) REFERENCES public.pages(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.pages_parent_lnk DROP CONSTRAINT pages_parent_lnk_fk;
       public               postgres    false    299    3423    297            �           2606    49171 %   pages_parent_lnk pages_parent_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages_parent_lnk
    ADD CONSTRAINT pages_parent_lnk_ifk FOREIGN KEY (text_id) REFERENCES public.texts(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.pages_parent_lnk DROP CONSTRAINT pages_parent_lnk_ifk;
       public               postgres    false    279    3368    299            �           2606    32788    pages pages_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_updated_by_id_fk;
       public               postgres    false    297    3232    231            �           2606    17003 J   strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_created_by_id_fk;
       public               postgres    false    3232    237    231            �           2606    17143 P   strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;
 z   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT strapi_api_token_permissions_token_lnk_fk;
       public               postgres    false    3247    237    271            �           2606    17148 Q   strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;
 {   ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk DROP CONSTRAINT strapi_api_token_permissions_token_lnk_ifk;
       public               postgres    false    271    235    3242            �           2606    17008 J   strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_updated_by_id_fk;
       public               postgres    false    237    231    3232            �           2606    16993 4   strapi_api_tokens strapi_api_tokens_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_created_by_id_fk;
       public               postgres    false    231    235    3232            �           2606    16998 4   strapi_api_tokens strapi_api_tokens_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_updated_by_id_fk;
       public               postgres    false    235    231    3232            �           2606    17033 @   strapi_history_versions strapi_history_versions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY public.strapi_history_versions DROP CONSTRAINT strapi_history_versions_created_by_id_fk;
       public               postgres    false    247    231    3232            p           2606    16903 >   strapi_release_actions strapi_release_actions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_release_actions DROP CONSTRAINT strapi_release_actions_created_by_id_fk;
       public               postgres    false    231    3232    217            �           2606    17063 H   strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;
 r   ALTER TABLE ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT strapi_release_actions_release_lnk_fk;
       public               postgres    false    217    3197    255            �           2606    17068 I   strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;
 s   ALTER TABLE ONLY public.strapi_release_actions_release_lnk DROP CONSTRAINT strapi_release_actions_release_lnk_ifk;
       public               postgres    false    215    255    3192            q           2606    16908 >   strapi_release_actions strapi_release_actions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_release_actions DROP CONSTRAINT strapi_release_actions_updated_by_id_fk;
       public               postgres    false    231    3232    217            n           2606    16893 0   strapi_releases strapi_releases_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.strapi_releases DROP CONSTRAINT strapi_releases_created_by_id_fk;
       public               postgres    false    215    231    3232            o           2606    16898 0   strapi_releases strapi_releases_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.strapi_releases DROP CONSTRAINT strapi_releases_updated_by_id_fk;
       public               postgres    false    215    231    3232            �           2606    17023 T   strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk;
       public               postgres    false    3232    241    231            �           2606    17153 Z   strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk;
       public               postgres    false    241    3257    273            �           2606    17158 [   strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk DROP CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk;
       public               postgres    false    273    3252    239            �           2606    17028 T   strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk;
       public               postgres    false    241    3232    231            �           2606    17013 >   strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_created_by_id_fk;
       public               postgres    false    239    231    3232            �           2606    17018 >   strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_updated_by_id_fk;
       public               postgres    false    239    231    3232            r           2606    16913 2   strapi_workflows strapi_workflows_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.strapi_workflows DROP CONSTRAINT strapi_workflows_created_by_id_fk;
       public               postgres    false    219    231    3232            �           2606    17073 `   strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk;
       public               postgres    false    257    219    3202            �           2606    17078 a   strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;
 �   ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk DROP CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk;
       public               postgres    false    257    3207    221            t           2606    16923 @   strapi_workflows_stages strapi_workflows_stages_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY public.strapi_workflows_stages DROP CONSTRAINT strapi_workflows_stages_created_by_id_fk;
       public               postgres    false    231    221    3232            �           2606    17093 R   strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;
 |   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT strapi_workflows_stages_permissions_lnk_fk;
       public               postgres    false    221    3207    261            �           2606    17098 S   strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;
 }   ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk DROP CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk;
       public               postgres    false    261    3227    229            u           2606    16928 @   strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 j   ALTER TABLE ONLY public.strapi_workflows_stages DROP CONSTRAINT strapi_workflows_stages_updated_by_id_fk;
       public               postgres    false    221    231    3232            �           2606    17083 L   strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;
 v   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT strapi_workflows_stages_workflow_lnk_fk;
       public               postgres    false    3207    259    221            �           2606    17088 M   strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;
 w   ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk DROP CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk;
       public               postgres    false    3202    259    219            s           2606    16918 2   strapi_workflows strapi_workflows_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.strapi_workflows DROP CONSTRAINT strapi_workflows_updated_by_id_fk;
       public               postgres    false    231    219    3232            �           2606    17274    tags tags_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_created_by_id_fk;
       public               postgres    false    277    231    3232            �           2606    17279    tags tags_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_updated_by_id_fk;
       public               postgres    false    277    231    3232            �           2606    24696 4   text_author_types text_author_types_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.text_author_types
    ADD CONSTRAINT text_author_types_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.text_author_types DROP CONSTRAINT text_author_types_created_by_id_fk;
       public               postgres    false    291    3232    231            �           2606    24701 4   text_author_types text_author_types_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.text_author_types
    ADD CONSTRAINT text_author_types_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.text_author_types DROP CONSTRAINT text_author_types_updated_by_id_fk;
       public               postgres    false    3232    231    291            �           2606    24645 (   text_tapies text_tapies_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.text_tapies
    ADD CONSTRAINT text_tapies_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.text_tapies DROP CONSTRAINT text_tapies_created_by_id_fk;
       public               postgres    false    3232    231    289            �           2606    24650 (   text_tapies text_tapies_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.text_tapies
    ADD CONSTRAINT text_tapies_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.text_tapies DROP CONSTRAINT text_tapies_updated_by_id_fk;
       public               postgres    false    3232    289    231            �           2606    17304 &   texts_authors_lnk texts_authors_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts_authors_lnk
    ADD CONSTRAINT texts_authors_lnk_fk FOREIGN KEY (text_id) REFERENCES public.texts(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.texts_authors_lnk DROP CONSTRAINT texts_authors_lnk_fk;
       public               postgres    false    3368    279    283            �           2606    17309 '   texts_authors_lnk texts_authors_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts_authors_lnk
    ADD CONSTRAINT texts_authors_lnk_ifk FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.texts_authors_lnk DROP CONSTRAINT texts_authors_lnk_ifk;
       public               postgres    false    283    275    3358            �           2606    17284    texts texts_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts
    ADD CONSTRAINT texts_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.texts DROP CONSTRAINT texts_created_by_id_fk;
       public               postgres    false    279    3232    231            �           2606    17314     texts_tags_lnk texts_tags_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts_tags_lnk
    ADD CONSTRAINT texts_tags_lnk_fk FOREIGN KEY (text_id) REFERENCES public.texts(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.texts_tags_lnk DROP CONSTRAINT texts_tags_lnk_fk;
       public               postgres    false    3368    279    285            �           2606    17319 !   texts_tags_lnk texts_tags_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts_tags_lnk
    ADD CONSTRAINT texts_tags_lnk_ifk FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.texts_tags_lnk DROP CONSTRAINT texts_tags_lnk_ifk;
       public               postgres    false    277    3363    285            �           2606    24742 8   texts_text_author_type_lnk texts_text_author_type_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts_text_author_type_lnk
    ADD CONSTRAINT texts_text_author_type_lnk_fk FOREIGN KEY (text_id) REFERENCES public.texts(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.texts_text_author_type_lnk DROP CONSTRAINT texts_text_author_type_lnk_fk;
       public               postgres    false    3368    279    295            �           2606    24747 9   texts_text_author_type_lnk texts_text_author_type_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts_text_author_type_lnk
    ADD CONSTRAINT texts_text_author_type_lnk_ifk FOREIGN KEY (text_author_type_id) REFERENCES public.text_author_types(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.texts_text_author_type_lnk DROP CONSTRAINT texts_text_author_type_lnk_ifk;
       public               postgres    false    3406    291    295            �           2606    24732 *   texts_text_type_lnk texts_text_type_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts_text_type_lnk
    ADD CONSTRAINT texts_text_type_lnk_fk FOREIGN KEY (text_id) REFERENCES public.texts(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.texts_text_type_lnk DROP CONSTRAINT texts_text_type_lnk_fk;
       public               postgres    false    3368    293    279            �           2606    24737 +   texts_text_type_lnk texts_text_type_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts_text_type_lnk
    ADD CONSTRAINT texts_text_type_lnk_ifk FOREIGN KEY (text_tapy_id) REFERENCES public.text_tapies(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.texts_text_type_lnk DROP CONSTRAINT texts_text_type_lnk_ifk;
       public               postgres    false    293    289    3401            �           2606    17289    texts texts_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.texts
    ADD CONSTRAINT texts_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.texts DROP CONSTRAINT texts_updated_by_id_fk;
       public               postgres    false    231    279    3232            �           2606    17324 ,   timelines_author_lnk timelines_author_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.timelines_author_lnk
    ADD CONSTRAINT timelines_author_lnk_fk FOREIGN KEY (timeline_id) REFERENCES public.timelines(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.timelines_author_lnk DROP CONSTRAINT timelines_author_lnk_fk;
       public               postgres    false    3373    287    281            �           2606    17329 -   timelines_author_lnk timelines_author_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.timelines_author_lnk
    ADD CONSTRAINT timelines_author_lnk_ifk FOREIGN KEY (author_id) REFERENCES public.authors(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.timelines_author_lnk DROP CONSTRAINT timelines_author_lnk_ifk;
       public               postgres    false    275    287    3358            �           2606    17294 $   timelines timelines_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.timelines
    ADD CONSTRAINT timelines_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.timelines DROP CONSTRAINT timelines_created_by_id_fk;
       public               postgres    false    281    231    3232            �           2606    17299 $   timelines timelines_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.timelines
    ADD CONSTRAINT timelines_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.timelines DROP CONSTRAINT timelines_updated_by_id_fk;
       public               postgres    false    3232    231    281            v           2606    16933 .   up_permissions up_permissions_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_created_by_id_fk;
       public               postgres    false    231    223    3232            �           2606    17103 2   up_permissions_role_lnk up_permissions_role_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.up_permissions_role_lnk DROP CONSTRAINT up_permissions_role_lnk_fk;
       public               postgres    false    3212    263    223            �           2606    17108 3   up_permissions_role_lnk up_permissions_role_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.up_permissions_role_lnk DROP CONSTRAINT up_permissions_role_lnk_ifk;
       public               postgres    false    263    3217    225            w           2606    16938 .   up_permissions up_permissions_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_updated_by_id_fk;
       public               postgres    false    231    223    3232            x           2606    16943 "   up_roles up_roles_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_created_by_id_fk;
       public               postgres    false    225    3232    231            y           2606    16948 "   up_roles up_roles_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_updated_by_id_fk;
       public               postgres    false    231    225    3232            z           2606    16953 "   up_users up_users_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_created_by_id_fk;
       public               postgres    false    3232    227    231            �           2606    17113 &   up_users_role_lnk up_users_role_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.up_users_role_lnk DROP CONSTRAINT up_users_role_lnk_fk;
       public               postgres    false    265    3222    227            �           2606    17118 '   up_users_role_lnk up_users_role_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.up_users_role_lnk DROP CONSTRAINT up_users_role_lnk_ifk;
       public               postgres    false    3217    225    265            {           2606    16958 "   up_users up_users_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_updated_by_id_fk;
       public               postgres    false    227    3232    231            j           2606    16873 .   upload_folders upload_folders_created_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_created_by_id_fk;
       public               postgres    false    231    3232    211            �           2606    17053 6   upload_folders_parent_lnk upload_folders_parent_lnk_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.upload_folders_parent_lnk DROP CONSTRAINT upload_folders_parent_lnk_fk;
       public               postgres    false    211    3182    253            �           2606    17058 7   upload_folders_parent_lnk upload_folders_parent_lnk_ifk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.upload_folders_parent_lnk DROP CONSTRAINT upload_folders_parent_lnk_ifk;
       public               postgres    false    253    211    3182            k           2606    16878 .   upload_folders upload_folders_updated_by_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_updated_by_id_fk;
       public               postgres    false    3232    211    231            W   5  x�՜�r������O�Q����11s���
�,�;�݇t�M��,�����Է����hj��)bf5e�j��|*!�l�����l釗F�!��������?�0��	�'D�D��gH.�����_����(��GYU����PU��#�*���]��z��;T�q���FE@�)��L`��YsT�GU����V����L9}�p����dRx�^��vJf��M�v��*<Ew2r��AQ�S;F�T��e�ם%��t��Cq��.��H�b��a��|
\��`
�Db�w�jz����rɝ��7.T�'�W!J��Y��x0M
�;S���ߚ���ke�m����X� &^="ƒ��tu*+��p��l����G?�ߨ$�hN�Qfp�*g�!m���F�c�c�
A�e��CG���	t�&"g���{�7�ñ��"k�q-e��b�jUg�k�6E�������������F�"d��e���s��`�Qa� �e�"SZ&�T��Y�����=�~�Ǻ��q!m���zo1,%�}�t���5e�aQ���EF۰����?�]���������}c�US�&�������l��u��l��O��LW�eB6��!>���l���Mi�����⭕�H�n��`d�F�@��بf�1Fq?}�U�o�<�����ɣ��S���Y����44ʨ��������'����o���\vj��F�]�<�-���~�Bm������ڄ<�Wx�Y�MF
�R�$t)!�V�>|�ִɗ��呾��tY�J�*��7)��N��w�[S�V?����c_j�6ԑ��J��Y���K/�ή�*[L����V�������6	�!/ӰKt���ˊ�dB�� �UY,�-����swa�f�:�WX�YZ�i")*��ω?��F�	��ʧ�36���h��V���?p�,��9Q�p�����^��e�sn�g{��~��P��2cZ�aQ(QE�d�T�\\�Π�����@����vI�*	��p*��|���3���RQ��r]#s�p�r�dW�~�˯l~�Ezۣ�+ �����9#.`����'[kyA���+w�Hh@f�m�W��?���Z^�����	��}0�$&�c����ʱ��/m0�����z^��p9�X���g�4��0������y�;���C(�B� w|��J�i)Ü�7*�DqYz+��s�P�8�X_��*AI
���i�V�4��A�L���ට��+9K,��)�w�;�I�It�.,coc����L���4�۬�'��]�C��p�i�<�6�|��2y@�Җư`��`���Є���c�6��*�2��͑��Q`L�4��b4-�B�i?��x���6�}G_��60G=j��Ht�����ҝr�q����q`
��ȉQE��$�;�cd��r�.�������3K<*�DXڡPF�U��BO�a�3���P�!-�E���U�k<�ʗ�O����G_� A�BYo�ϢI�[i��h���ON�]O�r{V�+'��ݨ[�!�e�G�8C�<�Q�̃��r���t�/\��2La�V]�1�9< ���/������gʱ��.k
�z��r1���H�¶���*��ޑ��.kM�E(� -PiW�]�e�~>���&�n���T��w&ȱ�-ۇ��&*f��3��>s�yt��evr��;�X_y�}��$hQV��!)�.lR��Dv��"q��ޮe� GY9�j5���?�v$e��}Ȏ����G�r��4����ʍAܫ�I?�Z�Ȏm���G�t8�C�+��|�� qQ���2��Y��X�X�����ġMz��"'�O�H�Ü�Ͷ[�����9�"��4�86��h����i���+���X�u�0*o�y��P��9�oǩ��
C��u����:c�.RS�jڽ�<�Y{J�=�W���֣��$�!����˪Ƚ�9���w�<�W
���"a?��"�7�B�=�I�ȝA�����Ӱ�윌�@q���8��=�)���[��X_a8���&�dUߠ�o«�|��+��]Y�u�t��%"�i8�W"*(�5`Bp��,q-L�fy�o�22�1챾I�d��j)�k��&nJ�6�N����X�aK;v���M��E�X�g�eS��s��tǺG����|پ��۾G�g� ����t3C�.ts��-^��X_�0H�>�)����r�8�6�N�6���c}%z��!�4[�r8��<�A��-;��r6�l������z,����T�q`�NV
&�.�	��?�+Qc!��1��@�!��cR5�T��6����vL}��X��2�ذ8���L���.�a��R|������A�4Sh�Oa�|�L�����:q�����J�Nu9um��4,n)sx�������k�i-�dMG�7�U7_���d�⋉�o����Xqؚ)+R�C���AT�ة��?(�L�(��̆���*`� "�:&��KZJ�Ro;����Ƿ��A^ς�q����]�r$)]���/ߜɵ5�Ή�L�~���]}��$]�&ɺ)�'gj���e��}��8{�~���5�C;=�-�io�엊�9q0�c?S~y�x���!�kH�w/ԭj̛����׋�7frAx+�#���L�4a�l�y���4���<s,>�/v+��%�G�5d�4�
�zJӡ�m2���?��W�J.��9�;�� aZx<r�Te7p�3����G���T��q_��g��P��n���,��T�G����F�v����� �G������f�����p�_���̟m�#}�Ay�IG�-&���#}���:qd�c�_�߉m_��  ��%�G6�0!m��IBNԘ�I���.��,~��
쁴n�`���ԹRg�A��С��^�A�/KУ��J��Tj=���E(W����]V��Q�_�_`��c}�e j�� �!�B�U�#UW���~6�.4�t鱾Bs���=���a�d�6^��!��K_�ϣ�J,@Ig�u˺���L^B
�c��������u���,���*�g�c��>�|��>�]����X���6���mӎ��r2�->ўv0��Mw��Q#HA5Ή�nm�t���,,����>9��.oW�m�*��r�j\�'��mH�#�q���e�D�����h����|Lw�8hm�.�k��F�S;s����wE����M<�uF-��Y��~i]��.�����}��;r8�ډ%MD9$C4��I5!ɯգ������~�Â��<�AL������6��Q/��/���y�O��Z��/����)�<�<���E�X8&�\��ĉ�������-��:����r�:��K&��,��<��m~�����ޒ���Ӯ�-a%��t�Z���i}b��U�#܍�|�Q��w3�m<����i#&�f��]R�R��0�زձ���=��i�)
Y��V�+��+v�K�p3�巗뗏��OĞ1|���=��[�e�C�(��f��R�0W]�����D�I?����W\"�����Y־ʥuX'���3m�F5������yy���/�m�|�s:�EQ:��S��g}�z�����]S���������/b���ח)?>#��OH�z�_��S��7ٓK��J%��7<O�T�I�ˇJ��rw�ߓ�w�2C0�6�k��:�{�����t����G���-{�O���7�C��2b��c1�-+�/mU�z��c�y��.a����������f��ρ-�T>{�E0��~�`�X�0�V�?wS��>8�~kX�}Pw���妶�����u,�� ���s`x'�}�&�^����Q56      }   0  x�%�[�$!C��Ō�{��_���� �R�'�l7����DjOJ{��ڛ�����/��Ƃ�#�������jQ�/.uF��ކ˽�{/\�}pa�T��-��qk�m�ŭy>�N��M�ͭ���í#��=�Eq_l����Q1<:�Yqy4�a�xt���ѩM���8ߙt}�c�><�c�Nݙi�xtm����͙��������=��S`�YLݬi'�z��f�B�W#M;��i��i�i�C�v��P����]�vK�lZ.�^ϴV�L�͒L��j��b2ȠL�b]�i٬�2-��Ц�e�=M�ǖ�L�ŖCL�`'ڴ��B�V�-�V��g9�M�f?�i5��1�.G�1�gcL��I��9�1��1Ftr.�s���0���]���˻q-6���z�Q ׺�y׺sx׺����ѧx�#�y����[xF�U����hI�O	Y���SH�T��%/�Q5�/rK�s���R��/z����}���J����
�z~AR��9�eIa
���r(a'n�����C����t(aK����i���R��?������      [     x���=o� @g�+�8�F	M�]�t�B�ِbp�������D��F�t��cyO4d��l�l���e�����+K�{��þ�%!z1�:\Q-�я� RXRb l��b@�@�"&���Q�!�HK�uM7u����X��l�޴�懷2UK��pv�V*wBJ���ő�NG�oX���M7N�htP ��hc m�I]���\@p=��ry
����c�g���rq�Q�z��a���~�F|�}��Q��d�[�u_@�K&>v��_�c�g��|XUU�F �e      Y   v  x����J�@��ӧpѭqrf�d��Fki�\�*��56i�Ф�N�ݺ�Շ�����72A]\8p��s���]�+�g"=PE�A =���{^���˿���+{m����Oyj���H*�nf9P�
�憎c2RYwi=l�lB��n���v1l@ė�6A��?t��V�c�9�nm��	��[͈��
b��+f\088��?}���j@to�d��1z9?�cW%	���5ړ�����K{;�Ug�uSY$Q��~�̠/�2N>�u��-&����8����^S7�&3-oG>c�w�0��r��LG�S�T�G��";�Lj�w]���ѓ�T�j�s!*�g���o�񽖎S��^ �ᤌ         &   x�3�4�@.#N#0ˈ��aC.N#0ې+F��� y�E      �   �   x�͎;n�@E�Uxc͛��x��M�(��A@EH�&�Sd�H�@�pgGx"р�ѫ��}���ޕݛ���a5+��A�ۛW+��K��]�W�����Ö))� %�by�N�
���Lی\�����
՗7�f�m��}�/ǦhTs7�)�w���s�O�`�"���^ޱ.��O��ւH�9�I2�2i�4M.�PaA����9�6Nu�(�ǜ�g���      C   �  x����n�6���S>o��ᇏ���ˢ�J,�;���Y�#���7*);	eK�$�H�D�̐�7��!Ţ��ʬR:^NG�K:_ξg��$�fcN9RAE�p����r�~s�\hR��ϓ�8�z?������;���^���˛�r�H���0.�g	�D߽;O���y7rr�4s��O�d��̖i�!�߭�>�2ٸ��ZO_��VD	{�4��UT�����ĥ�(����6�:�Q����Y2�7&7l+L#��0�aj��H(���0X��ϴ�%K��m�D��e[e�y����S�������(<�A�|�l&���!�6Z7�mj��>T�"�_B��³��t	���p�&���n$��чn�r��/��&r��T^3�11 0N$����j*�M�����+M����ݎ��|���d��L����r��,�?Z���k�k���H�k����c�q=��'�T����r7�l���+��D��Xx�JYl��؁�]tj�ٔ��t ��	������.B�pm�nRIN��I-!DjɅg���`���0��lH�*������D�&�?��41�I�
� ��B�d���C�5��rÞS�|��[k�Z��V���Z�G�rױ`�Nq�J)h��G�g!�=�ʅø!��#�X��n�4�KA<�Tsϳ T
4����0�5��x@���A<(�2���6�A\�/�`��φxP6A���
6���b���On�`x��M.�Yz�$�+���|����w3�e���6I�̬�fWنS��9�5���p����m�m~�ynN��Q���=�?֎����(�6�uJ5�<��W
A��X�	 Nniu�F�N��g7��R)Ax�Fž���)���ш�	����x�Y�G]N��(�(g���8Ÿ��Є[�c`�1�-�A�E���1J6����q%�R.��� x�~�$��~�����������?��Iz.d��o��T*f@�`w�2���mkWMv7`lG��c.�d��+4�߇�%&�(F�{�"��F9]i��E�T�zف;���W)����K*V^*D���\Q�E	�����}�����C}��)�F%��B���մc���^�K��V8�/��݁@Vw_!�'��ն{�����Y��$��Y�jT�8�mvQ�菼"펄�g9�{Mi�����ۜ����(*�Y���IF��h;�;�����i5ܙ��~��w�0���$�Uu��c��:A�G�Qy9)�4,�	�e�t���6�E@���C�O�̦!�C�� B�<M���N`�ϳԨ)TC�*M�ou
���RS�-���|��Z�.��"�;~�x`(@�_Dzs:ƓP�Sx�x�i|8�q>@1`�Ply��ߒ���� <f�-      m      x������ � �      k     x����j�0���Ø��Gv��CMcH�P\��w'!�ұ1؆oV;;��H>�}9�����~��O�_�m-���uO`�J{
��g��*��̋',���r$l,Xuǐ�Ra�
���@FP!�
he�f�W�r����ܿ~�m~_&��J=T��IwTC��H��$U��v���.JPL&�h$����(�EY�v¶0�=S��4�Qv��@�<�T�ckI��A�@.�̳ó1W�,H@�Q�Rv��Z�U +g�*��ѕ��YV�β�G�l<;K����$v&      G   W   x�3�̱,7HO73�J��L��7*�ȫ���L�t�K��,�P�H���L��4202�50�54U04�26�20Գ45"Qܘ3���b���� ���      �      x��َ�׵&xM>E�2p�AD�3"r��������lP,�9���<\13EI.�L���lY�,���\3��C=��_�<Iｦ���G$�Tʧ�Ȉ���k}�[��-��`��.\�u���;ot/.v�]X��x��0?�������Zc~��g6�lT�M�왱����]��j�ڪ>oT���I�e�0�l�U�ճ��fh^�Iü�_8�v���]���~mFէ�*��4�����Z#s��6���l��|~�z`�g�W�4��C{����Ȍ�������'��'�'�M{�A�c�ܳ�װ�yP=���������O������z�3���݇�w�C�H�NO񿳷�?��p��qT�TOZ�J���7��ܘА�סq2Cw��\�����;/C���pϾ˧|����.\����#61�2b�u_u�km^��><����c����{	�n^��ݟ��dn��ی`��W1o����?q����tc���C�˸[�y���.п���������M.�+^���nb��Wxa��[{��vp�-���I�>�Ƕ��s��w��s�wWh�~o��g�@�b��w��+���w����w����.�{��a��6D��}���1ܶ�v��ev�hC���^w�kI�P�{�ŉ?{�t���������<���h������i�nH;�Z�>�~M�v\i��-gq>��X7P�����2������mH~����n0pCkGv�l¦o�i�Y������զ���[�=+���[���z�&�Ⱦ�[Ep�Zk��I���e�����M��܃Q:�-b�(��Վ)�\�ڽ�}�W֮�Q�ۺ�7'���}0��g��n��0t��s��,�����G������<����ܩ��=d�x�|kq�f�z��z�/3������q��>�������H�-��^㍻[�Q�_��}������a;�+�l��V��?��Ԉ�> ��/��{�)#f��]6߃�cC����C}�A�Q�?�{��r�AK���4�#
x�=��xfg��ڲO��{�ط���dr�ѥ��5��7������{q�B���e��K�ٵ�52��r���0yB{m~�)�T�y��G�;�z4~���v�2b#xQ�
xq����m2�0F��v�w<3��3؎ʲ�it+���ݓ��p�˜��f�K��s��4��u�ևO������pPp�Ձ^3��,���5�:��L��YE�V)�ٍr{w���N���\��a!У���Qp!:����?Ҁ���<�v'w��93C�LԀ�V��wW���C�{���j��5�b����j��W��C���n%��;8�:�>��q ��Z3��I<�U�5�'��/�>��j�������.�-�9ك�}[��1ح"i�0�_g��
p�9�c�J��&��{��U�Kav$��ܽ�Y�Ā��o7h����.t���绝�Bg}ae}��^Y\9��K��'����:+'{K'��_���+�/]�޾|��|k��J�{V�1��c�]Ͽ��f��L��,��]V�[s0�o�(�mw`z�*����>��̼폷< �k��ZPĿ�������S�7G�:���vCD��v�.�o�S��>7p��J_:�"�`x��m�!6��	�NQzwwh����}C0��̓?���I+sʀ��cZ���
�hG�a<b����Gw��ac���v���|���?:+M7R�T��x���_�	+A��GjH  �B;H�� 4�=p��}\���>���u��V�&<t ��ό0�7qtq��X\h3f@0���]�	�o@�|��ڠ�G�З�0�5�Q�SP�18���`p��q�5��_b3���#7X�?7��<��@��\�֮O��t��������-��b�j�����r�[3\�-Q8��A�M�@>�Dj싵 �UFq��iXXt�^�?n�����'���Z"n��*# �� ��b��>!�2a`}��x""���zFr����6p�q���xT ���{
0
	�p؂��v� @�p@R���x��c��`#"�	S_ŭ�#�_������}b^L#��}��S�^� ٣{اw> %6��phG���+>�A�o�� mza���2�[��/��z�<9ݕ	'��10��Y���nŬ7#ڢ	)S_�^�?nph~"ԫ�fq' <7������}{&�B� ���c�}l����;�\�s:kt\�Č8B�A�s鍶��1���6�?���i.ql�J���y�Oa�l�3��clh9,��ׅ\>>�~Zhw=J��(O�) n4ې�U#�l�� %G,/i��}G��`�T�模�Q6�=;���,za����r5L���K���g�R�)��ι�r� �g�㉳�8�{����a����>�IRQ+�2���3EX'��p�#�5O�?f�o�Az<G!h��w[�1�:~�x� �K��E%/gr��׮��alG�P����������`DTp��8��π8��^/�?�,*�g�do�ĝ��WWn�xa����g�o,=XZ[�.>0����`�%1���y��>�y�	x�CpLFd�����o8��xzc�md�p��!�24�EX��q�0�[q1�ጴ��C1_)U%���ǽl��/I�����u���4�æD�p��X�<t�gIhfA��,f0)�y�|f��N\�����]rw(�!`#� ���Kg���qA���Za��m�ɰ/����������x�d����U)��;��㮊�'�n�.L`(��Yn�î�%�Z�j�C�P�/J���v ��Z��{Y��TD�iJhK�;oq��ǊlD��O���t��3�~�Ѥ������aTbq��4�_G1Ͷ�v�e��Kh@�#�݀���9�|��Ǭ�W�&qR�SR�NW|��;ga������ˈ�1��4i3;�����r�A �r�	���O�������ӰSH���lI�
=_�ҸOI�$�a��Γj�M����e��L����S�� b_[�!�;��B��ޙ^x��y�9�0s ���|��(�t?�&-R'�u{K�}�kL.��'���$��1��P֧�=v偟�fCK�O�<���D\gv��g�K��3
��O@�� �%��+��r`�:��>�yjS�{8��iP�p��agD-���=+ZYpñkW�s�'0j��+r�&�7>���/5�#<��y�8�H,��uk?��qv������M�o5��e�^9�0�<t���/3$�;k�:^�W����Hi��|_x�� �m���V����4�#�6�^]	�>+����PV۫+���|yeE�(k'{+'n=��rw�ܽs�/���t���WV�߹> Q����)�(���V)�����򯱟�{.%DUȦ�Xz	V�����m���p�I�(�ٱ `;�O��0���E.��ɩ\[�ų����<�m����5�:Ċ��y�i�ak l�I�v���YWC��3;b�35���"����p��n*�����s�O�È��#J�>��,�.a�ڇa
�Y�J�]�B,:��cy��}8�t	Qv���=:u�M�q���0���#H��蟠��,��w�	��pG>O�xS�r�X Lp"�ٻ��.�\h)�-KK����ੂ����.���r����{�u�U�rȗ�g�Lk�r29-�FБ
����J�jy
˕}�̯����.�#����f �d�#O"���*��؇�9�B����T[8��s8����i�0X�+�s�k��
�P�]�u1�n��2[F���
-���@G7�Ⱦ�}��<8K��tHO�o!��|Z��}�R��i>��t��s,t ��>5�j�2L��F��������-E PV)k}�}+���T)0=4==�Q^�-�I�l��o����>��=���7�~	����IU&\z�>�����S~���-i$8���n�GV���߱f��|���$��	 T��    ��@��S��Tr�`+���P{��*Ŵ�g�������(����d����'���q�"G�\��ri��ݰ�?�u�X�O?d������±�kr�9C����pHh��O�R�0{�A�a���:b����]̝����{;8&���V"���O��TEjTR(SOT3��kje��� �n]�Z+d�N���� ;5�w��T��p��z��G/=���z����;}xcmm����ħh�r�lE�e�qʳ���	�s�i�G�DLlQd��>�9��j6a>PH�2��m�Ĉ#gXc�$�忇��$<�t2*�u���^`E���p	�*���V4 �v��HEj�f0���s �gZ�Yd�E�υ�=i��5�E;��#���z� � ��r9g�̊r��26\|�E�*�f1+-.�.�6��mR-���y��|8�	�8�+�{3�qS
���c�^TYԿ�΢sz�~��χ!�LƾF!g�.1��Ylb�RC���*��~�5��gD���t���:�X3��|8
�u�O��3�Q��c8據$�����5���:�
�:"Zx',�b0��h��g�P��P�<0~&����<r0V� T#.�c��ftf_�3Lg�L*&�'y����nJ�r�oHb{��y �*����@��E=B&{
��EÇ��%�X������ �m3�w�w��VF��-W��SL|��|mB1P�!,i��'שX֗�ٳםc]��+�Q�bܦ=�ڀ$���T�B%>2�H����/��	l���BH�v�H�3���Wֆt~�������@�������nܳw��q�ۯ0�p�S���ۈ�"�v.%pD�+����q��зq�P1��{���+��^���y����m>��+��묭�������ӱ>_ѩ�n�����ח���z���/>���Ջ˽K���ҁ���JO��4�||���.f*���dߌ���J�����؃��N��%4�w�u��z#Iw5%�f����x�.�]P��y ��ġ�}_�jVIx�]�;����W��p�(-.{���`�/2�xX�<#Vo�6��νֽ-'�9�xL����	���tݕ��ُ$�R<~�&j�u7��VwSM��ۡ+�rT��7X������
5H��y �up���4�;R�H�;�j����»� g����Hhip��FL�'I�(Kf#v� t���F��(y)��wV���h3���mR��iڢ��Q�-��&M=����my/�tP��ө)ߛQ I�p_��I�(��@f�%�>@�� ,����(r�^�C��hH�RY��W�����ᙍ�,�]�����0&�R�t\�V^o�/�e��*p�՝�:ݷ�~5�)f�'j���]�+w0�Sё�p�6�\�,�`�׾��E�Æ.e�Q�g�ک�<'�_]�@/H�5\�^d+�E�h Y�k�W�!�;wX[���Æ��G��\�*�>���$z�	Ë4F\���W^��ɫ��iC�~���Ph���Vawg]gq�	�9ß!��5Lî�I��gU�~��FG��.�� ��x�+0����ï���5�6)�q�a4��c�l����d�`~8��SC�9��`"Ğ��&��چ��cI�S �
]�I��іw"E�C�=�T"͝�\5RD��P9fg~~��v��w�q,���1���
)��
z2`��_�k��E�H~��_��K��2^v�����4"��a�y���՘� q�'��C�Jﻟތ�}hm�*3�a0�g)x:Xy�}E�z�B;а�i��������ڤIY�Nq���E�&WA��L�>l��tH:I��q>��)�R��&b>)�;��֕���3E^����MdFE����� g�$��h�#w�޿E��)x-�^�42�4݇[�cr&Tө'���'2t� }�`EU+2���-F.�����rGȐ�A�?F�c�ͱ�37vّ���`,`�����Y��^��z��Y�~�PJ�cA���]}��JVh�i.�� �9/�%�#)�uQ����+}����X: }�I��݃ܽ
�asN.��R ���<����zԱ}�G��g_-����:&����W0(�|;�)j��ޟuG-��{S�	IP�LL�C�	�� �"[FG���>�����c�#\@>-O����飱%69=���k����R�Ӭ�[w���8��k���e��,�Nv�N�{�t��s�ݸ�ֻy����}x������øW������Fg^�S�O��~g�lw}��|�{�ˣ�0_�?�/��o��W����_���_�ܕ�d��W��íc�)����x8��6��� �p[U����A��$^��j��u�P��K�p,��VFJ��;��(��AzN:�p�O�D&������|Pn��*8��ŇWR 41b@HYq !�B_�-v;���fX�����N�� �W����5
���K�Og�[�����A)��: 4�nǰE	,�x�s�UP�- xh����Nq��� �a/'�	ǈ_e�h ���~� 1�,B�2�����Umi��{@�dکF�>���l�Y7��r��L����-#:w�=�eC8�C�HNO�!�e��a�V���p_�#ATB�*wJ�V(�(�(�x�,%#%E�!	�/i�~����E�X_|)��(K��'U���3ԝbw�: ��ћE}[@o�h���>�+6��@�J*�!��L��̙��' ��д�L����X�{�Z��e�i9�p����Bg,�rΏ���)N=z���/K�Wa���֒6'�Y"��M���P�:�t��C�%3}lCeZ�e����R���e�jwS��l�'57����G_�֐�ͬvP�	�ɢ�͢����(���Ϧ�wѐ��YM�x4�pǼa��C�j\p���@&�^�d:ا��b\�x�
��O����@b3�Q�P���C����dIr]�[��U���8�W}V�B�9�5P_��sPm"P A�tǋ�\��a;&�D���n^��.���GM����l̥<5Ү�D�+L���'�ǈ2���L��(i�d�e*n� ��#ܱ��s A�_�舤�2�6��� ]tA��y��Q�b,�[�r-g�[��T�V�b��D�ݑW���P��6�r'�؂g:Ў�9V�9/��ɔ܍�/��*���k�~-b�d>$^ht:���b�����ϻ�K���յ����b�����쬜����g�~x�܇�n-_�p����g�]��U/\)*�����^�W��&b{ETv-���vg�1�a?Ce��I��o�Gi��f��q��<dK�"�J7$sH�&��Sb	h|��!��g�M��:��Q�E'�$7�D+��ҩ�	o�ă*.8�W&G7��ʝ�O��Wp+OB�o�
�Uʛ Z'Qt�Z���(N�\f\sf�e�#ցf�*�KH�W_6�;2�"k��1�7g�o�4A�s'�E8Gw=�rP�'џԆ�����s�OIsZ7�dr6A���Rp�*UT�z��	=g����t��������N����M�YW>��g��������﮴�z��ϻ+�bz';�'.�9����W�,�ܹ�z���{�._\�i�60-���������y��O�{+����7<��tP:i:2�@;�3�'7\�������n�
�Ŵ!/OAp>j#��K��d%h�ވ/M�<�d��N���(�'��_s>a�<��Um�ֱ\O�d�e�؅_�a?-�Z0�B�a������nhJ��?�LJ��0�����fQL^1��P�W3U��Bz�P�+�W�\�F~��%SRSY��U�s��+S��#��h3��T�ە��c�n�A�w}r�'�'�u!rq�T��r��&�t�(��<;�(�J�Y�Cw= o4�mo euCof�⑻���S"u�S�6���iB?�H�� 1>sX,���['����z��9�	��{ 
|��ĩh(�io��ݦ|!l�c�N�0    �Q��ur�G7�q|���V�=R��M�zn�"vH��(b,`#�~�{#��k�#�Kw�Ș�����	��
�4�aù�̶+m9iz��4 ��D�q^ڟA(H�o���_�0��<Hyy2D��Li�<<	����D"?C;�Q1�G�2_��q�Gz�������^A_h�&�ɴH�@m���	 +��Q�ڇ�/
�ҁ��'O�@x]��pa�?J�pW[!i���79�2~�$��J"�e>��N�N�P4$�&��Y$�*4=��i���QC��F�<,�hr&�%��zL��C8�h�;��C�d��e����+��81W�+���z8�(�Hb*3��=�G�K�1q����+̊��VO��c_���}"A�8��GHts��D�ՉNhA��HL�6'���Ra��H9pރJ_��?
'�qN�%���T1� \����j(��C����XR�k,���!wy���a�?�a�\΋v�o��q�-'?�zٚ�}���9���'����O��1�r0'	,4_��oq^pJ���>��N>�'?"k���3��yI�;>?��sօ�OL���/#-%f�*�(��3��f٦XY��AO��B�'���ڽJ����y���h���"�9���M�lg�����rKYh�t3`�yg�+XJ�dg�ć7n\�rcc��ʽޅ�n^�}�څ�{�V�����:��e�*x��N��)��_S{�\��!;1�64�]�ŕ?��{J_��t�(u�W��#��������[]�F��`/@����y��G�+xZ��(�e~�H"3�=�>��Q����R��(�åw[9 fwi|����( Y��W�O3s�:��6x,�"!�w���Pxj�?qHTAѷ7|�,�j+ ��)ʃl���j�k�:2�0؛rB�8�7Q�Q�[�^cDh�<a �-&T64�Lr9T*>��1�8��v��A{	�GT8���pMX�봳�C�Q}?�6Z�ݶ��W�#��MC<!|��ۧ��_���<���:�� ��n�xa���ty@x�	�N�q"-�q�
C1�5�k�.aX6(�&t�cXJ�k.�����<���g_�]ꏛ������.�q�9�3S�UHv��tE�6�>�CpB��%_"HE�����U{�M��?��^9�_S�H����ϋ��@�,�żK��Z���M����{y���^\Z;��]E��.��|��F�΅��W�/-���n����7��n)����������ym���|i_���䪍ZD3�k0v
1S�'tZ������.ڝ�పJZQ�"���#��ê�ng=�/�SM�"�w�܃>$�ǟdL�kJ6>�ꩌ�����T�4n�1?9��r�<�����G��P唛�Ū��揩vz��gd�^�6��99��
ۨi��1I�Ćp���,��Wc2<o�?k !��3���Ll�!�UeMSA���[�<�|��/��P�k��2l^��f�BD
\Z�oŘ9���g)���Y�ę��z���b���U�O6[]79��pa���Ww�qݩ\�O�_��	��<W�|z�žO�N`��6XBJ����~�Fv����?J]5�`�P�{TVBUy8�*,/�}"�q�p߹��mJ	���(�5��9�tO	� �(�¨>3��56�s�[�T�!?B�AAIpA�����66ߺ��o�W���>�w�����3�� ﴋ�A3�c�.@��AI�CT�lT��E�ԧ0.�b��C�Ąǎ ��8F�A�f&hRRj�:#�M�΄$4/V�n�է}�I^]K@�<Qnr�(ɋ�Uf�^�`̜?.[?t*w )#$4y��)��A9�|�;n�Ֆ���i�S��[������Eq�'��1��p�M�h�M/ԑlI%���8�4�F!�q��o"WL�`�P��� ۂ�w[�Z�T�*�1\��N��&�y��>�h��_Y�뵇�rQ��9;��+q��J!iH���1A�A��'mb+#)��Ie�����U�1���gM�7k��rZ�H��=O%s
�ǺV���p�U�Z=��Ӗ搕�s����n������)^TIQ��V�8F��|��t�����C��&CG�F�ty#�'�sR��r4���*rY�BDo��������Y���ؘ|yK�*@�1MnȒ	�W��`���J{�����n�ĝ7�v/?�r�ҭ���,>���q���U�/K�/�.�����y~�A8�����jH8���u�3^��P��Q �H�~VZL�(iy���a�4�6�E�)G'Or@�d��}H�Vǰ
��mNf�q_+i�Ŵeu�LX�m�t3#UB��mn�W�6�Zi�g��#KT��p?A��$�~��'��nUP�r�S�$��"�b�PLY�w��?Nܒ
	{p���d��c�Wȿ��{�L��?����?���A �7P��L���?Pa`���c0`
�e|��c�{\�������B{)�l�|�[V�p�dg�ą����o<:�z����;�n���tsu��%mE4���kܾ�����w.>�3������7�\�u�?�ҡ�70�}�OMd��i�A�c񺰕���8��BU�������OuXs�j.�׀��oA��k�ŏ�m��� ]<��4��U�������vB~�=(���5�����z������-t��/,,�r�n�ĵ뗯\�w��ڕ��K7.��]��h��ųY=����{M����51�zh�51�kbb���\�"�{E����1�{E�^�z���^�"���������p�����Z��!����މ�wܿ��:׮.?�.^��>�q]�Ѣ����P�#6N%]�uO `�z�a�w�W��RL_������/'� �{���a�ԕ'C0|��*�����zPM	2ܤ*�gkf��9$0f&��&2���?��� �-#Wb泱�|"EJ�Cb�F�Mc`]�**����:I��I �8��bv�b�gt���K��zD<��D��]c�;�o|��*[>"G[|�G,T���L,���+��Q�'�Q��F�=N��ɏ#�p�Мvj+�\��ٱZP�؂�+T�uˁ��6��P��w��Q��Z�W��0_g1p_I��cS���^�(M�>� �#ɲ����!����e8���$�	�Χm
�r�S��(�b�\a�R~n�0�$�oD0&w8
Zf#�t䝲���q��G@N�!C���*'E�o�襒ZGC�K�PH,W����f����y;��}۬&�JT��V���!ޟ��!�St��-D[��s�tr��Xv	=�DE�5����keM	�B�*d�*�>��2N��S�6�hY�%��[�ZZb\۳�8f�(KE�3�<}M�y��0_�=�v[[k���@�w�d���M���e\��ƣ����Z��</�&2ܥ�֥�󗢠~MD������n�F��	��p/y ���@^A,��!2@h�^������!�U�\`��L���N�?�B�N���6���tr'���2&谻�T�����tfC�v�T��'yo�(vm�G���`�ie<��d[h���$�:-<��x��J��T�^�R'�4h��]���������TF��F`l��0��� ds�VG�x|��0�G,����h�x���Tݟ�o���g6�rl�j�X�J$���$�����O�bm�S1B}��O������+g6�K'ֈ�W�dS���O��)V�HP� ��]\��F�=���g`��,��V��C�]t��kQ)B����
��e�Uv��FXf� HG ��,���s�J���e��,��.���t����G�V.^�w��7��ݹ�qw����{���r����wx/7�^n���{���r��#����{���ܠ�����{���r���}/7����`PYmwV���������.��pi�Ε۷�_�v���w��V��?�[ҀJg���P[�G������j�v�d�����"������BB"?���˛R?Q0��,.!<�*�1|C�3�]�    ���fx���q�F������pig��ЗϜ�$�@�[_���Z�uܨ ������;bѡ���$W,VR³k�J�$w�K�ڋ�}"p���9��)�(��/�n�ɩ{��$�1̅ǚ^�d����kL���2G)�� ������G�ɢ+������ܮ�˼��n���K [W{8����]���{s�ע��"��R}��{y��B���%G�W�7X�8��88��h�y�������"X�vD1�_[��|'�js('@(���r�kH��zI4ʐ�g����4f���kr�^/���C�uf#����a��;N�H&�e�|�Y�\�	Eo��"8%9�J�Xd���S'�|�;��?4�}��m~�];�!�V�M[���*���3!�2��3A�!��t�B%�B.�k���1��a�D�7P� ��߆ge�$���W0�5VA�����4�����- �g�O�I`UJ���g�M��C�{���ȭ�-���È��a[3�`�07N)�SH#b���sXy��W)iդ�i��l� �����X>��}��.�c=�\ٱ�אy$��	�Tx5�����9Q<�p*�
�Vp�?��)O��5���nu��ֽ5��d!�Δ��B��)$�����H�_��2����R�a�*3��wZ���?�gX���1PaDZ&��Z��.�$�1?�:C�NQ�Els�%��'�fՊ�YC�p$��<}z�F��o�N��1`�[>pG?�%F�/F�,�d�v�� kd6iio<��&�Vd�S�cq���[9��K�
Y=�]>qq���W�66..�Zxp�����,�HG0�x�:�?�k���c�_�aLM�,auv>הh�#���A�(CG�S��kbM�`.�z�A�7���:�t��?͑��t�H��͹-*Z�:OfE��������3OI���B���]j��]���븋���UߎA�.]D�����W����x�4����I����ѽ�$q��{S�w�7sT	I	7�k��0�d=����5x�а��`|2������@dUo� Miഥ��S��s�$�!�u���C��%\oKkͩ��� ���8�Du4h_h	��z��gJ��ִ���)�r�u�x��aqR��p��T?B9�HȐ��߬Q[�<��D���h��l�#g���*�}W��4��U���wO����0��,0/�CY��l�n�j�Pq�PR�<O&h���߻��u�d0vD��\���en���.���
�N*�^僬ct%)"}������E� F"�m���G����1!���E�SL����99�(PoQ#�z�w3aX�ݎ�{D(6-���R�:�sZw���)zEǯ�1�S»�IO�����g�c2���p������p�5sܦzcd�=T�	�~�Կ]Usս�W��\-��}�7�S��Sq�u)o�ӉS'�l	Iн�gH}�=�g=-2��kRA@ߪ#n;'MmB�NpY #��67�����3ђ�r�#�J
��Q[8
�&�MY�%�"�aD`�RG9��(��9L>�eQyD�b_E@�VN��ͩ�tKKA]^%n�N=��ө*a�Zw��ze!8�
!�f
o7� ����;�����Cn\V����A�"�3�(I#�Dַ@$T)o-T���s������A����\YP៰L�U�J~e���3+��k�r����;�Z�v��r��݅�ݕ����{gW?�q��޼�h�Z��t�I�3-��)�]�Ax����c��ɾ�xɅ��	y�L��?�ވ�a�Tr��Rط�d�}񉤂*K�Q��j�dg�`��J	��@0��%C�	��3�/����V!\���M2F9G��s}C0gڨ�jP�ѡ�q�WV��0#�PD�:�YN	̭�D�o!g���P�����B�HH0�C
p)�X���C�՘v2S�(��rEgP�G9�Yi�P�PC�*�0H=]Qd�>��p�<�.��K�߳I�C��'MUz;kIwD�Ղ��p*�
%G�6�o����N-k:%K~�׽�P����騒�cW�'��*T �ǔ4[L,ځÙE�8�v��@� �V����Lr�Q� O�$�q�&Ka�3A�ᴖC���϶���R�ُh�)�AѷP�s �.f? {l�nj���jnP���:F�! �m:���tІ�����:�����
Ո�?!p,'�u���t���(�:�J�p=�m���,(�q�;&��5�2����0Ӏ,i��C�ؿ�n��,�~��GA����$���Wsq�!ҕ�J����ڿb��{&h*R���+8��F|�BL��U	�T�Eb�DV�̩�]��&��7�V�l�F���.U�K��h����������4HJ;��u�Xq4���>P�A�n|-��
k>��oIyKΣ)��H�7�4(v�9,��VUTL/Ûj��:W�dL/�A��N���KO��w��|���l�.�ݱ���4�1��6"xM�I�ҙ�AȬ�:�%(�|�6}e�ji�0���@PN�h��i�
�I�@T�?�a:NP��:�l�j�5H�h{)b^b��#S�4V�@o�УR�>��Gѡ0_� PE��KtN��Ȭ:��q�s��A��T������EMkY�#ڧ�4��9�%��,�2t���^]ʁ6�ϗU������ꉛ�K^�������ڭ�Wv=�{���0Gz�*�˿<��V��ɕQ��5:��[9���ʕ��2�B����Ć�"0Jr�"Ā��1-�<tQ��+4�/*֚�
.6���<�Vc'ݨ"/��mXu:�vD|�t��8}զ�8�5UB��dXt��2�q��Q���X��!X���|���O��f|���;�=ǟ���Lc�$�k���K�����f����R5��9� -{F��@ѩ���N-�*-+%����#�y�Up�u�[����Sx0�Vi���8��������4[(o?�����,�&_�E�I��[@)�P��N�+����"E��CP����*�@���ܴ�ڀ��qLK����+�ڕ���DU��h��VpS���[C5@���c�X-�	�\(�0َLc�� ��(C��֤���"���7����lDe{;�W���P/���at%�7�!4��	*u�CA7P ��pkc�s����t'X��b�j%��gD��n���Chv�|��G��R�3���@O<�������Op���P��DE׌��|�����iU��!�t��gn�\����}�lt~q��G����~�s���"-*���i���7<�~?�X���x�C��:9�&�#2���P�~G�`L_���.-��k�b\�7��Spδ�b���NM����|߀=���O��tdgm.�Zr�vh�0,l"MS�������p������|�A�5(��EG]@�T�[ �����H���tӋbg�ĵ]�(��*�����b3,�w9gx�7ud��	j&���^���q7d�b���F�5g���b��I�B�y��3���"�b�1�o�Aql���(�c���Yr "��]�?W�?�`6FO���p��#���h$���\���w=
lr[c׭��q񲬏��D���k���-���3���c\ �@��A#eSs=�Y��G��8nQ�Ak�	*��@D��
��O����
�S+�O��s��4�h�Ӗ�zðd�~@1�W���c,�zfc&k>����{9d��ywQ�o:��ݵ��_�p�ʣW/,��������s��d��{�VL��� J��PR��)N��d���T��^�<�Ꮝ�6ʴt-��Z���W���ي��H��RС��MAX�4<*FvuKL��\��NM>���T�|:��hvM��/�Bba�w�$LlB�+��_ᣊ��	k�U[T��.�R�QbYj:��%�tsJ�������[ �?G�9�,VI��d�<g�^��n��~(MuO�Q��� u�Ę�����S|��lD�="}T7�U����K    >pF}�y��~��V�����Z�stTM���nM�ͬ��z7��RTN썔�B������瑨��l����-[��x���F��u�A�,G�#T9��zh)����9����eH�©n��Px	��|�=Zh���a��[J�����	p�)gV������V�?��k�nHl�]Ƹ���Ɲk��V�_\��E������sai�V�M��ad	��c]�#���p!�s��kҡ�U�$|���ju����`ǣ$�=�)H���C�F������Pǽ���q�Y��k��tq�{�ĳ�1��ה�!kp}��3Z�����SҹG<��6$圙֐hj@*[�W}*!�t�s�z���nl�]nT�Ep�q�f�ތ����&��'��o��;��/�YOV�5
��o�p�$;rY��:�R�6W7��V,+�wT����B����v`g���|��46�/ �%U�;�P��?J�'�ۈ��9�a��K-
�%�4_� C�,z���y�~�2%Lp�Z� �僖���B��I,�.l�;WC m"�g�j�Q|�l[M�`} �S�%��E��Tꏤ�,����dJ3:���rA}"�<E�Nˬ�м�Ն��>-�'0�纸;Nчy��+�6�6�|8M�Ի�CL���`)�2�׃u�򈉾q"�+�g0.���~��)d�3="����r?.w8�Bt'wg�rR;N�452��M��V�!�������A��JT��kE�<1jG/e������PP^Zh��f�nj>_Y]U�O�do���]]8�ѕ��.��ݾqk����g��_	��%����e�b��ly�i�t:&���-�8k �u�2�)&�:��Q�RD��2�G�r��)��RzV8gN�k���e��J��>�BwF8�	|RaHDh��t���IS-͘�w3�*͔�	�v��S��h�a��Ϡ.Ϋ����n� �cH�2���l\���$BB��.u#Մ|Bk�aͶ����������ip�×��O4Ǝ�ܑ���^��Sz��*Jo�3�)$%hF�٢y����#/CX1��ōz��M1��]��!���2�)�$m
���W���V��z[�zB��F���J,Ё������ @�nΝ0�m�&� J.0b�2�Zu2���A���e�J!g�QŞ)cSdVy��n�TM�ٕS>ߕvWʝK�ߋ�x*
��T��u�^B~�v�Xܥ�DZ(	w��<-P����˿n!4�Mm���)�K��0tNX�A�����H_S5-�:�1S��Hð��Y�?b�{>�
%�B�>J�7��A�����Qe�kꫨ>�ȅ�hS�-�{E�V��Ꜥ�+�*���Tn�������>3��(Ȥ�^MR�P�S��z}�gv2m�"�5Y��Fbg��q��si�=�#��洺$�w������m��$�yԖ����x��6}@�URU{~A߯�Ȑ:%��ܠe8a1�^�A!@{a�~]L�H���V�v�ZS'|�������ͨ6t�l�=���NJr5L�RI���\э��@A�F}	ns�*7�i@5j&������f��e��OǟL$�f��!�r���-����3���1Z޺sO�q�����75o1�;;'��u�ʹ�{�J�)ɩ��c�O
�YV`�,HD'�*�7G�y3C��+��7z��n�(��)8�w��9qg���{W�\�q��ͥ������|�s�B �,�6"�̧L�*��*\:bl%h��<��ju��`���'y|	��H��^[3�Հ|��iz�K�$\�Fؐ��K)��\%RrQ~���g�M�ѐn�X��j�ɗ�`d�������|
�6����M�}����|oG�����p�"�ٗ"�rT�X�a��?���%���W�)��A�������qA)"�`6'$v!��J0�g��p3׆ꐍʏtaU�p�-�^��=��x�$�%莦���S��f�Kr�@GZ��ۍ�<W���_wg���=�c�O�	�:��p����-�ګ��R������6�x	�!+
�?������ns����^�W��l�Z�����n�@RGP���mJ���f�m�t�>�Rr�o쨀�u��%ﷲ�E�ӎ��Ļ���kbb�I���Xs-*])Ϯo���\�Oz���ue+�i��
4�������ߤu�0#0����$X��&����sk�߶={�U��>c;��.�/�w\�V⺵r?���-y)���`<�3�G�+밞��<:��y۝cd���W����A��a����O���{�|#��&#�n~�7G&+��)=��_�������'�6�wgm�.������6��s;���Xy�Fݯ�.�S��7��+d_F�q�:uf�gn ���Ҏ����/��_�O������/�?�h���ॽ�������|��O������Ͽ4�������w��7�#{��џ���?�T��T�|�0t�ފP�U@��s<`�*�b2�Hs8Y%�P���*�`΁��2kC�:k��}q�0��+�nQ��D �+,=OT4�w���.ľ/1���||�����/��w���Y�U����N�/z����!�?_j��h���^��W�׮ݹp�֣K�ի��K��?�x'�B�䚓��ߨ�Ya��������P�I���5F��x��}���|�0���]��q�j0���L�2�cQ�h6+���h/�3��������j�{���pנ��y�ؤ�J��S	�n) �HҰKZ��lgbET"!�9I ��vw����h��7��$;��Ys�~P�`��"U��fِV�~���Jn�c���V���� *U���P`'�G�!A�ԠT��0����
��q ���5q��I*��"�9�@q��G�{s�c�0gf�����R(���8*9��T�>�RA¨��%Ȇi���ǚ§�[�o�������7;��9�
���I6<X�k�m�V��:�P�xw}|'�F��-����v�NY70L��a�0P�=�z|�W���>�Y�i^��:���N�5��t��1�_���!���fï)?B�pH���c���w1ҁ��n8����܏���cJ"�7Q�6�&��D�?W;D\�]���D`S��aޛQ�&�y5�_+44Qm�ؘ�Y��]��,���v���h@R}B���*j�$�7�>�2�
���ſ:��[�-b`/`m+؋}���*�	����24*6��T��V�C��%��"��ܱ��������({K�czxt/�B�R�^z�LJ9),�z���5;���Hl��Z��%���6և���P�T:���+���c�,�Q��������bҲ�*���J�Cp:��ڦFE�b��	�.�s��}�>�>�#N�����U��{��?�-��i�I�c�@���j5�ejt}f����M�jTu�k����C��V��5��/xTr�}P��-�[��v�2��CM��P5/��g��fG�˞�t�i���KU��zΔ�+�L�*�"'��i�OP�׺x$��Ё��h�hC�0�HJG�}a��o0�١Bϼ�!��^,w��ty�!��debҳ�ER�:�H���!�mH5���ː?�9[����(�^�A�4L]Zm/w������Y:�띸~�⹏�ݻ��Q�µ��.]�~��GB��U�i���6&�{GX�Y�R�ۇ��!�XL���e�y���^�uU��	��4�9�Y��(4I)����T	��3�T.��neKV
���G��I�Tz��'�;�A�%e�*�<��8�M�)%�ޯr��B�t����G=�u
�G�Q�;�,��DW�.)��Z�ď���Ҙ�)��牲��3����&%���S״����3�����(]M���ȐA%��}q�4R����`U��C8<p�ܙ�R`c�<���)�l}%�U�1IC�}
8���}�ciT�nS��(���y�!
N����gI�׭��گ���S�)�'M"���S9�V�٠ß���p��k4xKsJ�ŭ;�~�۷tU��03�    ��=���L8P	�M=k32���$or]�Ez6B�%�wU*O��T��X��6E����)5��4�=�b�}���T�J�}�t�:�b�	����aqvJ!�:&1�W��&b��X��x���L�r�Gp�D�P�v�ƻy���GFʎx��s3[M�=�(s2Ao��8'<ar�E8�Կ|U9��I��4N���3d��������##���@��s��r�d�P����Z'9 Z�X�|��f�T֙�ʰZ�0��F��RMcvp�i6�P��A��9pUJ|,��%��>�&/����
���P#�[��j���?���F�A�)��7N���=�~����F����s�~�f%�ځ��mr�<ިgo��<\U��Ld�E��4'o�CX.=i�n,K�Ren�����W6��*��X��v/(I��iYY_�;k	�����ښ�Z�O��N�����囫;7.����ѭ�+���}�@C-]�e<u�|K�?�:N���%�^���|�5�^8��K�;��W�?�쭿C�/�_������;�����q�������z)x��r�>eQB��93�.J�~H�!�>�nW	�]���%����2������c��j����� ~�Bw�,/�;3��Ց����S�1YPr&��c�Va�Lj*��'�vM��)� �)Jc�s{���u�d������.�ƿf�UV�0�5�]K)��yz�}�f��,)�+R�Ǣ�L�%�P�h	D��Rm��>A	j���i/�(
Q��ў�;Q~CECX;H'wΑWJ�sἜ���&J$2�0yb��:#����w-���Z-���"*�����=U�gdʛ�������j��mg �n?��)*������^DH|���"���7X~K/ġ���݋z�����X�cx��4��ۋ��dmU�-d��������r)�h'�d�:+r���$��K"	l>�$��-�!��0튩T{=�iȁ@����4���Ȣ�+��r�q���/�K�N`�AJ�1t��@�5��MH��� r���V��j���8}������ ��s��4/�{9~M�O�i�U{Z��H��e��d���/^��32�׭
&�鸐�3VqC�Q���z�D%]�l�-z���g��V3}b~�i��u�E{r�ޤ,i~m�[��e�DX�x��AN�[J<������='���H��Ӈ�,׶=<�F��V$�:g2,sW��PH��F4�<� ��i�)=�bK'U�0��b���j,�+Mb��FU�*߆7w_�"�����y�%$�Й
�&߃�3���v����7r�_��t�&��m�Fsx6���?�\ӆ�LO��ܾ:܂�;���m���`���2��S�#�� ��rѐ�U��ʂ�/������ua�Q��4\J�{�"	rg������%w8h����$��$a�bX�)�bYY/�"o��<0Ŵ�:�����t��65�i?~\�dm�s���N�¸�b�x O�G(�&ܔ�����Hp��`����`��tJ
w��Kݥc}���й�=��p�jo��å����zԽ��vv�۽��7���kڥ�0C�$R��R+�����-��/-�gH��N�d��2S����b�Q�i�'�))o�v!8g�N�����cW���~��ŏ��A$@G��?��E�VB�!TS�E@���H�^ܥCTk"���@��எ����y~2Ǚ�Et�v�Iܑ�����m
�J��T��x����	Sp�}�&���K��Y�]+�6�]�tv\)�mf���L�Al�3B��!z��r&ܜ8hΊ�(鞣3�� ��)��!^��|6w`��Ix�ȱ;I��J .�S��u=<n'�б,"�PPR�OmT�@S,�
q���R���X����Rs˧��k��4���EQrp���m�W;�´�dBrb��R4ow�E�^��O�L�1�����u�����a[��H��[�N{��Zz@�K�N�3�>ƅXN�an�{̯-7��@\��/��ɼ�/�3K��� ��N��	��|����P�Y(�og�G}����A�"Sy� ����"w�8�����f��303{a��@~� ����'D��9�p5J�R郍>�i�P���c���}a�X�cV1�hxr��a`�ɰ
�j�.!���4�x�N0��e"�j�%X�p G ����p?J�v9Q�~a�cD��l��mr��6����+H U���Y���a���@P�e�7��$���z�f��������d_cY�Ul.L�S��V}�E�B|�!N�I:�"*j���@A61m�]t�(1&�w�K���`�$���꫇o */e�		L�g2��J?"���^����i�%<�u�B�i8�u���aܼ�M�.v�u�&
UmɁ�ZgH��pW��9*�%�=,���ܰ�^@��m>�;��4�~j�}���g6$�]��tx�	?��0�+DnZ]j"Á�xԻ��>-�}�7>`�7���H���!���Ƈ@��9��0:��>#k$� ?d	K�>|�i��v&\2\䋷��T5�A�Syc��G����⯗�~���)PE5�$p�coL��Dq�^��,���羙RF#[;��àJӰ4笉��d�*�2�Tv���oa����>U6��lSL�М�Sh<yV��FYY&G�����m�����E��/��X���x6��ǝ9�-4$	�-ܟY0����K2e�����J�)}��^]Q�
�������^�y��G��}�z���r�G^����� �u�N3}�>��Eev�{M�D:򧊨4����������'�tz�R�����	H��):}f�ۤN�Y���E��y�^�G��go�kzǯ��UL�v�����w������I�/5�o��c��U��Qr���C]`��4I�r>?���7��שg�(��3,
L ?c�/�3��xr��R}{����îa��op�6$���->��;�8ӸC�Ro���C�� )=l�#���09ph��6K��H[�b|3V5"��$�QU��KCh�S�ڇ%���#n��8~�S�Y�2A��z��|�E��+�H.u�ґ��%���(�1�G�Z]�F/������KYڻpáz�J{'�>�G|�kJ�V�����iy5�g��"�43p�]F����d�.2���\y���� Z�#�4i~�@2*�i��p걭Ef�m��P|�2�vܜ4�^�ݝ��kZ3o!�����/w��w�´K���5~'�G�T�F�f\�Ii�(���{t��1�D���'��^D�&"�M�!Zm!��2��)�e��m�I��l��-�(2�x����29��á�" ҧ��?<�Oh{<�����������f>��Q�y2*�κ�s6���<o��Q�ɧC�\��a���q*���C�ʷ��"���U��d/��>(v*��q$*��L;��J�d���^J��ri-�5��>3�E9�C��'8zQG3��Ö�6y�fj�mv95r�UӪɜ�pJ� s��>w���0�@�#��BX����M���s ��nYɿߐ%&�L�C�'P�ҕ��׉���	��;�� R�Or%���Tl��WfX���BF�
�l��$v�d.Y��Lbȣ�f�,��j��bR�Xv~)s���:cBmH>�H��	�4Ĕ���&Pz�K���4�t�͖n���7č�v�]np�V����U�9�f�E� $b�ܛ�J�]�
��K�K�!y�Xg2�>�Q�c���0
y��V�[=�)�����;����Ŏf�,�\잸�����;޽t���ͳg/�}�q��� �XQ]�Z4}��]=b�NN}s���>�G�������� �S���W����|�N��" ����b	�9��7�;%h[Xb>��ru��t*h ��&�55���g|0zqM\8.�f��,f^�cWS���_�;�Ȕ�\�� ��?�!!�=��8�B�ܗli}��Bz瑹Ƥ��V�Q��W�$���Y��PѨ}���<�X    a��h:�	\<����7���S@��T9��H-*C�t�N|��2p���}�w��xy_�Na�Fb�����$1����+��?q���pVs�
���X���;��V�kA�Xx�+`sx�ma�!���^"ճ���H���W� ؕdWt1��t�(�m( �-������P��Ny|u�8�EaU������<~R�"���
]�(g��)���@zBh�V7��z���T���(�$�����*D�&#����|
L�ř��ab|C�\G�'�ؠ._5�VhDΆ��F18�u)���/�Z���#�a"x.:
��I9�b���Rd�P&3U�,i��Bg��4^�� vPA�G!��E0t�w�X�,G���'���(��}�a���|�ƈ��
� �n�0�z�]�5�����yA���4*u��O���-��p���� ���b�R�Hy쎬8_�fx?�;k3&w|k��=�
Ҕ3D�}���mW}S$7S�2q'�������(vXdh|�C�/�2^�ʡ�*�Bb�g�(j u&�E���膥_�=zp�X��1w����ۍ�T\<Y@��l���
���7K�VyNV�R1O�B��.�D5~J����d���P�a�2��2g����'�[�O��9:�f�๗�1&9K3�5Ik�i��,r��4�<D��`�mE��g�T�����,R0�7�F;Ԁ@jF��U��Ƨ���[�ھ]�;Bn<�#	���܌+�����N���G2t9����R�
J�X�c�����W�����(&`�p���/�\�����I�k篇U����A�T�XI�� +��UU�\۷E�� kł@.�?j7�;�fYlw�EҚ�{��5�,�\인p��Ս��?<��7ܾu�ֹkgϟ�@&�������L�n�E3����Uia7��FA���a�a\��a)��&%I���:AUD���:\�-���}E$Y��a�L��Y�9ܗJ�b?�+���$���ʬ!�$;�$?Œex纋�!9����n��JH*�k��;:B�{�L��p9̩(Tf|fHID��Y�v�Hƨ��-��'o���Q`R=��	�����d�倊&�.���h�=�CU0�;ٳ�b� �Rҡ����g��_:�u��v���y�������+�u��_n�,��~��E�[>��xb���������o\�p���;��>Z	a�5�Q1� �gL_jz�������S��!� Rp�C�Hޅ�F�Q��*}��t_΀�&�TX˄X�|��B�,[�P�#���) �i��	n�+�+yQ�TlX��Z����)�������!vSU��}0a��3D��:,�=f�,q���ڱ��������
q��a�d`�JVA=#��Q�4�$;�j� z i�l�b���b��`���6<m�N�W�F��a���F���m�~QMD��n^p��gܣ>0��C���4�	�
C)D��80�R�3����e���PK̻�Q��&,�m�kt�4���U�/��+��������@�ܫ�or�q=���%l�#7>ݢW��3T��[c�ۦ�Ĉc�e�9:��8,]B�HМq�-����=��9�|nj�D�Q�\3�:�����)�0��3G��|��ΜV	p�`�Z���@s�߄��i�*k���YO}�Lȡ�%ݓ�*���0���OZ�E���TFU�1��D�A���܌�d.R�3�����lU�Ƕ܌��|���_����(Yn��C`*���嚢�Q��r{� �D�}|чQD�T�#�I�W;M����Ƣ��EPSpH��~��-����Z&x
BoL��O!���%ن,Q14V��:=���0%᩻�HQ�ą�i���z�(3S���S+8��|I��S�Z�"r
^�,��5����̝�����f��E~�2��F��Kq,($�`&K�����CP����X�i�����E�vC-=t�V�)�a������A
 ��Ӈ��lsU�R��/����$�1ht��H��=�΂^B8��>y�**N�֦�oRf�Q�h��Шl��8xP-����?�8*�3P�W��Y$f�
T.~k&����?'�Ĺq�:Y(賹�	����G��C�^�M�$��r^C@��$G"�)����"���
+q�;���Kl�f"e+%n�*��p0��$��"-W��#%
e�P��rhi�6!1{�C��)�"�a~W,גD�k�z�Z�H�p`�kr��ý���G�����A��r�ڎ�D����z�J��0�jK�y��D�v��p1�4ɨ�S��BA=4V��;�ɢ;0��	��X�.:Vy�^�]YkI��8�D�|�#���L�1����єI�m �N��[�z`��)E.6�M� �}-�7��E_�!|�������9Z_��U�]��\\:q���ݵ���n,uV�~xg�׽x��� ��-(�_a^C���x.J�c /�G��7��8:�A0*>#G�M�6s(�
�� �vά�2J�d��u�NC����<��}�*�'��Rm�[��e\YW�R�$�S����/��.j��䷘��$���#��|�y�2���)^�*�1��*�E�U]F	)BFDe�P�Y�J<�X�~U>�,	-y؜�0���nI�,"~9��q�P�;��S���~H3�����!�3=i[kg�(��T���h�B75����p�XY��ƨ��s|�=��qΆ4#�,U�%���1�LbJ���K�)�h�'c�xu�(�N�l�Z����a��RQ�4��jT��4UO�];� r`� x`�ɔ�R*Ϝ�����Sޘ
��cuԐ��P�͋a�8��%7��7��w}��2��%,���ŬZ�Of1�g6��"5n��2)� ��C��s��<\��1�,M0�����Ӑ
U�ǉl3��9P4��I4�p�䘛@��o�� j! N��1��Ԝ�Lϔ�ԍirI.�̔H��`J��<�ZG�}Tg�!�B:�.A���A�I����pJ���.[N���xмzL_��tT�@jG����G��B�/)���番d�=:�=ͻ����.Nw�m����;h�������Rd �K�+�PI�`X3�R��qB�����x���B�i�QU�nP��*.���*����t`~�/���8��4�#�r��Dc��+�*4���7����	���`q�T�F���Q��P�R�q���ar,���d�<��~q�G�
M�p*�R�!S�}r%����L�x67�C��y���;���H������.Z���CBat�*�=G�&!���k�� ����?>�A'Q��]gy��3#�8q�P�6`X�x+k�h�	LV�+�����H4
}�V\')�ʙ!�V�;�<�P����coi��Y:Dio��6��Y+`�s���;1�0S��&`�i���Iʂ�j�
��ϐIG�AXo���=������։�Q��S
[ 'P���^v�POO���D�i����X� O��^�fJ5�/w5qi����[�=�~yua���޽7�v�>��m�@���K��c{��=w�Ƅ��Z���I�*Ԉ��k���;�3�t%�>��ד�G[:w�ONJ[^�������ؐLZOlq��'sE�'�ģ�>"&�X1��ew`�� �� �Hy�Zy�$n��b+c]�	͌)K���sHx�!!�+$(��2��iRB����7u�l@%��7���Q�����0����Ԡ������UqIK߲�L���351܆�@ml�[��2j�A]��0�@U%��a4�#2�Y�Ɗ��j�-�BJ��=����Xn��l<|:e8�,�H�Cμ躒���`��c�CBQ��D[/��7��5r����7p���`f
�����;�uSQ~��� �P�ԣ��o{�A�n�N�l3�b[W��EP�_U��Iv� 8P56%��u��]"���T>S��q���j.��Q�������*�W�K�b�b�@9سu��4������ �    XӪ41ľ���u��� 4�s���[�L�8��\��M�Qg�7��
�oY-Y4�B7H�;Ӆ]��Mp�$�y�8�d��
�h��\���ǃڋH���$�EcJj�waS㚯 ���}��l�o�l�c}D�-
�騚��eFA|�R���$�]�y����!�j��>"�&��b!I�P`��4�E�53s]�����ҽ�އ
C�����'�vNY�cx�\%F�����Ey�8$���fp�������Y�nB<��d	��_�۹���h��\D��yB�>�LAN��چ�.ɾ@�,j���֡�ۢ�AM����8�r������t�չ�-�n8oP��Y>1K$8�?B� �d�m�� ��gr�"H�3	��DÂ�/�Q��p�)p��(jx1�Dz]�����@��\@<)F� vC�̑ ս?��+k�S�����df��d����W�K4i���6D�A�K$C��Dd R�B�s@OsH�P(m#4�Z)���І����)�Ō�vl��N> k��-���s}�L��za"%z�5�J;�սS&������cޑ��B�6�W�!�E�cW��翕Dy �c4'@�T���T�P��Y�.��.W��;ED�L7�Qg`�zl_%���-�{�9��ygY:k'WN�yp�ⵍ��_�y��;kw�?���ҽ ��Ju*j������&��>n63�+t:W��'���Spe.򚄏:.� �e�p4P"
Jjsp��:�酦-4���Q�81?j|H�N%�#�i��
0{�-e"��PEo���S=]W�uF�)�nmq\����n��|��l��C�GX�5WzR���tb�oҩ��G�3�*;Í�~ԏ�h0R�	�|�\��i�?�.a9@�v�p��T�	����<�ko��\�QJb��J�̬�SaIHs�2a�j���,,�+�(��9(C�:����$s�j��wM)7E˯B�q�J!�X�>xv�c�s����$��09*oRfBZ�+��q���/q��_.�����c?*����4K.�;��2���o��P��]دxjgJ睝�G1�z��p8R��ob�I5V�9z�GX9~O\K�*�-2�q�H+��p���� ���0�7h�u��n�_9�=ə���/<������Ț�Ǳ�c6:U�����m8��0� Y�F"�M2���v�@3#��Y���3���/������L��YIl'敜��RD^Ü%��P\��o0�f�����r	�b`2Fqjq�*��)VZbC`�P�2o��|�"�+�6��ʗӘۡ�4n:%~�6��Ha�E+�>�hk!<<.��A�0��j�Q��
؍�u-u�-_����!|��^
B�:ˤ�1�{�*8*.Xwƴt��i��.����~� H��3�aP��I�VEeG�Om�==���D/��AM&OY�?3^��-�9�'�$M�V�����f�)ګ\畀:�?h�SӍ�(k�[t�r����٨Eq�9�^� z�<͑VU�X��&k˒���+���af<mNh�f�@ ��rVc��&s /�����Vj�o�b�#�[>ƪ7g���_<�뼦 ��WJ��H9A����A�fݦ��d�K"���G���g�+j���8�pwP�4���}DR]�S���vt S�%KaC�1���B��ށt����U��(�<�p� �ĝQ�{wF��Mm�G�`�J�V���x����Xa��|�Yn�ei9��W����N.�����囷�\X�x�եKuo��]���r%@wz^{L��Q=�+i~J�2D8�K�*��� ���	R�@a,�K�b����ZS��|\Cj�bf\�g�oMc�������0���f���&��1��e���A�ҳրI��L?����Ws�w�r���<]�Qu_C�ED^)��u97JT�/� ���9=Bht#���c�ᦲ[%���G�XZ��k�e�ԣ:M�ⳆuMP��x�#�[����ܯ��*>�:5��|N�Hܰ���k5]���+T�.��ihBH4�iW�z�$���R%�!�2m��";�HH�f쨩N�AfM����d}~d���OFA
�Ǟ�=j�%��G���2mǐH�/3KX�p �H�%��ȷG��%�h2}*��+TM�E��1�C�F��B��KT�[��~v���4�$yHv߃Q�^x�TZZ�@�E���� ���s@�$�@^!�<�������HeҢZ�R�ⶪ#��l�FU���'	v"1~��9��L����eN/�R�,*�%�GM�a&�$Z�؈��i���(x�4�/:'D�TF�n�w��R��2A&�6�+���g���l.�뛱f����H$�پ��P[�pS��"'1����z2��ާ�8����4Ε�qy�#aA��=!U�����gچ���kVc�$]���օ�c3Q�r�8�v�fe��
LZ>*E5#��;���=��*���j�f�<��m]9Vrk?P�X�d�,YUj8eD�'
��HK�=��%�r���,���-n�~�L�om#���J��p*jؗi�ᖧ�{j�nќo"��PJ�y��a1�l��}yT��h��4��P+c6���A%C�"�3�	�>�E0*S���Q\�WX%�R�[J��u��������n56xEz��i������arH�)�E�7��6L����5�LmE��e�F&ok�P����&"�~q����[��g�7��4L�E� �QK1��agm^8TG�� =mZ*\h5����rQ�fK�(Ŭ��3;5�w51��9��v���gϞݸ�x��|����Wn޸|��Z�,J�ջf2KZ(��$X�Rd�)��X+I(��ĐQR�� ��G5���-u�������t8�&TxO��9�IÔ��I��BJ�а�p� �
�A��9��<�ш��&�>���o͞��6��8c[�A8FS$-#8۹�A�,jv��d��	BjT��(�|��!L#�������%��`����u�y��Ī9\��_�+����C�nL�g_J�w}�9 @C݆Yj�A��43��3���nΜ� u	�]2�`����w8#�p4�9ҧq>T�q=ʤ8/-n�H�_�c؎_A)�ȭ�<��\�i�̠�����4�������b>Q+�3_5ݱ}U�x�K��K�j��]CˠB�b�FXLR0��u�Q�*@�f;�<��EUV�����ʴ��oT9�Z��9E�`+�1��Z��
0
4A�G��P�FR`�J�w�(I��0Җ��	�Ƽ�R���p7���LҦuV���0������=%,��Z������������˿��n�t����<2e�PC3`�{|6�%X�!���I�
����]�OBJƤ�+��ӔŬX�(���a��-3N���a��F�����2z��&�S���W��:�v��)�+�l��po�!��� ,�H35?��Jgb��-#���d��Κ�;����k�W\u,8=Sچ�:��჉����O�jf�0&��7����6l�Q�(�7AuM�=U��K���2��Bѩ.ϖ/�Hk	��TG1+p��j�G��e(�%
�K��6�BxI�絯��D"�@����:ŋQ�����]w亮u���ST���-K}��@��${'@r��c�#��&ERl�����-�I�m��I����m�]���"���\��'ɚ�6ǘ�Uݴ��꺬5ל��o|� �X�c\i�ۂB���A�B��hNO�|	���m�5t;��OH����=�Bb3�f��ѱ�! p�t�K��&��3=^p8��x�T�%K��1Oy�CPWa輶�ab��=K�>&�
�P%���fP��ɪ����,h��fP+�\��;�,���'�!���*�	�9���ց��c�ps�{� ���\ouaM<�G�f�\���|nvc~����׮�]]�?}��GgO�gI�94!��
�N�@��y��]~�w����gq8C]�n�~	�8��s��\ns��J���㋃l��l�-fnX�S��9�xA��R�k�    �4�%��	�у����TYwK���={Q�u-�2#]��#9�pڧ�Q5���j3C��9��I��$8,�VĖZK����>��V���w(��DgɁZS [d�?�Σ�=ig��2v�B9RU#��� �ʄ�H����*&]�Ŕ�Nh��A,9A�z��6y�-���·n�R�q�p�ᔳ�\�H�n?���OG��d�冴 k6��	G���R�9�e~OeΌα�XQ�%W�������@�2���F9���pA����,�#���U��"�I�SJaN���+6}n�oU�;C&�B��+(p�' ς%��M���53��-��T��/LR:�X�Ly�x�t�/jv6����GP�� ��|�H�!�r)I2��%����N�S��<֪��g#�u��Ʒq
���	��v�wLH{�Z��V� Ո0&�>�]2z�5��+���;�t��{��k���W��v��(�Pc�k;�ӡ{<WQ`W�a��~�|��e���$V�j� ��J�R{Vf�#�4��jL?���a���=H���1�(yZ5�-�|V	
ރ��ij�`�_i0]�8�h+�E�O( ۄy���VqQ�ޜ��tc��+61#����L��f
8�_{�3��0E�'��ɬ��1���(��Q=|�Ԣ�'��UH����H,6�֐`��n��K�� �EV���ON��9WT�}��H`v�5�q�P��Rt����:��S̀�� �Na��0nV*�$,0b�G�YX������u_���#�4��'L�����̺ܵ�!��y۶��'v�x{?�$�~ư�] ��`�6�_����� ���q3�NCu�kǁPJ4L"[�r��Q�\�)~g-�����R�Û�a��o���@ I�~�����"�Cd�f�����J�)�����`-,]�;r��ڙ�g?�|{�����>��=�q��k��Y&���E�Q���7�U�̼Ρ�d2Ye���9�D)�3�Z��M�xs��4� �搡V�!�=�6���MЌ�@����x���� V��'�s͆�G���?�C��w�00:F!u-޲�y�$3��~�"D�=����D"2��}���Q��OH�0�$��C�w��!����6�a������R�0V�F��<R��5��6��@����E���<bP{h!q5Y��A��xK7�
�p��1�u,�Ӟ&����=�:<�j7�$M�`��PO���<�FƬ`K7ɬ����"y#��S��=tV���0;����\<^�@�cF=�g�wg����0�&�ۑ{Kgy�RF-L��ʖ���dk)4d���#h	O�[���=%�dN��L7���W9�7�N+l0���b<X��p��,?Щ�h���dgvn�!�:"J������F�)V����̧"�?D/�����y�t�j�dba��i5@z�J���ŭ�ЮE����YZ W7
�"ߩZ�n�5�w�9f���7�i[ ����]��RXQ���*���n�!,�5"л�R�O��'?���7)h	�M�E6Z��#�'Ŕ(ɗ�� ��G�������*���3|^no�|�PD��ƪ7y�g���`b�"�ŬQ("P梜O��&����5x����N��+gS^Tk���h�������4$u�W�����~�Iӳ!A����Ό=�y	"D�����M�2�6�L��CR�����qަH�[&+��f��=�(�2��4z�X�k���%�:q�:s��CY�n���to�}w#^E��G�D�|#WO�](��0�0�ց;�Ao��;v���)�����p��^��4+5� Z�z�CV�(��ZD�]ü��7fҖ�$��
��ț�'O��I-�`��7��qh{�&Ͷ����}�=���Ӄ�2	��jn��܌�c[B	/a�:�����mbK?p��q�
b��@��iW�:!�&�	 2ӻC��z�Q � p"-�<曈u�	��O@N��
9���Z8N`[��S��0���Ca*z5�R����j�EHj��<%����\E!��z��Bgj���$��XN��c)��sd���\N.���romYcD�G��\=w������_�t��鋿:{��Ǘ��hE�<������;��c,<�:.�,Q�_�>ݴ�"	<4#cQD.��dտY�(���@١�*�2��߇Y�=�&zOIe~
x`c���=9I҈y�K�)�jS��������^�
S~½S�?O�y��b������:�R'�Y�����99Z-U�P��$��0�Gy<�#�����]�욌��P���H*IWɠ��C	_��Hn#]6j�����h���*��	 ���kTgRj���������
�:�,Ѣ�$&K��z��ŷ1�ض`|�'׷� ��3~
ҹ1�F�`ŉ��1���	K�GF���4�W�/x (75���#n�L\�î�PgJ�'�9i�F&q�ԧ܈�+a8!����� 2YK��N!Ƃ>Q��\�=�[���(h�<��uL�l��R�����	��p�;d�GMo4*JN��0�t[�UD������H����;A��x$�������bs��S����yF�|�QB��U��c_���p�m�W!�Q�8����/�1��aB���r���./4׷м��8r��\a�_yf��B�k�@�v��+����>r�Vq���W��o$�7��|��!���>�l�A֪xZ<��w@?�-�h��j��_�3.���=�0���e�)�q
+I(N�[�-1�M�����L�=Z�&��u�Y�K�z�X�iT�ۖM��,�l��X��!����\��+-���T6�,̭5߽��~�X�ȓ/Z����e~��/�ڦ��l.v��µ^�={���;�K��MX{���:���'/u>�r���ܸu����]9�q��Kg�t��+�W��g?��q�����}���������Gכ_�|u���v��l�����Q�o~mn���W��>�q�ꭍK;��;��͓��'/l\i~�?�/��|��?��u�|��p%g.��|�������x����k�?:}���������6�Q�_B�3�x� w�#<j�Bc�8 ���<��o�P>�Ӯ%�\]1������aa� r�b��]��yd���0�ze���yP��g�b2�^�6<J�;��^)
v�e~g����P�2xp�P��H�k��������;��ן��E�k`������{���[R�U���y�O�����C��s^
���qb���j���XK�ꢖ��r�ͭ���S9��
J������_ʬ�(t���SrJn�ģ��EqO8����y_j,�l�t��N����/����O��?���2���z+s��z}iN��KG����`������'W�\ܘ=yr����8cy����y���^�����<�Y�13��qNR�L�rܪ����7�9���̴����e7�q��|�-'w�`��-�,w�?���M������
|�h^%aj�cp�x���W�·Q�a�#A:M�ơP�X�e�Ms=p���	0~�+�/!��5�I7�q�_��H�Q��ߠ#Bp�? Bؼ%:��z���� P�%�@0��{�b�h6*@�i��{���������~�<㯛�{����77���7�9���77��}��?5����Y5�����^4���of�{���������>�4��|���ߟ�'@z�x/ǋL��-��_�ķ'��aCb&�$6o�Q��23Z��$2a����1#|�	��	}���A��\T,��KgOR�Q�8s�)Y=J=#�^�\u�D����x�����a����'�o�EGg�c��/F��(9]����A�n��F|N�!<�.t�����'�|<ޯM�3�3[n�	�uPt�H�@�L2t�������}�ݔ�ˈ�=����j��*y��e�d�.�j�E� m$ߊ"��E�����K��lM���c�.�|XO�"C�ȑ'ɴ��?x���_x�|ǌ�@IK����jn    �'�&���D9Q�	>	�sḏ���@���<?T|	��n#�^{|�>��_��
��D��*����?��ǔ�A�NQ2#9��p�Y��
-P�L,y�ђ"2ϩH�/�nV7=���d%�Q3�:v��ͤ!�3�/3D��	kq3��&B��Ψ����b��7'`��8�鹠h9~0Zl�+�&�h��k3R�ΎnK<�Ud���l)hpho�N��B��2��D�Fd�@����� {����>�}yk�P#�%B9�����
�a��f��n���੪��,%����wZ"��c�ٔ��G�I�Z�[��.,Q�B�}$}���c�.5�SZ�#�HH�6Wuh�+�_%���bU.���3��z��4M[��ͯeh�-�Ϯi!��K�Gn��_Z������n̞�y���'?�zݤuk��_8m��d�t��V`Ȕ
(��
C�D�UpD���m6l1���>�S������Eo�i�l9�#�f�_�H
����ȗ������%G��=�E5������ETHUl��X�G�&�����Ϭ����i�҈W�؜ɢ���r:t���G�p�g�Nď������S^$=t��u
��-f8��Y��?Ј~���IP�C�r�w�S$k�s�s��kOJǹ��q;�C���ݴ_�H��͂}�m3Ced��+*+u�Oe�Ȋ��5m"�(F_|�)���~"1K�q���ej�*E�e+:
yˣC��_�"�R�K�t$�K<+������&�30D5Efs��;`Z���D�3������IH~PK�d����M��)�g�2a���W]>hb�URMD�K��g��B�����#Sy�P�<��*�R���x@|ۙ9��T�CU����%5e�7O<+�B��+����&�!)�,%M�ߏ��G��ᝩr��7�+�a p��h@+�<��s�~g��Md�Pfs	�d̮\����]6���[�SE��z	��Q�wa��K�Q�H�6<�S�B������'��ѧ��;7���6yH��ѡ�.�Pv��H��%G8�(�4y���/��u�
�P�
ac�Vk5�I|qjR�	���,hFv�aCd|�J�i�%bO����R8��/����F�d�9���-0=#vn����fȥ_A"��ǈ�ߌe�5��ζ g�\�|��ڦ���캬���.A���-F��*�e���5"�:��
���}	�N�ݰ��78E�4K�i��>����!T�t�*%�) ~x��|=��T���@[T��:Jy��9����d���S�@Ft7t��v���E_�]�������Z�R��>�j��c�W�8����8���p�eq���ތ�p~B	�Q�!�R��Tl�l)b��٤�Z'�C[5�Za�3������=�Ob$�t�L	��Q���g� �p�VS����s��$�O%�ԠJ�.��As� P4<և�s�0'��F�`���B6Қ����,: ���b�� ] ,p�.���V�$���4`����O`�
CQ��}���f+��_Z�.� ����K�Y9ڼ���ٛ�7fO�X�~a��G�+�nn�k�gqVX���>C�HE�|	_�a�6E?s��B�B1~Sn��}�۞�7���Ι �@d@/�޻��࠿
w$��*(U��_���s%�tVs�u|H�w�ņ�o��B��J���l�j9�s$��-����	)��8��s��q6u�S�U���2~Ѕ6�I�C�-T�2��1��_�d��M�3!�A
���Kd��C�͓����=�HG4N�g��s!!�h����"_�i?`���o��H�"pp�?�MA`��+���S��L��V:,cY
I�+e�]IO� ���vfϞ�}��Iˍe��U(�A%�aҍ̏�c�'�E�t�W����������E2�fG��[6Bi����d)��g*�NP@&�cZ TGpc�V�FòB��^�0j�8#Y�2�^�x)z�>{�@.��	����bЈw(1��E+m�� ��2⑓���	)�^��,B+�3�|6n�V��b�$��&�sTH��*��n�0�ުtu;�WcnA2G�b��JxܶBn�f˾�3Уm�!�����\F4j20]�R���oh��ȁU���r����y׍I.�Nj�)$<'C>�0�9�P�Kk�Yk�C�����N���S�����P:�T�i���6J|�Ţ1i���Wt3M���@.[���Ue-ar�~�Dٓ�{T����jI�L�{R+�tL?H[��R��-N�FDt�#0 �wO�l�qT�y9Ta%�_��]0*�dc0}Y<u���@�U�b�446~�KXߡT5�@�'��L��<(ш����*C���X��0?�V�dF1Qd|7,`	.tDғ�^�������A�a�*TI�&�@���9�׺��ȍ�����ci��D�b`���x]�kFd�Ebh�6J���1JB��`VM-�j��Hg'���4v����`��0�1����Ra��/>E>Ϊ�\���(3u��Aل�Th��;ի�%x9���t���q禹&�2w��"t f;�Z��
OR݊�VJ�%z�9h��8�C{ʯ��꾎գK�Gn��j����ŏ�\]Y;waa���Ս��3(kд�6�ήY�������?�a���0��e�����*Ta#�gb�7��9�zK�l���P'���.�����Q&I�c��!�	r*�F�"T��m�w}\\���>L�w�J�kL�)7���O�ޣ5�N�P�3d/����aӝ.��S���<7�"�cc�Kԉ��A.�u��^���7S��� �{2�O�a�IL����fy��'ޜ1��� ��N�u�+�
�H���\b��!���dSϪM��Xz`,-NU�u.'����>��@���p	���:��9h殰��@�<a�}�^՘����a��ѩ��#�Q@gT�mjMWL^����6#Z����'7e�r0NOj ��4�!��wTܜ�7���rHšpv� )�F )�RU�)ɲ�&B�l��=���2~)*d�8"�P���q���̥��t1���Xd�q��P:�� <G��z�*'cycpC4nǰ��1���w:�·�`N:��P�� �JDF�Ma
9�p�����1�d酅BC$m�r؈ڶ�"K(;���:<���D�](:%(t~��}�J���MA?��H�P������5��W
w�S�[�4��Q���}�@eۙJ�#I)���1�d�z��1���N�`���C��)��ِ�]������d�߁#� �f�^z]�>Q&�2�zny?��ӎD�4����@��߆�y���
t����ƃ�a�7U�_�NӘ�0�N?�O
��mF膕��'�li$!W���c���o��T?�����&d���֡�.�͝]��n2���yMp{}n���80��M���]�~�[N�`��Y�O�&8�L�sBp��%FK�<5~�A<;T+���)�H�LY@�X3Է�8-^���(�L'�y��ՠ�F8���ݙ����|C<�|���G#�*|*�-�8�&]ڧn��K���iNB��]��p��>�[5V�L����;�]X���I(��E��p�!O9͘G�`7��b�ţ0/����Z��4q=Z����{��G�P����/�h��kJ�2#b*+(h���_g��u�����̇��(>�J�(��T����0�^�zkK጖�W���vti���O��p���}t���O.]:���[��o�e^:��ۡK�]�T������!SG=�*u[D�P��6�o&ۦ�RMsdA�b(f��k����w&j��H�ވ��n^m�Z���g��K����>2_T���,LX���D�P�I鹿,��Jw�$zZ�7�Z$[��`REbqf�I�R��A�:��M}.o�y�`a�獢`ۓe�Y}�8��2�K�z0*w	�E�;8�i�A�    �ć����ub�/&wKl���R��P�Z !& �yz�7��Lb7:q��Ғ��i���$���7JR�ܣ^�<.��Kg�6�J�!}M7|]Rq���jbbso
�_���M�P̷����j���F�IE_>%�5qL�t��P�:\�W���/��~ΘU����ؑ��\٨F*�A���8���d^�񑩷�x&���?n�u.�S|d��б�w3%���PAU�:�V�<����Qs+���� ��M����R��R���5�j��9�.)��� ���E��`�)%����6���J;�-�̐�v5"�V }?��q��c���,��n���J@N�z�d��d�]lF	�H�=�5y�#���Ь�0c!��p�C�u�����l3��H��&�q�� '����A����'�Lh�)�q�횥�����m&LE܍ƨŋ����\�td�8t*���l���(�e7w6�UԦ��щ�2Y$���b̓� �Ɛ\ʎ���&�S�["�}`wd��,ǐ��65�9�QL�aw���l?��]��wj��K���H�ھ*q��$�Z
o`�'�}^��	Av��I~�\%�>����g/-�m餋;���ړݷ�)���߫p���$����w#v�eه��T$ml2/X��ꬌe�(���?�R�1���w/��3�2�l��>���~~	I��G1�( �
�3�������R*d����8]�=��z�������>�p����s_\�?����'fH���1J��eEPd�CF%7>��%r�&��SU��r��]�Ck��:��zm�fؒa��/���"g��ݷ�?��o9�sD���]ѡ�	[ȑ5�D���d/>e6yH+r[����P�~b�i^����ϏM��&��$�U��&NO�$�C$3j�&1�2i:#|�4���C �UH��(j��x�xcQ�,*�!�6;�=b�������hs9q&d��\P�|��t)�	A�D�0VJm��x��!ŮWQ�G6 ���D���60D	{��E;��y��V?�<�1-��� �Z�oTzD�X*���)>,���UN�<?5i'p��2�"�m� ��n��N�	5��w��Ic��f|�����^�w65w8a���P�)�3e��cqNv�� ����耳���5����WBQW��բG�L�Py"u�hU�j�Ō>�ؖ�K�nb>uvM�:��Y@�q3,NѬ�Q�������AD���Sd��ƏŠJ:�S�)$ac6�h�fG�h���}I�x��Q9�8bKm� �C	�i�`�ĥ�;"�ޱcq*�kA�ԩr���.�'5v���W���U0�98>�'�ŠY�J��^�0-�D����w��Nxn�g�1�/!���e��e�m}��*}.����µK��tGx��
)amu<R�D:�8�kΥJ���iJbH�N�p�3%T7d�$����2R$pnt�������5�����f��J}(Vʊ�Bb�l��8nt�v�I.�)P"0��V�,�<o�@f�D[Nwْ�r��f&����v0�����)J�[��b�u��,�"��KG��*Q�^�[p��D�(���������&k�&��Y�0�Gh>ֱ�o��G�i�s���]�����d\Vҹe��R_�i�I×�D277�¥y�B���/�{��(�4'�*�����DRf�]�o��c��H���1%��M�y��>e�X�Q-�н��~cE���"���Nf++�V�۠4$��-<K_�Dz
UK���,���;��YEɨ\������49,z;4�UȲ|��|Jϡ,������u @��E�U�ř�B*~I��}��q�ϫ8�ԛ]ˁ6��{�kK
̙;��v�[��>X��������8{{ei�ʕ�k��(]M ZXo�@���(ZC��H�6��Z�c9w�ɷ���j|�����3PE�1�S|��"ɉ�8�<��9x�h���DJ�X��Ӕ��ɠ$��e�u/��`V�&�o �Bey8X4W�����kp�`�̣��)Bf��Iw�q���XPWj��R��m��P�2�c�z�����NQP�M7TAe����m�[�#D� �^�\%�旅�\m�����Qk'�� ��X<��� ��6
3`�:kT< H4��2y)vЅ@��?�倨��`Y�yV��CP��C_�Ƃ�"��£�D-�Y%e��y�戡���MV\�?�q�,����Z-����괈xEsx_�Ǥ�(��n!�F�]ZttQ�r�hqN�c~�Dz���D8;������r2L���u�E�{L����*�q/��Ӿ@	�������o��t��!�Ng
k}{)���ɀ=��CȦ}���y���w�Q��՛u`-m�+v-�-ŏP������f�	��rN"I�h���/�q2�i��d�%�ѡ�׍�����&W�����~�R&c%8h0�'���	��꾸1�?a'�[����<r�͡[��ѐz�G�`�ˁ��z�����C�i~K�p�?tԮ=��%�C�Y���Xh5��3� �L��!����9Ц#�^>����DV�Ė�w����ZCV]�;SB��竧`��<Ⱥ��x�u4�	١����8B�JK@��[[��0Ȭ��z���4j�I ��&'���`�»���<	�����)uly����<�~B�2a�e���On"��x,����ED���	ۀJKH����Q]�p��G�S���v�	�������q���v��8�p,���5;��iVɔ"R�Y�r�~����(�]�o9��A\A5��*r���y�������\��|��{AM-|��)M�|��(�L��J��ByE]�<��%�`������J>�ͽӹ����6(�|�x��NMdS�%�d�WHq5��y>I�qyaBa����F�X�.ޑ,*�Y
A�I�N���m�+��A驟a��˅R(d�������^_������#�Z^�x��ɳ?�z����s߸�q�A`��N�	$���"���B�i!r�P����I&!���k�'f+q�w5�,M����yJ⃄N��:_������&:����W���o��bk�/�
Uf�OB���&��G��6��=(p1 2�!*B��<t'��L���|���rܑl���ө�#�� ��Gz�L@ʰ�Ά�8&UrF�!�����RN���_���"�ژ�k��@��aLo�2鹙b�Sq}#"0�	�h�jDa�Ub�8� ��~��`0Фf�>�д�fc1�4#�K ��<$���PI(?��U8��H9�1ܡ%;�ϦM�5�B�q!�ՙ�T�Da*ӟ�2�!Q{�`ި�0.	+$p+�B1?��|}s��;mDpsLj�"T�S�v�vE_���Y��_�(��O��������xB�-��ȧq^�-DA-��fQ��:`�0�Լh �� �-�!6�sG3H�b��%S&��_�x+i� �b+���jX�jy����Q
�Ą!X�@�?=S�l.�4 S��thmM�z��X�m�a5uF��p�]��8�[�].�x�3v�)��+C:���������d2w8�W#����y�� vT
Z2�V�:c�u 1=QS���(Ȳ��_ޡ�Y6��̾	�JލuN_����7�����Uh����י?�h�Ď� z�����c�?���P�&��8�����Gkp���m�t�*0��6�9����杦�شe'�,mtR{��>�/e���E����Ex�a��j������m=�oV=]�5c�lt���gnmu��ե�H�ׯ ƹk��axʄK?l�.�h�O�_Y�y}Glb���wBy�N���3#�ē`>�K�Bb��M��^� �����:��w��fuVR
����=y�NH�o�gi��V�@<�|�QX38C}
����<Z̽F�W_|9�gasz����_�k�ך�^���� g:d�p�����o��i�-f�~��{+4����%²�xty��œ�o^X�8��­������������[�Xa�����    �	��V�fy���G;��?9ߩ,�8�Y�F>�
ZQs�}�~���������˽��t�.n�8��ϧ�^�q��G�k��V�����7n��|�ow�ec���~�����Kg��o�ov�Ɖ�~��{��1�g����{�W����&��y8ϛM����z+����9\���>����?�������柞5��/���;�7�?������[;�Wz�x�o�_��?�oͧ^4��ڻ�%O�m�����/�k�\��������j�7�y��+x�#�x�@Õ(V�r�B�m��	��?��� E�N�����,��1�K�"�fQ��� c	��&����Irv��?$�6-���u��������L���b��U�;]��E!�=�����#i����>����p����a*`��fR��3��)�z��yzq�jV�n^Zp̽oa�J���𠒮)5�3��@�f���g������3z��c�U�� {�ː[bi�th��!���M� ���	�h`r��h�b+�$LH$�����������U=5�jj���|cc@�ザ�@,���S������X-㤉�Rf�OR� ����M\[����c>o�oғ~���o Q���=����@ڱ32�2��;�k����"}sHT���?��W�/�l������MZ��g���𔰼 ���Ki���]%�<�bFg��6�� ����v/B���,S7�0�_OL��g⭊��a�'�,L:0�w$*rVg˃6�8c���,���	�5ZQ(|��Uz!��|T,��P�Gͥel�a[�H4�wt���]�겦3�р*�e���[�Ŗ��22*Zc�.����� �Q,*��&�t����s��Rr�px#$`�8p:M�n�<�>��,��,\��4Bar�Ӌ��=�B�WR��~�Y�9lh'�M8�ԛ_]8�볫�H�tty�����|j�ÕՅ�sk�fgo}|yiie����a��$�x��m�@y�"0����I��=����|��ʆ~�,j_�����p�� Hh��
Y�����jV\�m
���~-���Y����:;����l}�����ZW�ǆ@�\_  ۸k��@�
�X'���i���v�h�öD-Psٔ��Ш�Z��Z��u?V�冖��;�Zg�t���~��Q��e0��Í�-n���&�`/ј�&�R]o�hF�����h���>sI+N��p��T�~��Fy�+��R���� "�|�q0���j[̾*�Ѱ5��/�]cd����TѨIs��9��MJ��a��<��{���~���$_�Z��;�]�Eg��2+3� �3��S���[8���ǳ��Yo�Il".�+���%eP�,���ojtA$�Ёf��p�;�����xR둠4F��ll��i���zr4���鷡��|�"Z����[U��;hM��ƨ�}��t��*oq@ppׯ$���d�O'����D���^�O��#>2��b�����|�.{B�h�J����M[�A\�!���Y�̟��:1������<F�mYPM8+�m��E�A��H��&�:L5^Vi�0"MNZ!M����f�����nga�ͶL��Z���B�6��Y�jPٷ�ȃyI�Ee�ϔv,*��Ȩ5�π*�yl7��dX�����\�d��$� q��&�p�L���-��Ǆ[����yJ\~�p�'
7PG�&�C)��4�\"�57f0�Cx�ƛ�HW�/��tܡs�uwX$ܲ����k�T�hL�z&�sB+�8��B%�@�q�Ķ뾢�V<�嘫��Ψ�63-������5�x���!�H�X9� ?�a�O�gI9���j`Ba����璹����sB��f��tC�A�l�h�ϩ��]�����t��t`_����e�M��V	KI�U ��S�>���L��n>�송��!��\N������͈�amY�-w���v��S����ta47��c�v�����Į,)�rl%ӡ���[����^��@Vz���Rg����E��,]^<r���g��^9����<u�ڵ���\^:i0�5�@>����<�����d�D�uk�	�9�;�*��d�,�<�bJȘ��JM���[�z�D�>t���zT��gߧ8+��ؒUt;I�δ��w�.����1n����q$�Z���I����-�fe$��#�^s%!�W�qp!�g���L���VsRڗ�f(�hm��Q[��4��p6I��2�l ������@W��Y$���+��4�o-.^`�l���[׵
�>�����̾��-Z6��m��	<	�2w�y��7�ڡ�8	˿Qic4����!w1^�T�Lۧ2SK8f��n"f�HYn�u�uW
�u �B؋e���w��s{�MvK��� ��H��QG5�4�*x��	Td���Xb\�	K�)~t����ؤpV�i:�nk���E`*�&�'?Ȉ�7�N�&����TQ�]���������&{��ҭ4�C��AF?j�y<,���'���	k�Ym�nF�'̭����Iu��<Wz.�e?���i��!@��v% $�br�:�s�A��B�y���GZ���RˀZ�S���2dH5�n4��z�5�Z;	I`�*'��g�AVZ�6Ô�<�\�P�A�7�2�0ZZ601�7���D��>j�E]�h^�~��(�� /@(�)����Њ���ڦrE��C�"m� x/�_�}��y�c�\��	���eE�ƒNZ����F� @��� ��Wف��F$3�C �,�`�We?��*l�&zEz��y��)���*m��s�s��dEE��.�2�zp�:V�)�K71�p���� ��6���'�pЄ)����`�6���������k�a��am&��.+�B	����V�NpE*�R�6���$fc����9�=�#�ux�5�i W��O}?��S��weA�QO�X�d����ߏ�|�pqYiI3��ø"�e4�9��7��v��	�4�c���;��)�SK��m�ufi���:36Ƅ~��l֘Qud�A��1�h��loa5����>g(+G���l�]��t�µ��S�Om\8w������>���Ҭ�/w�!�j���b���_.Ǔ5��A�eny���gWgS7�I�����CMxOQl6
�0_�m��Ԟ��T��C�����脗M���㮎	��4��e!��`)2q������>��=��Q�;�M�8�T�0�����wΏ#į�2 �	��G΃��]d�a�7�r����C�T�D�����)>̣�m�.F!q�a�K\Z3�č�tzC��1�Bf�}����/:VQz����1�]eS5�Z��[~h
ӑ���3sX��3U)�p�j�W��t Ќ��i�f&�ܝr.4X�
�gP�w��C���^��.�D�t�''"��ށ14&�,�8�ev|�9����2���S�A��*n��C=�@sx�"j�P)���=~���GH:{_�R-�%�0F3��ӳ`����sHr�M��\��]$RH�G"�T��&�*öo��f�Gr�}�!�ۍr��S��y �['j ��V!<�ns{�rUî+%� 4��U�٢�	�0�Y��L�� �#���ӑq��!#k�p��S��f�E�!���)N�zd��b
+af���ɧk0��l�t}�R@h��n��������M���sGh4k������K����hv�bx����]V���aҿIE�tR���m�9������e�K/�3;qO}�0o�3����V8f��-�)8턲��V�AERI�,}.���|f�ej���X_�U�j.ќ��P�K���z��Nܨ ��,�ܧ6����w��j�)���N�:����Q��;*����|�8���03L3�̊����H�'F�i�:�W��13%�;0������./����LP�+
�1(��z~ư3R�?�d��mթ��̦����3�w;�DK	y����f	a�Z{�Rx��V�hM
B���ۅ��    }�^���L�4;����|�~�IH�)W����5�j�?[�	����r���O	���i5��$e��6���iy}��]^>��_�[;u������[�:���s�N]3�˜B^���\D�;g�#���h��^�i�/�t ��G�DsQ�'�'8�� 
}�\νB��s��@N$$���:�(�!K���x�uБ����|���	Ô��Y�r�O���͎L"m�,������
��ɻ�iԼ��YF�Ӯٖ���5�+���;.���0����5��Dˤe�Յq��&(�X>7�u�<�D{��M�T�ph#fR���9��Y|�Mr�u�h�KP��s ���v��1����
�H6�%C��Lʀ�����̮@��	�+Tr�����4�I]Q� 4�Hb��ţ0p?��|K�>����:6��32B�ɂ����9����@ ���V������P_����H��.�����$��)<��yY�V�F��jԶ��~�Yy4y�r�j�i�?�p·yb@Gy6J���<Jm��ܩp-�M������~w􎬅A�Z#�Nj;�Z�CUC%;������I!ͬ�5����)�"���(ڽ�8���Z����Lh�#�0 �����r\�]%� ]l������S0�o��Z�̱��&U�:�{�}� xW=E�B&�ۥ�Z�R���j/�fK��iK5���/��?��?�	)aU*!�I8G/�pO	�Gq
 S��LlD���ay��a2J����/��cM�#A��`C4LR=��
���G^�-djR�T�V[K)6��%ʉ��Z�����F'v�i�Ҵ�p=�@�@7ɷ��#��eP��̭�̲�Bc�~$�=P	h�u4�r�Z��Qq�6�Hհg4I��B�(�s�s@NJ�����7i��$�[�B+Z<�^�4�4��$����s�t�5x#˯��#M�p_a����%��9��qT�v�X�X���e멘Y�
�	�i���(G��6�E	af��W��i*
P��C�����IA�S._�P�`�%~�|�8"����]����,���<��A������#H�@�P�_s�V�[��[\�!����±vty����k\����s�n�<�r����,]7Ǽ��i.g���Q�̴<W��1�d�uJyjf-�j���'�hvi�@_;^�f.��������J� �mء���Y@^�]�2mv9a�iʅ��&�~�~HW#��C��V] |���4y��-ET�xJ�@��-��cJ������p[���z���PU� ��@��pAD<�
�X$(���
�0@,�Z����}$j]9u������+C��_��ľx��p礯�� ��׮t�:$�'D[n	��f?}/�
��)����V>-eHt��}��	Q�	e8f�P��
bf�G�"�]�v���Դ�i�۟�t��W�N_ꐒZl�d��# g>��z5��c�i׆�` ���a�f��O"aw�����6B^�JK�/4�D�$�pF���XV�%"92�S񕿈l7�;�D�>YW��I4�
�R�J���"ܣ	��1쟏EI!c��镰Б8�p��˗v9u�#�383s3�㶸G$T;n� J��3C�)�d��8���e�x^�*�cO��_���P?4%�A4y�	*���4Vj_��'wA���v�Na&G7}O�2(���3de�?q��H���67<�Lc"��� 1�V]熺�WV�ui<M�+��u�#ck8�J�`"��Jo娍�YB��C6!Mz�N�֥wФ���cݚ��#�Yr��J�QG���M�V�-`2R=PQ��
�hD:�B�1�OB}/s���0�4p'숂.��D�Ҩ��Xte+`�\���$�e#r��rBr��t!�us�(JDV��퟼��%�<AAﻐRgl?H���Ce���%��-���ih�J�8�;��#Uy@�L�������c��\'; �b���~��n�ʨ���B�� ua>WQ9����&�+1v�O.x����[[�;��+k���4{ty�ȍO>�����.]��ᯮ�>u����W���� s4��[�ϡ�0�=��Rs�H&Ku7L�"�����T�������^r�d�[�EG�����6W$��|�:���s�R�%��ށ�"�R�і�&g5��-=�Y�S����T������Jm�MQ4��ʣb����1}MxQxw���Q�>��37��D%J�]DZ��@2��U��#]��y��S6o���زXI��A�1d��S��\��(u�3��O;���y�9���������	�|B�xT������U��M��ĽM�6W�}�?S(n���Ǝ�C�l�rV7�O����2m��C����3���\:l��b� B�	�݋,�0�3a��Y1��$��:NG�UW*G*��X�#���e���귳msI.���%+�ʕ�d�`�AE)}�L��p�jt��L�.�����][��a@G�f�=�Dx*-�/<M[l���9V�K{� ci����J)��Q_IK��C�����\�?�*�:0DI"b�PR���2#m�`o������Ic��<����Ĝ�ml)���P���yʄ�oĚ>{P��7���k��[@�[vS滴�\��(C�b��XŎ���hH c�6B�2j��ǒ	\*�P��<���a���v�,E�$}�|(�)�Aq��m� ͆�3����KJ� ��I�4U��p;�����BM��_J��*�ԉ%��F7T�b�jz��Y�hL������䑓�}�ں���G20)0,�l�
�L��$�.�r��q!�>�U�BDث�8N�a�� g�N㬗� �=�4&���4����0t���[*�jkZ�����_i�>�l�%�('�����E۸��T"I�q�٤�JrZ���q��`<Q�#����Ԙ�&蜈����$���i�"��e~��6��:�l�F�Q�,B�Y��-�$s[^_X�X����#�?��𫋳�?���ǋf?�d�橳���V���	e�a�FÌqQ��t2$�Bz�uvp3 �V�q4��v�Y�5HU�����݂���zt\/��`�A D'���!��!��Z���3�t `�I�3�c�L�m��0�pL���N��عH�B �C�
%��	K��.(����8he�]�`|m	5/���ً�)o1��@4���V���G��5�&J����]�KZ�퀺n�Ƶ~�������;�1��b\�@��V��\��
�,2 �
���Ҳn���{�ѧ��A:e�naL�6X��Z艱��.L��5^%��*Uc�[���j�S��ev_2����'C޺];��n��I��I���0�ݎ��"�֡{��}�Md)�YcI���x��,�0k�:<� ���{`Y'��Xx�f��H���f�ù�#�'�l�@�0�-�`Z��ub��."k!�S��)?��+�3����N�;��N���#��`>�����Xv�Ї�a Fa��OE��[�Qf4ϐr��@���C�[$a��e,H����в�G�Ս�rCJU�����ǲ��EoW���?��{?H��]{�����4�����;XFj��	� S�J0��SB��	?���9�>�[���:?�\�@J��w0�xJ-=�l�B���;�Ў�V��5����H��V��ɭ�;<
l
DMb�H1�E�J�f���vB�� !��^��zнY�0>/�/��B�z���u���xO\~lD�6
�����b<����W�!=_�&� �dtm�]������Q`} Y�s'�i^{Ӝ�Q8{�%3�r��1fK�@M�+�ˆ��5h�3b�/�1��߂K�m.�kiz�� ��6q��_AH �z�q��Ӛ�z�"yY��-t�x[0Ǘ8��D�^��\`|��18�+����*���x�����}�5�h�{�u����aG�F4��C�B��_�?U���ߡ��o���{ɟ���\lV    d������������~�Z"�T�Ȱ"@K�)X���p��4xa0��V��Ɋ������������%Pr���[Y�e0����B)�>�[[PMIK�GWf���v{��s+ח����<u��٥��gF���{�y���{��;�W��������_����ϋ�.�7����S�2���u��߹G�>���c����]�����'���7����S��O�S����#y�o�a�����7������W�B1֟͡�#@���S#3Uʤ�|��[D6�ǊѶD�*S�I�<P	,���di�F�NZOVΗ��	 (jIE�'2
qm
_|DSG�b�D�*��fǔ�S8�CL�em�w8�$/v
�׉�g�1<���΋��9XP��?�c����X���&$3��8L�1����M*4�Q�۰U�U|�H������_�����xF�4����17Ǟ�.,����j�V��N{6��Ta#qB�c1�4d��� ����Z���!��n�{_�Uي̨��"�֣fV��yN:?�\,!�йT��جZ&�x5IUC�k��)�����A�����{�,3�?a��D�F)~�v3�MLoO8GL�Y�n��mА�C��P1����C/���{�b��y���q-<���,�,�R��rS�Lꤰ)̊�t7�Ƒ{�U�܁���v6.F�p��� 4I	�[q	ɑ��m,�=��3��aUqpf�t�}>l��B�V��VT�T�
>�h�Y,�p�����[��:��KM��0�O<d~��}	��.9�XL
̿謢OXZVR���RI}<1��='����I�*�D�>�vvD���cOq���O.+�'�홙%��QE���MeVl��S������5z��]&�j(N&@G�k�Bz�OVc	�>�I,r �+���Z	�j>��Jv���̗f�P�id���,��J8VJ�x����?����WN�"]��++S��?[Е�FO٨JVe9�
x����6�V�'.t��df=���=�tZ�?���{`����ˀ˯/��A�KGW掜^=�p���ʅ��֮}x���ɍ���~e2�e��H��D��_��PtGjn)VLN0�K>�Y���х����w���@�f�p�.�xi��C�g��@��ݔ1G�/�b���ڡѱ$��k�v3��ZGH�ݮ-U���h*N���D��,�$�ؾ��`8#O;;������f��t�r�b�G��6C��/V�ro���&ImĤ���?!�x`���W����=�L�AUI=I�W��$��=�r����^��5����3��@�P<�T�}�v#~�"��G��q��>�	4M4��5��+\N��!����ٟ�Q�i�y8-!��2���f�8�/Î#�C����;?q�s�4�8K\��t1�	�ՈDsҀ�վ��?mޡ0)�����@�n�P�!"���ʨ�6o�1�˙<$��s؁۲4�xa�΄D�\66�}�=;&Mف:	(5,
#�$�\&q�.��I*�NQR1��s|���}�H�]!���	a���ϯ�K0q���5m�ᇖn��2��5�8�È}��I�n��C�6�0��mY��HF�E�$2�I�;�3��+s�3��z�J�m�J���B�$c�4̆���U<%Yچ�H沦��C�q7O���A�?�(f[F��CA�֖L��i�#SpEE�%����5�]9?�0�����	IKT\����4pF���j���)��`��3<8$	�\��cy�L$'u;���@:T�vLa�0,�i���SW՞��t�������Vʄ�����p�Y�1�'E��d�C�����'l�Hi�����c��m��k��P��	)�g&m�;H���\|��	@���9OG`���+�!��\�K���q��h0�������༁��������R6w���ib͂;���D�C?'�o�E�N$�^��,��}		B��GH�|74	�Ǒ��m����f|JXؿ;����r P����� -]�?r���O66�_�2{s�ҙ�'g/��~c���V̌�}��#Q��-*�B�%�x@xH�}bw�i�a�B[N ��wk��K��i�i?�=��s�|l��lGo���B裆����TQb
�gZJ��؅<Ϧ�ζZ���d3}�ӥF��	����*V��3�H_��K A�Y*ÿS�'�c�ُ�x�{��(
a�De�m������l>�0�H���̏�i��
D���Я_i�gx�I�*�F�eN��
��;��ɀ�9�b����X�?����^g��y��ۯ�:6�
��m��#T{���28%�k�(�	g� o-�� ��5CR��[������Q��<|Rũ�W*@���v�P�L��1N�<d�o}7��Ja~&�o3Rѣ�"��L�ϼ)L\���ph셩��<ag����h�=	�6Q����W,���Ue�+5�TG����_T �ddB��c��k�'��A��N��D�B 9�n��W���B�J5����F��J$�C�S�T��jMɡ��s"�6�P�P��R\��h��O����&L �>g7"Q-d�#N3�E��uB�#�p�MmR�(Ϡ6a#��4��5�h�*f��XP-ۍ�b�?Q��S���t�~�Xi�Xt���p�n�e��v�H�h�F qnu�ɯ�VA)@��H��?c	��� �\�N��5�� F*�#b���"�����U?wHB��΂Qpz�}ぞS�	����5��&if�G	Xv�Iu�ʿ0[[����5J�8�����<v���mF��qC��b��)��p&Z�/�����l����c\]�*�߅�Z��)
@��:iT�|�5�0�|}%��Fo�d��=U��E|�ҁ��w�ss��� �Zȥt!� �X�d��蠒���P',n+��ʆ��11⟰U5��� q2ȝ��s0JK��eN�Ԛ�p��	}�Q���~H
CI�I�qm�ޟk�wJ��W,���Ti9j V��IJ�Z�Q��t����(��1�)�� ]�N"S��+s\�N O�������a^^2J�KGW�\Y�q����ōٍ����.��^����ӟ�eU�w�`d;���nK�������{�n�����'� D͈�[U.��1���:��#/a����4��b�Xt��f�%��^�n۪?��3��; 3񒦷��VDjAHBu~{~^�G��$B��r�PQ��xmm8�1f�iFV9��f-E|�
f�zbV�	_ȶ)��oUjG��Vp�Yfܴ�b�r;>�4�ˆ4�0�t�pB���zs-D��h)��%Y1-GU�p[@4݅�����)B��6���5!�<,�t{�{}�AG�"QYn0S������ͻ��D
襂܉j���C��������a����x1�<��ZI�w[o���@�SdE�*�߄�P8x�֛����n�!�j�`+XL�>�{5�c��{�p4M���Q�*��:+�ס"nud�Ȉ=�Z2�~����M�o�:K�B��,���x����͐S{LƆ�#�7#��Z���np���֣CtB\X��@�\F
�jR��E�e��c�D��p���,��4	�c ��c��/8��^���Ŋ��G�Q%R�8��W)y=֊T�&+�n���f�����k~�u�ɫ�/�𜦾@16](j�.��PD<��m	J�����e
��ttC#Ҫ@tY��.��Q�xi���*��`O��ܦ�#�q��	����|�j�4�K�B��R�Œ����ph5��U�����s��_|��fk������ FY�?������n�4M��2v��IE���mF�\�lZ�u�� �6�"l<��[���[�)şk\�7>��f��X�B{�44�6))��3Ą��*�&�x�+��K�O,Ǝ����.6h�Ch����!�=X�1�.m5Jn�� �T�}F߄t�usF�cŌZ5�;f�i�z���� �]D\'��H:�u�R����������N��G�)��.�>L    G��0���rhp����Ĝ,�I�ST��JL�� !�;We �����a^�[�L�GW��X�����˷WNݼt��3'/�꣫�V6. eM�4�/�FL; �0U�tcS��U���[ZzÎ%6�����#��XZö����9[>5"w������Z6y`�Nf�9�"�kԏ����횈��>�e��	�o����x�I�̀ ��W"��-X�q[���Y(�ʓ�J���}F�7bC2��8\
mL�V�Hÿ�S�Q\lW����o�6�B�a����O��B9;�(�j��az��sF��54|Ú����'9_;,���N9�qS�S"�LǱ�V<��t ��s=� g��X?\�C��ڲ����R����Ay�/g�Ŷ$I�1�r��4����ШuI�bӏj�9i��U^�$�q�ޅy�n�&`���*Ģ�pC�l���&p�I&�@b��ŀ>-}Zw�GUX(Y~1�}�Z?��R.r�eB]kf�Ev�����Y��v�:��x5=4�1C�H�Z]��E�WH�p�z6N�"�a��.3���~х׶��.|,I#���r��k��(�Ma�*�߹Nj�VZQOa=@�;6~�u�M����s��xm���q>���`�{3^�!D>~�!�6�J�.�UJ�m�%i[��G�x�v�1"�U�-ww�N�o5 ��MW��o��7�o	6�\H����Z>硱E��z+�\��k	��Z� =��M_z����\/���"���T_�!��ƞQ>����G���;]^�ެ/��[#I��Y�P�2���T�!���$O�'���p���%-�)���cY�ZO&)"��"�#E3��j������o���U)�S�2�0-���&z��>ɏ��Y�PM,?�y#�:�9l�=�I��R���ݾ����(4�if�!����︉��S��6��[g�T;3t<R��p^��R�̲n ������;�S�~}�%vc�i��U�����T�OB���R�n��Y �6BR4�Z2�܌���R/'+S~ye^�5+GW���>}aam�����s��'o|�������|����Yk^�)�4Fi�0�|_��V�D�s�eoƴS��KhÄG9�9�1S��v,�YӀ2gR��1�TĲ�<u�a�������<j�`��0��E��)�(Ui^����yŌb��&��O���P��a�Y�f���=\�^sP؍�8�Q��}JH�#a��R��:EE���˳m\�"�$[2g����)�1�Ę�Vz��E�.���p�.8�h��B~ ľ_��$z�T+Wڮ�M�F�ؑ��x��{����˱у�O_�q����0K����rJmY��Ǖ��C���'��Ϫ�3��#I�����̡��lmK��$ǣ��##W��@9'�@Rcʹ�B��B#��22�O��qWX)�������@T'��|J��
h��D<���ˁ:V����|�J�F�A���	ŵ`߄� 9�[�*>$������>y�-���	l3�$��.h��Fq�ɰy���E�
j��k.P�E�+n2���p�Y��T�,�Z%ma����bx#�}�Lu���z���4�a��f�I�=�7�:�>�0es���y䛎�L��\>��-��H"��.(Av(��|��悏Dr�E��d*	R��/]:�XkF�*=�2T��s���<I�I�V�f�b�t��BFL��@.<�*{_<���v��!N��M�C�߆M*`�8�S���B�MWS(r��ه�!}l����t)��ֹxBs��,?�Y�Nc�:A;�e�{���D�lSC�&e]{�ܵ���L����Q�@�ɝ���N!e, -�!��:��ࠧ�.��_gy�a�E{���� }rF���\{��xHZ����MRk�t�I(���O�:��)�QM�g�n~���80^]R��g�����K������b�=��*��������%�1��wg ���YKj����O��8��p̌P�%Xj�^���l& }ظ������ܡ^�_ղ.�GW��\��[�o�\�~scia�Í�?�2{��k��S�FF�b���8��Zkݖ��O�}����f�̦aXP�/զ[9�pjJcv�r��UL���D���Q�\3J�ѓ��b��}'�/�_��X&.���iGsXC�fE��蔽��0�/�T"�W�Q-!��]A-�gr� ���}��$���W�&����Y�4�Le��B�e��P������Иv!��X����$�1i�U��vy�Pd��0{J�����Dh1m���En`��E\03���5�fڡ8� h�[WPy�ߪKOҘƀ�>H����T�ֳ8#����
P�+#G/z��bаkNRa|���ˏ�4X�%e��"����X���,2o�o��/��`L��ޡ2�64��� �08��9 ��?���P�n�tp�(x��'R�O��?Ԕ �0��5�C�G(o�'��rui!���~������[=�f�|ݱ̙��z��2�?Y	q��C�U���AX�D�D�DwD�`�n����=SC����
��2�`�0^�9;�〪h�[�����@u�WʦE� Use�\"Y�"h-�4�V2���9���8��d|��r��h�<I	o�O5�d���S�U�Z�]"�,R���p��H�4(���5�"�ۤ�j
�,H/z���H�Y�1�A�Qq�TzsUd�N3}^[�ocb��(�Ya�c�6x�]�cC`I#�d�����/�MUT��s47���=*��ʞ�j,��jD����]�Ԏjoô���y���r�� ���CG3�5F�"�$I�3�(L��Z�^�m�ʡ	����8����L�z@~}�|�����T�N@�UP7�.H�w��bϋV@��n7�n�Ʈ���.�p-"Ⱥv����H�#�aW���F�ِ��[U�����*�e)<|��kx���;�� �zc���<��D�.7���j,(�"��=�ya`u���-V�T��ZEj?�|l��V	�V��/����v��x���/yF鄖_����>����R�
H!?X/�9-���w�A֜�oc��[���=>���<d�Ե���!��ݓJ�П]"��(c�'�.��C ��_�U����[�p-3�xi�7�x�g{��s
wY;��r���͋�W.,^ٸx�����7~ue���5���������T��aT�U	�����@?�{����6815m
�$GeI},���2�<�_��	�ͧ����<�5����;ԍ c09�]���1K#ك�%S2�Q'oB��]'M��g�l�(�f�ZD�2�*v����`&���
�loF��&��b<���|Gy���\�q+�KIl2���in�w���|�A������5��
y��7����9�:�c�G���M_�/&�~f �$�oO�h}L���rr� ���E��eա]��#��!�y~py�B����P�R�����N����G����a4��6��SY����1줻������23�pS��P�B���[��ʬ�FoĒ�V��r�D-q��4"+���
��i�՛��l�>�ǫ)ߦU��]y�ǚ���@P�/�Q*� qd���(c�DS��up��s ���6EC!P�q�}��q	)ħSy��a/�VT@/��C��MG�!l�\L���Ɂ��3�O�������chGf��4X������A�m7��6�����gL��m��	-�-��ʯ��@�afX�<��IǠ3��x�~K��U�hAA���ǭ��1F����\�I��T�LVE��NP:��(@�0-!L��3�Y�Ԭ�="�zm� �"����4Mi�� �w�*PW)��jyɲ��NJӀ(����]oaح[�Bj��7�S�ж���EX�{��J:Q�v�n�]
c{���R�Zp:U��� �3T��"1�Pۀ4 nn��]��4!]'@|�����>K3x�iUj(hL����.v��E�w$�    JG�S=�)ܓ�%���
�p���[(��nI�,����ñMy�IXϕSY�w+#�٢�6��1%�xLIP�hv럡�*�ga*���_z����у�����m �<����;|�?�P��7_��C�R9�`E�M��҈���m?��ݛ~��Boy>ãiy}q^��.�]Y=rf���7.���q���W�>:���3W?<mp��y��fp��5l�0���OC�]��83D�ԯ�V����ݲ�/���nM0:�D�F��5�=����	.��J��0b职��ZD��_ALCS�4����e�%�b1�f��i0&G%N3|��w4�&���P<9[]������� ן��uw�u�DKs�㨳o�!w���A��`�%�����=� \��L׎�Br�j�À0j�N��IP<��r����4{$��B���}e��?��t|�kP��cJ0�DP6)���s ��G�ř�Gm�k҈�YQ�(QӴS��3�w6$��[��NhO��z7 冒bl��EzRʟ��?km:���6�y�,��ځK���8kn�/�,��ʣ�>.��9��\��+��"k���Aq$Bˎr��a����C�,`��
�Z��
p-FN�gH!���M˙{f��,��b�-��z(��wAM@���P}���+%��J$�f��͛�mU
�DD0��%f3Î�責1�{Q1�R�u�S����D*|@�0�t��0�:�nJ�#�/1��kQe.�N�D)�ݟ^?!(���ԿSq'Pa�AD�|��`��bu�&��"P�}�$�ñ�ȴ.�]��/�	m�3��4�J)Q�}3�3�LO�������ъP
S*)���g�������;#�?UJ�*Q��\T�c4/7�H��*h�ԥ1	$w�_�P�?���$�_�14a#��&��V���e	�R���8=g���8�2�3�@W�`�$�6"���k݊�X�	GQ�^���6��,�KC��j�`�<���eܬ �ݨ��C�zc�%q�i�-�iDY�0�K-ҨM�;)l
Ai@ҍzb7#X3,�TX� dВ��\�K���RoMw/-�]Y;r�ԯ�.-|qv����֖�\�r����s]Yt%I7uo[������=�%�h�q�rF\HO$xt���a�-�F��q�tNqF:�Rbnh�N$�fS�\y�t�M�KbJ���Ӥ�2?��G3ts�Ė��V*ESG RvH�\�,�AӉu���bGȋ�0ư,Ah�k(�beO9���Ǜ(jz��/s�g�0�Dg��G#���&J����H$�*���l�bu����C��ϙضI:���?B�����י?��Н���1J�LO��5�-����E�pV��v{�2�ߞ[[Yl��G�_��gd���[U`e^�*Cv� �o��9
ψ�A��l���{tٌ�>(�nd���E���N� ��`�k 9�H�R羧
��/�qth�����#r0���м���7Bݣt;����[X��b��+3�A79��2���uR~�_��jE��$�v�z	�߼� �����3��o�@��_���&��|PD�|����ɪ�b�C�*�|"�ED<a�SH?�/Q��{�,zF��ٺ�0Cˣ�>������f��X����w��ĩ;<�a�I޵[�E���+�nhmW�������qq(�w�Q���~��۫~�1��{�漉y�}����?�M�i�\VD4.���S#���Q���n�'�4G�o���ܹ&�{d8��D�4��S��
�����"�34����j3w�?�>���=���B��r�ۻ!L���]ϖ�i�� o��W����'~�辢�;��^F �=�.��T�m��r���(�Uz7�@��x;8��bB[վ�'���t�O�p�0�,���/����Ց!-�<)��6�3^=]���=!g�5F���E7���}�z�p�&�yB��=a�ي����|�\k�k��	�v ݹO|�>���w�q���pK����W��S�p���p���T�������#�7��/ܸp�Å��毟\�v~���Kf��򒤋�L%���H?n<��1cmx��l^�.yn��]t���~/�)Ca(�-a-���	k��d��t�!p�7���^�_�9:�d�Ա	m_X��k�T�+$\�E9'��d�N��&��˜�(���`Q��u��7�{o��?���}�N��X�����vj��k������v~���Q���ߚ��v�o�tܿ5�=�W^4��/������>�1����O�/�/����͟�m��1�7|ۓ����S��Z��3N?�rQ�ʄP0
L�z�׷��OmsmX�����qs>�XmZ����LpBE���_��{� 8UM���ͼ�)LD���"�=׶��X�&)CL��|�������u�-�D��K�$���)�D�m��H���]��k"m�hp»l��`�Q��e>p��Z�p� �2tup�� ˝����k�A�*gWX��g���:&�9���ɶ��S�Q�V�9+��5d��1���� �!��z�)�ҿ�B�0"����p-,$ǜwɏ����+B���t9Gu�<�Z�H��n���la)_��[�>�1����d*�P���|X���,<���$>(�h6�ֆ'�c}ps� ���/���Ѱ!���Zb�=��U�0嘉�{���o+S��'4����}��:�Sɴ�BR��.�:%�����1�3���̀GL����r23�U���egl궛	5��P%:�L��2�Q��'O��ST=���$Pa�T!�.�c�e:�`���:M����n���:�kU��y���D&�f�EeZ܄{/�]H�]�l�
�ŭL�*8��/B�{�J�6Lb3!l�Ӣ�AnB�a���7����ަų��s��٤H���΅������ɛ�6�,ݘ_>�7�V�]�zv�Ʌ�C�L�mn�!��x����ЖFj�Z|]�dO��m��`�ɐfL��$0h*��!\�?;���:+їT�		��;�`������B��F?iĵ�c�Yo�<^��C##��q���'�@�ԂorFd����D��H���M�<T������)�H3t\ї�j���/�/.�f,u*hq{c�fj��hb�e�d���	X��������s�:Z��O�nCMs�'t����/�֊抠'F<)UjQ����n/KW��h��5�Q(���34���qcW������>��H��(���q���`�S�J��������b#x�h�M�1r���`B�u�"�H���m�%�+�<��ov�P��X�+U��>'���)n�Bj:H�B�48޻`���p�$�E!$�YT^1iX�>��#�/,�6���8�t;*ܧ���]��c�W�r�p��$/@͑>N� ��8���&
ǃ�ԱΑ�mr���b'2�D��=~VQ۷ m�e& �V7���Ծ���H�%i@ e��fȉ|7�Biw��N��R�*���⑙KO��6��;�秿Ђe���}�܄���"������(7�@�A��%v�@�V����kףE4�89L� EP	<%g*�Ֆq.��
�	e�9�v<�����a"v]�v��Q3�U�h�s��F���������]�d}`��ĐiSܷǈV�h��B���y��^+����^2��6M�y�l��]�;p@^1\�E�U,	��y۶��$`\���Z���-yD#z�vW�sY� h�Y��;u:�����7ۑ����ɧ����Fe�0s1W����/p'%��(q�"3��O�TQ�.�T����k��%�NzfF�����$�v6;fv�#Hi0hT�fz�����;��NqsQRW��A�uFF��cO:�
K��ݦ3 �T�g�	�{����i8��z��< GA�x��0�v˧ߓ�w��Pqy+4�<3� K�2$��B;M��F��i�-	�mt�0�ڃ?�X�?*ߏ������p��ْ����    �
ǙE_Q���HA��!��\#Fd�7�R��K�W(�#��,��Z÷�^^l�����
Y;��r����w�-�_��y���^�y������_|7�_6��`p��������?"��x:vB���I=�
�\�:��()�a`0��iH։~� �Hd{�۲冫�Uo�EL�Ēq^��IƄ� ��vAp
A�e�(��E�3��"�DQ����,u��D��4)`2�>k���c��m^�K)D<��w��{q�+y�j%�0\S�x�]�F���k"j|1�������܏��%���]~k���N�32��i(�? �t���]��3����3�ܧ�͘UB�*3\�]=)^YjK!NL���=�)���Y��Lr�Jg�l� ���fu�Fi�A��HS������[�]a�	�� u����T���o�L͒
_ld�B.�4+� `ϪU.A��zKU);�G��m�7M�r %��F�	r��#����[�&[�q��L���\M".l!1�Q4�I,�{R.����IU��I�B��=#<�t�i D�텓
#�u�(m��ʛJ�i;�!��FXw������Đ-����ڞ�S��I�c�`R�8;�i�����HN`\�g��N�Dmь�0����7x��=Ǘˆ�֛�Seger�2�q6xΩ��
2Ц%����W�(P��q��(�m5�����dX��=�v�Ȝ�>��[��a���鴋�����������SF5"�7\Ӈ���2cȇ;j�x���=�I��# #�W���F���-ܷ�-���Ӆ�-�YE$�*�`�>w�Z�]�e�t��.��:݊�d��[�O0�%Bl,�I	L����P��I]hQs�z��<z�N0$إ�)ө�xI�r������G��*2��S>'j�R桨��]vS��K�DPIO
!r [���[wHW�LI¬�(In�`�r@E��[%�����˅��y-�>�F����@���������KH)RF��*+��Q�4�K�����Cjvc@4[!U��Q%��������Cm�h���K"�%J �a8v�hH���ֽ.q��	q��n6k�ۯ���P�g�On��8���snݿ|��ݕk��Ο�8s}{����|+����^#�Y��1�I�C8t����L��Lq�sG�%��q4���}"òD�oO8dJJ������2�\�]W]����1�l%���:o�ي4��D��\���S$~�[謷	?������=�Q��\6kl��36����2�g/�=a�k�{YBZu��y��S�?dX����
�;w���DxAByƊn�:���*��{�4��c0�� �-�t$���[1�~�D��"�=�� �8�?�f
9�"�H�Q�.
*#�*��������x{�h���!��d�b�v� ���h����>��9����i��<�(U��*���>l�99V�i��(��g`E�������%�>��[Z'��DŌ
t�GsL���vR��@9u3��#����|E;�bŷ�|n��HmS ˼+%[�b2:�G�-��p8��ˢ�&13�.�F=a.H�9�>��u�z�޲_3�6B-�C���\�'�j�Jؐ&�ݪ,�0}��_�����uuxs|�8SN�cpA�y�HW�L�P�?�f!@�u�`2 a�o}�����/����ADB!������F�!dײe��c2[�����^-�8ߢt�z��.27��j���ǟ]k�-א���Q&�G�� �� ���z���ފzM���ܐ��p�=����1w�ٲ
\��I.6�ZNi�	Z�4�tS��aT�,�T���RD���uZ��."�{,j���xA������ħ�3���f�y{��嘃����n
Q�ib��w,��6bd},�&S9��!�j>!��{�=\p���GI4��ct�`j��((���g�s�(+��_� uU���$8���$�c�b����|m���>��㥼���Wc���P!�� ��&�*\�(Tn�TҪ[��E�{��+wL~̚L�mpzf�g0S��v�QF����G�l�f�mGz��п!�d@Q�=�_���U � �Y� F·�)�4����PB�s.R�A�.�Af�����U��F{�0M��$���`�]T*
!�}:l���H���[CM��8��v���o޻�|v�����h����7?Z?�A-ہ(�X�S]��G�d�
��~�����1�.s�U����aL�:�7P��J�ǻYt\��$�8�Vz��8�
<�`d�6�b/?��L���Lzp��Ȅ��.'a� §t���&�!�����Kq��Y���u��-�[a�u@$|�K�p?����}tRx:��{ۘ�@H,|���P��定�ͬnS�
8�q��rB��o����ȸ�Q�+���*���M�pT�����I��3�&�9N9h�ێy��9�!j��b���@�0��`�g�X��cH���؄�}<���]Δ�N��,������c'Ք���H?���6�� �UQw��2ē%��+u�q�l��c�6���uc0�_ixR�)T;�1�蹍��ٳk�R���<�Ђ��tA��5�X��
�N��k*ݰ�^$�(����"�	���)k���vJ�
:'	 �s�e���P�|HD�B�K�da=|�Q!�-J�<��߫�/<�5��is�1��tN���抄:x̤�ߣ��`l!�?pQ3:���YBc���u1q��px��9�I�lܲ�F�&�W0�"4_0�۔,����$���P�=�T��csh�R�M�q�~�3��hc���2w�nY���Ke�!^��4u��]+뛑�w�RW�u�C��W2����ﱗ��zh�����B��E/�Fz7���@�ώ���A,�Ʀ�5������L��SMT���\�l`6�+��e�R�e��>��f_QI8J�V%�*� ���T<����hh鉋Y�Q��D��D�!��d�:3�q�ZE�FbP�C�F)��UG�P�Y����OMB�.)Ԋ�#�;��#�1��a�9���b�k�����@8��tU���usE����o�Np�B�����]�H�"ͯ�^�y�������@k\��!u��-C �ȏÓ�`dq��{����J������k�;.�y��b &�B@Vc 5��`��]*��4m��Z?q���{��ܾr��������������+��k�fsYK�p�Nq*��z{�=6��{%tA�������E"Ѥ̇!w�ۄ���he'�����Ԯ�����}����y�
��aj�{�YaJ��NSyS�љkl���f��O�[��D2�`g�"�-og���&`���H����4�4aՐ�>kD��l������$����\�.�Y�_�2r	!�6�����ƾ�|n��I�@��)cfюt ��ifn&����l�f/���2:x�"{�V��?��R�
)�ɪH���*���ԙ�8��˪i�rY<t��b�	!��{��;A�v����z�+)s��5�����&��-�`���fj�gA�aC���R�O	Q�*j����"��uQvy�H��pu��c��)J\)
jQ������)]'% &�j�D㨤�R�����fq}��{RL��"4@�1z��L�T<��J�[ki�D��6�@F�1�(}�4��S\a��R�07��c�0V.F	|&n�@Z�X��3���ʒ������:'���곊+��)@�KF�ٖ42#�I8U3�t�>6��7��I��~� ]�A�?k�/G�`��H�{���$M�@�L��V�@P����~�N�bM�4�����u/�4� -�ma\Ut�jJ�k���(�x�E`x��1a�f5��XވvG�9q>^�#�$yB��x\A>�ޡ�����T$�`���ȃR;�9X8*��x|��:T���.m��v����F�F�b0�q(�R�{@����7<�5q�Tm(��C�٠�Q8G���SN    �eO��T�vjF-��d��Pg��s]7����4��^�C�	gA_	'�ӊ7,M�ba�y�;Z����;��=��	��}��d�-��.Y�H�X6�ɲ�i"sX�(�<�!NG>lʙp�����И�C�͔�{��#�蛌�i�4�������<�pc�z�_��KD=�WN�D��;��D�{5�mH�S�Y,o]N��W[ۺ�i���Ɖk�ݼq���.^8�~e�������D@�Pw?q<vZ��([Py96Ѓ(=��`B��+��Y8U�����	$D�$a�����g*�b׌l��YQi��'��KC�B�bLDń3$�>U���c��Jq���U��tOͮ�>aNj��a���#���Y�< �މ�?m&��ue4���Lo��9������� ��$��Q�~F%� ��jM���*$���ZC����Ǖ_FS~�a�FI��1?hl�������{�0"ÃN����\f�d���+6�>��~�4���&Zi�d�w=_.�Z�?ω�K����e���l,����L���f;���0�<��\�JE�1L0��Fixc��F���ա��0i5��D��9H���D:�6cOB�>�����[���ϔ���Œ:�#�VҢ��<���	I�pKa�PG�J�AXq�!2�Z��o�h<��!�X���T�˴Ꜩ�L��8sR$	���\��;b�BK�>ѧ4�Nw'Y��:�CܐMdt�!](Z|Dzf)���\�X���<P311EK�_�zD�y�D������F�%5�`JP� Xш�<B�T��.NĮۧ0�oY���q��d�q/屔�%&�JQ�L1,lZ+�Hy(F��Y�4z��w��
�Q0��^RH-�=pqH���/3�r������{�9g�Z�ј7�m��@����Z<*Ԧۭfk��\</�o���i�OFQME�l�&�}X6���J>#j��<�H��GV�P;��� %`)���'��0�7�Q�Z���ʺ邬B��v#�ߪ�x�:��LA~3�G&4,�hFv�H������i6s�qz��n|�,ق�1�l�PvB"V�H��P�]�͉��..����3 ��z
��a�̩9�V\cvJ�n[l�����"W�q'�[/��l�Z�N����l���<�������\\���>����K\�����g�EXϊ�_e|����2'=�H3���8G$��5!-c"͢U}�1�8�9�xιkK�0G���%8�=SI>���q�,2�r;^�=�S�$�?$��s�;�&��.J���)���b\E�8��%�����������u�Y�d���c�'���Rm;u��B�q/N���1�����:;A�2�]\���P��J��|t&���虫ut�WY@ +�BW1�\�����N{��#Y���TVE9���]����?����]S:T4�ެ7�,��l�� ����t8�f�GeXB9��4j2��l�8T��-��*7��Z��#ۣn����y W!���R�x��
�__a��+�,7�C|Gp8>�v�U�G�z���Խ����68�)F�����wNM���ɬ�o{�Wا���׶Pf[��YT�Q����AG���?�D�8���p�u��!:��X"��������s�(!�2	$&Gb�R"4ʧ1'��V��������H�
&�1;]>�Z*Zcϊ2�`�Q�Jf���c* 9�;��fҀ�?���3
%��@h����v���*d�`�Q$uQ{�ʖ��c*k��)ɑB���#��L�%p���y�/�t�����R�҅4p�J��V�k����|�����>�nj�����ݴ�����V����+��w�^�B;Ɛ�UJe�rh�wc�V��e���s�?��W�u&�GǪ~�/9��/�ɰ�ٽ�'�%w! �X�K��b��N��Diα�;r�^�3�ĝDxJ�*i��|�u��9�!�5���s�G���]P�F�ߟ�ҋ/��Ϙ��;�W?��÷g=j,���B�K�HW��8���7�>����P\2�w���g%�*�U=����R� ����ԃ��O���Y`��#@����_+ �f5@,�ր���m:*~���[['n��`���Ͻ�y��s�ϝ�>��~��[1uhU�C3%�����ߥ�4-�����'�}ڄS���w���CeL
<�`Z�R
�����$��)�b�)�jA ]&ﱳ}���8�i5�/PN����к�ϐ�Z��ךּ�v�JIGި�x$��I(Œϋm�L��s,/M�T��HSi���jus�VڭNA#ȁZ$6QV�l)Q#2bu�Щ�"�9v!w��j^t�4����L���(�f�mlFA|��vGQ��R�EL�l���,��=�i�����w�4�m�'vm�����W����v��y��?o�y���۽�gr�­��q���+����on]�������9{�ڥ���6���}���j���^��T���7<П�l5O������
�æ��Y"��ǿ�z9�_�9H�p�|���Vq167��oX�	m��C���o���L��% O��m�K���Dz���o��A3DL�/x�a������z��p{cd��W��:>��v��77����[ Bo���WdӍ���ѝ��!�͌aEF�v�B�0Q��Qټ�;��Y����-W���,�E��N�͙^�������w���;xF��� �K=�k���M:���_pM=����qUX�a��+Z]moc;����I�7��Zv���1����,�.��j�Kr7�[x7+C0M�NɲE�y��εjW�����Y���ڧ�����߷���~h��3�я����]�g���o����lE��?�o��W�?��?�������k������o��/�o�Fk�;����������O�W=�q�g�Y��)\�?��=����=���l/_��� �����E�v������*�R�W�\�4���u��H�b��0��EA�݃��!�F��_�S��(�?D�t���.:���c(1f���Ց���I{]D���xc�=3�^��~ؤ� 015fU�Xe��,l��~������9<������]���Ƶ��W�n_�s����{g�Dy���<1���k� B}�dL���B~��Ye&b�pEs8�bY�+b�'F�O��9d'8SaT�_:��>�ԡݶJ�Z�}?��W8tӤ (Ԟ�����<�1�Z��`i��3��+��2�����k��J�Z�(����gr`���?�V-��lsn�&PL%
�݉�?Ƶlxؼ�&;i־����w���T@W[��l����Jj, �o����_���� ��$o�G�p���A䷡p-ҍ��YZ/��޼��zl{������0,�k)4�`=|FH��$u?z	�˚3�Y�0ы�zl� ������y����7�v֨'�%giO�`6a��|B	����f8��@:ZH5?��<pZ�����u�x�h)8F���.��
��sy�.�v@1T$��М2C���ƎA�X B����B�ש�����YDy�q�]*Q*s6�"Ɓ8YyUW���y���=j�]e�A� �f��9�%�k"
a�5J⃃��%���@�WC]#�:��W���Wy!�:�h�^��`=�G�OtCS�����S-�K��H8�1�y±�(��{�B:s�1�CY��y ��F�}opC�H޷{5ci��(�:5�_ �pa��/ ��xˉӡ���2lwY��T�ͨ��i�T��%�:��2��%��?����6�Rh��9lG��I���'p��x�{ad4,��a��s'Ң�j����Z��9���ۘ"�ذ����v��Fzv�/�U���m<������yzP�l���!#�p~fj滼���29�u#p�0Aq3�c�n[X�汣Qb��9�w#8�|:��Wp:�VA��
�XZ��ͨ��gjf�C\5�Eg�*��W6~5�    ���X�R��7�C�c���a�Y
��L^J9%�r ��|�T�$�����F�J���X�Y�]%����`p*�K�(y�h�I�A(�ݷJ8�һ���J�S���֦���@c ����T���?S*fR�2V��G�&��V��+��CLtl9�k��`�n,��ذ!*'7�9�W�wX5𹆝XC*]Ls�I�yĝ+�Ţ���Ʋ��{�����g�u-?�*�xZ/����2�_t{Y�[%n�BG8"P&q0ӵ���G�Z���<G7�$}*֒_��o>� $ �C/H!��G�!7C���C>?�.=K�;~��@9P�#5��h�E�f2�������k}>��j7WNn/�xwx���/�w���3~�ѕ�������EX˺P�����T!�=]e�=Z�jKDC�О�K6��'|��!J�=	���w�� A�.#��P�fJ��ȉ���X�:����@��A�<x	S�,c�d�l�����±GtX�-3�=�Q����ؗ��M�]W�εS��ԩD���{��cV�1@6id�-]u��G�V��D�����xX�S��@*V�+�����Ti ��9 �X�~3'mҨ�.1��%G���"r��C�8#�(i�����*���ag�#i�� �����fW���9���AsBi�.�3��L���~�"܄܀?��
]���
@��R�'M�9ȷ�S�{��ω�,~Z?�H�	:^:M�/�h����1��g�3���q](I�W��T�J�ڭ�~k�8fJ;B�hʑ>j���p�8~�g{d!*��9��bJ�8��"�us"T�V����E� cp'X�<�6�h�#�?�����8�?520E��ho�Ho�����=�
�Q�JG�I|h�P2TA�mOao�Q_7gG!�w�� � �d��v-��a9ᖒn���C=�BY���!�@��e�s ��@.�q�����ǀڅ��=��%Ѳ��Mh����?�{�ƭ��*ϥ��"˂t���.�p��˖Fm�]Z�;,1j0�\:y�-���#��(腎z��҆�h������4?(_�.@�-���ٹۃ'�q�đB��ؕ�n�_T���hNy���0\6V�{�ś�¶�#;	3�m;Bw���(l�]^2lV�-+kQ\���#ڐ���^���b�R���}�����ѽ#�Q�p�� 4L�YFj�+��~	��L^��Z����hq�|s�s����D?�B�pV�GD�T�(�T��LL�W�JF���
�Ƙ�VKM���
�h������k3���ѯ���?~�s���)��,�˴�0�H1�9��m@�������mY��nDF�q�ɠ���%�~7>���"N�!<�k4*+�:��)��,��E&��l�L����i�zr{x���{�ο������Ͻ��3]��x�̝���B=R�*$¢�Tl;|%��Z��簍�����l[��Jc`f��x�X���b�z�=iHqrpN�Q�o�HR�s�Q���F�t��>�����&T)�a����I�u*�o͓΢���/4tɢ3H�=4굀l'bL��FI��K��#�a{�b P�L:mk,ib:��O�Oj�����R�nfQFJ�$������c�ӝ�T��F���2;���3Q���h�Il`U`;��SԿ��CRb�s�O��P��i�fD���s�rDw��m �U�)�H��/
�P�x3��B��|U���k�|x���Y�oD�(Ⱦ��$B��d��|M&�7�(�%�qU�@�Z��$��.����O��zs�{����`��t��Eh\�<h����	_
/�A�4����&��A��H��~����O��B�h���r-``����4$�$�Q?�3XE����fFp�H�2m��D�a���&��Ho���j"58��[Ҿmp�Y�ї�qPLU|b�O��ΒGDXꔆy�At��_��`3u�E���8��>T�˭��2㯔r ����xL�(*;�9_����@���h��,��*��#Ju%�*�H�!Ry�P0^w桬��'���=��u5"�����4��`ȅB�\�HW�{Lj�\��4<m��qi��%�R��� ַ��FN_�4S�g�R�ECښ��$���X]�����	����U;���2�ך5�B/ӻ��b��!�o�ؙaD��C<��#P�J����t���Q_Ui'r�2�b��!~X㢟s�kf����'�H���'�UU���{�|���'�"�s��rNB���K���'�T8�˥�����u�$[d���a��}�"c>w�;
��,T��ԙc���I `�-�,6	k�Q�8�	d�Hɐق��>2T1�U<�\ƅ����)4;���<��2r>ƒT�� ��=�I��M��ϼC�p����#�/
?}Jװ΃�*C����"|��`�Qd)��q0��V����IC)��S�Nn���t��s�7�t����kW߻�q����P��M�4��S&ҡE��)�vA{}{fN���R 0N�C`/H�)��&R��^+�ss5� ��1&�h"�dП�篅3�ڣ*z�̐�wL�q��_�Q����e\����Td�T���[S��j�!}��X�����3/�>�waF_i�D�|/4��A<�X�}�̓dY��쨗>�z�x������l�|�JCK�<&R?%�v���̴D_����"×�K������)�h&5*���\	��4O�9ؕ�3��ڭ���ɯ���-k�DZ���1
�8{�I�(H@%^
@�ː�T���,k9(;�7���0\�GvM�T�R��)u��SGm�I�"�s���#g��t�/�B���rI�F&8��<
��k�N�\�--*�(dzN����;��	� GPQJ�9�C�	֯(�����9iZ?pL��.���OdN}�*bi� �)'�G��~@�V�d���>�wg��G%�����K��]��3s�#^�l��U��*�9�D=<-V���Ù7
�F�(m�qc_���bXk�B��g�(V���NةY6�)|W�O{��byI� E<�BEnAt#���BJ�`�{�B\��OvB�HUVW��$�Є��"@�U�l�Y�(�aO�'����b���S�|r-^�[�dʊCfEmn8��VCߚ֠��t����1�u�HC;KG��0�RA��$i�L��4l���q.����cɄ-�9,�D��	��B��)G�������_L��+<k�?N���p�k�lE�r2�E� �(��G�9���}a�e�����xH��v
-آ��;�wJ};L�Ro�%!������{�p%i�� |�^n&ļ�/pc��DU��J#F���������)b�r��>4
8�|p���SDW%U	d��è���Sc� �y��(#@�e�����������f._&ۋ�'� �"�m�� �Z�@&V�xD�#�`���L�[ɚ_K�N�p�졉Q�E̐s����Dv�4_���Pk��8e�T}I��G�:0�~[���ԃ�+�36g�њ�r�	���h�����ӀjV���5�;����ږ�j�On��x������+�/o޿|k�����{��#�fKC5د�Br�6��&b���vG�2�,u�\m}���yf����i���DPhUu�a������is�K� �f�<Q"���Pj���5C���N�R� @��=��(�;%�"A)�Q�Q��:��c��)���sj��֎�7���5��c�-�qW�c3T=L���b��PƚFu� �q�Jv�8� �R�� ��-Z�:�ʋF(J�}<ImƬ�,O��D"ב����%w�yA�l�`���7�;~V��%�/����w�- ���\VTm[���u,9+}��n�y4� _����nUt�ֲ
�j̬]5�	Z�>�c�h�z u�i���(`P#B"0��ry�/��6h)"���Kv�Q�ك�RX�i��C�t�+�a�If������>�\���H�SBy    �g��0�0�^2�}z)M�<��k��4�#X�W�W ���#oT�K�)o7~��T=vn�9R��V����X�V�-3����'&HB��"$%�B�J�xz`E��0�Q��!�<jW0�"�[�#�}�@����5�X���Ϟ����9���R@��+S`e�s(��jQ��T�����5pD`?�-G2"1���g�#k|ӪPz�d�{Gңl��v�4xT�qO�εB�"�H�ETG���~H�Hm�0�|���D�W���̘!�=����5���C0R0 �_�+]Fh�j��wx?/!�����rY�o�̨G$�xz��S3s�xK�����)�ԅ�440�1~����Մiv�h�[I�q0&��C�Ҍh��Q�X�Q�B# f]cO�K��f� Ǉt>I�GHu=t9G��Gݚ�'�s��&��,���}��m���S^<z�ڈ���Yp�ylQ귕#M�>�I��:ڗ��4x0Р [�U��/~.��.H��N"��9&�9:�|��%��^A)!�NG��;5FR�#E�YŴ_��������X�HhR-2�3��,�H���W�%��w���"R�Ӹ�t��L�h�91!.������q'z�O� �@� ��=�I�]�Y{
QBU�Y-��(�#(^M�'�SET#�08'����؏0ӳ��?%mN����k����~�H�ƈ��J�S��i�Ѽg�b�_4C8
�����5��R&���ї��o;�;� �Bk�k������eM��8��v���s��}t�[���߸q��G�]~o+����  F��Yg�ӽ^8�䖱`�)���Q<b&X�!����4!R�?�!�i�J�����#�d�R�6��we`�?�y� x���g���ݾ�x��B��p^�/�C�C,q�QRÑ0�#�{�����B��bu_�[�9Z,D;�\="���.(���*�`��k2P���ߎ�C0-b~�ɠ�Z化: ,���?� ؙ�(r�nJf�`�"��va� ǁ�/F6�S:
��Cj$;��	�ޢpp��� U��jw�H�e�\V⵰�0�Fy��,<�85�����~�ЃbQ�Y`Q�L,]L �Ĉ�_ 0�8M�2�+�3�"P�{�T%&��	o�`*�4x`�]��[tDIlH� 4�3�5E�Α�:/d����aqL�y	lߴz��nQ곤Z$i��V��g��3�R��%���9�p�T��g�+*����Cr����";��z�B���ܫ�oy���/�
x{�|���1���%�r����Q���?)#�{����+�Lx�Az͔�P��i���������Z�Q�`���Q�_Y1T�#�|�DbB
؜�o�7Q�L���ΉC2�M��!A ����l�g/�ܔ��I}SW��ů�rP]��H�˘���G�N��`��=}��2b�*MW�1�<L%Q]Z�L��11�U�&x�ӗֈ�����������7>��K\���j5>r��:���?rc
G4=�������$��4�"�Q�a��F(5�`����0�^����=$�eF�ۚ�^n��;=T@s�8�W�F�M�g(Rs�n�z�QޡGRQ�I�3J\g=����~Ͻ��o��㥮/�rN�u{���Å�IS���.��MT)Y�}���hTv�%�\t��7���J3�#5Y�G�.��:dvJc&��������@6b��
��сCxL	M%��S!��3��k��u���x���K��Tѵ`����l+B��ȁ���'?{�t�<(���YE5���J�C*�'0bW5���p���~�//�oX�0�r�	���wYIꡪ
�ȁ���F�o�đ��#�{Ξ�)��x��҇�S�}�w�:��`l~����j<�#V���P3�,��ME�ȩ�6ym��̈́�⇋�\1�̨l9���l��,����״�������w7/\~x����?ܺ�q������|�һ��Z���83���G�I�D"Y	ލ�P뷇qL��)H�a���Z+ǐ���መ�R���Hjg�1E�J�m�.�ǜ&�w�_ԨJ�D���g�b��:��AF�PPi8ṫ>�0�*��Ƙ%mi�I�O	5I��J�Ͽ�S��Ŝ�z��XZT1��jmc��w�l�˙���M�z�������r�(���4�a\R�%�4�X���r��K�� kn�<w��$d�x��O��@�7�����T�Cm�Fe��-��� ��Q�8��5�#�6��ajf@�� ���}d/{\�b�S����� (��SY{�"�'��A������'�#��{:�L��{+����v%�	MǢ�E�x+��!�Sy�A��7�9æ�tB�;��J�&�F�p��<����}V��w��1z.�q��5���R]���
y�hh����`�&ܪ���$^ uN�y�J�<�����i��;�uxu�"��o���ܬ(��]�%,K2�R�ŏE��S�l�ȋ�qweإ�(��4 ����-�G�O��'&/�U���ҫ�xaz��--�S#I��3u ғ��V�Ⓧd�F�&R�Þ��1
Q�_/�`�K�7��|T@��x"6m��q *���Z�H/1�`+ F##ۣ�Ԅ5@*�7
ʍ>B��	F�E"��	s��q�dvKvN����w�ƭ
zΦ�����!�,�YESd�)�xfeL^���h�l�:�8怯��b�}>���ML��ѡʄ��Gh�p�X3�*�K_�����1�mo���ڇ�j�on*�g�����?�(��&�D�tG�:6�"6�n>L0��4℣��=�\aB�7G�Ũ�x�Ӛ(7+L�@�>h)�Y�REs-o�v$�~!��U{F:HA.�r�B���@���IPj<��\�)�D&�f�!��b�G��i�_!�Bo���c�Y��O|�T�������I����R�q���⚙�x������X`Z�-����S�m�@�A�eDmm,Y���`}�fʟ�j�᭓�'�mx��ڭ��W�}�|�ޕW.p��
^��£�%�f�f�PZs���֥|��2� �6 ��&:��.�T�*:��q���9���`c�U���\c�}�3y�O������:�GK.�9j��{��Y�`�R�JQ��;�P��K��y�#�#��;-���lH�&U��� v�rZ��7�A_�>�������??��ކ�{�J�̳�sQ�t`@�/�d�H�q�E�~�pG��鼧��;~`*�c4�T���F�����UaŌ�_p���������������a��;"�I�J��3�e��"w�k��`m���wP<-��ln������;���������3f����o���?澒�k`������f����G<����Z�U�b�����a*Vhz�Vd�&Z��|e�Ƒ��tf��mN^�����B퍯q^�����4����LW��,�׿�
�p���O����#���']�=�7��WY9Ͷ��.I���>|'��|�{Zi��sm�͞k��f����P�����֮���z���� �������)������HǱ�O��?�O`ʟ�F�6��������������/����G����k{:�������w_��}�s�?t���\���'���$]Ԟ:��"����a��<GVr!G��c(��Y�9���XXQ�"0<�5E\"�%PL�>���8�hLU� �H$��;���u�ټ�FB6ˏh)�L�r�j	D	�q�=�E5�CC�b��k"�y���3�k_K6�Ԝ�q��eŵ�縑 ��#|^�>B"v1=hc�tF�,' q�W���?sE�y.�����1J
��k�m�U>g��6�R��y汶2Z%���(�R��ۛ'�n|t�Νs�/-�|xa���[�g��ڊ��n�H��XJJ[����Qk`G>���eE�|����d_��>��    ��0,rDVA�t� ϡnu_y;L��D)9� �Y ӓzZ�o����ܡ.�v�~��'R�E�F�O'�o�I��岤j���x���t��k�ܦ��n�kʒ=$�����)g������k�A��	@�[�T/��ϧL6Q��(d���P]j7���ބ˨\�BH��9��F+X��=R	�d26��p)Գ��c*��/�mi7��/���X�v*���X�n��r�1��ܐ�2��A�a'���3یGoh�s���o�y����d�q֓�߁FB�r,#ܱri����)ZU�mʴJx�C2�L������`Pɯ5	Q)T�x�1KXB}�G{�Q3�
I��V�Fmt�tDRV������y��`���(����.m��Ҏ�F��dc2v{�N�ozξ	E>j��&"M�JZ�0�Y�k��A��&4�0?�y���ދgtĥ*s/!z�-�35F0�ha���"��O�� 6�Mhn�$8�� +�S�|[U�7�G�J��ʬ];.�LF�I���Q��a�6O%���Q(M΢=����b�\VTƁ-d	o���S�Xqc�
h&hE{0����}L�	T��������k`�X�
ܖ���UI��F�C�J�1���ׄR���,����v�]�{��y�
"������;t�����E'Sg|d9��-"-���ε��on�5%��a�p �'�}��-�q�
W�`�+�pZ�����d�/C�/�e���W����d��^��([�c��ٷҮ(�P���ߍ�J}�`+��0��qq��f�V��:H$�{��$��2[�)���)�+Y[���ͦ3&����e��Nр�R�'2H��C=���D�N�d}��-��͛��r���q�R�4�J]<N���"���a��Y%�sM��ȇon{�|k٣1�����J~0�#SQ��Ff����F:P� �Oިȧ�F=\�eqpC�amm�aՔ;>_�R������^ٸs��wnm\�����v�ι;��،�UAp�a8���m�p�����	V؏r��M��Q��.n� ?ɇ=tj	M&j
Nkta��me3�U�F)pe�qO�P-�ї��=��BjJE��s�` ����G_g�Y¯$ !�
!��
�<�f�+���A��C���L���1i�9���J"�D.MsM�q��L�B�[p���N�R032�B \����%���U�rHgq���R��;<ؔ����� u�!-m;ч��BP~�ao���,���W����O)�é� ��{(�x���_�z�-*�.1H<��&����)%9;.)���a��x�׃�FLv�~q����u��<�< <��>>D��G��Lq�c3x�Dx��n��&~���isA�$��	al�W��r� ~ٹ����UP�gkűO}&^UK�����FܦJI�%\��8����2�Z<�����mr1pD�Qj�P͖�r&���g�7�b4�{v
<�:�Z0�#@"��u�/��;:AiL	��(�����Hk�qd
��0��3�fx�Ɩ	��#�����J�.B�e�|�se� ڥ��&a0������ L
P�����5}��E��c���5.��3K�ܠl�G��k��Z��*�Q �鏓ȅ<")
R���l�p�t��Jػ`���\O{`��P $�
R��
�QX���g����P6�$l*�z[�2�Y�6�iL_H@�QEִ+��օP��diE�B1ɘ��D��Êjq!�$�C$6<"�5mv�'o��m��a��f{%�X��;Z@Y��)m"�C-�SE�7�&�!��ӡ��I�_#��\Z�_l�q�8	���=�ό�#Kt.����BS��,���j���\�j3jԪO.)'uf����5*���مbd�m*�U�� �"w>���(��,�N�O�4�6�J�@M�BU4'x����=�q
�M���3I+TO��:6��_Eu��&�Ɩtd����Y,�|��lkז�X�3�Q������ؑ��4Rh��"�p��.A��KM2&k�|����6��(�\]}'S#ս�S��T���]M(]��pPg���~(m8�4��
lC�}P���Cyz^�&a�̸�W���ČQ�W��XW��lm����[j���������o���ں���k�߽{�����W���F8̚�0	�L#������Xf��쨬��d�l��g��^�k'El4�)@�I�;{�݊���*���w?T���"�%��ȬZ\�� ��ʒQ~$xyb�y6�Uc�.Y/L��PA�WM: R��	��&&���!��5OH�� �m|V���M�Oq��M���fJM�o�}���{�r��`0#�!3Ix���7I�I��l4K�, �a�&>
���l��BswL}	z���[��x����>�`	��8�<�b����È[�1�&�F�	��^��gY��J���1K���]�I'��_�U}��ج���3��D�Ӗk ����;J���=kIs)>H&w�&�6A(_���dW�鱟�yti�H*m�0iE�o��6\E�I��/)Z��A*��
��d�ȏ��<`�drA7r"�X��Y�ڈmȧ	��;�VhRqْ\F�i�Ҭ<}�������a���va��Ĥ�NVf�[ c���Lh���у�����A]�]<R�H6?EU,�5㖆��{���0H��@_-�b��	�`���llV���P� ��#��bQ��%���"^2��y$B(�Խ"|�Nj�(��=�^�q<8������D�@5{W��̧H)�(��aJ�z�<��=%2�~���8���y@p�zQ-gqZ�ͤ�W�$&GJ'ѩY<��ԩ�n�D�M %��ڤb.y�1CEf6��{����x�*ל߈EhS��H�\=d�&��Pc��v��K0#؏�𙙜˴Y�&�FoO2��UI�Yt�1��.�
�N�W �L�_�~,v���=���{C�=��c�Me��T��6)_�	1Q�Z���PM���>s�,�&�����܎�Gyb��$� A+*x��bM�L`c�<��⾾�{4��X�:��άr+:������=�}�C��HNpzܛќ����,�AC$�ݰUB��@���u2<a!عIe�����.�5�� ��O(KF�T�Ç����߉ڎ��l %ۃ�Ս��|cM++'���'�][=s��ʽ�3��^x����3����޼!+댬��}��|��%JQ��fM����j�۸y���ٍE��){K��
�!6K�P#���y�T��R!/�T��N!Z&
�I� ����X������8�ƙC��+T�TE$<�����`�a�LV��L%Xg;��ji6�O�r�X�%J�Q�(�����xlx�K��+�ap�%J�C�*��+=���q�<�v��Q�t#� j8��a���:^�?���0�fsИɨT:�TQY>�'�9y���7r����V�1}���	W�����b�������&�q*��6��R�B.���2FO�guPT�#�Z%�X�p�5'l��Mf�H��s->c>��OMu�-��Y�:P�t�v�>,�n@�e����Ū�1�x�
1h� �b�I�?�v#�5����x6���j���&#-��~{�i�[;A@�j�g{N8�.�ϢS��B��ܚD���>����@V�Y��~�;(xV�ҝ��y2M�:մ��x��+\/)DBB(�. ��ô���3�C�)p�	ˠwf��1�	���[.�-a�k["�4Z�RV�/M�H��	�G��/'�z��+N�ܵH-��TT7[��˶����3�½ �L��LD��db&�6
�;���^��,<���ά�٤�E7�|JDqs
c��t�/S�ͦ����U+�D|�2Y��Q�{*�N�4�i#+�	����`a3r��:��|%�n��I��|�/pF�@d��o���u~�s�R�U�s��?�� 5ZBddN�;]�X�Էc���>�j�(_�m�ʐh)?v2Po�    ��n�P5$���2����ʏ^"r&t�����ܩer2l4����E��#Zl�S�P�D�i��3�e�9/�����k��N������6q���	��mߚy��yv�݀�u�,A|;�Þ`P��cp<�p�a�����a����`u�`�t|>��@�'����/]�|��������޽y���[�^�q�F�l�$zs ̢��3��T��ܬ#��F�P
�u?]�'��|Q��s<w�F"�a0���53CC��+�/l�%EŊc̞�Џ��؃�`ޣ�W���Jr����U�%I��e���}GHNh���Wkc��dq��~G0���Bc��&e�q��
�Ʊ�LО�&�c�Bh�e�+d�Xo>N�*?��A[�X�zH���ƴb�L�$S=�ː��m�U�� K����j)��J�GM����ެ~���O���06��<�z�w���m��nA�,�N����#	 ����
OX�;m���\��b*^�o�WH��<:�x��7��Y�h��n?Q�t����W�Ҕ#�=�b�g�(z��z%�D>��5c�ѯ�`��>F�=�(�O���U�Y~��M/pb���z��M֕4���,�6�[h"�^�S����V5O-t3(H� ڂ���$���1�sl��+��Ͼޓw򂢔/`q���n1Lĉ��J's6 �{5fqI��w��+ i
,��a%\Q��`���W�?`%P<
��f-��!���5�o�Z���w�B7��_���0��m�ԫ�N����KZd�h��!��	��e[�����P�oM{����
�O�����/����~�g������_~���u�9w�MR2X��^�^
��Ǩ�ȴN��am�T�,�EzLo �5L�fR�A+�FȖί����T�JO@����Ƭ]b���o�hU�������aM�J�t_�a'��juÅ*X���)�H�e?���4�.�)xl+$T��7av<̴�J���9�HGeӓ��܃��x����8�v�F��6�^����盫*'[ks���ϜY�v�{�W6{�ֹ���n�۸�d����:�7?5�i�//�O,��b�^������˿��ݿ����f�ڿ�Ae�o���h����+?kW�Y�_��<��>s��~���}��nAZ�X$hA� A�/�R<i�u̽�Խg���7�zRM^�>�a�U�Ys�n���q�ʃ��[��4�K�Bc�{�S/xec���QI-x���m��Q ��cj�B��8�:dU�N�-���V"��&�x�'�,���^q;rai�)�ŏь�D�|Lg�;�{3]�����;�l��7]x�'���h��ƹc�^��r�,p�#�Q�/�z��(��C,�'QPf�A	@�fF0eIm
'^�����I	� 9�Q�M4B���Y_��R�?wSV�k��9R\�[!�&��Rz���!�X��ʏ����ھ�s��y����:)WAK���	���h�B8#��d>��ů��^�FL�%ډ�W�����FSQi׉�;�p�5�{��e�K�ֿD
J
��EH܌�5�O��5�&P�U�3�F)�h�K��sw~=km��Y;�����"i$_.z�t	6WN4�����?��n���sQ�S��b5}Xwp��?z�&�/U�HT�-���y�G_�YF������,������(�.-�:�=B����S�Ķ+�h�r��Zu���lcb�H,A˕صS0��W��&�=�?X��IP֮�5=2cߊI��E��y`�Tk�N˝̠C`�<����B�0��}�[U�*��Ӹk���NӅ��sm�o{��t֖��'W�b�iI�Ӫ�a�6
i��)�x����%9�=ɯ�\��������0)�8�����@'ċ�*�a�����T$�\K ��TI�22���چ��?o�����ꉻg��_���ʇ�_�}������o��t�0r��l�1m��?�(��]D�;ޠ�Sq�c���<QD�P2Cn��Y�<W�9���1Y�y�@6��X>X�?åG�'�]�<��fuj���^���ֽ,��Ȣ���9O"\mh���/�9��R�M"�5����<�kK즡Rh��닯Ζy����Ț�t�fg��Pi�:�wj^��A��|�>N$T5D�ݟCS)���}���j�-��a�v���M�|��;��E���E���	�^�C��C3�/3�"j�9�v�_��0�<X3"�Ɔ�)i�Uy$��ڶ��s�]�<��}��a�YЂ-��s@M��ٝ;�B7&^ E+��=ȂQB�������%�B���Nӡ�8�G�<6�#b\���И��y,����?�x�]7]�D@���<pyE`��/ű0��"�7GG��\p�]��Da�0�U�D̫Ѳ���4�i �����0d'Ycm��ߐuV�M�W��AIȐ{���+KTj������]w��H�1�o|%���||�,T��'�s�,�8��$$˞�zB2�]�i�q���B�Ih���������i�y��1�$_�1,� �:f6z��I�2A�]��Fe��#!_�� �#E�����}Oq46� 3�a-��0<h�6�	����b�S0�����a��C��[�[{�#�c까��JZ�͙|���Q�u����M䒡�� �r%A��5�u㐏�I���>V�� �v�) . ��	K�D!I�����h;5n���"�E�94������t-�	(�^Cm�����hs)�[pD������ :�x���-
Y�$��0e]��y,���H��S�U@v��*ףt�X��HT*��t�\\�^Mn�9%JOr�y�u�b'=�'D��B%Zy���s��;@�8��Z��^^,S8������[+
&�89\^;q}�����wo�8{cu������6.m\�z3���&��i����ZOg���b�x��Ǝ�Io�P7��>}�LK!z�i��/0L�Q�'��V}�pķ��b�)gE�1X(�^Q{`ԋ�?���CoDH+��8������@yTpKb�W����:o��?4�D�ج�b.���˲��Li0�'oJ2������		����7�aZ��!LB�� ��p�)xn�r����[� ������|%�eG��PB��)�A�,�QRŢ�^J&��Ys�</�+�T���D&�1L6%I���w����(��������11!��?�O����k��#%.N��5�Zx�M��"EmtݸDDմ��]7*<�k�Y䚻�U� ]e�|!<ư�N>X�VBbY ����(��Ҁ�>W*٨*�n���V��:꥽�Q>W����m
��)=y"���X��lW|i偙qS%�;p�J��[������o2`y�q��{{C̾O3�"�3'=](�$�Gp�Ti%������Q^��)G��@�;Tľ7�h�P����|��n���|��'�!Y�$J��F�!8��$�FG�3�'�`�1�wusYزČPz�+
!LD?pr�J��k@#p���s�읁�M�8Ѻ�	��(Dxք"�j��C��9�����9�Gm�=	`�Ē�]U͏��E@\D�;�H �Ń�iS8����r��
X{�3<v���vB֐�,6������(1!6��͢h��Et#���)�?-�%�U�_A=���f�L����Ñ�lD.m��q^��d�ݫ~1��exc_Яc�'ع5sR2/D&�&�U�7j�E����y1\_Q�s���a��!e6$�ѯfh����o n�"�R8���Ԏ��A�{h�l���Ǔޥ�P4���(����#�WPO��Q�]Ɠ�g������F������V�<9\^?q�܅�+W�;��g�ݼ���ُ޻�ފ[��Eb1Yz�gA��sFXg�]Z�A�������>B4�اtI��~�t��JK��~��&���	N�M���*�	L*��[�/�;汥�-����'$��{��L�A'����V��r�+0A���O�`�'y������a�ͤ�b��f�'D�'C�1XAb    ��8e҉2,�W��)�/�3O7��k�GH�1Z �
q|3�<���<�бI���"��<Γ�!1(@<�S���[P@N<-�8�K�"�7�)k�!����xXJ������m	��!}�L�� cݑ�m�	_�y��Γ�q�QM����܈i��E�`L�VF���J�I��(��!��yr���%+^�E�)��0`�һ�]��R���#��*@��-^lz�F�U37��ǜ��}��y�'�3U̈�P��XS������*s腦$����czJZ�A��B�d�C`p	�2�$%@2�P[�7>���I�.���[��bqY��ͻ%dF��a��q��5�>|�h���:n6ađ��4J��?��n����K��c�v5�iyC^�	��it�Dd\�q�pȃĶ�8t��<� ע�W���@��B��4^r�V�x��$�W�gUE�H>�b��lk<�i�@�(.c��� ,a�XP|s�z��L��{��|�j8F�ą.,l��6�+��'�n�"� Do����'ꓸ<ܲ���?�(C��C'R�x<I��6^As�8
م���=�2�o���u+d35�RC�p�G܆�F��|P����(姑�&jB�)�g��d��/�#%L���Љ��(h�C��G��m� o���+�U�mbh�d����]��� wSd�c��J�u�����O	����O�.@�VMH�̍��1�	)�C6r����6CU.�7��$R& (�|�P3)e�pm,�<���`	-4g}0Z�M����PwXm�.o��so��և��x���W޿�|m����Hr{(hNf��#���M�.�CgzKT�x#?>�%���ϾZuuԜ�G?�s�Z�q�L�T��`x>�j��S���㾢��~R3�	m� y<Qޒ�Hڄ�]��0��&@��/�>�.U�h���9٬���6#�,w�l/��������&����r�h��m��J�L{3�]���v�V��l�q=�_�}JO ����GR��o�JF�n�3�4�r���j̡�<g_hR���f%��}���9�(��h\��/�f�M�v�2��mBئ�v@�T�PP�w����P9?U���v���i��q�5�;�1�[K<&�+�u6f��T�2x��+��i�����Ǫ� ��x\H�v�=�V]�J�d@7*�<������5X���B�ʛ2D�����p��$Qd?��ES���R����كF� 3՚�Z0`��z��ѠZ?�l�G���Ԓ�h\4�B�HV���9CL��5m���*�j�b�9'q�Բ`�Q���isc�RK�����o�|�_�����`!��s���������r���]�����(RA��@�¯ߎW��玅1���/j�Y�ߡ��&(��䒆���V͈ �H�7�(6�Tj0U*ۛy�稣��#8���$Az\7r�`�1��$<�H����Y�^񊀵�gjF�a8n��@�~�����"���+u��
�b1��-�Ԡ���G0 ׬5L/��ʹ6IBs1�Z��q�N������5E��{[�����X5�簍���+��0ĸ������{@8��� P�~?�q��=�}ʣ�2�R�Y��Q@�10�R�.���ƾ��o0�?�v�, es��n&���6��}r��y��;�K�m��o�m^�7׷6�߈p�5x�\�����:Ԉ( ��l^�=�@*�L%�*Ke��0�g�T�Q褬a����D���B	�s�R$����V�"���r���e�W����eс�`��66f�%d;��VGY�k1��^��K� �\xS�\�з�|��0k���}E+4M��r/�ٸ2 m��0�������GT\I�v�3e��w����
�)��%�D�l��y�+S��Pu^yₚ�N�K� B �_��N����e��10�p���C�¯���:��O�H��(@�ԣ�����R�]9�t2c��Q��������_u���7Od�HW ��X�6]���mƪ�yRL<���K���P[��x6#\��@��&cDO�jv�c>�K�O�%hT.UM�2*!�X�E�Ʉ*�H��*� �V��Rp9_��k�UGX�c)/�&Q�7/b4W�Kf,i��pH�DwN�qV��2��qq45L���i�dF�w�S��gX6T�/�B8��b7�1�z@�:ƃ:J�������y��U�LuM�aP-:"�^
8�
�Ϧ�En>^���"!_��L8L�R�2�X�f��	���FA�ł PQ�E���:
���)��тH�5����%�j��mB�;@T@GJ�tq��K�o��B�,�s���⾚��<ӥʤD��90/�`��wԑ\�(%�;��q����Y{X�^XF��)�=���RsT�}\I@��]<x)�Bj�j�����r��1e��LSb�T��Ƕ�A֔8��T�9@:��P����Z�tQ6��G$�[c�:a���(��]I6����⣳�#�@.ʈV��Oa�3j��7���?\uQ��q k���X$��j�c���?ٍ{�,���0�PO���p��g����Б��E�FЫv�����'ڀ}�˃�e���|yY�g��O��N\�u���ƅÏ>���|���k�.��v���*�G��#�=��=�z�>�����rA��c]#����m�/n�Vp�WF��G�?ō�c�:���I,ϯs���62jk�}Ŵ�MRh�$l`cn�)�Y��~i��!���h�&M#%6k~o�K��2�K��ֈY�廋������ ����i,�oK��"�&�����E������U%�p�S%K%���Ćd�9�������i�3�(�E����)m�>AF鸫qU�Cȩ��8��a=�*c!�J�,y 	����F���si��w5��! +�0�ujm�����3/�QyI�1�#E��5��E�q��94��G��6ƃ;��5�K}6���OH���5�3�`.�	/M�������׶���Y�P��0�T`<uH��gdu�tZ|��U�.Bh�	Oh�(�����[d���R�y�\a��Ei"(f�~�k�_:��w�ЛaJ�rc
>)N��Z=�M�D�,����:�
�J2'��l�pF&�05���i�@7|�4t]39�Z_�(��!Ğ'ˆg_��0 ��x��: �dv����>#?�����v��Qy��,5r�o��,G�R�Z�V��)h�Ǡ���zj��+�΂��eY�5�0�e�q��|ڽ�[2��O�F�����Yj<�@'��M`��D���i��V���O�T����e�Ohe�ǅ	?������� /�~�ۡ�XpS<�zO��m񥈯��/�a.�P��1cFU떐b)	�l�2�Ѱ���;s�.��7��f�����;Fg0��ʏr�m��0���#ޒ
q{`��i���!M�j��S�� I���X��8�"����q������1��Ǫ(�v��ҙ�'�ĸ�&iA��0��3+އ*�Պ�L�|A��,�gk�9i;G��pe��e�+��׷��2<9\�>q���{��������l����wn޻���tY��h��$��rd�p�#.񦳎�V��
�z�{��e(��b����Zf<�L�qR9��)x�u�,�ґb��z]Ĭl�E+kQ��Գ����~I��Ɍ*��I���H�K�W�AΉ�XO@�֮�+i �Ё��I,쾊�x��i�t(�v=t�]�6ԫ�I�y,��"�Jo���5#��ƌ�A(A�#�Ť<V�L.���_S��,�ӑNU��btҕ:������M���,��Q�D]-���x�%�i �)S�$8�C"��ȅ�h�1Q�œX�2��It9��"n9�t )�~�i^ҦݷZ}��*�U������D�%���x����C�o�O� t&�
Od�t4NV4L�e��t�c��p���V��}��u�M{*U���
�tS��W.=DxmJQ��$/EO��D�8�^F�aޕL�Y����    f�rG�|F�,����9��{�}K�-�8`��E�P(�p1����rr�E���������o�(����t�w����G��#ZB�( �'D��+u��/�W�ѕ��y�a �Rf�h�Qv��԰:e�4�Kc���h30u4�|0�f���T�XIi�����-�����J��ID�!�����"�v?#Ń�аB1D��]��(źG)\Z�)rX�)a����E�>p�	�]A���h�*4I��I [5���W�� �P���2Tl��"�aWY;�͓<EY�Q���n�8�}�6�%0{s���j^&��x�'����'G5\�3G.��E����5�-�d7Z�rI���˴X��T1���Q��[�M]@8h�$����Q��ׯȂt Ϭ5 ������k}>T�L�+'����ߺx����խ��޽}�����n޾���^|�L(�U�Vx�wBTeE����y��.nb������Zk��a��62�(�X�\l E�-�?wsޔ�Jks&�vנB�QxWM�=����l���+��B��;7�c��OS��$�	x_��9�k��u��6�Z��{���/KG�Fs���+��q�m��ֽs�=����*w %c!)Ҵ���{$��z�O�� �,�N�>��	`|8�y|�C��C������3V����?��K,����g�G*X��7�tm���2��>�b�ᰮrm�"
:?��R0��d�N_�IɌ�"��0��������Nf(�5R�|№�2�i������IQ���$:xf��g�O��VE�oPZ�������_�|<�G��=��2�(��(8`&G#�8�ze�IegB\WåF&�FM\�bܫ&�7C�1�'c2^�l�������z*Q&
*[`i���E��C?l��' �f�|�ֲ�k�u?���wS�Dw����������{����Ao{�^r���w���v��0�z�0�������>��e���z{��pO��r����dD�.�F�Q#q���Q�-����F��G)��s���z���W"�0 �f,����Ϗ��G�4\o��p������e�7�Y�}��AO�(-�W~�C�
��%��cg����'��'��������p������'����%�{H��a{Ml#���b�	V;?0��p�?�)��)���VlҸ���pG�<��(P�����W~$�f� oF5�I=�� e':Gk�l[[��6�ọT�/!�����+��(>_p�xbX�~N7��'/�x]
�1w��1~����:`�)�d���1�R&ΒBy��m����1ׄh���;Țz��ni'��pv[�����	\B��L��#��ahk���i�0��-�6n��a�=Ml+�^x��OF6����J+�i��;�ˮ��_�h����7������}��feu���'���A./[���`{�"z�?�\�]7�'����767��ݳׯ\�|���{��m��(��U���-�N�YZ�<�U/��ܾ��M�̇�_�e��Q���]�����E� d�������$�V�B��a�q��=��E�-c���X�oi}�����~��6�o���K��C�U�]����k�����n��W][^k�xm��W�P~[���h����>p0~����������d��pۯ��:�ߵ��g�%��=Ǵ��:lkҥ�3R���fs\�48%��CҜ�����Ք�t��N����I['��7���/{5k�|1H�8��.�C>F���
��cG���� ��F��]qn�'��~�~��#[�C�E�"W��� �(�7�[�׹�7�F8�;�N����O�cc j���r�:E?���ҏP����q#��䣤�����:O�������N�����{��w�G_����unn���>m����U��g� R����������;�����p��}���%������|����?�������������߸ é���Q����V��D����8�����Q��p���=F��{�&�
E�&��EY��.\�e?�!�u6�+�K=��ɾ��)G#�߇K�	��nd�EdM���uk[FA���MȮ���ʉ�^�vae���{�o޹��G�|p��ڝ�(�ݔ��0@]�T�3W�����R]�L�-�}���|q8I���I�"�ȱ�y�^̶!Z��tċ3'���/� �a<�K=.>T4LGOR���nG�H9LxMY�xtQ�I��`��	��/!�/Ԫ���'����}Dމk�#��������.�j$��7/I2��������%`�`�ČtsL��1�YG��H0>F%��d><@b��1���%ɴl.�gw��c�sI�R��ϸ�.aG$�C2mQ�DM�a¨)���$#S��D<ܬ��x�ϡ��Ȏ0�e;.�v�P|s6rf
Ь���jM�ǀ�;���q6�
J�N�<FTVƌ:T�#�ya}Nx9���9@�K�3d�qʤ�l�K8?��_���ӧ��ƕ�D��1-�a,(�M����=p.�����&�Hm�z���pxR��hl�v�W̟�)1��ڹ�l��C��~Z�B��軆�C���UJx�c7�"�I�pmUߝ�KZb��8I�[`,W�9H����C�Pϫ����	���!3ٿ�,��Gl�P��������_g������	��3�A{u��wS�Ūٜ����c���i���[����t�M�~>^�ݜ�x�M���ф�k�r�s�\������)pj��Hz��53&o
�'��:�KW��l�n�H�9wL2�7wQx&��Q���Hr���U\�����p8E�? ��M�\s���>@p��e[�ݓ#�o�q !3���Ds����ߧf(E�9ᱶ%�}X�W�7�d'�U8�����wQ�b]!#B��k|6�3�D�)��x���O��^	�yS팂�)}��4��F1_M6W����@nơ4j���k,�N�����8$��m��A�[�xW$5�lt4Rn!_}���-��ae�i���%>'���%J�ϊF;I(��ʰ�#���tU	��z�D�-�4\&���NGTz�qL�Z����OA�z�O��7�-�L�D�pp,������<�J�X,����+�-=6a{��p�z���3�����kﯝ���������X�q����R�'�#iPi���.����l_�m����}�<,ϕ�Z�f���	��	��+�0����1yl�6S���%؍�;&t�A�~��a�yj�
=�`�	�@a�3��r�?�J@��C+>
4�f��Xo��;_����o8DJ�<o��iC��s5�nȮE�O��S��Z3i�C�F�,�Y����p
��MJ�X��dPB~v�S���/��-Es��?�SL��1C���2*ņ�������#g�o"�N���&�%?8����*�V�/֙��cr�����$�ǐ�Er#s��(�(��6�B��9�P���� ��E��j�aR�a)���Sy��rT�ҡ��!9*���{�'my)ڂ�q�:�&`��. n�
�,��Q��`���'R�9eVXy9�
�7�dM�k��V��8p�mp���W���  �G&8��\҃G�»f�z�Za^^]��HU;g��j���t���=�V[w2��ϸY
Ez��aI~�G�D��>�B1 ������F�DR��x8���%���e��6��{�o�˙�P�Ӥa"����aCk0#�d�.]��Eu/ˣVQz�Z��-#��6�y0�K_1Z�&���I��>�З�a [`�#��W~	���a=�ʵ�!
�Z�$4o/��^�7>f?!�XL��-�!e����E��y���@��5�T�Ȟ�������!u�*��A�ZlZ���N?5��6cG��@�IE.D)�S�@�~��Q����<����(ad�>�����x�	3�G��S��ɽ+D��I�O�D�7�;�yq*�Q͡Itq�CG�    �(d�z���?Z��t���oq��ו��,��30��R5�w����$O�d0��H)R�H��(��(��E���1�v�jw���(�uHU� ��]!�$g��^k_�('��\$뜳Ͼ�����V��v)M��֭��('J��&�q����k:���� cHI�`^�&�����<���Tґ� f�C��dne��Ԧ(�c��� ����&o�B��������$��a��/ ֈ���/|��^���D�c(���i��u�8���OE��ٙ ؗ����:�҈:1P\̮��~cI<0q=k�y��>�<˨r�4��>����� am=4��N�d��P�+!����M�S�K-<����񊈛W�L�][Ȉ���,.3ם[��/��g������^o��{k[���^������v���{�N�]][�m�D�#�'�F������J?�.�JQH���^�G�D�C�����P��i{����`��l�"���8����
ǯU�����^{[�n
wu����G���NR���^4��� ӡÛ
�mp9hC�� �3�_V�jK�rN7�@I�V#�ڱ�}V��"^����[�5���c�x
D\�"L�hyJ��f��*Ϡ{�q)���� l����Q���پ��nؐzUd�/�
e#k��C�
F���pϻ���M����a�������Zx|n�^h(��(!�h�f��'/�.��zH6��C͜y������(֭��uG.WY��$8��j<4�Fj���Xw�>���:gMN�;�1�Z�`H�8�_�'�����J�HP�]�Eu��[�\7 �`�g��p��3�)�`�$����4.bʦ?�>�Vh�P���$~�383�c�0W�r��8ȭ!��]x~ZVY䒂l":�B�x�⼩}dIXL��2uቱӖY���r��߱�l��T���&R\)?6~��AEcpD����� ��'��>��fށ�y���,6ʍ�f�CZ}�7�3}5ѭ��ȅxZ>�N�j��h8Ad�a����Ҳ@Z�rl�~Ԡ:FC���.�U��,����?�������z@�/�cp�U�s�S���=�nn�d�ԙ*���t�03"��M1+l��>�2�C�y�Z ��|+>
#X����c�0x d�Z[�7r3�0!�~܀�%�x~�ƒ_�nGב����,P�ssxReU��#�xZx���sR �M8 �r'�Y��GZ��=���"��p��ʩ�g�0���lQ�{2����^Kc*���ٟ#(�洪����zf�f�G<^q�'0��&A	0-%��z>���8tL�l��ү�vr�wB�@9HbNl��3�b���Ĕ>_�.-.)Lb�|�7w�k�w��n.N��lln�/��v��ܼ�1��Ԕ˘'�p�����c9 �;j�����a��H�2��O�Z'b�>1��G�-O��2;��d���־�Iц�T�D�)�fm�ىmBƗ���j:�K�tH�,L^w/�]+�v�YMٕ$3㐰��(YX��1ͭ~Z2�ل�0��iT��x�����{+����g�|\��!3���׼Q��h���!)
�ˮ���H�Mdߙ)f�o*rbՑl�I�1����1�V8l���Q=h��;I^�O)4�M�؄��BWd��	-�2i�>(�����x�O����18�24^��!%ӽ�4+-+=�a֭#��N��b�X�^D�$u2,$�C�����Z5j߲���>t�2�iT^WH�q�R'�g�[�?�C�OI-0�l��ؙ�75q��/h.gD�	�
��0l
2l���ST,:��E�EJ��i	M�;8��yˋϢ'h���:�}(q��C��d��~��V��D�*��c��u8^IY�+ )$�A봡�O�#;���2��7�@����H��2�j������_~z�����;ѯA<��>6H��'9�o����aJ^S�T
*������➕��B�,�1"��S�$t}�`�@��Y*���GM^�e�\$��y�8�F��s1S��*	I�я��8��`7����~�K�T0�B,c*
Z��

��.m���jXY	`�Ĝ�O��c\p�c��w����vr��C�:�%Bs�6IM�jɩ�:CF�C�X*�f��^Z���+�W_Tɩ��Y��1�;f���k �B���[1�?6��i�/c�i�ǝܡ��ϣ5���7.TfK�Y�D
���jĀ̢Xt���,H�u:��O�� �'Q'%ҧ����+4�H�k�igE8�u��)Z�,���>�P0���%�w�k�6�kG��(��bcD�E\�R\�C����;�@GGF�H!b�އ�T�Ւ0L��9O��ii%h ������d� �D�yS���)L�&�&�~�mkP��2Sa�IKQ��a ��J��9f��3�F��s3Zf�x�כ?��z�����������{ksw��ܽ~}�B'=�s-U��!"���EWr�ǈ\K��IO��^ao�*�IT~v،T�:,����o`n?�Y�t���#]���u8?�%���S�ͥ��,jX|�[��>�!�z�a�n5T-��[bQBn�C�V=%1��@�y(�{�_�����If�Hb(H`�����B�5�z���}���.�)�p�#��x0 �w;0�v"ɱxEd��l��}N�"XIH�$��!�����RB����>>��>��A*���.�x���c��W"����?� �\��D"���`����Fx9�5Z���5���o��2/�Yl���!�+t����e!`��R��2��)7yD�(����%��G}Ҕ@���	A�ɔ�0�{��Aְ�(�s���E;�pb��H���w�{c�BI׻L�lD���ɑO�C$�0H�{��;{�t���wF�l$�9i�Y.����ƅ�W����3Ñ�}}R>���e�&��H0� ,�E�B���O��J����0�p��<��#KyY���A�5�F�7p�Ssb�����G8���-&�	��,�J6`�!)�@�)c�q����h�V��Ə�Nn�����Wb���|ùcy�zRmS՞":�gpP>T�%���̈��ͻ�5�/#�'$U½����\Ԧ�P�3%�8���$�ʉ�a�H!��<����y��4,�=�J�����U������ej~�Yn�Ol_ӜVF�`�V:w��9HX*K�@F��e�{l�S��v����Q�{��q�?�KB��T;���a��/��Cs��0�Z�0����fEY���f�:۔h?g�C����ه+i�aC���
F���<���<��jѶ�1+� a(b2�����/�r$89��`�kO�0���4c}ӽe�з�5��>j�8�+޹�4%u���$��х�Y��z��>Q������������_��߇3�;p����a8>[:��
U�c��.3�G*PI�Ls���Q|vL�����;ȜAP�b��h� cvn�f��ӋkH�3mE2 5{=�B��M&�>�[�빴�����1��K��h�[�Sؙ��B�oQj�n�\�NR�J��I��1�dv�tQ�+вo���;dd�;��CLʟO-ja���^o���k�s7gf��^��rg���?�xu��j��iAR�{�GN���s@$QJ	l��#&��:�F�H�qT�8.���Zy�C7�_C�	f$ǐ��xo�]�b��B����}���.i3����^?;�t�6��  U���#���*�+��I�L�D�@a�,��ĕ�#�+QY�7?�e%���
�J�.�����7:��b� =��w�(||����*7�QV1B�X��x���y��ێX���a$�~4kX� -�Q�q)��3��"��H>���G�2��Xu�OCQC6C̳>��-0Vq#�؊��8��\��5��~)�?��,������~�%��(2� �%s��BƆ�Gl�f�9)_�e���8.w~��F��r��3i���S��Fc~8�J��p	�AQ��W��Xl�h� �    M�':�e��ҰM��_�9��j��"�Є�/�z������G�]ЫgqZ�O?�2tȯ=B��A��t0E��F��h�A�K�=I��? p����EܝP�ɵ\��@�|���\V2t�t���>�
�SMZ"r�W*�9�O*����Is�V�1��א�!��KP��&�x9u,��i�(��|�j��E?ƼEu�p�GHQ��@�,cH��r��^����Nh��Ywp���;�vU�a�g=M��B�\������#g��A�
Ü-�6��4�j_�i���������N����F�L����N�݅���=�R߹��S��
��c�Z�1����κ�\&�*�9��Rɱ��Q|,֜etx���1oBG��TH�fj����yC���� ���OZ��`�["xߡ�%Ն[��`/�qN�B����JC1k��j���^�]m�/��ؒ��م}w��R���b��Nkfl�'R(�]I��]UZ@�<�?f�J��$�0�g�'	�"�W���>�>�]ݣ�	A�Maz5�m=�m�a[�"�:�BV���D��#�Z���G���`֑p��ػ��S��`��RC�*����NY�L�2�4��� �9೧9�\L�dg1]�A����6���%�8+�,�u�3�����ћ�:��-��9u{s���ލ��[3k��7�w�ݛ�mZ(bF����g���[>���B��AF9i��1�[a�}��W%�:����T�}��Z�tMiI��I�'6�{AՅ|L<m���~���F��c���R6��F�z� 3���C�!R���6��i�N�VE<{s���uG�:#A3f�Ң��`"��&D�� ��e��XI"�3t����P:1C@�*�oh�I�#C|��0,��Lj8��x��@)���c(<Y
!乸�MʾU1@AX|ȵ��{�J�s��txO���^1٪��:o	G�y	sr�92맪��R~��>�� ΌC�г�Rȥ'���!�����x�ZI!"7�<!�
�+��5F���B�JF�4�b�^{�&���  ��7j�q>��0	���'R:���p?���3yU ���BS=�q1�F�e�B�@1�Xnh�����39���)��Gm��Z��������f����E��u����Q�Y�P�[�xE����p�Q[��_����垹�zz�MIj�K�c����o�|I����V�9�;ԦQ��P,"��s����\3�K�����4K]ώ=%�|?+<$ǜ���N��Z�ǆ�VPd�_�Jll%hx\M����
2�9s��� �ӤJc�_�0��Wr�����	,�L7Ѱ�U,ތ	�L$���AdYb�,��VD$�����ll����!Q|��u�9��yE�#���#���-%�\l\��2i��������rbXm&P ?�5W�i�I~9�(W^۵NĘ3� �ؾ�6�7��Z��p�9T�n��
z�@�ꈲ�ظS�BN�}�c_#��>�]�*�@��0�� �!<˾>�����Gi��	�fʽ�b��b&:�wuH�!0������^8�I���K�H��"�X�O�P�ysI7�c�/����0	5e
l�gox���Uq�=lؐ8�%e�s���D/�7�b�ѿ������-,�E�� 6�$
GQ�H��0B���PL���;�.L��?�=,vg�s�D������*z�{��s;k���nO��?�y������ݭ�۷�,V1+�����m��C�$	/��8�K�ڌy���	ë����A���ٞJe(����$�S,.���6y�!��+~�����'$�܃����M$�ƺ�V�H��qs!*����l������UQW�����,�D����y�_�;�R��Gx�U�I�AV �W,v�#HZ�v�e_Vֽ�7/���[�,�����H���H��QtM!� �j�p�'������R7��nro��[J�ծ�4�_i-�t u���C�&�K�P����%�#����cB�C�y(�KCQ�&�)��@rd�8�FM�F�����G/?��T9�ɨ�!+dp�D��A�Mp0��B�~��i�
��~�0e_t���y�2I��M�J��!Y�u�Q�?���*r�v�N�}K&!��8��G�����!��/D=�P=!��)r$u4 �U��V�Dsl�O%�>���9��P?��ґ,��1r<�2ˁ�?~v���;�[�p�c�(e1���p�xi��u�TcoK{Nq�T���k̯&F%�(w���Q�`da��T�!�
������ pY��4!5@b_b�@��G��F
��)X��`4֥�H��CI��Y-coS�8�'1��"֘��`��\�s�Y^�PM��^޲�GѐɌ�D�Gьr�y����ǂf#�T�o�b_.�DfQD�j�B�9��-��Q[Sb`h<܉��Lr��IY���?�x��s�	&'���H����dho��:zYA�.N�5d:�q0��dbj�6�pL��ӳ������9����#?H* I[�� �L�~�wj:��;p����!I�u-��^����b8]C|�e�4��.ߡ��H���K�@�#���Կx."b��Q��qċ��0��-��˙�b�vP����n�׌��tp��)N�zF�Y��]A=�)��
����Ə:�Ap*�g�`��R�0�����_RCmf3���H����%�����Ҽ$cv>y
l���������+�v���o^!_����E���4ڌ���Tw�7�V�/�c�|oz�����{w�nݻ�5���ۼ���pum�7愈s��Z1
I���8�M8G,׬9��su����P�8�4��$��?w����f�������}�>G܂��5:aT��2�_@C\�1l[)�1O�e������Q��n�'W��l����Šqd�˞��,��Z�	��\`)BL�
�aXހ"j�ޥ`cU}�ո?n�ݰj�4�U�ݣ�I��R���D�ȟQ�(5{`7L�It�*U^c3rp=�|s3^�=�H�B�>��)�6�`����NZ�8㺚/�:�Ԍ66��:;t�d�62��:Ȧ#�%�ڙ�o�)���e�O'��c�^I�����".��s�k=.������'X��@&�C+�������Z>��s���2s)Τdi�����e�p�H=$�+= �L��h�N��+�r�,��)+��ZaDXP��aj�ZQ�px�	±"�a+�ןɃ��7����ԅ���u_aj&eO�>T|Hc�s�<��4�\T��I������Pg@�UU���K.�!@�EyE^h����h
��z���@l��X7>����f�g(*_�5�?��'�^
U��HG��]`?]�=WT!%h���*��x��toqf��0#��`"=��a-(�ϮGͥh_x� !�*fXz��)0uGy�x�i5��1AT1��	N~%�U�h
�N� G���]a�E�?;vb�p���w�[���=fG�q�?��h@�3ͥG��3������T��P�qG��*C帐�#o��I,��_�lo��,�=�InEOp�!z��U���%�S%��H�3ce�,ɑ	��+���3*��:���J��|��P�|� ��9�y�V):`���)�I���#'��>	�l2��A_��?KY����Xoۦ�=&
�	%���䀶�c�|�7G�����< +Q6�6���"V̟RJ^�Ύ��4w����q^���eA\��q�)%�S�h��_M�h-<�ԅ�J�h�L6�aL�-��� ��{����r��Q��J&e���A\�}�Q�A�!�M˓��W.ά }l��y�:"�)G���h�Td��;Z�;V4��Xz�A���/�H�3��\�ؖϧ��c�|o�wn����+�v7�W��n��ؾrsq����,.2��2�I�������l���?Bi8�8��*af�K�`���L�-R2ΖP�H?�'�}��H�FL�)N�?��+G,_���G�Ik����xx    ��q��s�*�3iج;�/���}iq��h��?��"�4���q�x6���=�.�}�U�!.�K����ʎmH��m�kи�e�t�.�"�@ ޥv蓜�_چ[�0d�Gg�!��9R�H8.�H'��(D�����G@#�p�8w(�q�6-�WN����"<��U'9Ò�i���1w���-} ��z����WсL]�װ���H\��l�j6�6��Bo��'��a'fے(�	GN#r^Q�b��vħ��ϴ� st�������ه�#<��t�U��h�Vm? N,��4�!��(Z��$�5��%�/���f�����[���S�O�2���3w HG-��y1��5I��C�g-@q���T,=��FP�QI�M�m�v�����,���Q��/N���$1MAh�$C�:�'x{m*26|�mO
i�D|Ɖ��B�\��p�yi�De-Z�q��ة��q�	��0r'��r4��xe��QhH JЉi��W�)��x����$��H���9v�T��>qYBi`(���m��?�J3�c�=��5�B��
+E���8��>gwĊ���%?�@5>��(�9K[�,��x3 �e�{e����X��I�w<�M���D8""�_#�����~��o�өzK�s��O�o�;�����)�p��V�G�/~q��������%����Эf�;�(Q�O���B�~�4�h�<T�^�H���<@��_�by�?rOM���5k��c���Z؎N��l��/��c�>���0�O`XG]N������M775G�N3zU�w���ʇy� Q@~�ë��_�&������͗�g��� }�@$3ў?���qhj�\���fn6of�l�zs�lU�c��\���4��,��ǈDr;��a�x�r`��B�o������R�'�|�J!F'�}�ر�a��C����\�z��$��N �f�j�|�9d�X��y��;�me����1u"�	�ͪSf�S9ǌ��谡������sצ�7�켻�>�v뽅��������"�KT/�4���lƯ���8��2�#cf��!��`U��}f�~�HƦ7�4F���`f�B#kU����3�	إ�K(�Z����Y�PK���=�����7����0��"�:G��¢��i���p�ܿtq�:f�눩D5�0����%�>A���'
�ۤm�Ah����^.1�K�FN�e��t৘��+�����6?@z�B�qɎ	a��p_18���˚�`T�F�×P�3 �<m�y���>*�pu�	>;�\
?��}bSqɩ>��?�
�zóK���Y�������]�w>���L�����3��7!��1�t��:�I��D$8���q�����4_����L�����f���{�������[0������~e���u���핍�+۷���Z��ۭ�ז���W�_�l���\�ګV��7V���h>��;;[�l���r����������f��hx{�w�X�T�VW�'�]]�n��\s͇|����՞��nV���[�M�;���n�Q�z�_w���ܸ��q����������o��l�\ivbU���6��Y��X�ם�Tp��^�j� b�f��_��^�Um�m.���J��/�����l�3���ټ������J�������[�[���n���v�\�*� _���_��3J|�l{ߺqr_5K�k���/G�('��0 �L�~<Q��!�sh�� ��^$��`��dRњ��qLxJ�Nd��k�b���ATV7��#4`��ɣ��x	g _����݈	�a��DP���ai�C��|ͯD��w8����u�a˞]R��P���ly��IbSDV�!��c�]�pqlT�A��Ĉ�AD�.N�?]���[%���G���k�~�(
*���!@�@�����F��2��xȄ�2���s�È�Cu ]�?��O��ފ}�E��/�c�P�ohNKQ|p�{���*XgA[gn`�P"��t#���J��ة)^�Ype�gF��3�^�lq�ū1�*�_�4g�Uԕ�!�)����zRBg���<��-<5�"��#���C�Wl4;h�T	�+l	�:�]_��`�ls����a��P�t�Mp����訩 ��O�L8��<[(�B��q������Q��s9����g�t�8�d�3�ޝ�������[ܝ_߼��={~w��������G�]�p�w�f�t/*^�&v�M?�Fk �`�"��a659zGda��a��A�%,�p��S�g�
b���I�n+]��\;���fxT��UfBH���L͏	���W�OG�+��RLq����b�3��G:l{:��$����8>���*��;̮q�ʕ�Bꥂ5wt�_�����&k��WM.��a�x�d$�7�J�G�>D���0���ɏR��R{cLk�+b`�q�F������C�qC�ꏞ#�BP}�c'��'�7 ������^8��:��d[���˟�F������e{ࠋn��������k��a_�`>�W�zH����2��Z�z)���ܭ�������;��3֡E��i���	S����G����9����K�~RZ��u��0Wx��D}�lџ��<O�n�YMҋ\hw�ˉ�O����&ʻ@��k�a����,0r��J:n�v$�ɻ�q�A���MBvl��� �2���j}g���N��$���Ŧ�pQG�1�W���9�J�����b��sA�3afo�����a�L!�'�@��"Ǝ��J�擺x


3���B�X���
i~�>+
���Y����Q[� ��
۾��}����&�r���2OR�Rg�0�or�@���'
3D���&�w�o�eN>�8��H����N��Kv�)6.��Q�����`�%u.0�%N��Lp�w��#�>�dv
�`�4l�E:�x�+=���A1�S����eyT��aAK��쫾k.��܂]uU����o���5b5L+� �܇��6;N�Ո�u9T�I��9���}��&��>&�y�Rf5�RDA#m�%���+6�T_�����A����"���j�R����ٌ����op�ϓ�B���"����Y�n��:��e��Gv���� ��R�����3��oǜ���2����)�!�ſ�
�o��!?lyH��lF��=��B�W�8������������0�j�����칛{��3w���_�~�������W���ی��%�b�����!2&K�}�"�H>�z�+���e�|��5)�*�[�#�S'�� a�A����$���6pL�@}�!Y6�]���:��r!�CboG����ܑu�Kɔ��ݕI�}��.�^FY���J9�^"��o`��G�ץ9(�`�K���ϥ}XM`��V��,ۉHVP6_ f������d�f�9?����zFϳ�,��sWg���n�����Z��w�������)��zS�������+�%�:��w��u�>o>�C������������@��_/9i���}"�v���D��d3�ܑ�A`v�#�Oὡ�����U�G�!Ne���T��si�@]�+�UB߃��ͳ\���?|��;�q��>&8"}�m}d����3y=�^#?r���~�,`�9]ڏE�K8 �o�8ZĒ	�/��;��c�B0��7�Qw~���12����}���t�U�v���c��M;?ɇ����(Ֆ>���o4C�3��@�=E������Y'�ϟ�g�>_И���7��S���?��?Ri��V2�>G�z^�=wْq2��v3�Ҩ}���P�{;��F�k�y�ҹ�Gq<Zj�e\��ɯ(y���o2�>�<V9�ol4���t���?��k*΢��XxQ���;F�:EmS)��pEb�ϛ%�����P2�>���k������G��?q��	���\���)[Y]l���sk׮O��ۚ�6�{}zm���w7�gn-��| K   �bw1��?��K.5�\8w�������kwvnn�L�Yھgq����䒽�S���B���~�[�9Ko��r�����S~C%      �   s  x�-�A�,7E�1�GJB�����s=��v�t�Z��V�=�~k�����q?�q�e{Nlۛ�D�Ӈ�m;�ĵ}�"�v�H۩��G��!`�϶D|v�X(bّb��mG��#*�nG��$�I�;�,,�vd�X��Ȳ�ĳ3�K~�l,��e�Xr�˲�d�'Y6�tsY6���l,�l,��,Y�,��e9X�!�?K5D���"��R�PX�!�,�Y�j�,K5D�R�űTCdq,ﳐű�e1���mY��)�ű<��ű�k!�cya!�cyi!����B���=Yn[��Y~�S�R��Զ���T鼚��R��Ե�����G��,�Qe)K���Z&V�G�R��<�j�#�볒2Z�-Z?������<���#�k[��GZB�G�d���#�d?Rh%;��Jv���x�V�Gi%)������K\+I�w�$�׵�D�JR@\+I!q��������V�w�ŵ��JRX�V��r�������h<UX�V��r�������\�$,W
��JRXB+Ia	�$�%����(��ZI
Kh%�7SZI
Kh%`	�$�%����JRXR+IaI�$�%����JRXR+�?��JRXR+��aI�$�%����J�QZI
Ki%),�����V��RZI
Ki%),��dޱ�V��R�B
���QX�v���^�������*YK���%���*YK���%���*YK���%۲�T=Y�P˞,�Զ'K^����dPno:�kO�,*�ɒ�J{��G���R�z�d),}��`�"���AD�Y|��)<�	h]E"Za�HH+G����@��F�꫈�D՗���2����TU�<d$��z�HT}������!�����;�.��\�~�}�֜�~t��N����6ǹ_ͯ������k�r��us��m�͛�ܯ�n��u�<��q���ZG����8R|��Ƒd��4���q��&m�#�ghk)�<[�H��G�/��8RX�Ƒ²5���q�� ��q��l�#���8�`Ό#���8�pΌ#���8��Ό#���8��Ό#?K1�Gԙq$Q��#��gIT>�H��G��8��|ƑD�3�$*�q��cX>���3�j`w�Q���8���G5�;�wg��ޝqT�3�����������=���      _      x������ � �      �      x������ � �      ]   �  x����n��ϭ�����%r�.|���KE�"9����+�=��@���ȈS8�'���}	/�>�~~}�R���?l����n��>���x�}>��_�������������%��Yr~��/7OO7�wO:��d����籖���5˟�_�t���S�+�R����{�1��\��>-�U5ɡ��ZK,VK5��ʐ��jb���D�lMg����n�BKqwU��<zK�,��IC�j��.=�5��N���;�hImN��%�1���0����\C�17dݕ�$/s��Zc�kh��ƴ�}�^�LOi���f�-�y��C�g�}���;g�bܱ�Ň\�tqI��?�ԵB�>����ܬ�f.mҖZ�ͣdv�T�Cc�Uv,yҗ0(��(+mk��R
�ץYT;����e|�fqi���;ݟ�¨���ŝR�}�]Z\���gksU�$��,ԑ���X��m\�Ռ�P˴�K�����s��@��=͍���}�n-��2�I�S\�����r�iJK�,���i"+坧ժK�a��Jqq��G,N��f�1ƢS岝��-��3��^s����
���_��%�{)C��x	��K������]<]����r}��������[}��N~��=�N���Q?����,�/�×�}��޲�����N6��Ψ���Gt+V���nF�2� o�#��޷�R�7�����R�,B�Ҧ+9�t��Z�C/"��w���)0C�>|C 5�>;Ԍy^�ה��P��]�n��<f�B�P�cz�� ����g��1��ZB�PӠ�h%Щ7���� �{Q��>[0eĤ:� l� �p:�љ�7/�h��5@7���^YkGO \��.�%�}̊�%Y�K�5>`Y��sv�+���Dc���j�l�]Rbp�'��uDG����VTû�EU���ee���� ��#MZ����BZ�@K��1S�e���зL[�Z��<j?��5��Ά.��������R5x�e-c/��_X  �4&KN6b+�n�Q�eT�Bir��XJ6�
�s������Jj����5�V��_����E���Oy��O����������zG�<���z�aJ�8�t��Pܶ��Z<��]Ȟ�����xs���$̈́�z��[(1NH�3����hrĠ����=G렑�:6m�
�#𓼊^;>c�8V�FW�Ě�:�v�8���ms�ࠡ�Y��`)۪s�<5)���b�b��R�����c%�F� i�8wl}Xi�=SK���h95���
@C�vB_9C���`��¬4y8��9& �[�l���FNmg\k�-$`�Ѽ�֣W��QJ���0<��c�V�z���&3�f����\�o�K�(2��֨���r �?r` ��^m��`��V��0F݊&�艮��K/d9Fπcd��:�g0�4�`B�:��a��ǜ�<��Ud| |3]p\o i+�,���K��s���|�r�x�t�vU������O�t{{����v���l�FB����;���L�Čt�L�����0]Z'�bI�����؁x4L���U"��>��Ƣ����T? �y�$�6���a�e��=L&��&3%XVG~���q�4�eU�:��${������|#ͻG�i�fk�4]k5����嗲���Z���%2&��
�$��B�Ĝ��Q'�B��a��UIܼ<,B&Ƈ�F�\E{�X{.�m���I*�堒n�)�E[�i$T;B ��X��]��^6T�3��K�&�Ir^��!�buP�ځmi�6�p�ö{$�#�lJb-���
�C��q�#%G��c����!Xo%�ছ8N��y�7��e�K���(
�kG��0��+��=N�a�a���
 +&ߎ�n60�E�Odw��A`%o�#Y3\���ߏ��@�Fϗ�B����74��P/I/!]1�S�����cE|�⧞���r��ݻ���@      e      x��]{s�8����)����lM��̺v�.;������綮2)M�2��!){<S���q_�>���Р@IT�5��&�F�����xz��V�4��E^'y=]Dy4OJ��u:_�Q�Mj��L��^��b�̊h6�.�YR��>���N�y5��}|��n��,_��*9_�Y���K�De|�,I�������ONǋ(ͿO�l6���"��g�u���wEY�����$���W��	���fQ1���;��5��$fiEg�U��2$�"d��פ ��!�(v��L����G�a�Eqr�z��K��@�l�aޖQ}��ƝH�?EڏÒ�%�C��3���A���0ߤٌ���Vib�Y���J�}�̓��T�<�@l���x�S�5�{�þ��L�:��B'q�؉K�ل�}x]-gn^��^x��;�+��~%���O�봬j�b�v�o�M�A� ���J z(V5����R�^�Џ���>�.��RYL��\���FW���돧@���V9(�D",��Z!,����cǌ�'���I\���#���� Rz�u>Ɋ8ʒ ���b��ƾ��� KP,A��+�T���I�ȅ��@�b��Nb^|>+�,�����΢��U�/	G�p�D�n��k-�ٷ���A�3�>�;n�j��a��.�-�Ղ����f�>���a^,�i�t ;��·�������,E{\K�
�0"���_����0�T�Ф4bx"�ТDB�\��.����ab�{���t���n�ɠ�%�ɯ��4����]������I��,Eۇ��t���yBJ�>��$��w�������E��j|�A$��cC�ow�&��af�{�DN���+���쿂).��>X�}x�J��}�7A�r�
���>8�t�vb��.M������^�� y?n���U��*���T���T�6��L}rk��2�bb<�KG{n������ƱsR�QA�|�҃���vg�mFH����X#��� ��B�Ȇt~�D�:�e�T/+0�U��M�x�"n \}o�{k
�굖dMy`�ld�Ń.7�������^6f�Gc1�R��S#�ed�7�l��؅ɽ�}��7"N~+rt�UZ/�pq����z�:DJ/�)I{�ޘ�eQ&�C�3�S����6�|�hS�@�v�:42�" #V\�$�6ލ�\p�U_m��ق������İA�#� H��s/h��ݻ ����EnNUZ��^����ΧJ��K��rʓ��zIyB/�yA��NMU���ޏH��ք"����x#�\���$W/��ǯsB�ɖV��zj�]����W1u�`���~4)�^}]8./�C+�\^�ʊ�6AW�L�gڞ�?�I��~�����b������ ���?M�hĂ n)D�Y4~�l��b%ۙ-a
�B��*� ��V�*�v��&��L�6�z'�3w���V�^g�}5�?��n����;�EV���<�������141g0Uځ���U$�"�*��&��,0�J��4���.6�K��R˿��T	;@�boZ�K���ܠgM���~�zP�P�l�]����y	Tm~:�e���J	^�,ެ�A��#�!�����%:BZz�-���?���H2|�wB1|��!\�c|�ZV��: ��P��2Օ����."��3j����fr��G�I��f�*XeQ	�� X#3��ҊL���{�Ә=���RB���u�*�)��%ש��u�Sn	�C?鳮��g��gW�T��62�s0u]�W���r�	�52�%i3�T��]�1V����Ah�]%�+��u��)i�Y��7��<�kO���;m�/�m�o��J^�ٮ*y�F��%q��2�����vu�S�Z�l[+r{�gL�$�dg_��c���xQ�˛��?���e:ez#����5;MRG�<�Ǯ�VT,�%e�Ֆ<�2�#\���7(�\��I>���f���e�*9��z*fl"$}ɥ�+�c��K]������/���p�J�ȁ�`�}R�?�4��2�����)��͎7fʃY�>%���H)��=!֚s�p}k�~vWyňL�Ҳ^Q)
�L��"[-�Fo�g"j��!/�o���Lftf �1�si>K~�Zl۰�MY�)_�So��r����d��x��,0N�'��4�1rM�51�ԚT?j�FG�m�@�F��C/
DIc������MQ %�Yqe4���=�&0������,�x4##l�-a�;�bߧ�N�����k@����]2t-�.�J��-�d��,G������[U��"����Fh��[rm������!%e���f�
L�����Keu�h���֬AP�}�_P˵�?�-T0�7LCO.�#4�E����ل�7�,��X#R�"�F'���l䠴�d���9��*6��}�XoD�T�����C�Y/2�����חS��/�$�#��ZPvN����ŋ'N�^�,`�W��l L00A!q�p�6`*#��� ��L��L����?*)�~O����4I�hD����s�Q��;����'2�{����8���h����H�Z�R��=#"����$fwF$%9�*����7j�%8�b��xt@�.q�X�bY?P��*�� �7��֐eٌ|@UU8%�QBSt�0�l��)��BHWoU?x�s�lM4Q_��L��[��<m"'�����>qް�=z��n����0�����*_6Ǽ���ݬ�Ky�
W2��0����P�c�Y)���~<JT~U�d�cBh�B�Fv=�R�zw@�JvJ�g�zGWA%�J:u�f�56_�j��*7��B4��%X�1���pm�C��,Wć8��,���7��eM�Mw��j`�{Љ��Ƚ0�F�!F�ә��K5;P܃'>|��1!���y�%�1C�F(� �l��޲T)�+�|����̆�Ă�z����f���g�O��|ǔ��Q?_u:�Ϛp,�"x�?�8�b`^���|�4�s�@�Hs^�:���/��������>�|���6N4�C��㢊୅!����I�X����z���:a�N*�n����J����귮�OF6��p�� ���V˩aј�Z[6�}-�6�(�ڜӔ:��n��7�9������斃5`��1C���(@��C�VIt����:�����4�t�Gm����9h _���]�Vp![�M*�\�1�D�6M$�M��.�[
oiΡ@bpE��Һ�e�坮�m�{����N�Ffߜ]��C@O==��{���K��[��MXItS()(��ЎE�y��$v���5Ǫ�}a�њM�Fd�V�������ߊj^"��Jm����� ߠm_g'v�P�+O:��� �]C���3�0�(e���#�/����?�'f0-Gc���=O���[-�]�ܒ¡�J��&��1�����|���R�̙;J�C��Ig3�Ss���F�&��]��
����-= �a��!�b[3d%X�L/.�U}S��m�K@X"�i�D%h��)�/�W2w�He�8p������2�����(k�Z�ɯ�f�Bh��xJ`B���L�=t��u� s<�hn2ӥS����YqO�?�a�.đQ�#k*���X�;�Y�o��(t��$&�ҼpQ$�݁�]D%�Urc�%�)��T�V�Ŏ��@n �A+���V�E0j5AU�4H���!�Ac���~'Kq%��,������=c�g��!k��Z��L�1W����d��W����V������d�[$ak��'*�I۠�����oD�Q��esQ�Q��9@ݿ�� �vo�胄�EBz,��� �h>!�wR$��Rj�Њ��^�|{@nuZk���}�1�ڠ̂2�2���(U_P�&�����ǚ&o�ł��t�:�w��JR�uRJ�������%���sn5^�4�w����$:�tlvr�zp�Y1��g<�yN;3ϋ:2N�)Gϻ!���Ʊ��D�ʳ:Z>L�O�2�}T�)�#���X��}5�:\��S!(��t�'    ���K�'��������pYk��|��|����}�iЧ�V�zck��<�u{�t�p�6�Dx�t\�����H��~܂[�U��40Ծ��AJF3��e��m~��c;� 2���E�]����Y͑R���b��aR����_<��b	�*���U�B=^�$�<��D��tɿ����ݔ��)�:i�:�a�M�8D���nμ��]-R���6�^v���yE�:�y��y.�
ܿу��.�YR���,-��������v'� M�6�6E���.U��ԤM��"m�BE��1�Z����ĺ7�h}����bӌ�j�������;j ��z�{�S{����9F<���������VW?��ݙI��eAF�N�G-�Ꮤ����َ��.�X�HY��t�T�����W@_C@_H��#^��уT�t|������X��=Ű�eP�A1~"��_��ԅݽ��_����k�:-�z��`1|[M�,�~[���'Ž��1�V�j~��6�Z��n�d���n���7�/J�������%���ơ!kP��x��kA���e�s�d�q44�!"�J\�(kҡQ���̔��)��"�ݣ������e�h���.���	,@� �����B6z�d���Վ����r���k<��o�5&��^QP/l��_X�C�"����B��/��i���FM0je��=PO�Y�{<z�{�8>��*��=�+_ (����jpc�?˄��W�t��kU4���2	�
�u;/6`���p�<���9tv��QlL���RNI�=�F����3:�WYv�qR��쫪.㏞�k�nH�MXJ��Þ:�a�.*�����p[t$Vu���:b=d���{�j-�i���e�\��.�_��C�c���j�)}�Λ ��d2�|8��#�綒��DUKM�u�{G��E$z���g=|��F� ��ن[��k? ���߹|u:
�<\*��E������j>��GmR � !�ٱ_h�݀��ր��zG�G�I���Zet�.g��y2��,��^c��i�]�.kͨʼw��"��M���ܧM�_s�Z5��z<�M��R	RZ��x���	�`�T`���Ꝿ��1i񠮃�~,������=}��4h7'���ͦl���j]���)p얧=���r���sq[���-@�ہ��{�A����	Jf7%�(��듂Ep9��G���g'|D�s'S1S�HZ�J���..��'�����I粎�Ze�P8^�Y������T�.���~N�����4�آ�k9��W�5hIx]��1~��ఎ�f�[)����z,��UL�f�UBؘ	����m~g�LM,AL� ,ː,�8�)�ܥ���PJ��;EڟC=��+���Z%�!� ��A�!�q���m�n���|��>X���uj��G2��}���W^�49-W���[�E]>�A���U�����wy^5{��I�WH�C�r��ѯ{����hB���Uۡ��64�m�vs��X�7�8�\i6�I�O�l>���~���k��i��돧f��.8(x��b��KF��.��r�K�4�+6����wAU:z�Y��ڸ��|T%����P��[!	�>�k�E���:}? <�6��@�����o������F���.|��f�>���*��V���lE��G�C�^�(X�C��29������!j J�+��i�+�U��~�������h�	)�K~��C�u�ħO%@LϿΧhM���ɘ8�J�_��ح苝�IM5A�*�X����wIV0t��q��*Q�Df����"�FNȔ��τ��*�oߗL�/�/�_
*_�dZ*�,�yB�nzMǌsJ���쫢���Og�/��Lv�HRCYj��Ŝ;��n�s"��N����رjF�Zl��.6i\Uq]N��|V�W;��(;��Ћk�������o_� ��ƃ��p��~�����Y�ښo�է�8�<%&*})�5�.���+��4�io�7F'���q|�l�d0�4�%J!l�O�1"ɠ���,�����w�R4�����G�#��i] �"�EP��fU�����D�:��`�+�k4����L��iS&3�#��C�p
-�~P9=5o�=g5)�דd�`�U�r�:D��X8&8oL���'�Z#1�ۇ�a�<��L�|���8�ڇ�T������u�#Ί�v�1�� ��,�_%k-Y�٢�r��~pp/Y�:�&�z��F���'<��Q��5��;�gR'�{�L����w��<k���b�����t�&ʓL�O�nqV&�����v�$-�l	WKB.��l�
��5~KY� �DD����?/���dtC0�lT�D����QVT�R����e�0��lg���/��駜�!4�F�Ί������=����Bq��Hg��躠�(:�ruT#�Cz=�*!��?�e����?���h�����/_�����˛(��&���f=���"��6�8!��X�7I �!��U���i#�Z�F�(G<�mBѾ>8t$n����� �{��;*k2z�%�8K��i56V��+�'Mmt�(}������\y/�+/��E� Y|���-n[�������Li�$s�,Ê��3bÉ]z�KY|K�i0*cj[��[9�y~M�	�ҫ'_����x�A<�0����l��q���lg�*�O>PA��ӭ�3<�O���(а����(DC܇O<d�u����K'��x�E��s���ԏ���Ct�4�=�GQ�}X�MFeRl6���v81�L��L B�P��G؆	�4���D�~ЍVAM��P�z�qB�[h���v8�<�s�A=����ՓZ��Q!5��t�$�'+��<��2��W��Hxi��;?��x��J��p�:�pUU�Smo��M��u;��.�8�HCAL�.���n*o���.sPIA%=j���Zl���rs��ǣ������*�q�p����2渥�����(?����%l+k�+�c{�åπbx��=��מO�Kah�Ϛâj)w1��+g�jc5`��`�Π�:�7A���E����b����\@S |<f��H�N�C
g:���-6^��!(��z��o<�ƃo<(��l��7�]�ج��"]���h>!�����0��~�����bh�^\Aً����Ex��cY�̏��Fpj���riWJ��@.7D Am��?m/�鱞����SrNɫ��of,H8r�A%�r�P�l����!,GK��Δ����U��G?�3�&knԴH�4w '���A����G
�% ��P69H�x�2��T�����Y)���?6���4�b��-]�i��L�_��(���ǯIrD6��	v��qB�����8Ί9����^�kr�9l�H��E��Xs�I�ů��u�����;B���H�J<��Л{.-���,1*���0w�q���=���"�����iq-u�C��z#H-~��M���.�|��Ӑz�d�%,h�X��2�S 9�����������!�M���^S?�A���5Py�e�d����T7���f}m���ud�\Ϟ�`r	so"����^%��BSb~ɚ1�����TE��Tꀡ�ѝ�]��*O�II�fϊ�!pX@7�Q�F�=6Ҕ7��4�<�@��7q�`i�aX%c0̤V�k�����.`(#N����+��)�|���"u���>�`h�����=wdA�9��?����sєdjἲ�C��TuA1�c��@
$�6nV��s����a7���,n(:��,�]�>e�����a�~
��q�+.2ܒ�	�\6͂�tC�^w�Zi?��ru0k�jl�l��g;�}nZ����ã:�2��AM4��4�\�~���c�ڄ�u	|�m5#�^0a�.Ր��5�c{T���>�����=XM�|X���VK�a��������=�X�^�~D��W��i� �   ��a���}&�|�����=L�2x ��P;Ը���D
�j�"��� K��(Ԑ�P�(�����B����j��l*A6�ۄ�k�k��7q]��x�4�K�MI.TO��*�.S�᳜��'F�wir������Y��ŷ�Qn>7�^�1m�}��f��d��so�r�������_�O�-��ez����οz���W��_�<�¨��_|���aWO      A   �  x��]K��6>ۿ"����d{�[��akS��{�u� ���H���S��� 	Ds�r��"�k@_��ͫ�719�4�����G.ts�9���y�ھ��O++a}ס���lee������Km6�˛��M�p/q��r<;�$��Eb\}uZ8h��qh�o2���(��}�"���C�_������N.ԋ#�9����/��M\��$�E碁��/O��:��{*�*�.�^nݺʭ�������o�$��iu�nBz�!�l�|J>�!΅yV�0����5Jn�{�R�Ʃ͟�}������f�͙��离�jY���G5o�l4��Hx�!���is�	ݖ��-����:�H7���l�������޹]�E�����;7���i��.Q2�T�C�%Cr����1=�j�i���I3߃t���΍��Mz8��=Ǡ.8=\H6�E�w0z$:Cv�@�0ؠ�$��w���í��l��$�yAH}�������?��Bc��� FF3Ƀ��:����%�Gv%c\6?}��x��,J)��F�`�X��W�Vf�|�h�U&�=K7�FwT徆�gI:��b���)fW�,�/.��?�;$t��w�֞��q�(:ȺS���9Ɯ�AN6��.�:�6�(#2�F	G	G	WJ8�}�ʑD�L�dVW#��R�^��}�(�k�F�w`�Q�P��/[��
9A����^��I��B�JXǔ�ͪ��ͺa����Y���̱��C8q����o���"&qAz�3��� ,b�ϦG%eY�|��`&���`���.�d��>���#�:s"�w������
�K����q��r�}>��:���A�}�~xt��aI�J�y�=S�k ��Y��[�Q�׶@�m�-�(=(=�3k��1��I���-*u�c�W��	�N}�?�@\��>�&j�?Կ+п$�^X��ֶ˘���B���ۂ1��W�v�{{�o���6�Kx(5(5�!5�?pr@~հ��3�%0()5�[DYۄȡ�2����I��^��D)���a-�1gha`P5j����Zh���v��Cz!l�'9�(z�C��iDc��d��=����ޑ��p�Z��ݧs��|�3#̌� 3"I|����ɼ���M�J{SY�V} �"�Ĝhm���یiօ_����<P�S\�T�B�B�B��C
L�:
f�1
��(Ҩ��i����U���pґv��%�Cs�p�JJ�HTLN=
�^1)P��>eƦ�izM �i���8'þP�j�jqj�s�>�H/ՋP[02kc�1�.��1��P3V����I{�ܼ	v�0������F����S�����N����+��ʟUo�h{��i�o����6�I��QG�\`�Mc^��� ߋDqCq)n1	ؠ���Z;K�
�"�S/p�ҹQ��mOA�B�B��[��\���Vy٨fU�ڊU!�+�:����M�V�𻹰��w9qC%J#J�Лi*O��}�@ �~�@@2�¼:���0�QJ�w�M��
H����`.JQ�S�A���3سY}�a���)&f�(�����g�dhb�U�v0������#�z��%�>�㐉+< "�'��ڼ�,�>g��+= "ȩ̱\�r�=��a�7&�8��Q�|�7�p�&����Q�}�����1?���:���
Ա�vJ�_���.�A���O�4�G��|�F��QAצ�Wr�3�mE�=�_��>Ԟ�t���m�H���yf9�_�l�Y+�#���v����&c#�1�N�!�����AP���e�z1��έo������Ӌ8ŌYP������bՅ3,S�j��@ͺ}�&\ixƕ ����3�lLe6�g��f����y� 2h��g�s#������=��ٜ��(���q�ݴUM`�K0���&�.�{�� �z,���� ���� ~����߯uԂ��K�3%�+����X�!v�KF홥��d=�FS�$��'����{�w���[3)Z�&�n����P�FsГ8� =�Č rCd������T '�M<�t�9�/�YN�B1���ݕ���Y�0���sXǪ����	�dG�X3�M�7?����_~���fy��3�F�,�:E?2�R~>�k��;� �� ?�.wd���P|ץ&�wÈ	V�5�]�E�l��)��>�Ś���k�j��
�B�='� 	\�88�H)u�B:)G!dķ�:=�'M]{C���8����o/_�=XSAnh�So�!��%T�#��B�� ��DW|_l�D�����Y�X���%���;Q��^zQ�	��.��8tP����P]��m�p�o"u��H�LkOd�S%[���Y�\i����l��4�����G���(N?F�/	Ku�}�x��d��B��v=D4V�
7���ޥ�f��2W�)��H����z,?�씙UΑVG]�F'b{����tN��Ti[��	!ށ��:h�4�h�N��R�a�br�q929���Ql�Oa(��<7�=O��vVN&���!n�
�PЅ�q/,���܈.�it�3����X]ٷ
���X����8�_'o������Uria!��9�A\���Gm}�]���S�5�6.��	<��^�סGD�.�^���Uq�b�]6��0H~b��;��ķQ"�#���X��u9�t6�:x"/d�#al+L��r��2�G7�w��`Xs�W2ڃ<-U<N�O2���q�}�We%dubX�D� 'I �,��o��1��OLhˉ�S��x ?9(�RԗX����"I|�ÁU��0�e�*Z	�2��6�y����@��(�AKyt�8bBR�ޘ���î�)�M�@�E���!����lT��@E����0�g��VI?��=)��xj�9��n+@�Q��T��L#�ϼ5�=\Ǥ�R'J�i��6-;y��$�[/�`�̄})�n��4�F=Rc��U�%�ٴ�G=]�*��S~j�u���Yj<�"(��z�9���CT�%u���a���v��^v�.�h9{�[IIq���H��]1��
��p<z�@,��Khe>>���FP�@�S��;Yh��u���%dJ-l-Q<�/?a{� Ȩ��&6���g��v@��f��V�V���� ��1��Ҡ�訽r�	<�5��A�),fPݕ�[�=[T+��me��C��\ǎ�j,�-/.�ib��:�/���
[!�d�{6����	@e������n;�Ի�U�EƓ����X��m2��Dר��3;}f�Wǧ�Cn:�l�E�,���O.G�c �Ŕ>�>�D\ j[̀V��꿕9V3稊HV�z�2�C:P����0�R�7�:�Uj�1���sN���y���㛛�o~�����޽{��~w����q���7Ξ:�aw�qv7G����R{������ov�=�p��=�nn���9v�~�S���~z����Җ�P      i      x������ � �      =      x������ � �      ?   �   x�m�A� ��u9��	�ڳ�A[
h��K�u��m�?yb�ȑC�h6�(V����PWa3�K]����B_�����@)5%>��d*9p��[�l�I�J1y2�g!Y�#^�P�P�ޟ���-S;nB՜>���J�hW�+ࣣ�#o(�d�`S�y�z�5����UK����c6[%      K      x������ � �      q      x������ � �      I      x������ � �      c      x������ � �      �      x������ � �      a      x������ � �      g      x������ � �      M      x������ � �      s      x������ � �      O      x������ � �      w      x������ � �      u      x������ � �      �   �   x���AR1EיSxR�Nz��!<A���B��n<�����3dnd�����Uo�_w�4��b�
��Ù�+_�}B��ex���b�}X����P �D�:e%Y)���O�>g��#��r�A@��dU9��
�!u���('�|4S���܄�z��K<�(36�)�"�o���ZR<3z�T}R�!'��n��&�cy��Å�v�w���N�v�_Z�\��vi��ӽ��i�x�icm�$I>E!�Z      �     x���=N�@���),��5;�]{��r�4qH��a�Nq� �D�H�0��� Ae��yś��,*��	��o��rQ饫h�.#F�6�Ў�Ji�>P� \�!��ris/@P:B��Q"�fF���ęج3�����Y�U,CF���>��엁�d ��k�x�?p��=�K�w���|�I���*�c�-��C�kfr�����si@^�1�"��A��ҹ���n�J����W��*UǪ(uX1:��m�hhoH�퓩��ÿo�x�p(T/��۱�˲���+      �   x   x�3�̴4(2/ȶ�46�)2�N)+)./.6�漰�¢�xͅ�
&) �/̻����3.̺0�3Ə����T��L��T��������\����8P�!��q��bl�&0���qqq x�X�      �     x��ZiNY�mN��o�����C��ha"C�c�E�LF"3�8,f1aI�H��Cpl�\���$SU����(%R�J�������zE>+1�{�á�Sgf,7��F'�i�ʚ	Y	����U�n��@P�7B���#�_�u
�E��Mg@O�0촕J���n��]O�VZw5ߴ�J�_�i/V�>'���7�f���촞�Md�O��N>���l[�M���-/mZ����5?}F�5�˜?�e2Nn�|43��?L��	�)���`A���
��[-�L����R�� m/e-X$���op w��Lhư��|��ԅa�7mٚ�ne�޳��x>3ҟ�CR�O���<9=14����A�Y���׀�L}���L�ͻC��O���aGם�=l%�[�+w�kX�*�eQ�Y�Ezݔ��|O{�#���ǁ|���!<���1�n�u����T�m7�����{V�)K�m _c� �A!x��U0,�+2-�U � �?1k��2�9j@�\Q�Dθ�j��
��
�6^���2��
���lȆ&��^��d���QeVC�.���vp�F� }2,m(�,����a�j6����y5�U���`\�D�(��O*&�P����i������bŭ`�L:G��]��]S@A�BQ q��^�Px=�l��s5xZ�����l�!Qg�c��hmD ,��کC����z� ��:�� ^�,a��.�#�}�Թ����1�zxh[�0�5rN���e��P]�H���@]�`Yu��\z����OH����⒖_�T%O15�a�ÔA~O�T�XU�
�]�,X�xJ��z�4U�~�r��:����q���jQ����W@x�9�ļD�L�R|��Q�w����|u$������{�n����}�N�����z\�����ܭL����|;�eY��h	�����)�A���c0 �}y,�g�{�h����� �,X\�'r]�c�#�Z�o�[l��a�-��(ʷF-������.�6L]���8���S �C+��K���pG�7�>�`t�M��nAg���jv jL�Z� ��%G�o���fy-|���#bV��@q�aƛQ�i���I݂���R�&$��������h�BJ������{��D6�v����jՇ�hwf��Ƹcd��J�qhoU��"OeALVZ'�s�� {�n�q C[D�V�n���HE��
�BEK]`�Z�|KΩ1a_,�}e8$�W�y����#�r��ˑ����u��;����Ns1RN�D���ѶB�6�J������Jm��,�f8+@�fTg�v��[g�m���A6��j뤻�*�����SF����M��[�U�D"d(�z����q��@Ho(1�m���V$�ZE}�f�Y�G"<;�Q��oa��Uo~���:9��9k>&��}���J�oS;�ӽ�:�|�����e��g'���$���K
�H
���.^\0��4�.\0υ9�y0�÷�>�7����l��X���f�/^,�Xx��b���/^,�Xx�M��%&�c������ù��!4og���q�;/%���ei�eD즛�u���Q�X,�Xb��b���%K,�X,�Xb�ĺS�O�2S���Ȭ���O�Z���ꏿ��r4ۍ��OQ]�e��
�+,VX��Xa��b��
�+�;����SX=vS�l�e�Ų�e�.�],�Xv��b�Ų�eˮ;)���o{���.�]��Xw��b�ź�u�.�]��Xw�E�u_����oyA      �   F   x�%��	�@�ZL�]]��%�ב��gu�Pj&V�v|�7|�a-��U�ߘ��n6ߋ�տ�      �   �   x�-��� C��aN�@w���8;��Ы1���H����BvèM�)dFm�Q�0}p��:����4S�ˬ��;<fw��fw�n�������U���E�n���'�|?����}�R�
����J��|? ~� %0      �   5   x����0���ay��B�u@���XCm�&s�Dn��!��]��%����      �   5   x����0��7UL �uzI�u��k@c�nlj9�u:�����C��{$���      �   �   x���An�0@ѵ9��3c�!r6@RAH��l�K����zs��hT�JU7h4�/K~��pՎ�����=m^E�q+���g�_B$I/�YH���}�^�	�	!X�~��R�0�2�Yx�� �'���@�>�պTEֹ�ө�M׺1���d+�c�L� KM��3����x�kά��Wg�����뱑�F��q��5��f�@*�,�g���S��
6{Q�      �   1   x��� 0���0MԪ�t�9��A�0���q����v�GMO�ޑ��X      Q   f  x���;�� �9E.0`��Q�(��������'Q����iV��7�����*���w��b���Θ ��ʄۭf��u�ɛ�M���4^1�BzE�jo-�����<��}��.-�C=F�q�&�G��v��@�k��C�S�����8�0�]-B�3��Š��3R�Y�<�GL��0|��� ��-�y�a�!��3��ܸ�1�&y^~��Q0zg�ܧ2[[$9Ċ�����e�>���%�[�X�k�T���C�y[��E�כzP�=΄���>j�T����rf�cR�ga��ma�U`o�fkO�R�䇲�/�'�|xoF��U{�%�_���;7�ɾ�Zo��r�	�v6      y   6   x���  �����p�B�u ,?������OŰ�i'e��<%�M�g�	)      S   �   x���A
�0D��)r%�&FwBץp��W#�&U{�.�҂]�z�0/B�CZ�R�D�*���v�0�r�Z�Δ�A��P+�;2=��<�7��!~�)D?1�x@Eq�Y�2�B)�i^��`��m���m ���M�i��xt��7�Uo�d�}r����4�X!��!�a�      U      x������ � �      {      x������ � �      E      x������ � �      o      x������ � �     
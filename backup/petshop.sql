PGDMP                     
    {            petshop    14.8    14.8 '               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    25320    petshop    DATABASE     k   CREATE DATABASE petshop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.utf8';
    DROP DATABASE petshop;
                aluno    false            �            1259    41786    appointments    TABLE     �  CREATE TABLE public.appointments (
    id bigint NOT NULL,
    performed_date date,
    schedule_date date NOT NULL,
    services character varying(255) NOT NULL,
    status character varying(255),
    total double precision,
    dog_id bigint NOT NULL,
    user_id bigint NOT NULL,
    CONSTRAINT appointments_status_check CHECK (((status)::text = ANY ((ARRAY['SCHEDULED'::character varying, 'COMPLETED'::character varying, 'CANCELED'::character varying])::text[])))
);
     DROP TABLE public.appointments;
       public         heap    aluno    false            �            1259    41785    appointments_id_seq    SEQUENCE     |   CREATE SEQUENCE public.appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.appointments_id_seq;
       public          aluno    false    216                       0    0    appointments_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;
          public          aluno    false    215            �            1259    33575    dogs    TABLE     }  CREATE TABLE public.dogs (
    id bigint NOT NULL,
    breed character varying(255) NOT NULL,
    image bytea,
    name character varying(255) NOT NULL,
    size character varying(255),
    user_id bigint NOT NULL,
    CONSTRAINT dogs_size_check CHECK (((size)::text = ANY ((ARRAY['SMALL'::character varying, 'MEDIUM'::character varying, 'LARGE'::character varying])::text[])))
);
    DROP TABLE public.dogs;
       public         heap    aluno    false            �            1259    33574    dogs_id_seq    SEQUENCE     t   CREATE SEQUENCE public.dogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.dogs_id_seq;
       public          aluno    false    214                       0    0    dogs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.dogs_id_seq OWNED BY public.dogs.id;
          public          aluno    false    213            �            1259    25340    services    TABLE     �   CREATE TABLE public.services (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(38,2) NOT NULL
);
    DROP TABLE public.services;
       public         heap    aluno    false            �            1259    25339    services_id_seq    SEQUENCE     x   CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.services_id_seq;
       public          aluno    false    210                       0    0    services_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;
          public          aluno    false    209            �            1259    25347    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    birth_date date NOT NULL,
    cpf character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    login character varying(255),
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    permission character varying(255),
    phone character varying(255),
    confirmation_token character varying(255),
    confirmed character varying(255),
    CONSTRAINT users_confirmed_check CHECK (((confirmed)::text = ANY ((ARRAY['NOT_CONFIRMED'::character varying, 'CONFIRMED'::character varying])::text[]))),
    CONSTRAINT users_permission_check CHECK (((permission)::text = ANY ((ARRAY['USER'::character varying, 'ADMIN'::character varying])::text[])))
);
    DROP TABLE public.users;
       public         heap    aluno    false            �            1259    25346    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          aluno    false    212                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          aluno    false    211            q           2604    41789    appointments id    DEFAULT     r   ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);
 >   ALTER TABLE public.appointments ALTER COLUMN id DROP DEFAULT;
       public          aluno    false    215    216    216            o           2604    33578    dogs id    DEFAULT     b   ALTER TABLE ONLY public.dogs ALTER COLUMN id SET DEFAULT nextval('public.dogs_id_seq'::regclass);
 6   ALTER TABLE public.dogs ALTER COLUMN id DROP DEFAULT;
       public          aluno    false    213    214    214            k           2604    25343    services id    DEFAULT     j   ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);
 :   ALTER TABLE public.services ALTER COLUMN id DROP DEFAULT;
       public          aluno    false    209    210    210            l           2604    25350    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          aluno    false    211    212    212                       2613    33563    33563    BLOB     &   SELECT pg_catalog.lo_create('33563');
 &   SELECT pg_catalog.lo_unlink('33563');
                aluno    false                       2613    33564    33564    BLOB     &   SELECT pg_catalog.lo_create('33564');
 &   SELECT pg_catalog.lo_unlink('33564');
                aluno    false                       2613    33565    33565    BLOB     &   SELECT pg_catalog.lo_create('33565');
 &   SELECT pg_catalog.lo_unlink('33565');
                aluno    false                      0    41786    appointments 
   TABLE DATA           s   COPY public.appointments (id, performed_date, schedule_date, services, status, total, dog_id, user_id) FROM stdin;
    public          aluno    false    216   ,                 0    33575    dogs 
   TABLE DATA           E   COPY public.dogs (id, breed, image, name, size, user_id) FROM stdin;
    public          aluno    false    214   �,       
          0    25340    services 
   TABLE DATA           3   COPY public.services (id, name, price) FROM stdin;
    public          aluno    false    210   #-                 0    25347    users 
   TABLE DATA           �   COPY public.users (id, birth_date, cpf, email, login, name, password, permission, phone, confirmation_token, confirmed) FROM stdin;
    public          aluno    false    212   �-                  0    0    appointments_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.appointments_id_seq', 23, true);
          public          aluno    false    215                        0    0    dogs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.dogs_id_seq', 11, true);
          public          aluno    false    213            !           0    0    services_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.services_id_seq', 8, true);
          public          aluno    false    209            "           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 14, true);
          public          aluno    false    211                      0    0    BLOBS    BLOBS                             false   �/       z           2606    41794    appointments appointments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_pkey;
       public            aluno    false    216            x           2606    33583    dogs dogs_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.dogs
    ADD CONSTRAINT dogs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.dogs DROP CONSTRAINT dogs_pkey;
       public            aluno    false    214            t           2606    25345    services services_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.services DROP CONSTRAINT services_pkey;
       public            aluno    false    210            v           2606    25355    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            aluno    false    212            }           2606    41800 (   appointments fk886ced1atxgvnf1o3oxtj5m4s    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk886ced1atxgvnf1o3oxtj5m4s FOREIGN KEY (user_id) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.appointments DROP CONSTRAINT fk886ced1atxgvnf1o3oxtj5m4s;
       public          aluno    false    3190    216    212            |           2606    41795 '   appointments fkl1wq1xjkrxuih3e4q9koccrp    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fkl1wq1xjkrxuih3e4q9koccrp FOREIGN KEY (dog_id) REFERENCES public.dogs(id);
 Q   ALTER TABLE ONLY public.appointments DROP CONSTRAINT fkl1wq1xjkrxuih3e4q9koccrp;
       public          aluno    false    214    3192    216            {           2606    33594     dogs fksk4f0m5le3o4n8mjugyribthu    FK CONSTRAINT        ALTER TABLE ONLY public.dogs
    ADD CONSTRAINT fksk4f0m5le3o4n8mjugyribthu FOREIGN KEY (user_id) REFERENCES public.users(id);
 J   ALTER TABLE ONLY public.dogs DROP CONSTRAINT fksk4f0m5le3o4n8mjugyribthu;
       public          aluno    false    3190    212    214                  x�]�K�0D��Y���$k���J��?�J�ˋ���B $꙼�*�Kq������V&�4(_��ͽ|��R��4��?$p,OV��U�}6МJi��d�S	"v�C����9(�6�?"��7/9         k   x�����K�H-����ϫ��u���4��H,.�/Rp�I�=�8� #�(3���1����� �&�4��r���|N_W�P_�CL�%�y�P3�b���� ��(      
   �   x�]�1�0��9EN���v����P�F�qI�!$������f��m���v#�gz0��+8p@�P�~��<@mT�E[t=C�{�_/R��#T���[{����y^/�T���7��@�	���"ˎ�HWP�|���H�O�� u�B���;�         �  x���M�A�ϝ_�Q5tW�w����u=R�#&#��o�:�#EW1Ӈ�߷��Q�T������T֫�xXL�F���f��x��]����\_���$�D@-�Rݔ����u���q�Y�^�i����zl�i7��w�n�C?\߉�_����"ZB,H|�L�H�
���Ln�y�r�o�O�;b��-[r��-��Pns�[�:1�g2|����Θf$�Y��lVvIjL�Dbq{������	���} �)0Oj@�E(��%PM��G�<�i��ZwS���3�i����)���_d�0n%ُZ�S"0���
1F�[�٤�.�G�D�D�Z����s���Nm��	�I��lSL���T��H,�b��2����d�K31����i�!<E�!�r���1�J�9rq6��qp[ұ�[i��4 ?�a����:�x�f��O��1         �   =   x�3400�w�7�4267401��**�,�p�s�+�L�4	�t��)s��	�H+0��*H �MU      �   =   x�3400�w�7�4267401��**�,�p�s�+�L�4	�t��)s��	�H+0��*H �MU      �   $   x�sNL��/*��H,.�/�u�I�M��5��*H �e
!          
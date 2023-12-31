PGDMP                  	    {            pegawai    16.0    16.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    22241    pegawai    DATABASE     �   CREATE DATABASE pegawai WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE pegawai;
                postgres    false            O           1247    22256    Jabatan    TYPE     o   CREATE TYPE public."Jabatan" AS ENUM (
    'pegawai',
    'kaban',
    'sekban',
    'kabag',
    'kasubag'
);
    DROP TYPE public."Jabatan";
       public          postgres    false            �            1259    22267    Bidang    TABLE     �   CREATE TABLE public."Bidang" (
    id text NOT NULL,
    nama_bidang text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);
    DROP TABLE public."Bidang";
       public         heap    postgres    false            �            1259    22283    Golongan    TABLE     �   CREATE TABLE public."Golongan" (
    id text NOT NULL,
    nama_golongan text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);
    DROP TABLE public."Golongan";
       public         heap    postgres    false            �            1259    22275    Pangkat    TABLE     �   CREATE TABLE public."Pangkat" (
    id text NOT NULL,
    nama_pangkat text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);
    DROP TABLE public."Pangkat";
       public         heap    postgres    false            �            1259    22291    Pegawai    TABLE     �  CREATE TABLE public."Pegawai" (
    id text NOT NULL,
    nip character varying(18),
    jenis_pegawai character varying(10),
    name character varying(100) NOT NULL,
    tempat_lahir character varying(200) NOT NULL,
    tanggal_lahir character varying(11) NOT NULL,
    nama_jabatan public."Jabatan" DEFAULT 'pegawai'::public."Jabatan" NOT NULL,
    jabatan text,
    initial_jabatan character varying(100),
    masa_kerja_golongan character varying(50),
    diklat text,
    pendidikan character varying(200),
    no_sk text,
    no_rekening text,
    nama_rekening character varying(100),
    umur integer NOT NULL,
    jenis_kelamin character varying(10) NOT NULL,
    agama character varying(10) NOT NULL,
    kenaikan_pangkat character varying(100),
    batas_pensiun integer,
    foto text,
    url text,
    "bidangId" text,
    "pangkatId" text,
    "golonganId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);
    DROP TABLE public."Pegawai";
       public         heap    postgres    false    847    847            �            1259    22244    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false                      0    22267    Bidang 
   TABLE DATA           M   COPY public."Bidang" (id, nama_bidang, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   �        	          0    22283    Golongan 
   TABLE DATA           Q   COPY public."Golongan" (id, nama_golongan, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   #                 0    22275    Pangkat 
   TABLE DATA           O   COPY public."Pangkat" (id, nama_pangkat, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    217   a%       
          0    22291    Pegawai 
   TABLE DATA           [  COPY public."Pegawai" (id, nip, jenis_pegawai, name, tempat_lahir, tanggal_lahir, nama_jabatan, jabatan, initial_jabatan, masa_kerja_golongan, diklat, pendidikan, no_sk, no_rekening, nama_rekening, umur, jenis_kelamin, agama, kenaikan_pangkat, batas_pensiun, foto, url, "bidangId", "pangkatId", "golonganId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    219   �'                 0    22244    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    215   ��       m           2606    22274    Bidang Bidang_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Bidang"
    ADD CONSTRAINT "Bidang_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Bidang" DROP CONSTRAINT "Bidang_pkey";
       public            postgres    false    216            q           2606    22290    Golongan Golongan_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Golongan"
    ADD CONSTRAINT "Golongan_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Golongan" DROP CONSTRAINT "Golongan_pkey";
       public            postgres    false    218            o           2606    22282    Pangkat Pangkat_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Pangkat"
    ADD CONSTRAINT "Pangkat_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Pangkat" DROP CONSTRAINT "Pangkat_pkey";
       public            postgres    false    217            s           2606    22299    Pegawai Pegawai_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Pegawai"
    ADD CONSTRAINT "Pegawai_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Pegawai" DROP CONSTRAINT "Pegawai_pkey";
       public            postgres    false    219            k           2606    22252 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    215            t           2606    22300    Pegawai Pegawai_bidangId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pegawai"
    ADD CONSTRAINT "Pegawai_bidangId_fkey" FOREIGN KEY ("bidangId") REFERENCES public."Bidang"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Pegawai" DROP CONSTRAINT "Pegawai_bidangId_fkey";
       public          postgres    false    4717    219    216            u           2606    22310    Pegawai Pegawai_golonganId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pegawai"
    ADD CONSTRAINT "Pegawai_golonganId_fkey" FOREIGN KEY ("golonganId") REFERENCES public."Golongan"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Pegawai" DROP CONSTRAINT "Pegawai_golonganId_fkey";
       public          postgres    false    218    4721    219            v           2606    22305    Pegawai Pegawai_pangkatId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pegawai"
    ADD CONSTRAINT "Pegawai_pangkatId_fkey" FOREIGN KEY ("pangkatId") REFERENCES public."Pangkat"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 L   ALTER TABLE ONLY public."Pegawai" DROP CONSTRAINT "Pegawai_pangkatId_fkey";
       public          postgres    false    219    4719    217               H  x���;k1��ѯ�2)n�}�1���aq6]=�%xb�v�-	yx�b��{4֑'��Qq6Bn� ��K�wW�����f�Ԟ'��`�n0��3�_����16��|c�
��A�\�Dro��r�>\]_���w���"�6�f�Y�3�ٶ�Ď	Ē�ઇ�AR�����͛?�ߞ����!n���%4f�� -#��|w�$�/%M�������z�X;������Tˈ����s-�j[t��b�ݏ�w��R��tLi97-�5�e#��g5
H�T<e�57_����<���p.�q��|G��D�l��-����k��L����q�iXcƏ�p�T�(G�	��2⭡����0]\]_��5f|T�-��	$���)b���rw������0O���\�e�&-�ZcvJv����ÿjF��J��$�I-X��&�����3g�9'���;<<�W=��^c�8�)$����p܋|z#��q�V��tX�oi��q��F�2il%�<x)�Z{K���v���]���؄Mw6�p��OV�Nb�(�a�麽��>-�q��<f��;c�w_n      	   A  x��TAnU1\7��0rb'��@Bb;6q�Tj�w���+�?�]4z��G.�y��;"h7��Z!��t��n�������h7	���	ә���$!���� 9+t�Z��Ճ�]������v9���I�)����������3��	�5����g��l9��@���4�:��t?dK���?���z�W�,�TS#���[��.@�P���T-2�L=��^��e9�h�~ﭛ�<��yow�����7��"7�	��z�5�PA�:c��[)����{�?�O����@r= �P����09V�i���L��׀W�B��B��6F��(����U�{&�Vq����ڈ�wX�9p	��`�dy��4��Kl^��?�`\W9�A9b�>�2�6��X�ӛw�_�I�p`���8��k��-nG��ˑȚ~��&�u��(Ʋ����B+�F��YZn4s�!�ż)��)��:o�,׼�ʺ�ڰ�DĖ�Œk��1"�0�b�`���2a]��M�:+�s7�iS�$a�>���ql�A+�K^�!����u����T��7!��]�`         *  x�mT;�e)��U��e�6����t4	��%���/!:!Y2�����K+@�'h�8M��eM������Q�T���ayU~Q�a�0m]À�2P#�>�����j��Jy!ݰDR֪y@V
��6�B�c�e�C�����m��x�]�P�%����M�z�}�������ez��`I��"g�=��g.,�e�m\<�?�x�$�X}W����W�1K[�삂'��D~1ްԬ�� r�Z���X��}��5�K.5߰d�Kr�Ε)4
��PP�GE�0��%zRnX�R��pEmH��y�c����x����ݰ`d/���qT��`�`$�]7a<W�c�aPnXr��y0�0=�k��ұ���5?4,�S��>g0�h�ۄ�m/�_s�wyd}�4"P�������]AH��b����y�(���l4W/*��87h����=[gc.��BX9-�1�6�ȺY�F�Gk�#o�<O2���RG�iY'��`��B��\&��:Ǿ���v&~�K}��^��Ï�Q⟈�BE��F\�|Q^T��g�)��-��2?/M      
      x���r�H�.|�|
\�6�`ž�����Iv�jf.����M�dv������ȅm,͙n�DA� ��p�|��r˃�����>T�z�౒�z��1g$5LrJe�R��x��;=�.Gӫ�,�:�>}�'?e����S�b�i~�>;}x����o'�&{7�i^���������n~�����q~�<���?|��}v����O����j�(ᔳ��i�y���q�3R{������O��������*+n�{�7���{�Mn��Y�f����G�4ˮ�g���O�g����?��;f����e�9�����/iz�F��ӭ��59�ge%t�2�N�g�P�ɂӇ||��������oJ�����HQJ�������X%ht>W1O$�Xq�J����<�B�"I$�%)���J�e媂[��[!+M���H-�J9R:j�+����Ba<��kx��5yD͑2T�C���<%�T����`%J+�p��d�S�����r��.�O�q>8���N�=��ZF�"T�{#n�����������i�prRA� �r L5[�tKh-���-��ţ�c!]�<�>�|�g�,���o Mo��?��ǫ'q�(����G���0<W���M�%�;��_=>�{v�x~����Y�o<U-�gy6��fӳ��<����Ldg� ��?DE[�nK�~�y~(�c��{"�<�R�־�ZJ<��G�"�A�h��E0i�J�PJ��� �b�؊[�t�j渔���JJ�����+bo����28g4ȩ.�tE�H
��H	c�R�<�o���"�ݑr �6z�)��D��+�$�0�*�c%�g\0x�E��Z������w���=����VR����px���[�����ď��<c���Ζ����=���,�k��	w^��q �E(ceQQ�9��t��W�L����S�ZP�Ei`��2�"�1x����ҽB�X�J�<��U�"(2�U�=5��@�BXR2��!�)�jʃ�LQ��|8�_��>�J� ��� ��D4\�XE�7v�F�����ד��Ԩ����O������9���ֶ(�����lzr1\��mqX�{
��X(r�P,,T~3���cz5:9ϧ�|����߃�ڥP4�ySj�������v�SC�d�"p8��u�HZ!I)��*x�1� �����@"�^i�5ܡg*+�ny�*
�r�2�����*���<�D�.�rFֵ�k^ LKZ�R0�j��1����R><�\<�F�(�c���lˎJhk��a�8�Anh���A6���<�YP����� &��.���iK_(|K�'+U�p+_H�J�,
������~](�V�
Of�$� � A�1$w�0joi)�����M�%R��(+�J=�ǣ���}�<��v�� "��>���^�;�k���z%W a��l��q���zs���ߗ'��&'�����������ޟ�;�?�/N������C���N�"����ojt1����CU�Z
� )/�D���`�+5�D����R��w�
L�6�j8�`�EM`*��ʔ�_<Qk_�8�~u��)v��� &[c
��n�@�*a5+a� [P��T�6�>>f��l
��r�{~�Svv�[����h@�7 ��y~�-]��F�?����}�
��_����}�c��K��}���W����g1��ȶ  ���۾o��qkDfz����o]�������� �
��6¬��*A�v�߃��p�#����ӳF���<Ֆ��,�GS J��*�y�p.y�+[��H%��\�
ޗ��&��(@L4UQk�+�U/J�Aw+��2Ɓ]Q2�����@HBOZ��Ԟ���(,"#
J%�w�]a�]r>pnD�	2v�1��#Z	�r36в->�ҧ̦�D��	�2ɦ�8��x�t٭�:��6]�C�n[-�m� B�*V\ �C��SdB3_�Ԙ���Tʃѭ 8�Ia�/5U�e�h�6Y+�Y�1ɘ#P舾+g�i����<8����!�3�������$;���M��I��~��cP�lm��g���cp<`s<��Gؾ�=�Fx�/�oݭ��J�L�&�L��>��s �&�kl�偨,+C���@*ǹ�*KP�,ƫ[�����5H|����������񅽨�wAy"��H�#av]q(� ��0����	ad��6ZP�U@��T2�q���e������᪶��]�Q�~|j�A� �i�jt�4� >� ,p_�Z����#����N_>���pĂK��d�Z�Gfki?���=/�eUD-�-�:!oܵ����ɿ��--��,�����&��k"&� ��
Fe۽��.4�))�����) S�+�.�BH��	JZ��+��
4:��Qa}QF�J�o�G�b����`�y�� h���,8��T[�ITm�{���,���J~>͏$��n��(|+�LT�4j�s�� �������Z�4]�Oj5��p�����g�.@��9{��!Хt���E��"�$�QM(h���E������
kbC�ݒ�j����є��&z^�����>dmE@_�=� �yOTΆ
\K��`����ᩱB��dSЎ>b ���wlHUYT֒/*@b��U�d�d]��X#��wٻk��������կ�_[(� xǎ7���ƳU�im+Qhh�CvX�F=���(��4`�+��ޟ	���1p�U%*�9�$+jo��,A~RV(�p�z ��p	/��7�u]��*
S�gj������р0�4*�x%�)�sB�u鼍����d�?f`���ϳ�,?<��ڃ��b�ט�[pPU�<k�p��਍5�aP���P"���p����BJ��V�a�M�0�	���G���d�s�j�)���*��M�܁U��P��mw���<pt�-�eRIUԃ{M����m�LZ᫢v��G��^Te�)�a(�&x}�(]I0�U՘/ �`�����2�TG	ή��|���嗽i�<�*�	o��:P�������(�꠼m`��j1�%��\��n2ه���w�l�N�����<ԯ���9>k�MP`�������?�*�����
V��-:�+����5��*+�x	�Δ���ת��.j�AG��ނi-��=D,��$�O-� �T��媐)�N֚J���
�H�V��$I༅"(  N틡��>9����Oz��ǈ��VZ�
���=��8���w��|/� a��|G������͕�Ŵ����¸��?n^P�;_����4��Y!�D�iT�퀪�o��}�y�W��)�MS4��Yb��� �<>˗�b��<|���6@;�fG�x�(xAPe+�R����N��L�!'��Mm���Ls8l���B��W���I`�P4T�T�֍��˘F�A����Q6�n$��L�B�O�Bԭl�x!��۱��O��Q���R�av���^��*��DF�1��\����&uB20i����[�1�a��� wt���b,�5 �����0�=����p�tr'�<�\��W�p����Gx��q�"0���!0����1�;+W&���_U���T����r�,�)jѤ�]���WրҨJ�L̪�x6Kp��VH�^x�5�
Α�c�5�L�1���>�R���M�%lTv}���~��zp9g�H���<��1����']� oщC��J|����)�����G���I24|H�!@��h���ӱ���g6�� �������O�^���B{��!x ��Hбa�8ەy�t��`�/r�EA�I)Al������W�J@�e�D,��Ɠ�7�O���c2�ez�L����7�6g��D���G�!x�3��y����G���H	x�^*�UL��U`Z8�Q�	Ƹ�H)�LZ!-��fI���8�ȭ6%)K
�4<���Ҁ@    �
�HQ��L̪R�é���(��X�tv3\����ů|�^��?#��7bh�r�Z+�M����{�wc yo�z�v���ʚ��Oh�,���Y�x��JEŨ/�e̫�Z�PB��BR��-�z�� �1FLA8�ŕ�W�2�\i�x�c!�r(��; ׌�eq������J�����
��5w��?�Q>�Zd�g��<�5����T]N���qK(D�4
������
�a7+�����J�2�2�"a����j9~������9�%G`�̐ ���9�,�f�	�^��;�m_| �TR��V�|g73�zC"~��z~x�}��w�Aӂ	uU`t��U�m�mPN��*
]2 ��z�7�׶
	�T�
_SA��w�H�z�|�"���Q�SG��(�NYb�� ���'�P�	-R:��d�ӱ,� ��Qn&��㟟���Q�*��e �&��z��[8~�m�k�7E�D�m����ޑ�F����M�ה�����ɠ���2ȇ��sD��%c�����hB���XM'��������O�%�?g���~�`�V�8T�����`�o��\� w�w��[����n��u�$�����%R̩C�v�Hm���3.������C*\���W|Ws%�B�
I��g\I8��p��1�1 `�5hjl���h4����P%�`�{�9�P��n�r�W�l���̬Z�4��*j_����P9pIi\���(�.J�4��P՚�B�%xm� ,��- O�	����,��k�I�G�,4	�Ј�X�(KL�2�� c]���l!��<�|բ~����դ�B��7��1ߪB,�i�4��.�}�(7p��M��	!=5{��m��y�dl'�"+~
�OpN�S�P�5��Ć�F��,\Ƿ�eKʕ�[���*�����%+���@�Ɖ��DaQ�xUG�A��fP#M���O��ō�&Ly�Jtm���ZXh�|X��|A��Y{��U�2�� �ܖ	�^+c51¶���D��m�1����BR��-�+�>�″��"�ObaV��
c��F���
 �`�B�rWݤ�Gӫ<��l�bt��0�_�K~5/��!�ZN�*v�Y ���Vx�n
���#V\8�M �?�囊ȭov��6� �����$"F�k����?�G���`?��*!�f%�O�R�#�u51����#v�+��E��s���8��
LD��ҁsoYt>�६�T��v��eu������1 (%��@SjDG��e���߂�+��l �߻��C�7 ��.RF��5OCR�*��x�5R�����/�����]���/:��tojx���+OyU��2h��J�U�h�U*d�VH�pO�[��.�E���?�X�h�6e���A�p[�w`�џ��6�A�� 0���I�@a�����n���RW�
�����aH_,[�a�z�u����V��X-��d������A�.�\[��Ԅb���K���=�����E �ǔ1�����N%3$���� �R�h�1 �ڒ�� :�<T�d��e?�;���0��T����=�Vb%�`&�-�t���dT����l�w���u1& �@����rө���g�ϲLR1�#z�� |3��� oLx��x�Kz �>�6w�Ŕ����bzoY#A��\���`��d�����fO@��m�w�1�:�Mϼ��4 �Fd�U�z�����S��߰��&Xm�~���#X�ڲP�B�Læ�R
���"%X��·-m����UΪ��D<��SH��(8 �
�����|8�]��e G|mڅ�f��鴹u��ۑ��_Z�����X$������n?��>���g���}�+8{t�/�D4��p�l��*E�*�%B��sa�Ъ��,?��-�����9���]
����ʳ�ö((<8d;�T�;���8��P���	p�(͊�

#^?`I+�p98����q��S���K�q��X�Pb+f%��0�y�u[� i�Oγ�&�yv��~�_�ՙ�����꺚6K��@β��AT��6�'����q�kL(U�h���y�>����^ŭ��.~��;����[>��?����Ng����ա���F`W������y	ޭ K��\A+�X�,)ve�6Z��ئ���\�:J�Yk����(�#�B������^���0PD[�De;f¨DU�P�(��ƆM>??Fwh4�·M1�v]�e��ć���i����6t�E��F�W񱘃w�-+����SMז��rͤ��@v'E��8V���IZ!)��v2��>�d�3h�x��pGZ_`�>4x@�בh��cQ󁦷��_��u[��BDI�$m���-864�7��vi��[Z=�7�[��e��N4m�_G���SplJ��(�38=VËs st�H��KZ!�]xS�?���<2/��,���6R�iih�U����h�E�tYF0�g�9�������+�-�u+������3�{��޻�����ֶn��ߪ�m����/0Kݬ��Y�{ ?�2�jx�`UQ�RpQ�(�}��IZ���97شǣ�V�0�7��a��U�`s*jE�1j5emn�|�{�W����e=�f���֓��n�Z��k�-�,�"�W�� BH��:P���%X
�\��3%��Eޒ�q�:|�k�=j�c'CI���*�sC��T��? |�aH�?5�ׄ6�e	ȹ��ArW����V�.Ϻ���\PPVij�������I+$���0�;z te��"�`y���' O��%� [4+uU�-����������0�@}'Y~���a��]Z�C�_���&�ev�]��p,Z]��s�O��D��S.,�+�, X��O�J=�M��DEg�W
p�
IQ��,P��a��;��.�V�	b�d���u�N��>�~�5���f� �NN''ٻ_G�MF J��S��M�h�XIQ#��ۅ{S']�h\�o���i~��������V���2��'����5�W+&�W��y��U�1@��	�w�RȞ���&b<KU��#� |%e�vK(dOY!	t��x�ޫk���#v;`D�{F\YB+O������)�)�(�Z,�DCA�ή�+����i����U]����f��,fRm�)��]4�;�i��
v��Ƞ�JZE�u�H0TI+�x��9^rS�h2fᱨ��q"'苙�� �Xp���s�K�Fp���}�����Ok�`��
�.�j
�P���~L&�[b�E;�.!����]�{t��E�8aߪ��R	S(��ځ諾�zDF��P;M��^�lDsm݀vz�����e#�ʘ?}�8��oo�ӝ?7�i�'֨1���jW�D���j��2;&�a�yIS:�3��=+�p���Gf���fM�*�:�����������&��ʵQy8��n��7�,"��Er���r����W��/7�/�����>��_|��cq^���Y��#��7�{^1!�Rp5G*J_N:�ULh�NZ�3��18�CٷV(��"܍�D"s�x������NR{?>��mz����l�����Tl��m�����j'��c����&��垬�¬7�I�����(��/���%l�+)�X!�)ᅔ�aݖ>��hAq��
�T%fcx�`L4�zg*�tݤ�=��R��{_�!X��d��y>j|��E�����9n��-Ǜ[�;�'��}��_��ǚMx���!c��S/-��X3b��Þ�BR_�[�-@h�<�TܒP0��,�[- �J/��j��Bo�Ke٤-���Y�O��˶ˉ)-�np�.��}�v͓�al	u�SW�c��WF+�����6��T2T�0��	�.i����7�-JqDA�p�}>����`�D���0Z��[e��O0T5-�k�Ώ��d�i��M������>���W�:����f�~����3����Ev��մ�̢���$m��M�"���G�zo8������Udܗ:�.MI+�U4��c��&-F�A�\Ӿ���� '#5����    �N5����{���O��1�	LN?<�<�������5t���	�N�;���g7��̤Z��"8}��Y"�`;�߅-�H	�*�ޕؚ��񴴑R��KȐ'��5-x[͑�qs �*%c�����88 8�	�ŕr����S����tevr}y>��ϳ���|����t�����F�?���yZ���D�1�����
l:9p��H�fs�� �#m�Q�ij���88Yr��	U`I+�p�C�#b%��"R�}�B�I��D�c��`�tQ.�1��E� �L�&���,?�]����:��	�͜�ϒH�l۞l�
l��o3��7>!����)��r�^�P#�3����o�啈��J%��V��fQt9�,�g�$��} wJRȀ웅���x�_Gf�<���sdX�QV���H����^�j�:y/�+dQ�[D�V'7n��ϞL7i�
�t�3%��P�R�'h�V�2Q%T['��D��@F�B���!U8��H`���I�Jk�� ����`���)���G����aR[��`H��G*7c*i�d0r#92ㆺ�������b�T��q����S�曶�^/���Nx��t�¼@�υ�X�>$u�U�J�=�VHJ�&g����i)58��DJ��� (9�h��0V�3m�A��C�@s6�������{�������[�M����p�N@�mc�e��*uPwl�����#v(����⃖FPQ�Q�Q(>��d��J��X�sy�bI+�p(U=�&DW�
�CK�G���M�>e�r�WɧF����&�U�B�t:BC�~S��!�����;5�5z u�B6���j8�Zc���`�E�զ�
��2%���Vj+��� ��%�05�,F#�`B1^9Eˆ>�l�)j}j�]~�_-s$g�n�HV��Կ�/���e�����uSG��u�n�٥���n�����U�,)v��*���)��"�6-KV�V9�Tڛ�B��z��w2	608���$�`V%�{e�S
S�-l uM�-�'����}��l���q�	���'��������������� R�UD�sV5�l�LK��%}���d3�v�SroM���k�Al���M��R�I��{�� ��kr�mߎdhƖ؁ͅ#Fqc}'T�SԹ��XOY���,��-Y���v�)|wª��%ͮ�-~�]��f�Ģn�9���b�"����v��a�L�A�`����{$Ǐ�2����^����!ۺ��Ȫ
^pK*��,���b�1�R�߰'T�^�&����c-�xry��cKy;�R�����c�}��P�\�I�fz7���6�Tv@ 6��p�e��V.8�`O����@���BR�W��눒�jJ����ʑ�M���YE@�FD]"� �=\Il��I�KUz	�$�~J�e� � `�J�&��|�HU��ǀ�l�H2�����\�:�6���E�B��V	��`������"�ݑ�v���tC���.�䢢�ioUeXi=hZjp:���`�]
]�
I	��,�S�H8#h	�`���^����]K�f�z�f5�U���ϯ/Ǔ���r�BM+����L}M:��*��S����B}Vn�-��`%���gެ��"��?NQs��`�	�d= �HTY���K�4����>�U����0����n�g����NƲ�D�VS3l�#,���?�ͅ���,����-�U�ޚ��y��_<�u�OJd�y�����ӝܴ�V��T)��-x�gkG@@B�^	���~0�?���+Ƕ�|v�(A$��s�DUqp#�]bQ��k�fנ�	 �w��)r�]vO|��Tg[�_>}u�L�q�{R �!��N�����ب�ڏ/�oU��1r:���\}���O���A?�5�xz5E���Sv��'d�����/��7�3�.r���Q��^!�Y��T�En"��`o%�g u�fe()N���u�Ȫ~Ew�_�ޜ��x�N�O��r��`ɵ]ڰI��e��wWY�������&#����Tt����J�*�A[ni��*��؟�4)�ҒVH2>I�q`�X)s �Ҡ��;Wzbh�x��Ю�QG�1��ځr�z3K��5�H�����&?Ѹu�E2���.����y���P��o����v��k�����2I�VѺ�z��v��:�氤�zA�|H_y	�\��P����t�M"�f��|���!��,VI�X��ל���L��i��Y�&�(n5�����pf��l��X�PȖ��_- [`S���5 ���H_,�̹�G����p�Y��j�Q�*�&��������fpv��q�{rK'&W3),Z��Q�z�=�S�(w�0����E�k*�%c��i�|��fZ�v=��5 Wy�	�ƌ$8"<�a��
����Z���Du~0?9N�a��)�q>͏���:I��#����r�W�j�3��:�v8�;1�ʟ�v����d�����?����(��hЭl�&���p |V��
�KUyG3"�)+���- ԑ����h�$�چa�]R.Ig@9�$j��hF��e�ft�g���U~�g��o-���O5!}+5P3L2��Py�>^�S�c_\ڭt�]pG:8��*)Ns1�BX�GߊK�K�I+�xyb���r0Pxm�pG�eR�����.U�QOAa;�Z��M�B~u	J���|��t��p#�������S���Z��
��rg���ځ��0FR"��^RlTD�ye���ȶb�����]^'�*������W��\c��l�k}�/�|�o� ��a�� ��JF =��Xa�)�G%౤�ҥoٷ0��JT8��F���  �#&��J�X�\m����e�|�.Ov�ӅV��B�	�;Ӭ�N�l��v�p��V�O8]	�w�{Qa-T ���^�м��B.��U��G�M�B3�ͪG���D��>��xL����r��x�A�).6툐w�qw�6q9��9o�At_!��� j<� �	�0���&h0K*��NZ�2o��G��.���2��;H|�_������.̓��;m��χX�pr��w�x�KCÝ]��8��}8�b������&?wg���,	����&�<���D}��r��~�
��QB���U��/�]�V��X��Av-�e�>xΘ��6�������4�d�Y���������q~�!��i3i��y1����u]ѹ7��8Ѝ-�T�\e�0e�c�z�4V�G�1�HY,*���u� �Z;2�[JF��d<����2��P���mm>������C�F��GI��ц^�4��6��=l+�3��0��Y�<�7��j�[d�P�����$���f��ԽXi�����)���8n�h�na#,���y�[��އ���3p�Kl�J�RVHb�L3��ș��kZs �&9�}������Ѿ��Y{O/�y����n�^���S:�&`,cx�	���ɲ�G��_��"9� ���y�>&��ݾ�V�Sh8 'o�� �(�u�)E�I+|��>��l�֪���B'hĪ �S���cG������=����H)w�����񢛧.�_�-� ��y�1o����u��'ܝZ_'���Lr�J��6���}S��>� �C^�Mrr]�,N>�-F�*O��Z�R'5�����}K��偶���/	H?x�^������毀�����Z��V�g��W�.��Z~&�&��ڕ��Z���#lnb=�I"�0�P����ܰ�*����42��u	�ؤ~0���e�B�>bd�,�ո��(<�R�i#��c�c�6���j�]�g�M*�Vg]F5�r�����v^����_�?z�l~>yx��o3�^� ��7�GV-�%���Z�.�4��S�������z�z�]%J?ze����7�I�l���k O 7�b:BPE��w^T��1��'���?3X��=ե���S�xƕ$SE��~=?k�H_���"�}z�����xY�\G`���]C    � ��@/��]t@��e�!�֌4��g�����"��
lj�	v� b��!Jm|��~��MI1#�=J7 �Jr��=�%<�4E,T%]tu������e�����i�[~<�ΰ&��z���'����&[�i7/vqK�SX53�"h����mi���E�
I�o����r��JiK�'�LZJ���]�ҕB[Y�+ѭ�M�.�<�W�M��bR���n^ϕ5����`�A@@�ϱ=�Er���φ��.8_�Q��n�-IN�.c�1�x��#��0�_^�."l���	�����2'��=y��߿��s�/?R`/�(���hP�9RxP_>H�%�>�XOy�Lp1���5�0��pN'�M�<�ě�?�k����n&OrY�J����gu���h9��v��UrA��	��4���*t	/�;!呲�7Q�|���f�b'�H I�AN� f�`9�"��*�� ���9����$N.{���z=i[�R~n%�h�
���M�Xv�R֏��-�]%$lR2�1V䖕�-��	�֔��F;e�O�OLZ!�P�풙�HIf�_tQ+�Y=z!�^Q�8��.1���d9辶=����O�I�Φu�U�!��>����[[��<��Y�=k7�l�%�Ɦ���o��1
��p���ڄ�I+�p��&�n��&P�A �G��0��DP]����bN�X���2;mؗj�����^Zv�W�Qk�Pg?�D�M�zp$Ua�^t%�G���j�2���.)+$!�lJG�w��#�@б�8 ��g���U,j*gƙ�(��IK&��U~y6�}���n�s�~���a�\p:%Ul�;�aȖ�H�V�`�)�dJ��\c㣯�X��W�MY!	�����iˣ����f�E�2C6ϨbI��Uj��#$�����O�n`[s�w��x7�K ��w����S�H����r�=��cT���k� �k<�F� p�jP�	���B�^x���:�3�S�j0$���d<Z2rL���>`�����.�A?��"��-��e_$64�m��6���.2!g�iv��������mA�l�}S��Y�\N�?�I[Yg���r�+i��vf��*.��4B���R����� * ʐ8�����VN��uu�pC;��!�y��y~��r}�ձSI�]K�6�g4;##�����+�0�����S5�`�CO��p���L�h4-*���e�$dJ�V��BMŬ���X-`RSF����X�"�7� ����M*�q�b�h�h~��2���2G�2��W*�l�_�����Ӹ:�N���3�@���mM׺ �:8�;
�;+W��Ѐ-*�y�RWJ)�sc�ו�h�/��ʔ
�~��b�3j�P�aN�y�'}ns�F P�،A�����mƳGd��gx���n%qR�/�w,���:��)�� � �����]�J+�*+/�2��V�Xym(��<ؠ��P�.� #��lB�U�
߰�"����x���,���Wj�~3���/a�@WЀp��j���J'��+�p�sB�Aw�a>��9��o�嬐:�f&UJ�,*�4�@�ָ;KN;K��B��x�x���c8O&�xS�Pq_QZh\�uEw�f�ڭg����8.9�����q�N.��?�Puj6�1>�y}nW,i������R5b��AAi߇������@�w�q�����>Ӣ2�SUh)�� ��O���RV�`�I�C�
�*)�ZP\"ȼ$�:.�r�q8��M��'�>M�����f=9�\x��$�������YW�Ӭ�����bD@��e�0�͆����o�``K�-u�Z,Y�������ʆ��j��1����o"�R�B!�3/a�}QK)�`m�fM	c��F�L,�ˇ�t2���4=Dku2�}ē�]S�p`.�A��}�v�A��-�5������e��;����c(�K�t��#1&}�y���ͬi}��R�HAI�Y"���$HTּt��i�0��Buo����0]��c�!�i!7�R�w�L���OfZsxcb���)�L��.V�8�k�F�Xy�p��7,�b�z�(�/�Q�14Ymu��7c�IBN^�����(��� ܒ�������s�g���HNBa1®�E(��UE�u��ܐѺ^~׵˴)���;iSj�x	��Z*]��0N�"�b���O��3� ����Z�}�#��嬞{��׮t� �������*dv	N7��h��()/(p\0�-�OH������Kd�����2�J^7���U>�J��Ԃ:pi�:��'dӼ�V��w�!��V�*�_�6��4�M�kI�e��bJ�5{�5��#h���_�_�[&Y��-mӡ궻�@5��߳���H`�	����:C�X|&J@+<kj*\�.@/����<�:�_7H6�&E�����ko��_��_6�R1M�|P�y��ԤeYr^�-�A���E�
?�(1��?����
N��g'�p2
�Q�1%5�a���)3\�M���$?�]?/*�a����a��?���'���X��c@�bvk����ZrQ}�����I�>�M�8H�|��&��*i��|�[jg��[p��懰�ˑ�G#=?����P�H��q�D���d��"C��"-�
l�Z�ʗ�Ĭ��%�����sZ̞o�Z"���d����$��8���@�
 rQp�����U�.��"i������%��i$^;��rt<���hHGd8��l߹�q�3���0����l�K,~��2ц��yC腋�ׇ�5$���e9ҁ���*��au<��Ȱ��Ѕ����Yv���]emitCI�
�*����?R� �ЂY0'�!���x����KMimglI�0,���&�{|xZú�Β}}�������k���Q�}��s ��4�7���D���`j�W̍e�[���$���� �H_��U�I�
<+<�'ʐ�S?\��i�<k��f��pIo�G��ߴ��j1���eq�:�K�����"��ȝܟ����ix�+ǐ�������0 7R��%��x߲��HHF�s�����u�
ʣ� �5mR4�nkm�߯���I���Hxy~�9+bapvw�6������|N��Q�8��8�2��J��.]������f^��Ϻ�G�l�H�ZF]�j�UQ8�J�=������8[	���B���e݉ �M�룿M�Z��x�S2�CFT��N��N��9���<l-r���s���H��'�MVvL!�v4�<f�� r0>��6�	�`�0=�H��	D�����W]~awչ}���P�
'J4h� �DU%c�UA;������E\/B�����jӿn�8�b�*g
���VA��~I���:����$Nj�=���*�<h���1��7e��TܛR.�V��g#^�X���3S��g%�q�/lS��GYc��-��9x+օ>���ab�ô��}N��p�n�s&��[���������4��U�/YH�
@K���+���!Qzp��4��B�՛·S*p^]z����J�uB�J��8�����&Ѧ2sqbFHX�$T��^u��V-�'��?�?�y���G�k��_y��(�x�U��:��=�k��`���*^�)5iR�J+j�6�r�^i�Y� ` �#O��NY�3* C��\��i20bHC�'�|<$��>�-�N�6�:� �:����qk��β�������W�d=Q�&��)��m���zheA=/,^��=��ςS �V�[ڰ�Ta2�a<b�\����������)�ᖆ'�vVmQ�sg������8+�:}igm�����5�_�����tV�Pg�T��:@�M��s��}�ESF�9:��!N*�*�x.e�$�����
�6�ZP��K�*Q�]�2
�*_�pq0kz��[�2�W�t�z��w�����Ó��f�8�BR���-}n��{(�������ゞk�I��'�Y��?�*    U��J���T���f�i<-�,� &������V�$A�"�B9i��
��čH��\��8���x�Ҁ�w��s���k�d�b��u�����6)�C/r����C�{*��Q�ε�ɪ}�}�*槉%tk)�~5t x1/�=����s��t���4=���B±�/�6�zk�,��	E�I+$��w(��/��Hr�o���`�!��� ����ȔMY�dvI6��3�d��_����U�fc]��Q�"�G��z$�/*=5s�8��q��*��V6�{�3H���OI��l,��9�{HZ�G�	�x�n9Б�Z�cC�3���=+���.��G6,�+���Cl����{�.f�<I�ծB�x���ߨk��'�C�n���`�nI�M8��1�J@��b�~��+D��*Ƹ��������\�AG�N�('�@��x��Ub
�B��L�����`�&ӓ����#'M�����X .6���-e⋇Hw�=��0��^��P����I]�BGPU	V���`�V�Dg�&�&��T���-�)�J��EEp�	�,jbq&���*^j��n�FW�l��q==�>Prr�
�]z��}��«A�����x;[dX�������K"w_�l���GXN��p���m��ў��=��X��sSz�}E�B�Y��KZ!m>��L#Ϗ�R0i5����O��	�*����d3sn�TŅ[�?֌U��[���F;BK��櫬}C��"ޣ���y��K��5ت����~�jѼD�� ����4n'���-[�'������+�9N� �!0�'ե���U�*��� �^�@t�.���@��Ke@[7�c+�B��h���Ǎda�s=�6��a�ڒ���g���E�JV?�X�=�G%��4��cj;b�mO����R�� z ��Ԉ�q_��~(��3�������*�f�XGv횀���sؖ�zWOp�i��U YUU"ٲ���R���/�M%�Q$��M� �(y P�Qp�Ì;(PR�ee���j�iI&���]������0�����$ߘ�a'YnE뗀����U$p7�����?��|dto��&�_�DnY��P�����	:Ysg��W��%e�[�
Iɼ��͢nlb�*PP�	| �"� 0V�Ԓ�$7���~,�ò�����8Ϧ����*_�j���۶����ؤ�[�"{��Y�2���tYb��t��:<*l�.}\�	By��g;RGn/�@%��[ٔ$*���Ύ(�u� ��;���!�;��Ǆ��x��6c>���'6�F��e%�c����B�,'���-F��c^�N��/&���N�E�M
�7���'��64s�^~�V���Fث�嚿���&E%�e	/�BUP%�N0�U��T�N�
IZ��j�%�9�G��h�s���n��7���)�7"�N]����'x��em,�[��\����_�٤[�۽�*��YkjV�
,��������W�*�����}f�(�q�;��x ��+;���/������Y]���b��~t�~$��~�.���循�ܮkS�K���u�~<� 6��U��:\E۴�鯧���y�rG��H����Rs,�,�̮3�3�x¡�P���E 2����'0y%��ù��1n&4V`�(�^rF_
ek�	�8
	��g��x�0���o��|��x�X��)�g�E��V��8�?�C�F��Lq��B�\���M͈�\���vlq�ĖC~3���~6�:�F��6=o��w�5�6T���M�mQ6R���T-H|)����@dBlC2�ei�f�5}Q��Nj�%P6&��t���vw��ZP�B�5�����8EQ<0e�%*�k��-wKTȚ���uvv}
.QSu�����ǈ�H���&���Q�IAԾy��3Y��jH�&�y���}%�a�@$8�֊�D����)��IZ!���8�Km��H��m�C�"�#�|�K��<+Aߒ
  (V[��B=:꼡4���`�����U����b�J���7prS�=L���i�U��<�Ya~ˏ�uU'u�%�@��R��B��}�|q:�*Z��C|ˑ�]��w\؂����oF�y��&j�I�]�@RM��N
���� �`�%Z��O���eׂ��(A��rd_E6�� �˼�%/YP���*�^ń�^�
I�߇l@�6��+Y\;(48���3������,(wp�����[�^�8���5a4���N�y�	Og������6��I�+�}�m�D`�J�wyt��`ټ�Oa#�.����ؽ�J#}�^�<{$�^)����8wC�]�+�K,�2MEǑ��]e�����o����.�-��n4,h��a���:ѻ3d�5O}��֍�c�3Əm1P��v_݃� .)�/u�����2�8�Q�������_�����)�����bH��
ԙ�S2dc��C�g��F�N�l:�Y�h����?5I��V��o���� oz��e���\��]�8��E��+@�A� �`����\�
�6\-�]·܎���$�&P� �U���`@�����s��5���H����3����kj�_?ƺV?��}��Õ6�7Ҧ�)����`��lr���w�� aqf�~�cJ�}��S젦�����V��i�x%(�J	SI+|M `� ���#��� Gd�@u3c�d,���������v 	)2�v�5�P+A_9)ʤg�T�B� ���򪬐�lF�s7J�
�𠸺�����4�X���0rրu16��ˡg���¢�����rs�=g���L�yo���N.N��%�Lk_b����m�6w;�;ig�� �!�JT,�T�< ��F/j��1h)+$��҄o17G������Cx�}���l���Q�לw��q��o����=�Ys04����"1�ۅ/'�t+1���vAη$N�Lщ�/QjG�j�m:�07���AQJj������$��b� �cU��Z�ْ��r2��4���|{H���RZ[V�Cwz��绪{�U�6��G0=V`U��N���v۸�z�^�_�)� a``�B�Su�"J���&�!9e��N@	�,����AO����(Č�2���JC��ܻ��/&[e�
��3
|v��ٟ�2����{_I%N�����1�HmB�E�
_2�c��Bαtx��X��葖d�ƀ4�J����>8�����t�^z�i��cѨ�V�����e�*��N6
�;���yW!̗�j���3U;�*<��[1��A_���U#F	��N�Ԓ�BR0>��uT��,��:.(?���2<�� �V�*VC���I�Z��?'Y=3v9l�����M��7�/b+�o�MZ����j�����&�6��_�Q�6�|�X�m�|)�8�h�J{�J���U�(���V���SV��z�̑0HYΚ�.䩓���0e�&FY��,T�WJK
xd�\��=|�ʹ��T�9��g_7@w�dS���}���΃�ؽnJ='��^<-��tz?�-h]yX%T�$���Yޒ���.U�XN�]y�����c��
x	[�6D`�����Y?��z�����7IQe};��t�/�Æ�h.���b�N�]�dl�z[g<��bn얪�������t`[aO I+$���NL8f�9=(�{�A��H&$��|TJ" �ފzr�f)&��X3&��$j���k
R�W|���;�v��h
�æt�s�߭�4���/)�H�\U���P���5���|YRPn`�q&����η�∊������ڑ@^Z*�q�93V�N���?~���/���y�]Ƣ��jhH���;s�IAI��ޭjt,�?g�����I�/�HP8���k�^��@�ƪ2(�As� *k�xeiBUu�
I�;^Z䳡vd�3����eGL�6H9;�\�N�Z~[��cp���<�y	Ě�����`;�&�4m�UM�{�w4�Y.#�    Y�p.2S�W[a�'N��JZ�"��N��tdD�8Y�rк��oM��R��\�LO��)E������b��a����S�:/��,�Y%��t�^}v���N${�Y��v���a�w|���Oc�=��zl�^ 圱AP^�Pj�TI�
I�ͷs)�b)�J+ct$�J�p�Ṳ��ei	��W���Z�I�`��>���)�D�#��st(^��-����V�e=�eVf�x�_�%�l��ILTC�s��~�>՞>���K�q��9(-�'+J�x���`/��.a|G�
i�o	0�2 ��xhq���#G��$�yN�c3s3(��Ǟ��OY>������@"1�q����ɽ�; E����ġ��gI�����O�%��m�B��@}U#	 S,l�fT$��y)�GM�T��1�i�>v�W�-��<�ί/�O�����yv���h�&5I^p��p�m�K"���y���u�K_�)L���s��K��(�J��+,��
�k���S����P�X�y�� �[P :�B�i�6Ѷh`�I�?�k���0� ���h��
?����!��h�bL6@:���s�d�>iڳ��P�҂qs?i��b'�	�:i��p���f��"i.XZEq�� I ������QRY3�Ʌ$��m?����Мj��e�����%��lW�p#���:�>uY��9� ,w�nU��Z��ԙ i��+�LR	+$���2d���1����:�`%�.��7z��g��H�l�[�[�·��/�ހ�_��5=�4�ձ��M����fw=H������_4뤙�_�f�X�z���I��q�5�}��`�U���"(	[m/<���ؿB�	s�*$`����*���i}D)��
��Jp|A�M�s �N*e�Ħ��h����α���q<�'Cw�v1��z7;�MvJ���Vh'���Nru{w�sp0[<(g���t���A���=��:eRH�
I�no�*�\��`��� ���.��:}b���h�F���U7BV�-�Op�������ӈA��r����ښ�F��3�
�n�v�I����Ia��l�>���'�I����_?�H�X�l��0�PP�mu��~�w�SnH��z^�=7ٹ]=c%��wt��?�������	5�ƌ���D0���I��y�
I(D��ֆ����B��mj_]��C ���L2mBk!H�ԧ�B�`�4�W�Lߔ�V���WE�M��lz��|ф
!��7����姍Y+�/��C��H�2�w�{ˣ��Ю�� 6�e�����A�l�k�0���zz�ӫdm��;�8�,��6D�"I�>i��c��*&��)U��� ʎyXQC���B�IxMH�N���y�kM]�:��K�ͯNO�8�a���ꬓ�D����_�:t"�=j�3�FYwK"p'��#1�;��p ��ii�[�2�_�\SxB; i�p����@fQ��_KI�_�B��m�m��C��5���덑���Hyq�g�e[=y�=�6!��n��p���V��Y"3�F���?i�6m�\3��d����:c�43l�u��F��c�����{�Iݧ��A:��N��BɔͲR�b4'S�Q,�$�t^��L��`�W|^��	�}�A����#b�
>%%��y�+RdeA��U��
f����� -{磟T~q��~�Y�K�@�H6�{��~L�h\"��Y�á!�Ԛ�Fa`�97S&�j0F5C:br�B�Nk����!����ۣ���n�To.v�[�tu���`������WO�m�ц�cZîjϽmc���	:�OS����l�q+3�?.U�YI�Df�!��
�5܁����rʸ�#s���@�{Y����j7���a<�Vq��Jegg�e��Jou����=�'1z���@AjSvK���e��dF*j2��Ӓ@
Z���+'%$l x����8�O�O]�/���H���'~��Y9��Rg�d,Ǒ1�T�JZi�d`@��a��tq�e���Ͷ�&���Q��j�(�4��S��J��=�k����e�#��t$S��.�BC��x�vh�;��+qϧ\�o�� ����z����{��$�:��[�6>B���Q�����~����6�8;A<*e���C�d
��D�!�&F0���#��m�.��9Ѯ ���UP}Rd+�뛫�+�q�*���.g'��l�z��q�6D~0��)ڱv�;�����~�<�B�*��ya��h`W��k�R
JZ!iGS�O*ln�X3A6�umK⍒�[�J5�ڳ���'��Uv�N�jX�������F:�k2�˺W���r���z
�m�S�\kU!�#�����Umoi��m���w��8L�=,���]@�%+G��pYf
���x��ɋ%���;�"^<���x�܁CZ���NX�Xg��<��׋�"��l���H�w��5��+��Z}'�g$
���ĩ6��dv2[7���������Nn����wH��r�MR�����qnyp�J�q ��޹Z�Q'h"$��d��V���J ��C�XiN�ZQR�)�,8QIfh.������+"v���ќ�Y~�^��ċ��S8i
Ҋ_x�EM��#|<Yw��MR*�j�u�|%!�6�./������/�Mu�2�������5�y�+<ب~H>�f� �Z�Lr�} ]!`�"�����X���utBG��2�غ�L�H$���hҼ?h���!�ˢ6����M��^S��2�[�̊�)n��'����93}<�/�Y!8��0d���+;Г���k��]��MA�ɺ����ux�z%.|CC��}�iyM���IB��BR��1��CA�JZ]�"#./4�Z����Qi���.�}�����'H�6��h?z��s7�U��j�����������&p�AP�E	���`i59����q���l��,�� ~����X��?5�v,H��q\����ˋ�b#z���@���O
7�����w��|���Y�$?~�i���B��P�@"��B9�R�ҥ�k��y��	Tɤ�X�p���Q�y�I��nRpUE�=��Di�}h-�Y����ܬ('�Yvy�a�'1���Rp���B���C���YK�M�fK��v)�K�~r�&��X�A�@+~\�����ÊO3_|^��9�M�`�,�#Qx_�80"U0�t�5�5��j�!w"A{9i�'7�Ij,:W��iKr<��E���v����١<����M�����6����^��C5�*C5|��X��Ju1����d�0.5pp����%��a����N��42��_q�rP�!�����n�D��a��^@�[)5��r�@��x��_&��S��;��Ԝ��BE8�� ���f�����ep���r�V�1l'��<�N�2�}�i���#�8W�����=$cro��A����Jr� �R"Q�T�#5���T`l프`�a�jkI+$��_�3ت���=��8B�<l��H$��i�6��C��^ݻ�N�O�P�$qf'�"__���N���[�a����y��H��]���u��
U���c��
�v];��=D(��'�Ǆvj�
O.��gME��ػZ��8�	��a1w�׈��C�V�9�!����v�g�]�=_���=9�������
4�%�G��C,q]CT��6G����vX��,p��������$���<�=����z�����nJ����/|�����ۗ�RߙV$�c�'�P�qE	�A��r��֒G�Ցת���(��&ఌn\X�m��v��V�+�mm1�PG?�DP��{�jy�%08T���NN3�^�UD���i�fń+�J;1 5�]��7���R|�*�d�0�G����-�u�����N�ʵ-��ѭR$$�I+<���`E�ke5�&�!�J�g��&0���L���$����T�g�WW�/���Vvګ;��
6g8!�f�b������тޏ$٥�a�{���ֵ� 4@�� hmx���[ec���	�}I+$)k=����#����ݐ�dS�a�<������� �9}69[6��"|����\��m��� �  ���!޸�����ړ�Ƌm�u�hF�^�l.�H��g����,%Nхc��n�S����U�j��i�ڮ����ʮz��/���R#f"��`U�?�� ��K,���|������!���v�4�D��Y�Qٌ����@����@�9AL��'����E*����4��"#e%%��e'�d��q�-KZ�AǴc��-�!�b��w�7�Ɲ�? �z6��"�*�EG{
ܶm:l���/�9D�5����pٞ�����vYCg3�5�u���pe�����M�
;I��X�På��ݶ�_р�W��f���JY�	���]|_��N�ӫɫl��vr����L�<g|Dz�b�����w� ��_�\���K�no=�EC���+�Ņg�/�P�Ҧ�怜��\9V��q��?��Z�.�^*,��2S��̌���9��l�!��yn���g�ۨ�C�;�$x�Q��}v||�7d�         �   x�m��	�@ c�
���>�ϩW 0���_�-ǆI�a<ԅ���x�9��1�H���4"���H�C���B85�������5UNomLi�����6�P��'�I~T��O�_D@��F�ޮ���E�������@�,�     
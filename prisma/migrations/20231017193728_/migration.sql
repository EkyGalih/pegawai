-- CreateEnum
CREATE TYPE "Jabatan" AS ENUM ('pegawai', 'kaban', 'sekban', 'kabag', 'kasubag');

-- CreateTable
CREATE TABLE "Bidang" (
    "id" TEXT NOT NULL,
    "nama_bidang" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Bidang_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pangkat" (
    "id" TEXT NOT NULL,
    "nama_pangkat" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pangkat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Golongan" (
    "id" TEXT NOT NULL,
    "nama_golongan" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Golongan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pegawai" (
    "id" TEXT NOT NULL,
    "nip" VARCHAR(18),
    "jenis_pegawai" VARCHAR(10),
    "name" VARCHAR(100) NOT NULL,
    "tempat_lahir" VARCHAR(200) NOT NULL,
    "tanggal_lahir" VARCHAR(11) NOT NULL,
    "nama_jabatan" "Jabatan" NOT NULL DEFAULT 'pegawai',
    "jabatan" TEXT,
    "initial_jabatan" VARCHAR(100),
    "masa_kerja_golongan" VARCHAR(50),
    "diklat" TEXT,
    "pendidikan" VARCHAR(200),
    "no_sk" TEXT,
    "no_rekening" TEXT,
    "nama_rekening" VARCHAR(100),
    "umur" INTEGER NOT NULL,
    "jenis_kelamin" VARCHAR(10) NOT NULL,
    "agama" VARCHAR(10) NOT NULL,
    "kenaikan_pangkat" VARCHAR(100),
    "batas_pensiun" INTEGER,
    "foto" TEXT,
    "url" TEXT,
    "bidangId" TEXT,
    "pangkatId" TEXT,
    "golonganId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pegawai_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Pegawai" ADD CONSTRAINT "Pegawai_bidangId_fkey" FOREIGN KEY ("bidangId") REFERENCES "Bidang"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pegawai" ADD CONSTRAINT "Pegawai_pangkatId_fkey" FOREIGN KEY ("pangkatId") REFERENCES "Pangkat"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pegawai" ADD CONSTRAINT "Pegawai_golonganId_fkey" FOREIGN KEY ("golonganId") REFERENCES "Golongan"("id") ON DELETE SET NULL ON UPDATE CASCADE;

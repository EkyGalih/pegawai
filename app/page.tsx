import Image from "next/image";
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

const getPegawai = async () => {
  const res = await prisma.pegawai.findMany({
    skip: 0,
    take: 9,
    where: {
      jenis_pegawai: 'pns'
    },
    include: {
      Pangkat: true,
      Golongan: true,
      bidang: true,
    },
    orderBy: {
      name: "asc"
    }
  });
  return res;
}

const Home = async () => {
  const pegawais = await getPegawai();

  return (
    <div>
      {pegawais.map((pegawai, index) => (
        <div key={index} className="join join-horizontal">
          <div className="card w-96 bg-base-100 shadow-xl mr-8 mt-8">
            <a href="">
              <Image src={`/images/${pegawai.foto}`} alt="Shoes" width={390} height={100} />
            </a>
            <div className="card-body">
              <h2 className="card-title">
                {pegawai.name}
              </h2>
              <div className="badge badge-primary">{pegawai.Golongan?.nama_golongan + ' - ' + pegawai.Pangkat?.nama_pangkat}</div>
              <p>{pegawai.jabatan}</p>
              <div className="card-actions justify-end">
                <div className="badge badge-info">{pegawai.jenis_pegawai}</div>
                <div className="badge badge-info">{pegawai.nip}</div>
              </div>
            </div>
          </div>
        </div>
      ))}
    </div>
  )
}

export default Home

import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'

const SERVICE1_ORIGIN = process.env.SERVICE1_ORIGIN
const SERVICE2_ORIGIN = process.env.SERVICE2_ORIGIN

export default function Home({data1, data2}) {
  return (
    <div>
      <h1>Docker & ECS hands on</h1>
      <p>data1: {data1}</p>
      <p>data2: {data2}</p>
    </div>
  )
}


export async function getStaticProps() {
  const response1 = await fetch(`${SERVICE1_ORIGIN}/data`);
  const json1 = await response1.json();

  const response2 = await fetch(`${SERVICE2_ORIGIN}/data`);
  const json2 = await response2.json();

  return {
    props: {
      data1: json1.data1,
      data2: json2.data2,
    },
  };
}
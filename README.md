# Tampilan Mobile Propertiku
<div class="row">
  <div class="column">
    <img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/unplash.jpeg"  height="300" width="150">
        <img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/unplash.jpeg"  height="300" width="150">
        <img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/unplash.jpeg"  height="300" width="150">
        <img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/unplash.jpeg"  height="300" width="150">
        <img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/unplash.jpeg"  height="300" width="150">
  </div>
</div>



# SOLID Principle (Python)
Prinsip SOLID pada bahasa pemrograman Python
<ol>
  <li>Single Responsibility Principle (SRP)</li>
  <li>Open-closed Principle (OCP)</li>
  <li>Liskov Substitution Principle (LSP)</li>
  <li>Interface Segregation Principle (ISP)</li>
  <li>Dependecy Inversion Principle (DIP)</li>
</ol>
<br>

## 1. Single Responsibility Principle (SRP)
Setiap class tidak boleh memiliki lebih dari satu tanggung jawab, hanya satu tanggung jawab


> Contoh **implementasi** SRP ✅
<img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/unplash.jpeg"  height="300" width="150"  >

<br>

## 2. Open-closed Principle (OCP)
Penambahan class tidak boleh sampai memodifikasi class yang sudah ada (existing)

> Contoh **pelanggaran** OCP ❌
<img src="https://user-images.githubusercontent.com/43178357/170184230-a51f8028-4d63-45a4-8ccb-5f53369dc883.png">

> Contoh **implementasi** OCP ✅
<img src="https://user-images.githubusercontent.com/43178357/170184396-07b9c8b6-1a86-4add-8c0c-4c506bfbff1d.png" widht:50% height:100% >

<br>

## 3. Liskov Substitution Principle (LSP)
Parent class maupun child class harus dapat mewakili sifat/tingkah laku (method) satu sama lain

> Contoh **pelanggaran** LSP ❌
<img src="https://user-images.githubusercontent.com/43178357/170185777-1333f862-fd96-4dc9-81c3-072a7c3a8983.png">

> Contoh **implementasi** LSP ✅
<img src="https://user-images.githubusercontent.com/43178357/170186171-8f0676dd-e7fb-4f0e-8a92-f091db49f7d9.png">

<br>

## 4. Interface Segregation Principle (ISP)
Class yang merealisasikan (implements) suatu interface, perlu untuk bisa mendeskripsikan semua method abstractnya tanpa terkecuali

> Contoh **pelanggaran** ISP ❌
<img src="https://user-images.githubusercontent.com/43178357/170187279-56883ae5-2778-484f-ab26-df4ac50e7652.png">

> Contoh **implementasi** ISP ✅
<img src="https://user-images.githubusercontent.com/43178357/170187447-a488867e-dcb1-451e-8c8f-cb696b39dd15.png">

<br>

## 5. Dependency Inversionn Principle (ISP)
Modul tingkat tinggi (class yang memiliki relasi dengan class lain) tidak bergantung pada modul tingkat rendah (class yang menjadi referensi class lain), keduanya harus bergantung pada suatu abstraksi (baik itu abstract class atau interface)
Abstraksi tidak bergantung pada detail, sedangkan detail harus bergantung pada abstraksi

> Contoh **pelanggaran** DIP ❌
<img src="https://user-images.githubusercontent.com/43178357/170187838-bb3766bf-cb44-495d-8a8e-3edef6a7deac.png">

> Contoh **implementasi** ISP ✅
<img src="https://user-images.githubusercontent.com/43178357/170187956-119345f6-15a1-4547-be4e-3b2c598db970.png">

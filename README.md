#Kelompok 4 Propertiku
<th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/images/1.png"  height="150" width="250"></th>

<br>
# Tampilan Mobile Propertiku
<table>
  <tr>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/unplash.jpeg"  height="300" width="150"></th>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/propertiku 1.jpeg"  height="300" width="150"></th>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/login.jpeg"  height="300" width="150"></th>
</tr>
  <tr>
    <td>Unplash</td>
    <td>Welcome Page</td>
    <td>Login Page</td>
  </tr>
</table>




<table>
  <tr>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/login_berhasil.jpeg"  height="300" width="150"></th>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/register.jpeg"  height="300" width="150"></th>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/alert_data_register_kosong.jpeg" height="300" width="150"></th>
  </tr>
  <tr>
    <td>Alert Login Berhasil</td>
    <td>Register</td>
    <td>Alert Data tidak boleh kosong</td>
  </tr>
</table>


<table>
  <tr>
        <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/alert_register_berhasil.jpeg"  height="300" width="150"></th>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/home.jpeg"  height="300" width="150"></th>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/formulir_syarat.jpeg"  height="300" width="150"></th>
    </tr>
  <tr>
    <td>Alert Register Berhasil</td>
    <td>Home Page</td>
    <td>Syarat</td>
  </tr>
</table>

<table>
  <tr>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/profile edit.jpeg"  height="300" width="150"></th>
    <th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/notif.jpeg"  height="300" width="150"></th>
  </tr>
  <tr>
    <td>Edit Profile</td>
    <td>Notifikasi</td>
  </tr>
</table>


# SOLID Principle
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
<p> Pada kasus ini users ini setiap bagian memiliki tanggung jawab masing-masing, view untuk menapilkan index(tampilan halaman), ControllerUSers untuk menggunakan logika pada pemrograman seperti tambah, edit, dan hapus. kemudian untuk Users sendiri menampung id,name,email,dan password. </p>
<th><img src="https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/assets/image/single.jpeg"  height="300" width="500"></th>

<br>

## 2. Open-closed Principle (OCP)
Penambahan class tidak boleh sampai memodifikasi class yang sudah ada (existing)

<br>

## 3. Liskov Substitution Principle (LSP)
Parent class maupun child class harus dapat mewakili sifat/tingkah laku (method) satu sama lain


<br>

## 4. Interface Segregation Principle (ISP)
Class yang merealisasikan (implements) suatu interface, perlu untuk bisa mendeskripsikan semua method abstractnya tanpa terkecuali


<br>

## 5. Dependency Inversionn Principle (ISP)
Modul tingkat tinggi (class yang memiliki relasi dengan class lain) tidak bergantung pada modul tingkat rendah (class yang menjadi referensi class lain), keduanya harus bergantung pada suatu abstraksi (baik itu abstract class atau interface)
Abstraksi tidak bergantung pada detail, sedangkan detail harus bergantung pada abstraksi


  
# Navigasi Buttom multi layout
  navigasi menampung index dari page, index tersebut untuk mengarahkan ke page yang diingkan dengan cara meng-klik icon maka akan di arahkan ke page dengan animasi transisi.
https://github.com/Feby-Maulana-Hendrayatno/MOBILE/blob/main/aplikasi_mobile/lib/navigasi_bottom/navigasi.dart
  
# Koneksi Pada API
  disini kami menggunakan koneksi yaitu app_config.dart yang mengembalikan ip/api/ . ketika kita membutuhkan tinggal memanggil kelas AppConfig/ nama api yang akan kita panggil, contohnya login dll. dengan adanya koneksi tersebut jika terjadi perubahan alamat pada api, kami hanya mengganti alamat api pada app_config.dart (tidak perlu mengganti alamat per-page).

# ArdaFuat Showroom v1.0.0

ArdaFuat Showroom, QBCore tabanlı FiveM sunucuları için geliştirilmiş bağımsız bir araç katalog / showroom sistemidir.

Bu scriptin temel amacı, oyunculara sunucuda bulunan araçları temiz, düzenli ve görsel olarak zengin bir arayüz üzerinden inceleme imkânı sunmaktır. Sistem; satın alma, test sürüşü, ödeme, garaj kaydı veya anahtar verme gibi işlemler yapmaz. Bu nedenle doğrudan ekonomi, database, garaj veya key sistemlerine müdahale etmez.

Sunucunun genel geliştirme aşaması Pre-Alpha olsa da, bu resource kendi kapsamı içinde ilk stabil sürüm olarak v1.0.0 kabul edilmiştir.

---

## Genel Amaç

Bu script, sunucudaki araçları showroom/katalog mantığıyla sergilemek için hazırlanmıştır.

Oyuncu, belirlenen showroom NPC’si ile qb-target üzerinden etkileşime girer ve araç kataloğunu açar. Açılan arayüzde yalnızca config.lua içerisinde tanımlanmış araçlar görünür.

Araçların model, marka, kategori ve fiyat gibi temel bilgileri ana olarak config.lua üzerinden yönetilir. Görsel, açıklama, marka logosu, bagaj kapasitesi ve performans detayları ise html/vehicledata.json dosyasından alınır.

Bu yapı sayesinde araç listesi ile araç detay verileri birbirinden ayrılmış olur. Böylece stok/katalog yönetimi daha temiz, detay bilgileri ise daha esnek hale gelir.

---

## Temel Özellikler

- QBCore uyumlu yapı.
- qb-target ile NPC üzerinden katalog açma.
- NUI tabanlı modern araç katalog arayüzü.
- Araçları kategoriye göre görüntüleme.
- Araç arama sistemi.
- Araç detay ekranı.
- Marka logosu desteği.
- Araç görseli desteği.
- Bagaj kapasitesi bilgisi.
- Performans verileri.
- Açıklama / tanıtım metni desteği.
- Config tabanlı araç listesi.
- JSON tabanlı detay bilgisi.
- Database gerektirmez.
- Satın alma sistemi içermez.
- Test drive sistemi içermez.
- Garaj sistemiyle doğrudan bağlantılı değildir.
- Araç anahtar sistemiyle doğrudan bağlantılı değildir.
- Ekonomi sistemine müdahale etmez.

---

## Script Mantığı

Script iki ana veri kaynağı ile çalışır:

1. config.lua
2. html/vehicledata.json

Bu iki dosyanın görevleri birbirinden farklıdır.

config.lua, katalogda hangi araçların görüneceğini belirler.

vehicledata.json, katalogda görünen araçların görsel ve detay bilgilerini tamamlar.

Yani sistemin ana kuralı şudur:

Araç listesi config.lua üzerinden yönetilir.  
Araç detayları vehicledata.json üzerinden tamamlanır.

---

## config.lua Mantığı

config.lua dosyası, bu scriptin ana katalog listesidir.

Menüde sadece Config.Vehicles içinde tanımlı araçlar görünür. Yani bir araç vehicledata.json içinde bulunsa bile, config.lua içine eklenmediyse katalogda görünmez.

Bu sayede katalog kontrolü tamamen config üzerinden yapılır.

Örnek araç tanımı:

    Config.Vehicles = {
        {
            model = "sultan",
            name = "Sultan",
            brand = "Karin",
            category = "sports",
            price = 45000
        }
    }

Bu örnekte sultan model koduna sahip araç katalogda görünür.

Buradaki bilgiler, oyuncunun katalogda göreceği temel araç bilgilerini oluşturur. Daha detaylı görsel ve teknik veriler için sistem ayrıca vehicledata.json dosyasına bakar.

---

## vehicledata.json Mantığı

html/vehicledata.json dosyası, araçların ekstra detay verilerini tutar.

Bu dosyada tutulabilecek bilgiler:

- Araç görseli
- Araç açıklaması
- Marka logosu
- Bagaj kapasitesi
- Hız bilgisi
- Hızlanma bilgisi
- Fren bilgisi
- Yol tutuş bilgisi
- Ek teknik bilgiler

Bu dosya tek başına katalog listesi oluşturmaz. Sadece config.lua içinde bulunan araçlara ek bilgi sağlar.

Yani vehicledata.json içinde yüzlerce araç bulunabilir. Ancak config.lua içinde olmayan araçlar menüde görünmez.

Bu mantık özellikle büyük araç datası ile çalışırken faydalıdır. Çünkü tüm detay datasını saklayabilir, ama katalogda sadece istediğiniz araçları gösterebilirsiniz.

---

## Eşleşme Sistemi

config.lua içindeki araçlar ile vehicledata.json içindeki detay verileri model/spawncode üzerinden eşleştirilir.

Örneğin config.lua içinde araç modeli şöyleyse:

    model = "sultan"

vehicledata.json içinde de bu model adına karşılık gelen detay verisi aranır.

Bu nedenle model isimlerinin doğru yazılması çok önemlidir.

Yanlış eşleşme örneği:

    model = "sultanrs"

ama JSON içinde:

    "sultan"

varsa sistem bu iki aracı aynı araç olarak eşleştiremez.

Doğru eşleşme için spawncode/model isimleri birebir aynı olmalıdır.

---

## Kurulum

1. Eski af-showroom klasörünü tamamen silin.
2. Bu ZIP içindeki af-showroom klasörünü sunucunuzun resources/[qb]/ klasörü içine atın.
3. server.cfg dosyanıza şu satırı ekleyin:

    ensure af-showroom

4. Sunucuyu yeniden başlatın veya resource’u console üzerinden başlatın:

    refresh
   
    ensure af-showroom

---

## Gereksinimler

Bu scriptin çalışması için aşağıdaki resource’ların sunucuda bulunması gerekir:

- qb-core
- qb-target

Script, QBCore objesini şu yapı ile alır:

    local QBCore = exports['qb-core']:GetCoreObject()

Bu nedenle modern QBCore sürümleriyle uyumlu çalışacak şekilde hazırlanmıştır.

---

## Kullanım

Oyuncular showroom NPC’sine giderek qb-target ile etkileşime girer.

Target üzerinde belirlenen seçenek seçildiğinde katalog arayüzü açılır.

Scriptte marker, E tuşu yazısı veya turuncu checkpoint bulunmaz. Kullanım tamamen NPC + target mantığına dayanır.

Bu yapı sayesinde showroom alanı daha temiz görünür ve gereksiz 3D yazı/marker kalabalığı oluşmaz.

---

## Komutlar

### /showroom

Test/debug amacıyla showroom menüsünü açar.

Bu komut özellikle geliştirme ve test sürecinde hızlı kontrol için eklenmiştir. Canlı sunucuda istenirse kaldırılabilir veya sadece admin/debug modunda çalışacak şekilde düzenlenebilir.

### showroomreload

Console üzerinden çalıştırılır.

Bu komut, detay datasını yeniden yüklemek için kullanılır. Özellikle vehicledata.json dosyasında değişiklik yapıldıktan sonra hızlı test için faydalıdır.

---

## Bu Script Ne Yapmaz?

Bu script bilinçli olarak bazı sistemleri içermez.

Şu an bu scriptte bulunmayan özellikler:

- Araç satın alma
- Test sürüşü
- Oyuncudan para çekme
- Galeri stoku düşürme
- Database’e araç kaydetme
- Garaja araç ekleme
- Oyuncuya araç anahtarı verme
- Meslek kontrolü
- Galeri çalışanı paneli
- Finans / taksit sistemi
- Araç spawnlama
- Araç silme
- Araç modifiye kaydı
- Araç plaka oluşturma

Bu özelliklerin olmaması bir hata değildir. Scriptin ilk sürüm kapsamı yalnızca showroom/katalog görüntüleme sistemidir.

İleride bu sistem, farklı galeri veya dealership scriptleriyle entegre edilebilir.

---

## Neden Ayrı Config ve JSON Kullanılıyor?

Araç katalog sistemlerinde genelde iki farklı veri tipi vardır:

1. Sunucunun aktif olarak kullandığı araç listesi.
2. Araçlara ait görsel ve tanıtım bilgileri.

Bu scriptte bu iki yapı özellikle ayrılmıştır.

config.lua, sunucuda hangi araçların katalogda gösterileceğini belirler.

vehicledata.json, bu araçlara ait detayları tamamlar.

Bu yaklaşımın avantajları:

- Katalog listesi kolay yönetilir.
- Detay bilgileri config dosyasını kalabalıklaştırmaz.
- Görsel/veri tarafı ayrı güncellenebilir.
- İleride daha büyük araç datası eklemek kolaylaşır.
- Config içindeki araç sayısı az olsa bile JSON içinde geniş veri tutulabilir.
- Aynı detay datası farklı sistemlerde tekrar kullanılabilir.
- Scriptin bakım ve güncelleme süreci daha düzenli olur.

---

## Önerilen Kullanım Mantığı

Bu script en sağlıklı şekilde şu amaçla kullanılmalıdır:

- Galeri içinde araçları sergilemek.
- Oyunculara araçları tanıtmak.
- Satın alma öncesi araç bilgisi göstermek.
- Sunucudaki araç çeşitliliğini düzenli bir menüde sunmak.
- Dealer sistemlerinden bağımsız bir vitrin oluşturmak.
- Sunucuya modern ve temiz bir showroom deneyimi eklemek.

Bu scripti doğrudan satın alma sistemine dönüştürmek mümkündür, ancak önerilen yol önce katalog sistemini stabil tutmak, daha sonra ayrı bir dealership/stock sistemiyle entegre etmektir.

---

## Güvenlik Notu

Bu script herhangi bir ödeme, satın alma, database yazma veya oyuncuya araç verme işlemi yapmadığı için ekonomi açısından riskli bir işlem içermez.

Client tarafı yalnızca katalog arayüzünü açar ve araçları görüntüler.

Server tarafı ise configteki araç listesini hazırlar ve NUI’ye gönderir.

İleride satın alma veya test drive gibi sistemler eklenirse, güvenlik açısından şu kurallara dikkat edilmelidir:

- Araç fiyatı clienttan alınmamalıdır.
- Satın alınacak araç server tarafında config/database üzerinden doğrulanmalıdır.
- Oyuncunun parası server tarafında kontrol edilmelidir.
- Araç verme işlemi server tarafında yapılmalıdır.
- Plaka, sahiplik ve key işlemleri clienta bırakılmamalıdır.
- Exploit riskine karşı tüm kritik işlemler server tarafında doğrulanmalıdır.

---

## Geliştirme Notları

Bu sürüm, temel showroom/katalog yapısını oluşturur.

İleride eklenebilecek özellikler:

- Local araç görselleri.
- Daha gelişmiş kategori filtreleri.
- Favori araç sistemi.
- Test drive entegrasyonu.
- Satın alma entegrasyonu.
- Galeri stok sistemi.
- Yetkili meslek kontrolü.
- Admin katalog yönetimi.
- Database destekli araç listesi.
- Araç karşılaştırma sistemi.
- Yakıt tipi bilgisi.
- Vites / çekiş / koltuk sayısı gibi ekstra teknik bilgiler.
- Telefonda araç kataloğu görüntüleme.
- Galeri çalışanları için özel panel.
- Araç renk seçenekleri.
- Marka bazlı filtreleme.
- Fiyat aralığına göre filtreleme.
- Performansa göre sıralama.
- Yeni UI temaları.

---

## Önemli Notlar

- Menüde sadece config.lua içindeki araçlar görünür.
- vehicledata.json tek başına araç eklemez.
- Model/spawncode isimleri birebir aynı olmalıdır.
- Script database kullanmaz.
- Script para veya araç sahipliği işlemi yapmaz.
- Script garaj sistemine müdahale etmez.
- Script key sistemine müdahale etmez.
- Script sadece katalog görüntüleme amacıyla tasarlanmıştır.
- Marker yoktur.
- E tuşu yazısı yoktur.
- Turuncu checkpoint yoktur.
- Ana kullanım NPC + qb-target üzerindendir.

---

## Dosya Yapısı

Resource temel olarak şu dosyalardan oluşur:

    af-showroom/
    │
    ├── fxmanifest.lua
    ├── config.lua
    ├── client.lua
    ├── server.lua
    ├── README.md
    │
    └── html/
        ├── index.html
        ├── style.css
        ├── app.js
        └── vehicledata.json

### fxmanifest.lua

Resource bilgilerini, script dosyalarını ve NUI dosyalarını tanımlar.

### config.lua

Showroom konumu, NPC ayarları, target ayarları ve katalogda görünecek araç listesi burada tutulur.

### client.lua

NPC oluşturma, target ekleme, NUI açma/kapatma ve client tarafındaki katalog işlemlerini yönetir.

### server.lua

Araç listesini hazırlar, detay verileriyle eşleştirir ve client tarafına gönderir.

### html/index.html

NUI arayüzünün temel HTML yapısını içerir.

### html/style.css

Showroom arayüzünün görsel tasarımını ve responsive düzenini içerir.

### html/app.js

NUI içerisindeki filtreleme, arama, detay ekranı ve kullanıcı etkileşimlerini yönetir.

### html/vehicledata.json

Araçların görsellerini, açıklamalarını, marka logolarını ve performans detaylarını içerir.

---

## Resource Bilgisi

Resource adı:

    af-showroom

Önerilen ensure satırı:

    ensure af-showroom

Script adı:

    ArdaFuat Showroom

Sürüm:

    v1.0.0

Sunucu geliştirme aşaması:

    Pre-Alpha

---

## Kısa Özet

ArdaFuat Showroom, QBCore tabanlı sunucular için hazırlanmış temiz, bağımsız ve genişletilebilir bir araç katalog sistemidir.

Bu resource, oyuncuların araçları görsel bir arayüz üzerinden incelemesini sağlar. Katalog listesi config.lua, detay bilgileri ise vehicledata.json üzerinden yönetilir.

İlk sürümde satın alma, test drive, garaj ve key entegrasyonu bulunmaz. Bu sayede script güvenli, sade ve diğer sistemlerden bağımsız şekilde çalışır.

Bu scriptin amacı, sunucuya modern bir showroom/katalog deneyimi kazandırmak ve ileride yapılacak dealership/galeri entegrasyonları için sağlam bir temel oluşturmaktır.
